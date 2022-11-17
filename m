Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D9A8BE0
	for <linux-staging@lists.linux.dev>; Thu, 17 Nov 2022 18:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DB60C433D6;
	Thu, 17 Nov 2022 18:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1668708778;
	bh=KCxIvC+hdiZE+1xFJ8BT4IQmgI+9o6zwKKamoBYbuNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VZEIAlFP2o9Yg1Z/w7VpifR6D0Fwaxj/sMh8ldKE1jsH9NbJwe2MwIfRjTAHJeJjE
	 9KAfvkOaR9UmvUrI/KUoZ5IXk3Cdjiwuw99hwL7kwsjS22tKw08hw/ST2ptF2Iio+z
	 Ta/6iFmu/XE88+Udz+7LzikWgNIrnawguU5YZQeo=
Date: Thu, 17 Nov 2022 19:03:21 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Deepak R Varma <drv@mailo.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	gustavoars@kernel.org
Subject: Re: [PATCH] staging: wlan-ng: Replace zero-length arrays with
 DECLARE_FLEX_ARRAY() helper
Message-ID: <Y3Z3aatcaISvqURJ@kroah.com>
References: <Y3YKhee8L+kAfHM4@qemulion>
 <Y3YvGdkyGm7azGg4@kroah.com>
 <Y3Y1N6AwWEXLpSrx@qemulion>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3Y1N6AwWEXLpSrx@qemulion>

On Thu, Nov 17, 2022 at 06:50:55PM +0530, Deepak R Varma wrote:
> On Thu, Nov 17, 2022 at 01:54:49PM +0100, Greg Kroah-Hartman wrote:
> > On Thu, Nov 17, 2022 at 03:48:45PM +0530, Deepak R Varma wrote:
> > > The code currently uses C90 standard extension based zero length arrays.
> > > The zero length array member also happens to be the only member of the
> > > structs. Such zero length array declarations are deprecated and the
> > > new C99 standard extension of flexible array declarations are to be
> > > used instead.
> > >
> > > The DECLARE_FLEX_ARRAY() helper allows for a flexible array member as
> > > the only member in a structure. Refer to these links [1], [2] for
> > > details.
> > >
> > > [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> > > [2] https://lkml.kernel.org/r/YxKY6O2hmdwNh8r8@work
> > >
> > > Issue identified using Coccinelle.
> > >
> > > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > > ---
> > >
> > > Notes:
> > >    1. Proposed change is compile tested only.
> > >    2. Solution feedback from gustavoars@kernel.org
> > >
> > >
> > >  drivers/staging/wlan-ng/hfa384x.h | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/staging/wlan-ng/hfa384x.h b/drivers/staging/wlan-ng/hfa384x.h
> > > index 0611e37df6ac..3a1edcb43e07 100644
> > > --- a/drivers/staging/wlan-ng/hfa384x.h
> > > +++ b/drivers/staging/wlan-ng/hfa384x.h
> > > @@ -960,15 +960,15 @@ struct hfa384x_pdr_nicid {
> > >  } __packed;
> > >
> > >  struct hfa384x_pdr_refdac_measurements {
> > > -	u16 value[0];
> > > +	DECLARE_FLEX_ARRAY(u16, value);
> > >  } __packed;
> >
> > Why?  This structure is never used anywhere, right?  So why is this
> > needed to be changed and not just removed entirely?  Same for the other
> > structures in this patch.
> 
> Hello Greg,
> I am unable to confirm that these structures are truly not needed in the absence
> if a real device based testing. I could only validate that using the compile
> build and driver loading.

Think this through, if no one is actually using this structure, and it
is of 0 size, then do you think it is being used?

> This change that I am proposing in the interim would enable the compiler to
> protect the structure from addition of a new member below the zero length array.

Why would you want to add a new member below this?  That's not what is
happening here at all.

Please think this through a bit more.

good luck!

greg k-h
