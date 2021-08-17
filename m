Received: from smtprelay.hostedemail.com (smtprelay0069.hostedemail.com [216.40.44.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A010168
	for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 21:03:35 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave07.hostedemail.com (Postfix) with ESMTP id F3F8E181DD434
	for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 18:36:18 +0000 (UTC)
Received: from omf16.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay07.hostedemail.com (Postfix) with ESMTP id C725D18132D1B;
	Tue, 17 Aug 2021 18:36:11 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf16.hostedemail.com (Postfix) with ESMTPA id 88B3B25510C;
	Tue, 17 Aug 2021 18:36:10 +0000 (UTC)
Message-ID: <11a09af791c5453175a6bdac1c51bd9fcb0685bd.camel@perches.com>
Subject: Re: [PATCH] staging: r8188eu: refactor
 rtw_is_cckrates{only}_included()
From: Joe Perches <joe@perches.com>
To: Greg KH <gregkh@linuxfoundation.org>, Michael Straube
	 <straube.linux@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, martin@kaiser.cx, 
	fmdefrancesco@gmail.com, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Tue, 17 Aug 2021 11:36:09 -0700
In-Reply-To: <YRv4po3sLcH9VLuo@kroah.com>
References: <20210816193125.15700-1-straube.linux@gmail.com>
	 <YRv4po3sLcH9VLuo@kroah.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.0-1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 88B3B25510C
X-Spam-Status: No, score=1.60
X-Stat-Signature: 4fmkf9xk51a9m6tpwoquu4m4r4ersfjf
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18FiyKAUKgIPzwQGuG8kuWbFPuj9F/R1aE=
X-HE-Tag: 1629225370-1987

On Tue, 2021-08-17 at 19:57 +0200, Greg KH wrote:
> On Mon, Aug 16, 2021 at 09:31:25PM +0200, Michael Straube wrote:
> > Refactor functions rtw_is_cckrates_included() and
> > rtw_is_cckratesonly_included(). Add new helper function rtw_is_cckrate()
> > that allows to make the code more compact. Improves readability and
> > slightly reduces object file size. Change the return type to bool to
> > reflect that the functions return boolean values.
[]
> > diff --git a/drivers/staging/r8188eu/core/rtw_ieee80211.c b/drivers/staging/r8188eu/core/rtw_ieee80211.c
[]
> > +bool rtw_is_cckratesonly_included(u8 *rate)
> >  {
> > -	u32 i = 0;
> > +	u8 r;
> >  
> > 
> > -	while (rate[i] != 0) {
> > -		if  ((((rate[i]) & 0x7f) != 2) && (((rate[i]) & 0x7f) != 4) &&
> > -		     (((rate[i]) & 0x7f) != 11)  && (((rate[i]) & 0x7f) != 22))
> > +	while ((r = *rate++)) {
> 
> Ick, no.
> 
> While it might be fun to play with pointers like this, trying to
> determine the precidence issues involved with reading from, and then
> incrementing the pointer like this is crazy.
> 
> The original was obvious as to how it was walking through the array.

It's sad to believe *ptr++ is not obvious to you as it's very commonly
used in the kernel sources (over 10,000 instances).


