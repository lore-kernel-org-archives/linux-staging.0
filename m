Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6C133DC;
	Thu, 20 Oct 2022 14:43:08 +0000 (UTC)
Received: from cwcc.thunk.org (pool-173-48-120-46.bstnma.fios.verizon.net [173.48.120.46])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 29KEdmUl009069
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Oct 2022 10:39:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1666276789; bh=kG1ree45kEImwHBAJ1rz5gdQQphkhdtRHQIe70Qv3bQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Bt6zkpa0llmvbW8hygwCb6IzIQFAarbADX+6SD4I9Gf9VczYrRa/22Q23QAkXffRt
	 A1LoTxldWA6YQeUhMp35reOCWxzjy3QPvUsJhPyedjV2C2bPF7WvpkfDQ3UCtPHLrk
	 9JjzmiZHA86Nn9jpNWSPdo6lP7WisDjFZPEJqnff/TVYCE9a53uqF+VNpSHurf83mj
	 uGgliJsNUMLzktOo/XCGx3KU5P4nybYfAO5EDUWhU3JGkAEbORx0l0qH9h+TGQ+mV2
	 yBMNpOfUNw/djKpwE1DkuO8Y83pm+smQHATBeZGaXEmDgTQsnvy4fN6OLB5vPKpSg6
	 fzyeFCHnSvyLg==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id DEEA415C3AD1; Thu, 20 Oct 2022 10:39:47 -0400 (EDT)
Date: Thu, 20 Oct 2022 10:39:47 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Tanju Brunostar <tanjubrunostar0@gmail.com>,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
        outreachy@lists.linux.dev
Subject: Re: Request for assistance
Message-ID: <Y1Fds7BJjY/OcwU0@mit.edu>
References: <Y1Eqa7uKB+Wk+Mb+@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
 <CAOkYk0iU0B98JsH77avky--AS19V=GhQox2f_b4PAG3ZBB+SVQ@mail.gmail.com>
 <CAHJEyKX=yyuyYFajs880CuPdc019dBOm_LCkgXHzjFaA-Jgt2A@mail.gmail.com>
 <Y1E6qYkzkRxlloNp@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1E6qYkzkRxlloNp@kroah.com>

Tanju, some additional hints.  First of all, please don't send cleanup
patches to address checkpatch --file complaints about overly long
lines.  It's generally not worth the code churn.

Secondly for code that *you* are writing, think about why you have
lines which are exceeding the line width in the first place.  Is it
because code is being nested too deeply, and perhaps some judicious
function refactoring with good function names might make the code
clearer?  Would adding some temporary variables that are judiciously
named make the code look clearer?

The rules about "thou shalt never have lines which exceed 78
characters" are rules of thumb.  The high level goal is to make the
code more readable and easier to understand, since good code is
maintainable code.  And sometimes it's not just about where to split
lines of code but whether there is a better way to structure the code
so that long lines aren't needed in the first place.

Cheers,

					- Ted
