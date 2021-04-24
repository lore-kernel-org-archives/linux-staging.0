Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929A971
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:34:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 79BFE6148E;
	Sat, 24 Apr 2021 09:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619256875;
	bh=ihCDST5UD4p6eE3SkAwdZ14Nn8W5w9pzJnHNoHxEqgg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=iPkfO9aIrMiycBlV1YYV+NKae/t2UiVUr5iRBb/k44F3cae/FBAJVPxH+CmoYIPCh
	 a2nnUyta7YAW8Z8bY+x8Y7MrVpHtRM5ddSdSPGMdbVh2dy56dhphaaIJhD3Df7eHJv
	 LHegZ3hXhp+xhfHXwbfAXJxix96/1bJ2E6LwdoipCaqnhOEfujQmya2zAnCUm5SI/6
	 cmQcIKJIcXHyy2oI1OFgLcnkE8lRlT1D5YQOu6d5zF/kBMhrGs8/A3pnXaG7IANTM2
	 CXZBB3DfqWV5sa+NyHpByFNP8x1kLt0O9QlbED26RYunXP8oNcsbHwWyKf1czlsKcl
	 xFFGZnSYbLfDA==
Message-ID: <cb91a955eab6cb9af3a98bdde56f2dd29375e55b.camel@kernel.org>
Subject: Re: [PATCH 08/10] staging: vchiq_core: drop vchiq_status from
 vchiq_set_service_option
From: nicolas saenz julienne <nsaenz@kernel.org>
To: Stefan Wahren <stefan.wahren@i2se.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Date: Sat, 24 Apr 2021 11:34:32 +0200
In-Reply-To: <e60363d6-49eb-ad11-77e6-67ac283168bf@i2se.com>
References: <1619122076-31785-1-git-send-email-stefan.wahren@i2se.com>
	 <1619122076-31785-9-git-send-email-stefan.wahren@i2se.com>
	 <3731e98b81eac97f2bdbe9a24fa7cfef59b07581.camel@kernel.org>
	 <e60363d6-49eb-ad11-77e6-67ac283168bf@i2se.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 2021-04-23 at 13:03 +0200, Stefan Wahren wrote:
> Am 23.04.21 um 11:59 schrieb nicolas saenz julienne:
> > On Thu, 2021-04-22 at 22:07 +0200, Stefan Wahren wrote:
> > > Replace the custom set of return values with proper Linux error codes for
> > > vchiq_set_service_option(). Now we can use the result directly as return
> > > value for vchiq_ioctl().
> > > 
> > > Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> > > ---
> > >  .../vc04_services/interface/vchiq_arm/vchiq_arm.c      |  4 ++--
> > >  .../vc04_services/interface/vchiq_arm/vchiq_core.c     | 18 +++++++++---------
> > >  .../vc04_services/interface/vchiq_arm/vchiq_core.h     |  2 +-
> > >  3 files changed, 12 insertions(+), 12 deletions(-)
> > > 
> > > diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > > index 3395201..ab2ce07 100644
> > > --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > > +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > > @@ -1517,8 +1517,8 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> > >  			break;
> > >  		}
> > >  
> > > 
> > > -		status = vchiq_set_service_option(
> > > -				args.handle, args.option, args.value);
> > > +		ret = vchiq_set_service_option(args.handle, args.option,
> > > +					       args.value);
> > >  	} break;
> > >  
> > > 
> > >  	case VCHIQ_IOC_LIB_VERSION: {
> > > diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> > > index 9f9677a..31c1c1a 100644
> > > --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> > > +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> > > @@ -3371,21 +3371,21 @@ void vchiq_get_config(struct vchiq_config *config)
> > >  	config->version_min            = VCHIQ_VERSION_MIN;
> > >  }
> > >  
> > > 
> > > -enum vchiq_status
> > > +int
> > >  vchiq_set_service_option(unsigned int handle,
> > >  	enum vchiq_service_option option, int value)
> > >  {
> > >  	struct vchiq_service *service = find_service_by_handle(handle);
> > > -	enum vchiq_status status = VCHIQ_ERROR;
> > >  	struct vchiq_service_quota *quota;
> > > +	int ret = -EIO;
> > Due to the nature of the driver it's hard to make a clear distinction, but is
> > -EIO really the best error for the function? I don't see error paths that
> > really depend on communication with VC4. I see it more aligned with -EINVAL.
> 
> In general i totally agree with you. I just wanted to the keep the
> o(l)dd behavior, because vchiq_ioctl() has a catch all for VCHIQ_ERROR
> -> -EIO
> 
> I'm not sure if any user application relies on the error code of
> vchiq_ioctl(). Otherwise this isn't argument for all the other patches ;-)

This is something that bugged me the last time I tried to do a vchiq cleanup.
At some point we'll start affecting the IOCTL interface in subtle ways. It's a
PITA as we don't really know if there are users out there that wrote their own
VCHIQ applications. RPi ones we could fix.

I remember thinking that the best course of action would be to completely
decouple the core part from the char device. As in, for it to live under a
completely different directory, and registered the way we do it with the camera
interface. We'd get a way more concise VCHIQ core. But IIRC there are lots of
quirks and hacks to accomodate to the IOCTl behavior we'd have to iron out.

Regards,
Nicolas

