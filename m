Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916082D77F7
	for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 15:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789486728; cv=none; b=WGtrnsRG1wCTbDbdbH1Fyc6vRWDfl6t6AzHX4DJSpEg7OJh8ELn/6v5N5JVHrhPOfvHy5F4YezNsjkrN8Ljar3RIdjMWlB1f03H/Swcqqc8SBggfAZZu5Oz88/tPNC/CAnM951u2PPnLFf/Srgy4FeyyIS2VWqZG8Z0LsukR/Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789486728; c=relaxed/simple;
	bh=+uXmbD88BiEUIkLs0C20M88JsOLHQcJbIINYHao3O00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dRtNimgFW+yuEVPZJYQlVNI87pEDBYLsUYdrD9KvunHsE+Y/5pG5M+mMYc99Kvg9NY9QYEodyKUjnoKKhEGqZzrl75W5Dzlm3TmVNwWBddgioRxEjKE2/T02UIg73T+Q/QSYaZUUq0xm947mWki+aG8d1UpL4kt94U2kKedFJh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bbQGdUit; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bbQGdUit"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e83a388f8so719785e9.1
        for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 08:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789486725; x=1790091525; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0NDrDdvnRkf8oxzdqkBmS7w/O32Fpy9g/+yKR1PGh7M=;
        b=bbQGdUite2p7wGB5znpf+oyCLv0xdyL8bspRtwRRsBr1G2PAb4xsSr875+wGNvxus7
         2H+lam5TBOVMA/Zjkr4XFAOXA8h82VPiOnd+QnRbOZwwb8DCv7w3v4piV1MuSruSxA25
         wjrOrp3PwS3tUPyqDaP+tHvXsIJIc6pBqnp1jvLjNkw0dTCD4uC0O2mTgNo1CMiv6ySc
         JjEkfiFG5CjQ9Tkz9mbGE8lCf2yiPfzfRWjVAxNju8IQ4CK5CSRlSOVjpmjAGNB0ej8s
         FDfs8308Ix2RXAp1sx8O2FOdaVTEuDINyrc5gdtowlz58OUZBGd1EOgYOrmC+WRm+0M9
         qC4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789486725; x=1790091525;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0NDrDdvnRkf8oxzdqkBmS7w/O32Fpy9g/+yKR1PGh7M=;
        b=cGVeXpc/6AtjpTbWaxehZ3vDoHez00DsbqU2ERNOCkWwesuDQ5QwiGAf8pHhtmiOh9
         7CXVaZGO8/GCjQdUfdpZm+P72dZ8Vvzy1UUuQNKPHvhjSItCEWlYg9l/GtlxeqFjz7oP
         8M//Nr6/6l5b2g8eohZGwiAZnxOC+yoK03ajW5943qMSqivwUGJjmVZYseuJOYDn2BiX
         461ft+qzsxMcxKDQFYWlpwrGgAStrd2RsxzSJbx2DwLBRqXXGd0C97Yi2/yekenQIHoM
         +IXurGFJXBy5144Xm+cbKB25LeO99tNg+yfvoTxdMA4SOJbl+ZbyvOda/ZrdtyigjDzH
         JZJg==
X-Forwarded-Encrypted: i=1; AKwUvBz1+oiUlBWiSfH7QE25ZZU9Ou1lAPfw2cIzi9ir0q9Tx9l4OawaCPrrEAjkXrIa5c4V5T922bOAPlKIIBCn@lists.linux.dev
X-Gm-Message-State: AFuF++kTUYRFawpxgyaaHKxdEUNmxSa3lOnOc0BuDUsQfWDx/jvkNrKd
	2ysQwPYAk22znd6gtOnYBMpayvE2lZ7V9HG/IvYhyrs5jBJqCwBTJfc+pdVuG5q8iDCN1A==
X-Gm-Gg: AYBFou2rYkC0JEMGXs0CwUrItZ5gDdw9MF8eks++XA3595NLepqDY0mBrdxzz4nvT2l
	UhFQ2BSWBQhv8WAwUD3aAfxd55ETxG0uM36puJmsSaYJpzxvN12X9947PGHnB5J+j6Y9I+1p99c
	jDNtfIQjEt1SKFrPo5+9cLyEz8qBJTVv2/Z7cwzccgujo6xHuSsKT8UASt9Y4OzM4k/pz34eCEJ
	jjAT/FkSTj/opX4b7g0W6b2ddspoD+h80h+MAKKa9dr8mNGFkLJ8jxVnYKxIuNXw+Ep2HwfVJkC
	oPMAPhDGzqCuaGZiQ8i4kbCF0z7EL8EepbkE5/P7nXK0VQEVz6f7+E/G9Ikq7K0maZky8/mWP60
	SGcFbVfrW/U3fGTElFxTyLRrC53T+AltzYTGb/Gl+h6KhTSME/fcKIEVFhbg2O0JESKoDtdgX/a
	CRvmcutcQLvLgrntmd3zhLoC/gZcdrfTCkaxDXJXdrbY2idlL1VZuHsus/UXHHHS8PPeq+oPa3f
	Htaog==
X-Received: by 2002:a05:600c:198f:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49e7a66b2c5mr160200285e9.10.1789486724578;
        Tue, 15 Sep 2026 08:38:44 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83ac3c52sm4128355e9.13.2026.09.15.08.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 08:38:43 -0700 (PDT)
Date: Tue, 15 Sep 2026 18:38:40 +0300
From: Dan Carpenter <error27@gmail.com>
To: Punnay Sharma <punnaysharma805@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] media: atomisp: ov2722: Return after failed pad
 initialization
Message-ID: <aqlmgA3HNfxbvjXF@stanley.mountain>
References: <20260915140828.25537-1-punnaysharma805@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915140828.25537-1-punnaysharma805@gmail.com>

On Tue, Sep 15, 2026 at 07:38:28PM +0530, Punnay Sharma wrote:
> If media_entity_pads_init() fails, ov2722_probe() calls
> ov2722_remove(), which frees the device structure. The probe then
> continues into atomisp_register_i2c_module() with a pointer to the
> freed subdevice, causing a use-after-free.
> 
> Return the original error immediately after cleanup to prevent
> registration from accessing the freed device.
> 
> Signed-off-by: Punnay Sharma <punnaysharma805@gmail.com>

This needs a Fixes tag.

> ---
>  drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> index 2c41c496daa6..0748247ca42c 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> @@ -979,8 +979,10 @@ static int ov2722_probe(struct i2c_client *client)
>  	dev->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>  
>  	ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
> -	if (ret)
> +	if (ret) {
>  		ov2722_remove(client);
> +		return ret;
> +	}
>  
>  	return atomisp_register_i2c_module(&dev->sd, ovpdev);

The bug you are describing is real and your patch fixes it, but
this isn't a complete fix.  For example, there is no cleanup if
atomisp_register_i2c_module() fails.

regards,
dan carpenter
