Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D717A
	for <linux-staging@lists.linux.dev>; Thu, 28 Jul 2022 06:58:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8AA5C433D7;
	Thu, 28 Jul 2022 06:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1658991504;
	bh=9VtPWDr71X6cu20A7g8i4Z19oj5u5gdAoplvwb8bcDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=curQK1W9PBsTNWLk/jhbQnrodc2Ty0zLzbkxqCVkbCgpNHDtpZ/2loC4SEkiuDxBQ
	 QGzRL2Orfu2+1GYvoabCA8qwVYW6Oder7Ll+TISokUjczDizH7xseyenwZA4xs1R/a
	 qpgQF4IK8vKsmn0MFWsCxZ5Xkl9B0maAtb0ti/nc=
Date: Thu, 28 Jul 2022 08:58:21 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] staging: r8188eu: get da from ieee80211_mgmt
Message-ID: <YuIzjeiskRngUSGH@kroah.com>
References: <20220724153917.138848-1-martin@kaiser.cx>
 <20220724153917.138848-2-martin@kaiser.cx>
 <YuDeo4qHOqDkdZy9@kroah.com>
 <20220728052515.tmzztbha2ckwusd2@viti.kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220728052515.tmzztbha2ckwusd2@viti.kaiser.cx>

On Thu, Jul 28, 2022 at 07:25:15AM +0200, Martin Kaiser wrote:
> Thus wrote Greg Kroah-Hartman (gregkh@linuxfoundation.org):
> 
> > On Sun, Jul 24, 2022 at 05:39:13PM +0200, Martin Kaiser wrote:
> > > Define a struct ieee80211_mgmt in the OnAssocRsp function. Read the
> > > destination address (da) from this struct.
> 
> > This explains (sortta) what this patch does, but not why you are doing
> > this.
> 
> There's a bunch of macros and functions in the r8188eu driver to parse
> standard messages. I'm trying to replace these driver-specific versions
> with the generic ones that are shared between several drivers.
> 
> This patch removs one get_da call. It's not much but hopefully, we can
> eventually remove get_da itself.
> 
> I know that we should leave the parsing of messages to mac80211 and get
> rid of OnAssocRsp etc. Until we're at this point, I hope that doing the
> parsing ourselves and using the generic helpers is a useful intermediate
> step.
> 
> Would it make sense to rewrite the patch description or to summarize the
> patches in this series to something like "read some response message
> fields from struct ieee80211_mgmt"?

As is, the patch description is not acceptable, so yes, it needs to
change :)

thanks,

greg k-h
