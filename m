Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F044499A4
	for <linux-staging@lists.linux.dev>; Sat, 11 Jul 2026 09:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783761402; cv=none; b=mhBEBoPfZHOYG/Zzdj4LblnnuRo9oKC4I5hAUqX6afnlw7y3qfz4NmQlQio5kqIvW2CAoftwDaBZUFcn3QDMEaRZTDNRf68DOq8Q/vTtu7tksiP0gTzuwZM5yJfutuX8GtMlv5aXRihvp2bO9r8ak6haOnwRoR/VkyhRD3iiSWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783761402; c=relaxed/simple;
	bh=uaK4E2NN338KW60VTHBVG2Nge1niyLZtTyuoJn6LktE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tnalU0SY5EXoMWnTG40i/S6k2/MbQT4nrxUSo3I2J54gfCp0/dZO2zzFA2bFD0ZZPfTNuS/x0MN3C0Qn/ks74oElBhzJH+kfw4+ecJ3v9nWi0y8fR7E1akIva1/sHxdCxh6koymL5GSB/p2xRcwXAJlBXixhmFOPiX3sHLbfVvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SQw4/qpT; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SQw4/qpT"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so12300915e9.1
        for <linux-staging@lists.linux.dev>; Sat, 11 Jul 2026 02:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783761400; x=1784366200; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gsR0+1V67dKoDon9Zt9yFSPL0W+9/ofIZEZlGwU2kRs=;
        b=SQw4/qpTPb1J/bAy/A6qK6YragcpTbP85f7QTT6gkh+5gHZNV080z8X8fqyV6GL2te
         ilfiV+qGojrjb9VGMfR+ZWInfMJXm3zgKCIJVwhFUYPS71Ic8AcMzvRec6gzIMiE/80Q
         hX5uRkBZ3+EDgUo11kLN41V21ZIMODkhnzXwuonYgVdSomQIlE2w6b+RufiihCc7/EhY
         RyyMacF+KjLBFC0T66op0PsTWmfKycQiunR95lI1eiQc9unfFlkLOrg31mHhUDl15jag
         plKQgvohLEgOw48dw1uL4odXd0UgLiykGwDxFzP46HW/hUNQTQ2SYwoowJWchYaHmutb
         XnSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783761400; x=1784366200;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gsR0+1V67dKoDon9Zt9yFSPL0W+9/ofIZEZlGwU2kRs=;
        b=V6c5CeFvWoMNlPH228YZ2BP70QiltqUSdiNuMSzk2KJGVriysxXb40osqRxgKOh+Cc
         33EXPyznq8RpqPb2xQeVXGmU7PmyOo0h7Dgc0nS5YEyfGJ+tWfgGgOgZRN1Ncf4rm0B2
         nvcjtNVuUVCWLDK0KR6Ehnvrg5RmObiaYLDrOSwY4YueKVhFmehtFvJ1MP+MPKb0p3g8
         kx586BjARu6q1X5qMWZ9HXyjNM+Vax3Z6fypcViJ3qVv4pxZhF25CmW0x+azdrO3SUvg
         MfB9t+zJguOKVOK+F7OkLkmPlqge08j9N+oiNwNzP4W/oWmtNQSHANwL45X3PX1QDLAk
         FIcg==
X-Forwarded-Encrypted: i=1; AHgh+Rr3O3vtKaN4pGdcxhIOBRq9ljI2wU0n1etVcR2GAyxfTrB2hWOO036XJOOUS8c2ZCd07VF9moFUzqAl90mz@lists.linux.dev
X-Gm-Message-State: AOJu0YxnRdqAHTkhglRcbCBY00mUj/2AuJG8rslF+CZyd9R2RCZRCJlX
	2NunT01WMre5klZ0JqlVyXumbdq7zvzF8mDb8nPOTJPJqG224lXanRh9inQwLHw3EqI=
X-Gm-Gg: AfdE7cl9Yw19Sklq56s/S+gceIoEHdHmqU8IX6+/Lq8xPwYygXG1U1UFsxetTXPUR6h
	bL6nsoxyvdp+22z4pq1y/TSz91jnTfylAmvExAZkh1L1Bx6zQxR+GSxpHrGXIwZfUoTwgODzu5t
	4XjuOBToiWY6Pq3nt5HTrbWzyUHppg7tprh+lj1evnUGq5v5tvlwUZO9V22M9DsaWM3s2rngox3
	CqVm1bFFjtN7eEYcPQScdv9E8yUaLXPpJ7hkGIV1RhgzVTwpeAPPK5yrbparpHRxoigfmWM13p1
	ObTZSwdTrOks1Oxp/0elSOw3dOHXLZFrWvZWT2gX0cPccQ8kKD8j6T67Yjtq0IoRO+bJ/ecLaFE
	ubJQT9KLzEPJ+JSSSnBsxdd87yzczl0Qyc/TQAY5+e1IZWCVLPLGxqL/UWeJUCi0w+fAn/cCdiz
	6VrPavwKru
X-Received: by 2002:a05:600c:3492:b0:492:714d:8c4 with SMTP id 5b1f17b1804b1-493fb0450bfmr9365165e9.11.1783761399743;
        Sat, 11 Jul 2026 02:16:39 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb670a41sm193656215e9.0.2026.07.11.02.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 02:16:39 -0700 (PDT)
Date: Sat, 11 Jul 2026 12:16:35 +0300
From: Dan Carpenter <error27@gmail.com>
To: erqeons <erqeon@gmail.com>
Cc: gregkh@linuxfoundation.org, hansg@kernel.org, andy@kernel.org,
	mchehab@kernel.org, sakari.ailus@intel.com,
	linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: fix indentation and remove dead
 return
Message-ID: <alIJ83ctZ7NDzBhF@stanley.mountain>
References: <20260711081657.37117-1-erqeon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260711081657.37117-1-erqeon@gmail.com>

On Sat, Jul 11, 2026 at 12:16:57PM +0400, erqeons wrote:
> Fix style issues reported by checkpatch.pl:
> - Remove unnecessary return statement in void function.
> - Convert spaces to tabs for function arguments indentation.

Split this into two patches.

> 
> Signed-off-by: erqeons <erqeon@gmail.com>

Real name, please.

> ---
>  drivers/staging/media/atomisp/pci/atomisp_cmd.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> index 6cd500d9f..fb1ae146b 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -1419,7 +1419,6 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
>  
>  err:
>  	atomisp_css_free_stat_buffers(asd);
> -	return;
>  }
>  
>  static void atomisp_curr_user_grid_info(struct atomisp_sub_device *asd,
> @@ -1885,8 +1884,8 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
>   * Function to check the zoom region whether is effective
>   */
>  static bool atomisp_check_zoom_region(
> -    struct atomisp_sub_device *asd,
> -    struct ia_css_dz_config *dz_config)
> +	struct atomisp_sub_device *asd,
> +	struct ia_css_dz_config *dz_config)


Normally we would align it like this:

static bool atomisp_check_zoom_region(struct atomisp_sub_device *asd,
				      struct ia_css_dz_config *dz_config)
{

regards,
dan carpenter


