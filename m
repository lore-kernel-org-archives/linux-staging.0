Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28B46D00
	for <linux-staging@lists.linux.dev>; Thu,  8 Apr 2021 11:34:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B1C3661107;
	Thu,  8 Apr 2021 11:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617881681;
	bh=jyaO0qglGyFdhPEM06gVFnPGc0e+8xQPP2hnY0QpVqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eV0F5TSU2bp/hGiIrSd+oZHtY2de7+gdwSpPzqLCSWbVqhFazCZrzW0mcBwdtJOzT
	 rzZIHeDfuWFKff0fyM6vxueM7Q4kp47WjxOhQxPPd6UKleNDoAk58NEAtLySsj92b5
	 3+6CoL3sMCPAtDIZ4jRS7LhrDGicbvF9FjRBo7d0=
Date: Thu, 8 Apr 2021 13:34:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mitali Borkar <mitaliborkar810@gmail.com>
Cc: Julia Lawall <julia.lawall@inria.fr>, Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: Re: [Outreachy kernel] [PATCH] staging: rtl8712: added spaces around
 '+'
Message-ID: <YG7qTib76wKhQeoU@kroah.com>
References: <YG690ZIRdCEcjoM6@kali>
 <alpine.DEB.2.22.394.2104081027100.3155@hadrien>
 <YG7oOezBpYsi3Fr8@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YG7oOezBpYsi3Fr8@kali>

On Thu, Apr 08, 2021 at 04:55:45PM +0530, Mitali Borkar wrote:
> On Thu, Apr 08, 2021 at 10:30:09AM +0200, Julia Lawall wrote:
> > The subject line should be in the imperative, so "add" instead of "added".
> > 
> Ok Ma'am
> > On Thu, 8 Apr 2021, Mitali Borkar wrote:
> > 
> > > Clean up Check:spaces preferred around that '+' (ctx:VxV)
> > > Reported by checkpatch
> > 
> > Please try to rephrase to explain what you did and why.  "Clean up" kind
> > of states what the goal is, but your opinion about what is a clean up
> > might be different than someone else's.  It's also not necessary to cite
> > the checkpatch warning exactly.
> > 
> OKay Ma'am, will rewrite the appopriate commit message. May I know while
> resending this patch, what should I write in subject description, 
> RESEND PATCH or PATCH v2

"RESEND" is only ok if the patch and changelog text is identical to the
previous version and something got lost so it needed to be resent.

I do not think that is the case here.

thanks,

greg k-h
