Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D63D19644B
	for <linux-staging@lists.linux.dev>; Tue, 27 Aug 2024 08:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724748068; cv=none; b=C1pcjCHY1wCarhrd2sNgsW11VoBLdxl1FuABVVbdycV8RBcM1XgoXPCwwmCQNmAJJ2De+511UqhGFidCef+GQINnH4/d7JxacJFHLocfMXqkz3C8JujUUox3PMVYTo7s/lSFEKk/NvdLBe6nCEcUAN77hrCVtyQutBrzMG8Tfns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724748068; c=relaxed/simple;
	bh=0gqafYpFsfCbct7kk8S2BYP5nbyMWFsVauV6F5Nxq/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gdK5UX5swBEfopxH4gnBqQkxUoowuHO85Z40FaMLahm4Q/lRHQm43d3nKPMxdF0jVfihtkz5uVysr2wXIK/pTyCZ3riDRPbpz9cyQHCkdoftsTk/CWp42IqgbYoc63vl64dQIDurokLBdxD/6CJSUg3namTmd9J7BlnSret63ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mtAOS9V6; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mtAOS9V6"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42819654737so44405685e9.1
        for <linux-staging@lists.linux.dev>; Tue, 27 Aug 2024 01:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724748065; x=1725352865; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WLgLPlnbrmv4PGVaAQ6YPq+VN6mj8qeNpxeetEpH32c=;
        b=mtAOS9V6nqhtZ2BPOrwB9xTJgozugsEClbb+uBxrasDgXumfj9gazOtOyggxumoqqM
         mJQyRfb6aa9wn3QqCsbU8nJq1cDIkN/VCg4oPBgslKxyyYcl5cxZSEyo7Mvfpbpb296A
         er+QJ+ZjImtQINjCT4fmJ/zt4/CRgHod8GKdZylewrODJVMTVBQD0qeGPoW30RuSJkHe
         VUzkl016dlyEPxAk/QjLB4I5AwbhAbiqi6n9dzRURp2s4juj4vZtZUOREMWAIZOhcANg
         7tMkIVHql6WzhZ0VAR/tOCTcuMiVzlyivPWV0cQMqTwp1eZx6q9r9kNImbDu9Do5jMdE
         NR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724748065; x=1725352865;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLgLPlnbrmv4PGVaAQ6YPq+VN6mj8qeNpxeetEpH32c=;
        b=ddt3MYyDXDA7jYmjypyN7ZM/RerkJsxhbMdgd3aHztWfDSHhaSlzf/WI6vnms0EpuT
         c5XEPprlix/3VPiXNCf/t47M0xmHsrQOLJdgk+KFqxUBiNelzzhcRIDQL4yYwGk9AFna
         BbAreNnVLD2UY/pcI/zaoqO/kTgMgYd6X1JuX8d4PfLqqycjt+EokD6LWKXg7Cm5UNc3
         eJD20OlRIUpCQMoVL7Kmtnwgm8mlGt4BoRHIy/pzbIhdq4J+mMQI07ouhh7rjhDOBWH1
         2eH+ou2y2m74SMcCnPL7wmUz4O6hIHFWHHVtt9H/HdDrOlIcpzV3/0PDRqIRpDeMcCwc
         NmHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtSXNdqNSrMuIPnYY2jRgW7/PCBg3TctL7dmd7mKZHzyHOOrpbjKJlqBpnZKRsvwfnv61dIxCV0bNDtzo1@lists.linux.dev
X-Gm-Message-State: AOJu0YyYOBvxJB6cZEQdWOtrgsrIGIxxAnfxqTIDwrwjfvPCKWLvzsBm
	Y+ZyAgK/veOWill4UtEO6+DEKt6WXqw0xsdRuWGsTOhTJOOK6kUbOWKJtTiZc+E=
X-Google-Smtp-Source: AGHT+IHD7U7oSMgJ9gZmwzeFhSQFaYKGfPgUODPIaCGYW/yRpAXBwWn9ZvxiQiZASTmx9Yv+oyqxPg==
X-Received: by 2002:adf:b309:0:b0:367:4e05:bb7b with SMTP id ffacd0b85a97d-373118e3c8emr7193339f8f.53.1724748064612;
        Tue, 27 Aug 2024 01:41:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac517a442sm179351675e9.36.2024.08.27.01.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 01:41:04 -0700 (PDT)
Date: Tue, 27 Aug 2024 11:40:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Riyan Dhiman <riyandhiman14@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: added bound check to geoid
Message-ID: <8d62104c-ac1f-447a-8b53-cad4e66a6c8d@stanley.mountain>
References: <20240827055555.65371-1-riyandhiman14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827055555.65371-1-riyandhiman14@gmail.com>

On Tue, Aug 27, 2024 at 11:25:55AM +0530, Riyan Dhiman wrote:
> diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
> index 7f84d1c86f29..d93a5d428ab9 100644
> --- a/drivers/staging/vme_user/vme_fake.c
> +++ b/drivers/staging/vme_user/vme_fake.c
> @@ -1059,6 +1059,13 @@ static int __init fake_init(void)
>  	struct vme_slave_resource *slave_image;
>  	struct vme_lm_resource *lm;
>  
> +	/* If geoid provided, validate it is positive and less than VME_MAX_SLOTS */
> +	if ((geoid) && (geoid < 0 || geoid >= VME_MAX_SLOTS)) {
            ^^^^^^^
Too many parentheses, but really there is no need for this.  Just write:

	if (geoid < 0 || geoid >= VME_MAX_SLOTS) {

> +		pr_err("VME geographical address must be between 0 and %d (exclusive), but got %d\n",
> +			VME_MAX_SLOTS, geoid);
> +		return -EINVAL;
> +	}
> +
>  	/* We need a fake parent device */
>  	vme_root = root_device_register("vme");
>  	if (IS_ERR(vme_root))
> diff --git a/drivers/staging/vme_user/vme_tsi148.c b/drivers/staging/vme_user/vme_tsi148.c
> index d81be8e4ceba..97323b5563e8 100644
> --- a/drivers/staging/vme_user/vme_tsi148.c
> +++ b/drivers/staging/vme_user/vme_tsi148.c
> @@ -2252,6 +2252,13 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	struct vme_dma_resource *dma_ctrlr;
>  	struct vme_lm_resource *lm;
>  
> +	/* If geoid provided, validate it is positive and less than VME_MAX_SLOTS */
> +	if ((geoid) && (geoid < 0 || geoid >= VME_MAX_SLOTS)) {
> +		pr_err("VME geographical address must be between 0 and %d (exclusive), but got %d\n",
> +			VME_MAX_SLOTS, geoid);

Here you have a device pointer so can use dev_err(&pdev->dev, ... instead of
pr_err().

regards,
dan carpenter

> +		return -EINVAL;
> +	}

