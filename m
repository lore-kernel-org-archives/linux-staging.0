Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D92A340DB2
	for <linux-staging@lists.linux.dev>; Wed,  7 Jan 2026 14:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767795614; cv=none; b=rM+lna44v+pBKbKz3TEvrV/A2GKI4Mxs24QfZS4bt6ZQRkRfaydkLopYC7/vAhOiS2AklzTorQ+s/rI23X7rhLEYsoEUdGiUmd++J2ult6RqXm3qmkDVXp+/P+yaosL/MUVmaxWBfu9Pm6K3h+z0D81zLA+Gp/Go+BrBmEya5NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767795614; c=relaxed/simple;
	bh=RP6yrOmfkgG1pSCCp/KgSQ837psbCw1sb+DDsPfjTA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qL6Zg95h72q0B5oopUUfBJ8CgboNTmJWToyXrtyw9QhpFAcbqdAJReoxZMsVZhenHByDGeGXA0A1OPLVP4dD2N/04ms0lpzH3z93jnZRlaXJepVfPSFM8DWMpUMTKgLCoCSvYleCoi+AibUaUd0Kax2GR12lUleCDaKO1jVuNIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Eq275hT8; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Eq275hT8"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42fbc3056afso1126843f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 07 Jan 2026 06:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767795611; x=1768400411; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/3EuWWmPchcdKXlx3oZPsaTz80UKO5qPXs+yQV6vLYk=;
        b=Eq275hT8JqGxGcAu1m9aK9TLOop2y7XzDCQMzGZkqZzHLdNJecxFmMyKTuseXSj2pM
         +1jpPdeMNGe7rPzjwbuC6wMbleTyEL7gzJaXVW3/IzkhKGK1RKYbNG5tOVuxmpzIjJ0l
         J8Syeg3jj511mXaNA4IWH0rKPFJdmBVMavQVPuqomrF78jLjnkZQv05Ko5O67Fr/B8u2
         C13wsJeXKuzu0HCiRo8nOWqAxKMSiHS8FgMHmsCHfOMEWaCoEGN5GMm64hnevTMreBnq
         hKOUJsq6AF8S2ueullq7bvDU+AxQVjkuLBAB+XE+Ewrk0j/zoRiE5WoNMPVnb2RzRVyW
         xy4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767795611; x=1768400411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/3EuWWmPchcdKXlx3oZPsaTz80UKO5qPXs+yQV6vLYk=;
        b=PC/b9ZS0w36VUtB/ciA6LvJvFc9Irr8GbFPWlx7YryNFZbwIto1Uxvu4kU/TDB++v/
         BVgK+rr5M3OlXU01E4oDNMTxKe1swdFbKjNLJ4vNJ1RWTJIeKg/DW3/GI4mHpEKZkKB8
         ewWhGIGYxzdTomhFQFSKJdzJdvhzdBGmV9SFv8NUMT1CrMvTA+/OpMKJpp/MJA/b4USK
         3ucr5N3UPsaCR42W90UyTd0QLkkREY7HRWncezuIoCgEo/CoGb1iZzyw5HkdRMCU61EF
         VjkQ/1THsZdnn5y9XBMZXZbpMIBe5gw3GMuMwyZ9kTt5pvrbMinB0Danb0BhjpP3GWv8
         ed1w==
X-Forwarded-Encrypted: i=1; AJvYcCW65N1Dmh3JpSeluwxmsesxE4JjPt7xnnzd1Cmvy8lV7m4iLrRNeHQRravHXnFhlURLF50vLzNnCoEfr2iw@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+uvNOHrKTwA+4pbFdmDVc4uXLN29mZFRu6t0FA0NVCd0//Lww
	HTCRcEHbS5M2W701FHCS5N6cY3d6x7TkkSLvSX/zwZpYgjhZSKmZwPLvPg4P1UYvBI8=
X-Gm-Gg: AY/fxX4w9Jd0KUOo85eQDZgR9/xnog2RBYPRDWEJZcXGz7nSL0t6KMwS6OVdlQx/yMJ
	3PrTkfO0r7T77Gr6o4yf9dcLtrtTBJ52aGT7q9h+EvA0RjpPQLPtiLv2ViRjObIXi3nE5LJhIMd
	OWb5oSL8Cb1pgD+sNMesAyzUEGmgnXm46zcc5UoC7Kgkmj8i6VpARcrVtTCf7esNsZbYFT2jUfS
	+HL6hT0ORhqAJa8bexGJzVCfn+joBEj1ZI8oYAD/gDeFG4dB4eNRJNcedvEQBzNrDb/O/Bkd5pN
	tSVP/tVsdVeORZ3RQOUUNuhVg7e7kA2wCh/r6UUUk+Y1j2Fy9MAVubqf7D0ol0zrHfR2HoS3I/0
	IPcEvOwEiGAsejs58ZcGD/u6FosegLldrTB9Rqs/jMcJot6omRINczFzbcNMLrt6suvuezsdm56
	LdY5sW2UanV7tTqsio0mmOUjN08PE=
