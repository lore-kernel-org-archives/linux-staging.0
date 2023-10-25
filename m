Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B125D8480
	for <linux-staging@lists.linux.dev>; Wed, 25 Oct 2023 09:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kFzbeKvv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88251C433C8;
	Wed, 25 Oct 2023 09:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698227163;
	bh=zXmP2B8zYPqXpdAmO8tizBj+J/IG8kpzFJNWBcUYlio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kFzbeKvvyjHPBbNnTe6hPNrK7cXc3E6waaC3JNh+UepTsZQAe/Tviw8Y+coa1e2Wg
	 ZWpiTrDIO4Dm1IYISQ7wfUVm4kPJXS0YYcC4MjABiHi/l9AjwyxgFpKE9M0MVtPDrS
	 n1LAcsJBRXlhdmYd1XkkwdghvbJeoINVJ4s9ZiQg=
Date: Wed, 25 Oct 2023 11:46:00 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	"Ricardo B . Marliere" <ricardo@marliere.net>,
	linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/1] staging: vc04_services: Use %p4cc format modifier to
 print FourCC codes
Message-ID: <2023102546-trident-clear-1299@gregkh>
References: <20231025060717.71895-1-umang.jain@ideasonboard.com>
 <20231025060717.71895-2-umang.jain@ideasonboard.com>
 <bd7f3a75-598a-428e-85c3-8dd867043c1f@kadam.mountain>
 <ZTjf0fT0yl2cwGWJ@kekkonen.localdomain>
 <fe0b6ed1-61ba-5373-1525-adb040f68184@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe0b6ed1-61ba-5373-1525-adb040f68184@ideasonboard.com>

On Wed, Oct 25, 2023 at 03:04:04PM +0530, Umang Jain wrote:
> 
> 
> On 10/25/23 2:58 PM, Sakari Ailus wrote:
> > On Wed, Oct 25, 2023 at 10:10:08AM +0300, Dan Carpenter wrote:
> > > On Wed, Oct 25, 2023 at 02:07:17AM -0400, Umang Jain wrote:
> > > > Drop VCHIQ_FOURCC_AS_4CHARS macro in favour of %p4cc format
> > > > modifier to print FourCC codes in the logs.
> > > > 
> > > > vchiq_use_internal() and vchiq_release_internal() uses entity
> > > > character-array to store a transient string that contains
> > > > a FourCC code. Increase the length of entity array(to 64 bytes)
> > > > since %p4cc requires more bytes to hold the output characters.
> > > > 
> > > > Suggested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> > > > Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> > > > ---
> > > >   .../interface/vchiq_arm/vchiq_arm.c           | 20 +++++-----
> > > >   .../interface/vchiq_arm/vchiq_core.c          | 40 +++++++++----------
> > > >   .../interface/vchiq_arm/vchiq_core.h          |  6 ---
> > > >   .../interface/vchiq_arm/vchiq_dev.c           |  7 ++--
> > > >   4 files changed, 33 insertions(+), 40 deletions(-)
> > > > 
> > > > diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > > > index fc6d33ec5e95..de6a24304a4d 100644
> > > > --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > > > +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > > > @@ -1441,7 +1441,7 @@ vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
> > > >   {
> > > >   	struct vchiq_arm_state *arm_state = vchiq_platform_get_arm_state(state);
> > > >   	int ret = 0;
> > > > -	char entity[16];
> > > > +	char entity[64];
> > > >   	int *entity_uc;
> > > >   	int local_uc;
> > > > @@ -1454,8 +1454,8 @@ vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
> > > >   		sprintf(entity, "VCHIQ:   ");
> > > >   		entity_uc = &arm_state->peer_use_count;
> > > >   	} else if (service) {
> > > > -		sprintf(entity, "%c%c%c%c:%03d",
> > > > -			VCHIQ_FOURCC_AS_4CHARS(service->base.fourcc),
> > > > +		sprintf(entity, "%p4cc:%03d",
> > > Not related to your patch but these sprintfs() make me very
> > > uncomfortable.
> > > 
> > > KTODO: change sprintf() to snprintf() in staging/vc04_services/
> > Umang: how about one patch on top of this? :-) There are just five
> > instances of it.
> 
> Ricardo, how about this? Do you want to take a swing at this ? :-)
> 
> And send a v2. ?

No, that would be a separate change, this one is fine as-is.

thanks,

greg k-h
