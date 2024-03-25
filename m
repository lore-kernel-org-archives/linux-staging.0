Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB4E4A29
	for <linux-staging@lists.linux.dev>; Mon, 25 Mar 2024 12:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711369739; cv=none; b=BLR9LTqikqUciIfTqAOBNwWXNjn/FHguOyiOpfrAoaNdcJQtTD9ayPyWcGeMM2fApautFg2MBSM8260DXRfEna1xm01y0qgrc+Sb87J+eDAz5JPSA117BYySm+1R1uvCL6x4r2gKcDg8DNkyfHI5J5UVmOEJyolGfjqcJX31L4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711369739; c=relaxed/simple;
	bh=4aRjekFogW63NJ/saTB+Ui/q79quDnGwh6aOvA8UlGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PVf4tRpSyfYmcyeR2osWcXg5lM/8/AHBUS0ZNYYc0MoNGuJ0+TeFmt90yMFL0Qzr1v53OYYRyy6YrkaPgeh0tiSrJkvJruiI4QPnmTeQe+RSenLEMwoyxCq2LVq2EhIWaOys0PUxjseyQwD/7zBCqt+KIOLtHD/tnvVhj6H5Rgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jbwjgmdl; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jbwjgmdl"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a468226e135so506923866b.0
        for <linux-staging@lists.linux.dev>; Mon, 25 Mar 2024 05:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711369735; x=1711974535; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A5iWcf+JZDsLUFR0I0zIhJdqU2WN9xV+AKxo3kNhvLA=;
        b=JbwjgmdlT86QOpR0Gdmeo2dRAGZz3HwIVpFtWVAtWlymiCC2X/FNyeQyogcLFAMFjz
         hGVRxhINL53n+AbwzaHkQg9j2ec6ABs7dfcbyyyDp89pgB4rxPg7H2T5u4/TEXuhu5WR
         074+XzGfMNUdHrCKcnRmbeONUT/in1rKO82FPZ6kvwVXhnwCJDovG1FubocrZzfHsPx7
         PMZpa5el2h7BOCAOYG1SB0RkTCq/RCx4YZ5l0pfQ8jpLP02mMTAbYqeYBX9/lPqLqAsX
         zEj2D/Q6OFmoy/z2xkAg9v0MkKSC+r0ZEAqoNmd44zllLFUo77KNp0p/jAKdif7zHH+R
         MF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711369735; x=1711974535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A5iWcf+JZDsLUFR0I0zIhJdqU2WN9xV+AKxo3kNhvLA=;
        b=ZJR+fyt5H6XRT6jD+WjTcUkaRLFL8i5o4b3R5YrnCKaNdeN2yxflvEAe9IQ0GVx2j9
         cZWN3WbS8Gc2TFkcgRB5bt/18kxXBdRteOmrUolbbcdvOGYDKoKt5DeeSdyKZxs6XHQE
         H/si881N8Lqe9/5GHGMWXh3R80vd8N8UGwx9b8cz/eeARVz+guEZNYZx/lWO3kx/0Xmz
         HvCnzdSLqCLwT7rdjPik4ZLE2J/OC0csvBSw31ufKuHMAR6OuEeSt5ZW+jEFaJHu/xcW
         8SOEl/1HIahHqtD5urFfNV5WF2YdQonbNrM4HIReZjWpPqzde59gIx64fbcSyqUwgsH/
         OPxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb9A8Hz9BaIxicMXjT3QfJFvIC4HA7j1S/O8BeMPusZtsegbFzmg5y0XgtY3BCc0KfNDheVR9vWUrXeQY8wZ9DuGCNp64TCWz0SOixNQ==
X-Gm-Message-State: AOJu0Yww3ktMCgOWTNATv5JGqn0ahlO5zb1BECt5fq+MyOhLdRnZL+kT
	UThYyiORUYbHw1KUm2wpT4IGkfnR1VUAto5JXKl/R98SHMmox13Q40vPHVjLIMM=
X-Google-Smtp-Source: AGHT+IFkj0j2GhlW2pPV439N3QcOLRTQjACpF7mNQ6hJa8q6n1DRrMckbturzaEhq4tBC0AGpYFO0w==
X-Received: by 2002:a17:907:6d0b:b0:a49:7078:582a with SMTP id sa11-20020a1709076d0b00b00a497078582amr2657317ejc.35.1711369735408;
        Mon, 25 Mar 2024 05:28:55 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id e10-20020a170906504a00b00a4735e440e1sm2994822ejk.97.2024.03.25.05.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 05:28:54 -0700 (PDT)
Date: Mon, 25 Mar 2024 15:28:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: coolrrsh@gmail.com
Cc: slongerbeam@gmail.com, p.zabel@pengutronix.de, mchehab@kernel.org,
	gregkh@linuxfoundation.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-imx@nxp.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v2] staging: media: remove duplicates
Message-ID: <f11e0f7d-3521-4f6b-b38f-2e6f3cc59674@moroto.mountain>
References: <20240325033427.4708-1-coolrrsh@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325033427.4708-1-coolrrsh@gmail.com>

On Mon, Mar 25, 2024 at 09:04:27AM +0530, coolrrsh@gmail.com wrote:
> From: Rajeshwar R Shinde <coolrrsh@gmail.com>
> 
> The kernel configuration VIDEO_DEV is defined twice in Kconfig.
> Thus, the redundant code is removed.
> 
> Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>
> 
> ---
> v1->v2
> modified the subject and commit message
           ^^^^^^^^^^^
You forgot to modify the subject.

regards,
dan carpenter

