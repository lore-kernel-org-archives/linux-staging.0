Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFA5305E14
	for <linux-staging@lists.linux.dev>; Mon, 22 Sep 2025 11:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758540531; cv=none; b=WJIFxjT1kFnLj1eJRxC5g/a+VTSJFCqWneinoM/faIJ5tA+0S5nBP/fIvYGl+S2OpOfaS2Pe26o2FUPxKt73QYt9nckXwmHC6VxuK+ih7ypPkUFJZu5DyKsAaq5TxgY8GHOoeeylG565GF54pTzYQ/Db1VCZ5WAMIBNqfB48vSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758540531; c=relaxed/simple;
	bh=3FWccC0wBYnZhQF9LERuXtOSWdEQxrAed3E09vmEwMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CtcO4YBHFa/nMj+6fF9EItTM/1PR3pdAxK86fE8Q9U5Qs0LOyrCkg48o+Tm0XBgOoLpVdsQA7tbTc/u13g10MlNEoXdwzr9AvKXMVGj3J0ge+UvuYWJJt/4mcwNci0ohZWFxeiuv5s6garRRhsKCKCRfPtUhQVdoYKumba7aad8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zoHAgyzw; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zoHAgyzw"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3ecde0be34eso2657275f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 22 Sep 2025 04:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758540528; x=1759145328; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sjU7ecr6qYWC8I2dcd/G+p4fmR13pHtJbJz7aga8+1A=;
        b=zoHAgyzwQdY1lEeR9AIxPsc0vLpRSqSQjzOjerYxZfZqFx57DZRvdC3l1h63veKOIf
         DhmR6hGkK16ZD9UwWmeNUlAzk6hsLY6QG50BKnVYAiwLtSa/Zo57lfL04zUlucwuNeJE
         p6v1Kz2tpiLhTtTXdI2Q1Rjt+a6l6fGX87NrpGikaK3XeLEew4rxm83bV2DrzzqnHNv0
         f6RGsDecr5JMg6iKjmuZr0u5D1zMOetjWkv3fsALGmlABUGL0ul1OyOODzpUBpuiEyGu
         VOgKJYS8j0/eqjGvowlBXXtkRx0cLJoUY8TUzbWrayN12JLbrtPSagT9labbWlt2LD4I
         7kOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758540528; x=1759145328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjU7ecr6qYWC8I2dcd/G+p4fmR13pHtJbJz7aga8+1A=;
        b=bjyKrY8TZIkRPMNP3BJnM1ZykioAwpl5ggwadMbrf+zSv+qh8/w9ecK1euBXJme+Bp
         dbJ7/RLiR/bTitxSWow273ElOOmLyUh5En/TEXRoJ7dRpL+RxzlzgUZ7CNUfkL5/pc4o
         eCaxdGTrtJn3vEkHzCw456cb6E4uewlN8/55bwPr8NJ30K4DeMzZrSxToHbX1SQBdJWO
         M8JSet84PDwbOLbczmbk0Ba8g5lGn+0iKXZLXk4Oa0CycInWuoVjye2xobmaEtRy78NV
         ILwHKuwfWWjq4115r9Thg5QOUAm08AkQ1lztJsEm8YQedP8iTEQQKnXNx4WZwgNPhB3E
         APhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVlcFbKjHnHqnMDJYLFiZQO3/9Xq/PsCV7Ber+FZbsZJB1DFa1d1vkV8TTWixy2ZlCMkB9Wof25GPmvbgL@lists.linux.dev
X-Gm-Message-State: AOJu0YzzBNSHeyzDKGnciaRnXMjYEjNtO9IgCSIgrmaLlbyNkFk57CaX
	SqRimZw+rzryqIbteJ9N8qPs+3Xg9I1gdrBuqmCXtoWDF+3/xthgYtFWC8XihpVG/4M=