X-Google-Smtp-Source: AGHT+IHUqb1cXUtZCpRJ8P4UFLSIpAgDZ36o1m7wd/K9meyda/t653aOMHHTvrT9/dtiigGlLK+MGQ==
X-Received: by 2002:a05:6000:2302:b0:431:316:920a with SMTP id ffacd0b85a97d-432c3628fdemr2605337f8f.8.1767795610407;
        Wed, 07 Jan 2026 06:20:10 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm10689604f8f.43.2026.01.07.06.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 06:20:09 -0800 (PST)
Date: Wed, 7 Jan 2026 17:20:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Karthikey D Kadati <karthikey3608@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 RESEND v2 1/3] media: atomisp: replace shadow zoom
 structs with v4l2_rect
Message-ID: <aV5rloYmYfLMkMKA@stanley.mountain>
References: <81e2d12c-342b-4b88-88a0-3e24115541aa@kernel.org>
 <20260107134844.68074-1-karthikey3608@gmail.com>
 <20260107134844.68074-2-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107134844.68074-2-karthikey3608@gmail.com>

On Wed, Jan 07, 2026 at 07:18:42PM +0530, Karthikey D Kadati wrote:
> Remove custom atomisp_zoom_point and atomisp_zoom_region structs and
> 
> usage in favor of standard v4l2_rect within atomisp_dz_config.
> 
> This aligns the driver with V4L2 standards and removes unnecessary
> 
> custom types.
> 
> Also standardizes the internal ia_css_region struct members to match
> 
> V4L2 naming conventions (left, top, width, height) to facilitate the
> 
> bridge mapping.
> 
> Updates atomisp_cmd.c and sh_css_params.c to use the new member names
> 
> and ensures safe math using long long casts to prevent overflow during
> 
> resolution scaling.
> 

The commit message has extra new lines obviously.

> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> index 327836372..4ed6b8aea 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -1764,15 +1764,13 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
>  		return -EINVAL;
>  	}
>  
> -	if (dz_config->zoom_region.resolution.width
> -	    == asd->sensor_array_res.width
> -	    || dz_config->zoom_region.resolution.height
> -	    == asd->sensor_array_res.height) {
> +	if (dz_config->zoom_region.width == asd->sensor_array_res.width ||
> +	    dz_config->zoom_region.height == asd->sensor_array_res.height) {
>  		/*no need crop region*/
> -		dz_config->zoom_region.origin.x = 0;
> -		dz_config->zoom_region.origin.y = 0;
> -		dz_config->zoom_region.resolution.width = eff_res.width;
> -		dz_config->zoom_region.resolution.height = eff_res.height;
> +		dz_config->zoom_region.left = 0;
> +		dz_config->zoom_region.top = 0;
> +		dz_config->zoom_region.width = eff_res.width;
> +		dz_config->zoom_region.height = eff_res.height;
>  		return 0;
>  	}
>  
> @@ -1783,18 +1781,18 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
>  	 */
>  
>  	if (!IS_ISP2401) {
> -		dz_config->zoom_region.origin.x = dz_config->zoom_region.origin.x
> -						  * eff_res.width
> -						  / asd->sensor_array_res.width;
> -		dz_config->zoom_region.origin.y = dz_config->zoom_region.origin.y
> -						  * eff_res.height
> -						  / asd->sensor_array_res.height;
> -		dz_config->zoom_region.resolution.width = dz_config->zoom_region.resolution.width
> -							  * eff_res.width
> -							  / asd->sensor_array_res.width;
> -		dz_config->zoom_region.resolution.height = dz_config->zoom_region.resolution.height
> -							  * eff_res.height
> -							  / asd->sensor_array_res.height;
> +		dz_config->zoom_region.left =
> +			(s32)((long long)dz_config->zoom_region.left *
> +			      eff_res.width / asd->sensor_array_res.width);
> +		dz_config->zoom_region.top =
> +			(s32)((long long)dz_config->zoom_region.top *
> +			      eff_res.height / asd->sensor_array_res.height);
> +		dz_config->zoom_region.width =
> +			(u32)((long long)dz_config->zoom_region.width *
> +			      eff_res.width / asd->sensor_array_res.width);
> +		dz_config->zoom_region.height =
> +			(u32)((long long)dz_config->zoom_region.height *
> +			      eff_res.height / asd->sensor_array_res.height);


Why do we need this new casting?  Is it a bugfix?

I don't love the casts to s32 and u32.  Those are unnecessary.  Also
width and height are s32 so why are we casting to u32?  Same comments
for the other casts later on.

There are more style changes than strictly necessary to just rename the
struct members.

regards,
dan carpenter

