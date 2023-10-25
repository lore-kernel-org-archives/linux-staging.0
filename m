Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983A5F4F0
	for <linux-staging@lists.linux.dev>; Wed, 25 Oct 2023 07:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K+yUan2u"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2c54c8934abso75139581fa.0
        for <linux-staging@lists.linux.dev>; Wed, 25 Oct 2023 00:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698217812; x=1698822612; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O/a2enGvtc1HJJcrsQxtyTV+TZ4Dj/K1d5FQy70Je18=;
        b=K+yUan2uSAm/dpvygn/V+8kjlMQYKjZypXyeRrD7Q2I09t55gUcxgH8FEOAh/WASnJ
         GiYnIwcEEEJlb2XBIx2+aVkpLPQq7mU2cqEN5PmVDOaeUEq/9hjDlIkmo7Jz2f3igG7W
         ZmI1pTqV+1yOIEdlM13vtdeNUsoUlYtqkkzfRP3RvngivigW/Selp6vv7cgWWmArSjCQ
         CLv9qhmp6Louit+ashHekloI778YAmbmLKcjSuZkO9bDLznfkH78+14jVv9z+SH5byoB
         o/1Ql2tUGFdDrOTTGPubuasAm4yRDjBnrrvUyWRlKC07dMMHXhLemYOqINNciZBJTE8S
         f+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698217812; x=1698822612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O/a2enGvtc1HJJcrsQxtyTV+TZ4Dj/K1d5FQy70Je18=;
        b=SZWQ1OyZw8ONKLXKlTlArBJXfDuvboqilLIRtKQfq9SZb0ACXopztsnJMcCzwZ2FqZ
         rrz1S/BJI6ANbJFPRLEficOTMtYPoVh2lZYbu6IlsR+sb6r7kNpN/eYB3ud/Q9iGdqSy
         LWIgMWzaUlov7A3hnPJYJIKO8KbuqVeOhNe019V8L01pI1A21f1B3TEoPERzxPlncvLW
         kBWcX/gDU5b+2tA9tBabrtnnP/97kMQwFAIf0ijB+Qp0cTAgJfAq8bB+PUBrLvFESU+q
         ep54kgRKwNasRlWnFyU3+qfzvzPkXqY3wiyOqkpZaZRYVU+TARplNGEWN2kmQqNx01Qy
         Eo8g==
X-Gm-Message-State: AOJu0YxoLgObs08za1mUUwP2v6BjIrba2LYUxG3lZQ3j82cw/JzLynFN
	l+iKu/BaBbKqG1W4KHeBtyzG3g==
X-Google-Smtp-Source: AGHT+IFrjhPdd6vWCM5twqWe8Gx1vQOZe4ftjHiARiD5M6kbpwMjDkRu3Y6/bbkfib0ftOWckR13og==
X-Received: by 2002:a2e:350e:0:b0:2c5:1c4:9005 with SMTP id z14-20020a2e350e000000b002c501c49005mr9520358ljz.32.1698217812468;
        Wed, 25 Oct 2023 00:10:12 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n13-20020a05600c3b8d00b004053e9276easm18734063wms.32.2023.10.25.00.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 00:10:12 -0700 (PDT)
Date: Wed, 25 Oct 2023 10:10:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"Ricardo B . Marliere" <ricardo@marliere.net>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 1/1] staging: vc04_services: Use %p4cc format modifier to
 print FourCC codes
Message-ID: <bd7f3a75-598a-428e-85c3-8dd867043c1f@kadam.mountain>
References: <20231025060717.71895-1-umang.jain@ideasonboard.com>
 <20231025060717.71895-2-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025060717.71895-2-umang.jain@ideasonboard.com>

On Wed, Oct 25, 2023 at 02:07:17AM -0400, Umang Jain wrote:
> Drop VCHIQ_FOURCC_AS_4CHARS macro in favour of %p4cc format
> modifier to print FourCC codes in the logs.
> 
> vchiq_use_internal() and vchiq_release_internal() uses entity
> character-array to store a transient string that contains
> a FourCC code. Increase the length of entity array(to 64 bytes)
> since %p4cc requires more bytes to hold the output characters.
> 
> Suggested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  .../interface/vchiq_arm/vchiq_arm.c           | 20 +++++-----
>  .../interface/vchiq_arm/vchiq_core.c          | 40 +++++++++----------
>  .../interface/vchiq_arm/vchiq_core.h          |  6 ---
>  .../interface/vchiq_arm/vchiq_dev.c           |  7 ++--
>  4 files changed, 33 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index fc6d33ec5e95..de6a24304a4d 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -1441,7 +1441,7 @@ vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
>  {
>  	struct vchiq_arm_state *arm_state = vchiq_platform_get_arm_state(state);
>  	int ret = 0;
> -	char entity[16];
> +	char entity[64];
>  	int *entity_uc;
>  	int local_uc;
>  
> @@ -1454,8 +1454,8 @@ vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
>  		sprintf(entity, "VCHIQ:   ");
>  		entity_uc = &arm_state->peer_use_count;
>  	} else if (service) {
> -		sprintf(entity, "%c%c%c%c:%03d",
> -			VCHIQ_FOURCC_AS_4CHARS(service->base.fourcc),
> +		sprintf(entity, "%p4cc:%03d",

Not related to your patch but these sprintfs() make me very
uncomfortable.

KTODO: change sprintf() to snprintf() in staging/vc04_services/

regards,
dan carpenter

