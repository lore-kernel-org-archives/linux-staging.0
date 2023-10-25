Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BE92D623
	for <linux-staging@lists.linux.dev>; Wed, 25 Oct 2023 11:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=marliere.net header.i=@marliere.net header.b="ASZHunVi"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6b5e6301a19so5298245b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 25 Oct 2023 04:12:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698232352; x=1698837152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:dkim-signature:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gVeTDHNiYFAq0E4cZLjml4cYo09NnTGBtpZK+Ci6oew=;
        b=VuLfez8iwjSegQ3khtzRwb4Cq56ee6YXFLMsIqKuafyHf3UA6OzpcuYbGi7rIgBLOC
         HAKrkfVGa4rS8tabDbbhUddZ8f2/4POkVCLHpeboaLFSHQx43esPPYZIOZqUEwZJKNsk
         IAp+ZePepaPUpWwY94oMGt/ezFqtpmCGXEKBhROVre0/Jo1smwmfPcbr1p0UlSAbt8y0
         sMyhgRjUCmjxLGP9Vgtfn8Rg+ZyhBUs9pLiJmv53TP/3x2R/KMz+gGfei6IfTyoIevTq
         NCA5u0+t6H5oDFg9hSaB5kG1r0Sv8f3EQ63RzxnAoj4TsZNtFHp0JMPH1VRgc4ztSeff
         r+Fg==
X-Gm-Message-State: AOJu0Yyvb0WQBwPt/rDSWwa0sjE1XWic1y13gSxi8CmEPvJHj2fP9V/N
	A+nSlKMIIrn+ph4v3+LO40o=
X-Google-Smtp-Source: AGHT+IFjbriHfa4Gl9sFnWHU8GbQeS718AwbIbRVgDhurwrSv4kdyeKTHjS1maO0ee6/5iW7xKmJLg==
X-Received: by 2002:a62:6106:0:b0:6ba:8478:b99f with SMTP id v6-20020a626106000000b006ba8478b99fmr12986285pfb.28.1698232351950;
        Wed, 25 Oct 2023 04:12:31 -0700 (PDT)
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id x190-20020a6263c7000000b0069337938be8sm9530410pfb.110.2023.10.25.04.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 04:12:31 -0700 (PDT)
Date: Wed, 25 Oct 2023 08:12:33 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2023; t=1698232346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gVeTDHNiYFAq0E4cZLjml4cYo09NnTGBtpZK+Ci6oew=;
	b=ASZHunViQMwyt+rN1JWF1PfVa8VGpDlkSp2fQlI52X60C6RHEB7GD0y9GksUqennARBZRE
	CFQOTqEIG3FmENAhrIlDwf3gRyu+IY0LbWJgjMv9pRtlLTCqaCbRR/vO2rvo0SdrtIck1F
	HHHssuSHuARdN317AkOaQxv8isUR/W8qHIYqOhkb66F5erZqV9k56sv5BIqzblWPgeZzzW
	7m4x2jsU1NkzjxZ6BPmYKDDnk4Ky2UcqdKJyorbUjnDzz0PGmFtiUQxGltKefkIjbM+eQG
	s4P+oY7MdSMAaANRjla4pJbwazC1vXu4pEFbKjTUecjQxEEgluDtZprrBOMUxQ==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
From: "Ricardo B. Marliere" <ricardo@marliere.net>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, linux-staging@lists.linux.dev, 
	linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Stefan Wahren <stefan.wahren@i2se.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <error27@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/1] staging: vc04_services: Use %p4cc format modifier to
 print FourCC codes
Message-ID: <5zsxrx553w3e57n6sqff7y4bfn2opir65bvb3o7mbiipzn2po4@gs7d3hkgjr3d>
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

On 23/10/25 03:04PM, Umang Jain wrote:
> 
> 
> On 10/25/23 2:58 PM, Sakari Ailus wrote:
> > On Wed, Oct 25, 2023 at 10:10:08AM +0300, Dan Carpenter wrote:
> >> On Wed, Oct 25, 2023 at 02:07:17AM -0400, Umang Jain wrote:
> >>> Drop VCHIQ_FOURCC_AS_4CHARS macro in favour of %p4cc format
> >>> modifier to print FourCC codes in the logs.
> >>>
> >>> vchiq_use_internal() and vchiq_release_internal() uses entity
> >>> character-array to store a transient string that contains
> >>> a FourCC code. Increase the length of entity array(to 64 bytes)
> >>> since %p4cc requires more bytes to hold the output characters.
> >>>
> >>> Suggested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> >>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> >>> ---
> >>>   .../interface/vchiq_arm/vchiq_arm.c           | 20 +++++-----
> >>>   .../interface/vchiq_arm/vchiq_core.c          | 40 +++++++++----------
> >>>   .../interface/vchiq_arm/vchiq_core.h          |  6 ---
> >>>   .../interface/vchiq_arm/vchiq_dev.c           |  7 ++--
> >>>   4 files changed, 33 insertions(+), 40 deletions(-)
> >>>
> >>> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> >>> index fc6d33ec5e95..de6a24304a4d 100644
> >>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> >>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> >>> @@ -1441,7 +1441,7 @@ vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
> >>>   {
> >>>   	struct vchiq_arm_state *arm_state = vchiq_platform_get_arm_state(state);
> >>>   	int ret = 0;
> >>> -	char entity[16];
> >>> +	char entity[64];
> >>>   	int *entity_uc;
> >>>   	int local_uc;
> >>>   
> >>> @@ -1454,8 +1454,8 @@ vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
> >>>   		sprintf(entity, "VCHIQ:   ");
> >>>   		entity_uc = &arm_state->peer_use_count;
> >>>   	} else if (service) {
> >>> -		sprintf(entity, "%c%c%c%c:%03d",
> >>> -			VCHIQ_FOURCC_AS_4CHARS(service->base.fourcc),
> >>> +		sprintf(entity, "%p4cc:%03d",
> >> Not related to your patch but these sprintfs() make me very
> >> uncomfortable.
> >>
> >> KTODO: change sprintf() to snprintf() in staging/vc04_services/
> > Umang: how about one patch on top of this? :-) There are just five
> > instances of it.
> 
> Ricardo, how about this? Do you want to take a swing at this ? :-)

Sure thing, I will send as another patch as Greg suggested.

Thank you,
-	Ricardo
