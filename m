Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9062E62E
	for <linux-staging@lists.linux.dev>; Mon, 19 Feb 2024 12:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708345924; cv=none; b=gPwNRbBo06Qti2o6m1DQzS3jU6u1CC+0/JX52I8Mrpuwg9GmPPrqYa9adHX1W4rXrC/C2Txn7S5zk/khKFwyZfAj3e2t3zrGCyAckdNyVNTu2zqFrFTe39MHtF1yP4U/SR0aGtVPl0DGwrB0XYfdjFcXIgJaxbh2iMklPC66/nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708345924; c=relaxed/simple;
	bh=j6578wxWKqcx8ONxEVdRiQYKPP0Syiq2K9w0PPf/ewo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TKPcshwJFo+5xKK/jLJ0T1XMgPOUpryGqR2/hQa7bEdn1GWfPzxAFmwmTGbIvtEfPKqsZjy9FhyIHv+cBFYOo54Cx3aiSwOdI+WsYAKN2BG+BUh1VWvong83SEzWDyB8E4VGUvhIAkZq5SpP09YNjjlrG9q4JfrD2YK3IYN/Lww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SrYCbiJ/; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SrYCbiJ/"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-55f50cf2021so5823015a12.1
        for <linux-staging@lists.linux.dev>; Mon, 19 Feb 2024 04:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708345921; x=1708950721; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H5rTBOT512LHdHzuBKt2E2Za1VrV48YhxTWcmimOXXM=;
        b=SrYCbiJ/sLAUQWT9k/aBlAAGt2juOfhALtkVeq7rPj7ikX572ynI1zGRIF4Ig1ZNsH
         l0iCU1k/VeUkPZsy46wdh/hoz89WNJ+GHldIGzMyhnz9lMg3NA1ayinrNJEDISTE20hy
         bC7VU/3zbn5R6NBXfEJD2BAUTGSV5Dji5icN2V1QcxOvBh9JdBNzpq+sIvL0FAA3saIG
         SFRvtn6G4cLt41KnAEQeBXTnyQNASCAHJ5oYhY0Qqqzy0QF2v4muorB6+CfPz8OZNfJY
         ZbZsaIJ4t1xtJiqLBeyfsy7FDoCO7BGedrbtA/224+HvR7tRB8OU8Tj36qSEabHRhjxn
         8jrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708345921; x=1708950721;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H5rTBOT512LHdHzuBKt2E2Za1VrV48YhxTWcmimOXXM=;
        b=YPouXbx/0pbV+9rYfYXhNVOMCsCNS5dvArm1wVR+QfOBrUa29Q/dVG2VuF1BgZb0yo
         fJfC0VDssGLanGDJTUOZPn0V777C8t37vnNJm7ws5Nenru0sS/ufUsCcZXDXYP8LuEmU
         A8etCb4TxSjNtRaHfH4YWlnY/r9Iw0ufw0I2eDD3lreSTwjTpDQ5k3uLo6PUzx1suTIj
         iewZ2AKdgw3OcSriDCEOLnWXSj3AyCpW0oBwoycWZewPQzg9MrHtDvZPhjlVZre0lblk
         vOktU3Fd94irnGpbGEyZTun3yFA7ryqs/kBWiz5lsPg5bY8iLIRR5BzLge97YIGV4EUz
         J27w==
X-Forwarded-Encrypted: i=1; AJvYcCXowU+JaSt3t8pXvK1eUpYAoZD36+RlOCvGIyyTI+3Y5kCJx7lb3V/idCiwQEIHNGFZhU1My+6InsQu0asTFWJ78NZsTsyjvSGI7U8q9Q==
X-Gm-Message-State: AOJu0YwPqFtjk4MgUaUi+qi0Lipvj4PPccb3lvC1QZTiafZamxjIG66K
	BFre9WOn9CsMCeth3Bdhp5DVPJSDszimdZqNzttsA8VRGBJtgTnTQ9K4FOYEyQ0=
X-Google-Smtp-Source: AGHT+IEqPkau5gA1xSLGNYFbfj0SBd1j9tWIVJtBLMtRG5TURWbjPOmxSGxc5PG7FWezTEwt4jfqrg==
X-Received: by 2002:a05:6402:14d0:b0:564:66c1:d527 with SMTP id f16-20020a05640214d000b0056466c1d527mr2208068edx.36.1708345921462;
        Mon, 19 Feb 2024 04:32:01 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id i7-20020aa7c9c7000000b005649f17558bsm348699edt.42.2024.02.19.04.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 04:32:00 -0800 (PST)
Date: Mon, 19 Feb 2024 15:31:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Moritz C. Weber" <mo.c.weber@gmail.com>
Cc: florian.fainelli@broadcom.com, linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Staging: vc04_services: bcm2835-camera: Fix code
 style checks
Message-ID: <4295c4b8-bcee-4a7f-8960-80b6d3934530@moroto.mountain>
References: <236d985c-1835-410f-b0b5-cacbd5fbf930@moroto.mountain>
 <20240219112234.8673-1-mo.c.weber@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240219112234.8673-1-mo.c.weber@gmail.com>

On Mon, Feb 19, 2024 at 12:22:32PM +0100, Moritz C. Weber wrote:
> Resubmit these patches to address comments to rebase the 8 v2 changes into
> 2 patches topicwise
> Fix patches with same subject issue based on v2, which fixes multiple code
> style checks for better readability, consistency, and fixes typos from v1
> 
> Moritz C. Weber (2):
>   Staging: vc04_services: bcm2835-camera: fix blank line style check
>   Staging: vc04_services: bcm2835-camera: fix brace code style check
> 

Looks okay now.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

