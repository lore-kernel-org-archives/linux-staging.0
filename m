Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB298BD2A
	for <linux-staging@lists.linux.dev>; Fri, 20 Jan 2023 06:57:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D85E0C433D2;
	Fri, 20 Jan 2023 06:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1674197830;
	bh=iR8irKikdBBBq/MCs+R8NpDj23hq/KzA4TkNi6TBP8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H0K24k7BAgiK7lxn63tFMmRcFoHwbkqE/Szqh/Q3W5ZEECuX1CTHdtYYXrDzUeApt
	 NRIHT/qjW92gzrGNryJjZ+Ij4ixh52Zi2tEiLkYSbov0GltugTmO/uCepxbP5hLAfp
	 WBTP9ESvUQo1ps9FfH8Nq0jkjzqq7/+DKThXqqeA=
Date: Fri, 20 Jan 2023 07:57:06 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Adrien Thierry <athierry@redhat.com>,
	Dan Carpenter <error27@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH v5 2/6] staging: vc04_services: bcm2835-audio: Drop
 include Makefile directive
Message-ID: <Y8o7Qrg8MhCgkALk@kroah.com>
References: <20230119115503.268693-1-umang.jain@ideasonboard.com>
 <20230119115503.268693-3-umang.jain@ideasonboard.com>
 <Y8nuJfuzW9QBcSVd@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8nuJfuzW9QBcSVd@pendragon.ideasonboard.com>

On Fri, Jan 20, 2023 at 03:28:05AM +0200, Laurent Pinchart wrote:
> Hi Umang,
> 
> Thank you for the patch.
> 
> On Thu, Jan 19, 2023 at 05:24:59PM +0530, Umang Jain wrote:
> > Drop the include directive they can break the build one only wants to
> > build a subdirectory. Replace with "../" for the includes, in the
> > bcm2835.h instead.
> 
> I assume you meant
> 
> Drop the include directive. They can break the build, when one only
> wants to build a subdirectory.
> 
> > Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> > ---
> >  drivers/staging/vc04_services/bcm2835-audio/Makefile  | 2 --
> >  drivers/staging/vc04_services/bcm2835-audio/bcm2835.h | 3 ++-
> >  2 files changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/staging/vc04_services/bcm2835-audio/Makefile b/drivers/staging/vc04_services/bcm2835-audio/Makefile
> > index fc7ac6112a3e..01ceebdf88e7 100644
> > --- a/drivers/staging/vc04_services/bcm2835-audio/Makefile
> > +++ b/drivers/staging/vc04_services/bcm2835-audio/Makefile
> > @@ -1,5 +1,3 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  obj-$(CONFIG_SND_BCM2835)	+= snd-bcm2835.o
> >  snd-bcm2835-objs		:= bcm2835.o bcm2835-ctl.o bcm2835-pcm.o bcm2835-vchiq.o
> > -
> > -ccflags-y += -I $(srctree)/$(src)/../include
> 
> The reason for this, I assume, is that the driver is in staging. The
> vchiq.h file should live in include/linux/raspberrypi/, not
> drivers/staging/vc04_services/include/linux/raspberrypi/, so an
> additional include directory is added in order to use
> 
> #include <linux/raspberrypi/vchiq.h>
> 
> When the code will get out of staging, vchiq.h will go to
> include/linux/raspberrypi/, the extra include directory will be dropped,
> and all will be well without having to change any source file.
> 
> With this patch, we'll have to undo the change below to
> drivers/staging/vc04_services/bcm2835-audio/bcm2835.h when vc04_services
> will get out of staging.
> 
> Greg, is that what you prefer ?

I prefer the drivers to NOT use include ccflags in the kernel as it
breaks the build when trying to build just a subdirectory.  If/when this
code ever gets out of staging, then the include lines can be fixed up to
point to the correct location of wherever the files move to.

So I like this patch, but as I couldn't take the first one, this and the
rest did not apply so I'll wait for them to be resubmitted.

thanks,

greg k-h
