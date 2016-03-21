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

/**
 * 이 클래스는 패키지 외부에서 참조 되지 않는다.
 * 
 * @author Naver Labs
 * 
 */
class Literal extends Terminal {
	private String literal;

	public Literal(String literal) {
		this.literal = (literal == null) ? "" : literal;
	}

	public String getLiteral() {
		return this.literal;
	}

	public boolean sliceToken(Token parent, CharArraySegment input) {
		boolean isTokenized = false;
		do {
			if (input != null && input.hasRemaining() && input.startWith(this.literal)) {
				parent.appendValue(input.slice(this.literal.length()));
				isTokenized = true;
			} else {
				break;
			}
		} while (this.isRepeat());

		return isTokenized;
	}

	public int matchPos(CharArraySegment input) {
		return input.posOf(this.literal);
	}
}