Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40D570
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 12:04:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C35B7610A4;
	Fri,  9 Apr 2021 12:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617969868;
	bh=z2Di87V6PHfFJcyBdNJcC3hjVhWKGllPObQkeoiQ25A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mc7hqcyfEjeHNT7mewY1g7SQItbES3IKuwMaNiZw8IQAftZMelvDuqAZ1B6OHKlZC
	 7fh2HiGNNIzkUF5Sia05+xiSV3UZKPz0pqCnpyKKeQUChemFYkiW0Li0nd29YfkcPt
	 BxxsvgvFcsfS5899Q1adz7d2eg8W+jcJmIWjTzk4=
Date: Fri, 9 Apr 2021 14:03:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sergei Krainov <sergei.krainov.lkd@gmail.com>
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8712: fix wrong function output
Message-ID: <YHBCdbmPczyK3/0R@kroah.com>
References: <20210408234527.GA6893@test-VirtualBox>
 <YG/1MyfOrHgCi5sr@kroah.com>
 <20210409114159.GA3122@test-VirtualBox>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210409114159.GA3122@test-VirtualBox>

On Fri, Apr 09, 2021 at 01:41:59PM +0200, Sergei Krainov wrote:
> On Fri, Apr 09, 2021 at 08:33:23AM +0200, Greg KH wrote:
> > On Fri, Apr 09, 2021 at 01:45:27AM +0200, Sergei Krainov wrote:
> > > Function r8712_find_network() were returning wlan_network even if it
> > > didn't match required address. This happened due to not checking if
> > > list end was reached and returning last processed wlan_network.
> > > 
> > > Signed-off-by: Sergei Krainov <sergei.krainov.lkd@gmail.com>
> > > ---
> > >  drivers/staging/rtl8712/rtl871x_mlme.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > 
> > What commit does this "fix"?  Or has this bug been there always?
> > 
> > thanks,
> > 
> > greg k-h
> 
> This commit fixes the bug mentioned. 

What bug mentioned?

> And this commit is based on staging-next and has nothing to do
> with my previous patches, for which I'm sorry, I was wrong.

I do not understand at all, sorry.

Please resend with a "Fixes:" tag that shows the commit that this fixes.

thanks,

greg k-h