X-Gm-Gg: ASbGncs3xz2GTUPZ+kx+dADLaM/1GpcWYoffWyZi3lbyFED64yPONxIyLSeYsiuPlpA
	vAmHu+6Mbh9LYJyyn51yLCBcd2NvzgAuzwAjYylZnqwcRRvNzZqRXuzEQb18SNwphJMrtK+knvj
	iQom0QrSwrhm10RwEJZxDHA1eciGrZWkUm9E+g2O8nqtskvqk1CGup3RU7fNDXvSfXwWeRDAcZZ
	yG/HmPCAM6ao6UD12NaxOZ3HxlC/XVwaFEayfFXj2ww4SSKRgPGRsWirROMMI1dYy16IYkkbmE9
	lo78Qz6LWWFvCLMnsnON6h1s3gIKrMPMtJ0jHo/aI8VbG1OLPAJuD9a11lvNPMZZFNJsi1a/JTN
	kraNau4SM+FluobuiJHm5ccvZDsec
X-Google-Smtp-Source: AGHT+IH4MVTTvJNffVVHP3rQfdQ1+Yz3bv5wsjwPbeG+w6rdZ8vSfpmXOdmU+Yfl/Cq/S4gBo7/gWA==
X-Received: by 2002:a05:6000:400f:b0:3fd:7388:28a with SMTP id ffacd0b85a97d-3fd73880634mr2585927f8f.8.1758540527943;
        Mon, 22 Sep 2025 04:28:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e15d1610fsm15388905e9.7.2025.09.22.04.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 04:28:47 -0700 (PDT)
Date: Mon, 22 Sep 2025 14:28:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ma Ke <make24@iscas.ac.cn>
Cc: dpenkler@gmail.com, gregkh@linuxfoundation.org,
	matchstick@neverthere.org, dominik.karol.piatkowski@protonmail.com,
	arnd@arndb.de, nichen@iscas.ac.cn, paul.retourne@orange.fr,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] staging: gpib: Fix device reference leak in fmh_gpib
 driver
Message-ID: <aNEy7LsnKa50Pq3c@stanley.mountain>
References: <20250922084512.9174-1-make24@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922084512.9174-1-make24@iscas.ac.cn>

On Mon, Sep 22, 2025 at 04:45:12PM +0800, Ma Ke wrote:
> The fmh_gpib driver contains a device reference count leak in
> fmh_gpib_attach_impl() where driver_find_device() increases the
> reference count of the device by get_device() when matching but this
> reference is not properly decreased. Add put_device() in
> fmh_gpib_attach_impl() and add put_device() in fmh_gpib_detach(),
> which ensures that the reference count of the device is correctly
> managed.
> 
> Found by code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: 8e4841a0888c ("staging: gpib: Add Frank Mori Hess FPGA PCI GPIB driver")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
> Changes in v2:
> - modified the free operations as suggestions. Thanks for dan carpenter's instructions.
> ---

Actually, it turns out that this isn't the right approach.  Sorry.
This will introduce double frees.

The caller looks like this:

drivers/staging/gpib/common/iblib.c
   204  int ibonline(struct gpib_board *board)
   205  {
   206          int retval;
   207  
   208          if (board->online)
   209                  return -EBUSY;
   210          if (!board->interface)
   211                  return -ENODEV;
   212          retval = gpib_allocate_board(board);
   213          if (retval < 0)
   214                  return retval;
   215  
   216          board->dev = NULL;
   217          board->local_ppoll_mode = 0;
   218          retval = board->interface->attach(board, &board->config);
   219          if (retval < 0) {
   220                  board->interface->detach(board);

   So if the attach() fails, we call ->detach() which works.

   221                  return retval;
   222          }

It's weird because the fmh_gpib_pci_detach() function does have a
put_device() in it:

	if (board->dev)
		pci_dev_put(to_pci_dev(board->dev));
                ^^^^^^^^^^^

The detach functions are really similar...

regards,
dan carpenter

