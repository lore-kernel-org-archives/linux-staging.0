Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305B73FC1
	for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 13:30:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 16E306124E;
	Sun, 22 Aug 2021 13:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1629639013;
	bh=R9YFws1+havCh2xzlF8mD4WZ2n5VX7IcPxztMq5h5X4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=whaSNbTpC6wDfKbyuM6vIGJSlm7n+Fhaj9FYc/KU7vJjRD01mi0UhTdwvVe1Z1kUh
	 Mh3zX0qCyDRtNh1y/eX7BPrCxCrsraC6UpZNK1DaQjbvOsgxIQekUY/rbVEJbNfQlj
	 ifw5+8cdqdphZwrthuChE6iBH3TkXmGxgztcjfAU=
Date: Sun, 22 Aug 2021 15:30:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Pavel Skripkin <paskripkin@gmail.com>, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: Re: [PATCH RFC 0/3] staging: r8188eu: avoid uninit value bugs
Message-ID: <YSJRYRVAP6x0lx2q@kroah.com>
References: <cover.1629479152.git.paskripkin@gmail.com>
 <435eea22-da31-1ebc-840c-ee9e42b27265@gmail.com>
 <YSJFhmTs74PUyo8b@kroah.com>
 <2244219.zNr1yEsLHP@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2244219.zNr1yEsLHP@localhost.localdomain>

On Sun, Aug 22, 2021 at 03:21:30PM +0200, Fabio M. De Francesco wrote:
> On Sunday, August 22, 2021 2:39:34 PM CEST Greg KH wrote:
> > On Sun, Aug 22, 2021 at 03:10:56PM +0300, Pavel Skripkin wrote:
> > > On 8/22/21 1:59 PM, Fabio M. De Francesco wrote:
> > > > On Sunday, August 22, 2021 12:09:29 PM CEST Pavel Skripkin wrote:
> [...]
> > > > So, it's up to the callers to test if (!_rtw_read*()) and then act
> > > > accordingly. If they get 0 they should know how to handle the errors.
> > > 
> > > Yes, but _rtw_read*() == 0 indicates 2 states:
> > > 	1. Error on transfer side
> > > 	2. Actual register value is 0
> > 
> > That's not a good design, it should be fixed.  Note there is the new
> > usb_control_msg_recv() function which should probably be used instead
> > here, to prevent this problem from happening.
> 
> I think that no functions should return 0 for signaling FAILURE. If I'm not 
> wrong, the kernel quite always prefers to return 0 on SUCCESS and <0 on 
> FAILURE. Why don't you just fix this?

Fix what specifically here?  The usb_control_msg() call?  If so, that is
why usb_control_msg_recv() was created, as sometimes you do want to do
what usb_control_msg() does today (see the users in the USB core today
for examples of why this is needed.)

In general, yes, 0 is success, negative is error, and positive is the
number of bytes read/written.

Anyway, let's see the second round of patches here before continuing
this thread...

thanks,

greg k-h
