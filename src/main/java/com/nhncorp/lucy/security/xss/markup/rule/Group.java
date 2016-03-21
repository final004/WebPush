/*
 *	Copyright 2014 Naver Corp.
 *	
 *	Licensed under the Apache License, Version 2.0 (the "License");
 *	you may not use this file except in compliance with the License.
 *	You may obtain a copy of the License at
 *	
 *		http://www.apache.org/licenses/LICENSE-2.0
 *	
 *	Unless required by applicable law or agreed to in writing, software
 *	distributed under the License is distributed on an "AS IS" BASIS,
 *	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *	See the License for the specific language governing permissions and
 *	limitations under the License.
 */	
package com.nhncorp.lucy.security.xss.markup.rule;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * 이 클래스는 패키지 외부에서 참조 되지 않는다.
 * 
 * @author Naver Labs
 * 
 */
class Group extends NonTerminal {
	public enum OPERATOR {
		OR, MINUS;

		public static OPERATOR getValue(char ch) {
			if (ch == '|') {
				return OR;
			} else if (ch == '-') {
				return MINUS;
			} else {
				return null;
			}
		}
	}

	private String name;
	private OPERATOR op;
	private List<ParsingRule> rules;

	public Group() {
		this.rules = new ArrayList<ParsingRule>();
	}

	public Group(String name) {
		this();
		this.name = name;
	}

	@Override
	public String getRuleName() {
		return (this.name == null) ? "" : this.name;
	}

	public OPERATOR getOperator() {
		return this.op;
	}

	public void setOperator(OPERATOR op) {
		this.op = op;
	}

	public boolean hasOrOperation() {
		return this.op != null && this.op == OPERATOR.OR;
	}

	public boolean hasMinusOperation() {
		return this.op != null && this.op == OPERATOR.MINUS;
	}

	public int getRuleCount() {
		return this.rules.size();
	}

	public void add(ParsingRule rule) {
		this.rules.add(rule);
	}

	public void addAll(Collection<? extends ParsingRule> rules) {
		if (rules == null) {
			return;
		}

		this.rules.addAll(rules);
	}

	public ParsingRule get(int index) {
		return this.rules.get(index);
	}

	public List<ParsingRule> getAll() {
		return this.rules;
	}

	public void remove(ParsingRule rule) {
		this.rules.remove(rule);
	}

	/**
	 * @return
	 * @see com.nhncorp.lucy.security.xss.markup.rule.NonTerminal#nextToken()
	 */
	@Override
	public Token nextToken(Token token, CharArraySegment input, ParsingGrammar grammar) {
		if (!this.sliceToken(token, input, grammar)) {
			return null;
		}

		List<Token> children = token.getChildren();
		Token child = children.get(0);

		return child;
	}

	public boolean sliceTokens(Token parent, CharArraySegment input, ParsingGrammar grammar) {
		boolean isTokenized = false;

		int start = input.pos();
		do {
			Token token = new Token(parent.getName());
			if (this.sliceToken(token, input, grammar)) {
				parent.addChild(token);

				isTokenized = true;
				start = input.pos();

				if ("contents".equals(parent.getName())) {
					break;
				}
			} else {
				input.pos(start);
				break;
			}
		} while (this.isRepeat());

		return isTokenized;
	}

	boolean sliceToken(Token parent, CharArraySegment input, ParsingGrammar grammar) {
		boolean isTokenized = false;
		if (input == null || !input.hasRemaining()) {
			return isTokenized;
		}

		if (this.hasOrOperation()) {
			for (ParsingRule rule : this.getAll()) {
				isTokenized = this.sliceTokenByRule(parent, rule, input, grammar);
				if (isTokenized) {
					break;
				}
			}
		} else if (this.hasMinusOperation()) {
			ParsingRule left = this.get(0);
			ParsingRule right = this.get(1);

			int pos = -1;
			if (right instanceof NonTerminal) {
				pos = NonTerminal.class.cast(right).matchPos(input, grammar);
			} else {
				pos = Terminal.class.cast(right).matchPos(input);
			}

			if (pos >= input.pos()) {
				CharArraySegment segment = input.subSegment(input.pos(), pos);
				isTokenized = this.sliceTokenByRule(parent, left, segment, grammar);
				input.pos(input.pos() + segment.pos());
			} else {
				isTokenized = this.sliceTokenByRule(parent, left, input, grammar);
			}
		} else {
			boolean flag = false;
			for (int i = 0; i < this.getRuleCount(); i++) {
				ParsingRule rule = this.get(i);
				flag = this.sliceTokenByRule(parent, rule, input, grammar);
				if (!rule.isOptional() && !flag) {
					isTokenized = false;
					break;
				} else if (flag) {
					isTokenized = true;
				}
			}
		}

		return isTokenized;
	}

	public int matchPos(CharArraySegment input, ParsingGrammar grammar) {
		int pos = -1;

		List<Terminal> terms = this.getFirstNonOptTerminals(grammar);
		if (terms != null && !terms.isEmpty()) {
			for (Terminal term : terms) {
				int tmp = term.matchPos(input);
				if (tmp >= 0 && (pos < 0 || tmp < pos)) {
					pos = tmp;
				}
			}
		}

		return pos;
	}

	public List<Terminal> getFirstNonOptTerminals(ParsingGrammar grammar) {
		if (this.hasMinusOperation() || this.isOptional()) {
			return null;
		}

		List<Terminal> terms = new ArrayList<Terminal>();
		for (ParsingRule rule : this.getAll()) {
			if (rule.isOptional()) {
				continue;
			} else if (rule instanceof NonTerminal) {
				List<Terminal> tmp = NonTerminal.class.cast(rule).getFirstNonOptTerminals(grammar);
				if (tmp != null && !tmp.isEmpty()) {
					terms.addAll(tmp);
				}
			} else {
				terms.add(Terminal.class.cast(rule));
			}

			if (!this.hasOrOperation() && !terms.isEmpty()) {
				break;
			}
		}

		return terms;
	}

	private boolean sliceTokenByRule(Token parent, ParsingRule rule, CharArraySegment input, ParsingGrammar grammar) {
		boolean isTokenized = false;
		if (rule instanceof NonTerminal) {
			isTokenized = NonTerminal.class.cast(rule).sliceTokens(parent, input, grammar);
		} else {
			isTokenized = Terminal.class.cast(rule).sliceToken(parent, input);
		}

		return isTokenized;
	}
}