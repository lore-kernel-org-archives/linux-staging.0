Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F611C2D
	for <linux-staging@lists.linux.dev>; Sat, 16 Mar 2024 08:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710578228; cv=none; b=I+ei4ShcBJyAdL1a0fiF4MId6fLRP7zR9QVXNdWDuYi6Hk5hOZmGRMKq+6W0WWIouQiqrGQDUIJ9/o8La/il/X19mreo03ttA/sbbR4uBS6x+5y/z+pUH9cP86sVoo2MUCHefARAUEni2DBcYZwvM8rEb5HgnqnGMzSuG3799Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710578228; c=relaxed/simple;
	bh=6FxUfz26i2mU757QTNbH/5XQjtzSQEgy992T96rWZuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qczuu42SnVpIrHtTRXw9xOj1jdv8R8/8gSe+I1yuCDaGOUDBrZlCAyAh9xH7M8oijm3z/QmUWtGyfCtzkhiaGNlyw6yA4tjGfEUqwZmi/KwjK0hWj8/+dHlUFxsAR6b1jHTcuO9Wc06ZIFsYqsQu15Fl2kNLCV2kGYws+wXQc9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GKQOL1rc; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GKQOL1rc"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4140727912cso2323335e9.3
        for <linux-staging@lists.linux.dev>; Sat, 16 Mar 2024 01:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710578225; x=1711183025; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MRXv8+kk2vwgn86+Rp0F4Kj3NVm91b0/gW4aSQjDx1M=;
        b=GKQOL1rcL5H8g5b07SxmsJa+oEN3uJ9mWa2vHQfE2R/NeKlrThCDmebNEmRlSkbuRo
         WDPJIemuPRZ8Os2ldRE7Afi2i/wUownaSBe/SA4SRyvRlXxISApnfcICj1pTsYsJWYdw
         eXubJ3tyKWqBS/xP2Ny4n9AvbLzLHi8unNgzPvbD8/AfTyYQZm63sVC8XMfwD3UOM7q8
         RPBDmWAWLMIfbrS/2vphilukSCvD5Rd/dfpVfX4PNx3VLhaYpcHDuAZgKeIBtBOifHRL
         gM+/Du9X6awZCLGNFNTBJY+QcM9gnaXkU+C+a12t21N0n9c9n+wmcz2ciUouN5LXRbLo
         +opQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710578225; x=1711183025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRXv8+kk2vwgn86+Rp0F4Kj3NVm91b0/gW4aSQjDx1M=;
        b=mc3wEpVQakFIXal+0mpj8+8ARl10EcuwmKigOkTi5Opnqgegqp2Zo4AE/2sMd2yvZf
         uuTJeUfmonvDeCGJ1Tph+yu+rPlW3/LUFwYmpFod9g6NzG48iWAdhDvKxdFXB+pMnspQ
         UQDispxjF5IdzxkQ6ts72uHPqBHsElhpz2shUzQCQ7DnWhSx72pdH/0uojKEvvM4/nsg
         OvA5bNcj8cLMtxMMRKU+IMjvMBOASO+mYWjW+5sHOPGDGSe2J25nh4/JJkfs6KAWe0jn
         m0LZMP0ZeIn9M806Kz5ympx8jE7RagaLjAvUUyKt42ifV1G22cdhJ9fsZS1g+qxIGG3I
         uJzQ==
X-Gm-Message-State: AOJu0YzSBkA9LhTPNgekxW6EM4uZF4WeAUf8/o6t9cQF1dwrxFGSgka9
	mBRijqQB42/du0VQZlOSqmxGqt/AVFQxbVAXGsImYOpGcrKVa02Dhd3NCW13b5Q=
X-Google-Smtp-Source: AGHT+IHIeCFniYXY1EwHxflBgK/WNR/qpWZZLCrIdPvd/0PQjowpmPw7Ea7Y9kH8HOX1wEz4p6Z4AQ==
X-Received: by 2002:a05:600c:138b:b0:413:ee37:20e0 with SMTP id u11-20020a05600c138b00b00413ee3720e0mr3847861wmf.9.1710578224636;
        Sat, 16 Mar 2024 01:37:04 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id bp6-20020a5d5a86000000b0033ecb329f15sm4795313wrb.9.2024.03.16.01.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Mar 2024 01:37:04 -0700 (PDT)
Date: Sat, 16 Mar 2024 11:36:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Greg KH <greg@kroah.com>
Subject: Re: [PATCH 3/5] staging: vc04_services: Do not log error on kzalloc()
Message-ID: <de519bae-1f1d-4ab7-bf74-48ead8f578e2@moroto.mountain>
References: <20240315105659.111544-1-umang.jain@ideasonboard.com>
 <20240315105659.111544-4-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240315105659.111544-4-umang.jain@ideasonboard.com>

On Fri, Mar 15, 2024 at 04:26:57PM +0530, Umang Jain wrote:
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 3c3e6f3e48ce..1151cb4a84f9 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -690,7 +690,6 @@ int vchiq_initialise(struct vchiq_instance **instance_out)
>  
>  	instance = kzalloc(sizeof(*instance), GFP_KERNEL);
>  	if (!instance) {
> -		dev_err(state->dev, "core: %s: Cannot allocate vchiq instance\n", __func__);
>  		ret = -ENOMEM;
>  		goto failed;
>  	}
> @@ -957,7 +956,6 @@ vchiq_blocking_bulk_transfer(struct vchiq_instance *instance, unsigned int handl
>  	} else {
>  		waiter = kzalloc(sizeof(*waiter), GFP_KERNEL);
>  		if (!waiter) {
> -			dev_err(service->state->dev, "core: %s: - Out of memory\n", __func__);
>  			return -ENOMEM;
>  		}

You need to remove the curly braces now as well.

regards,
dan carpenter

