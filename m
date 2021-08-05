Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A427A70
	for <linux-staging@lists.linux.dev>; Thu,  5 Aug 2021 11:04:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A03DB610CC;
	Thu,  5 Aug 2021 11:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1628161450;
	bh=wVGERqshi5jMBnr7v8DOpzYeN89jP8lWGjs3FfSB1G8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XDxCCcQtsCmRqjvwvksXD2wE0IFZfhNIgNo1Im8GdFr6LidUPyMK6ZO2/WLF44Pp4
	 eFeGu2WK5xv28l3nwaLsKFwmUPtWpeIFCBtFFtR3dku2M6O2O/ORsn5Donoy0jq3J5
	 ZGTpwFhKPti7BacnTofaKLWgaoMweUwFY/Oo1lIs=
Date: Thu, 5 Aug 2021 13:04:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: SAURAV GIREPUNJE <saurav.girepunje@gmail.com>
Cc: fabioaiuto83@gmail.com, marcocesati@gmail.com, ross.schm.dev@gmail.com,
	insafonov@gmail.com, linux-staging@lists.linux.dev,
	saurav.girepunje@hotmail.com
Subject: Re: Post to linux-staging@lists.linux.dev denied: [PATCH] staging:
 rtl8723bs: os_dep: remove unused variable
Message-ID: <YQvFpwNDRSxLxNmp@kroah.com>
References: <1628081824-28535-mlmmj-16bf2009@lists.linux.dev>
 <YQqZ4TlTzZGIaixJ@user>
 <YQqccPSjYA/lR11g@kroah.com>
 <YQrMZEND3pY8Pav4@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQrMZEND3pY8Pav4@user>

On Wed, Aug 04, 2021 at 10:50:36PM +0530, SAURAV GIREPUNJE wrote:
> On Wed, Aug 04, 2021 at 03:56:00PM +0200, Greg KH wrote:
> > On Wed, Aug 04, 2021 at 07:15:05PM +0530, SAURAV GIREPUNJE wrote:
> > > On Wed, Aug 04, 2021 at 12:57:04PM +0000, linux-staging+owner@lists.linux.dev wrote:
> > > > Greetings!
> > > >
> > > > This is the mlmmj program managing the <linux-staging@lists.linux.dev>
> > > > mailing list.
> > > >
> > > > The message from <saurav.girepunje@gmail.com> with subject "[PATCH]
> > > > staging: rtl8723bs: os_dep: remove unused variable" was unable to be
> > > > delivered to the list because the list address was not found in either the
> > > > To: or CC: header.
> > > >
> > > > (The denied message is below.)
> > >
> > > > Date: Wed, 4 Aug 2021 18:26:57 +0530
> > > > From: Saurav Girepunje <saurav.girepunje@gmail.com>
> > > > To: gregkh@linuxfoundation.org;, fabioaiuto83@gmail.com;,
> > > >  saurav.girepunje@gmail.com;, marcocesati@gmail.com;,
> > > >  ross.schm.dev@gmail.com;, insafonov@gmail.com;,
> > > >  linux-staging@lists.linux.dev;, linux-kernel@vger.kernel.org;
> > > > Cc: saurav.girepunje@hotmail.com
> >
> > Why do you have ";" in your email addresses here?
> >
> > Try removing them.
> 
> 
> Thanks Greg, That was the problem.
> 

Can you resend all of your pending patches in the proper way, in a patch
series, so I know what to apply and in what order they should be applied
in?  Right now I have a bunch that never made it to a public list, and I
can not take them, so I will just drop all patches from you that are
pending in my queue to make it obvious what I need to review.

thanks,

greg k-h
