Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384C1346FC0
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 07:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773646015; cv=none; b=Bu3IkFh5uAAhnjCJyZkFAa5jT8bTbD7ui/uzCpPuILG0p3WoyrTW1x92MnIJwInG+17fd26wyao12LtGbmVYv19zILB27OfXL04zM5YnwTWwPL5ElY7ELvmj3F/Tz5bcXfP+PJUcm4XcAIRrJ5ot01IOlEzHzI4nyYf1A+M9LaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773646015; c=relaxed/simple;
	bh=hSJ3VBdUqO7zSqbYNTKpf14F1ZawuJQfrG08v/33fdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hSnEx7/xDG/TGCJnJ+kKeuQ15i+NLWJ1SqCVtcbzTqNjlaF2Rfr5UejOq6x1k67Zxqm62nMaFWr0T7Ewxzr29weW21inSNQ8aEi8/4R7nQWNkWV6P//xwAS6dw+U5a4+icPtkNftq7HVuUuG079/kHCeO9sTcoLp5r1s0PdxakU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fweRb8WM; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fweRb8WM"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-482f454be5bso48864885e9.0
        for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 00:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773646012; x=1774250812; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MNq4xW0J3bXHmWOG372MrFQGECFj/5A4bz1BA7Mwpfo=;
        b=fweRb8WM2KnyCxxull3oY1R43LgHJhg/FKI1hA1xa7XQoYd2iGMQYMG1T4Dp0/PW9o
         8CZERPawznJ4CUnK4EJdO6WItu7boMGZOOM2RE70uCN62SOnUcPZ24nEndZBXEv4gsV+
         +r47Qp1H1MBC79HMrhs5kM5iWxBI/yzpre2hH93/OZhLpsqJnr3RZ6mw2FxgDPLG2pBi
         og7aZfz4ZUUHx8+wAgbmMh36Y3jFyz9Z5yB52EUXFFKbT8XXODCUqSbBfsuektEElVuy
         taT7UixmCESfeyf0bDuhoY7MnoMnROlcb05joh7Bn7B6IsVDhDgxi7I5tdKQFPjkK0GY
         LaFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773646012; x=1774250812;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MNq4xW0J3bXHmWOG372MrFQGECFj/5A4bz1BA7Mwpfo=;
        b=nbhc/d/HjwHCirNSPY+DGTXiM82enuWN3/cO2AJISWqsmSlpoenjgTt05qZ7fmXHON
         sf4z25HBVTDyxEqJwrI0WnBFjLfn/YaGe6szh8ud9fBmoSnmETDxHPJ8Yj5Ai1O1Gn73
         zrzDb6R4IOkRe5IUJZxvJXGrNHz1i8zwV9kfFa/2PZlvlPNMsF8WRXVgm/rjo3RK1Whl
         NbbbWF1+/PqYbMn9vaiTlLaUPjan8th/NS50UsGg+A/xjm/jsRMDccfaq2otm17FYZp9
         tlPHATZXP5XbVWjYiOuRuSxNfpMoTZWgmZYm1y5SCF2stxBdwv90O8EMveiV4Oyyva4N
         pplg==
X-Forwarded-Encrypted: i=1; AJvYcCU2N1vWMuiaxTl/DrK4VX5AcSAkts70XaPOFx/Ibm5OWgBLy+1/1tMgElG/vYPnhi6OqGC3qDgAqcqsrGxR@lists.linux.dev
X-Gm-Message-State: AOJu0Ywu28e8hHefDCl+mkU3b+SS2JCb8d/LahPzr4o0oTciO/3LnjuR
	tqAzkB8me8RX9PA+ydorBAa86wsJUvfwTuq9Jq5qsLUyl2VIWA5VYwBbOymD/zr5mQ4=
X-Gm-Gg: ATEYQzyMup2gG+9At6GUQejazLuaAc2NGGcq0sOyMX9wSHg8QtbS7qMp9aUD/8N+zGC
	roJh+AujIqbR/i2atbaJyOlp9Sc9naNM9Vo5AyeeeEvC0zWhNGUYcBF2DBxlnjgkwEMP5KqSQh9
	gknJj65DN3wjb6U9A/yjLqCemRgkTPxmzNMMCnsqZcJ44p8xsR5CXGjeE8KCUXBR4TrTh0PJG1P
	7ZQkBAxXg44PKS+zSfmr4RL4eqyUiCAmffrgu2FvVx79RJrjrMa7yEgaEhva8uXBPlY95UHelub
	P4h1IBFIJ4et6hieAf9AbeXvR9rwzxmFsKgcfh+oC2dUf9Ll7Timy74qFptHtiuguyCOj3q4Pza
	tXUeSFcmI6DD7kz5V9v45E7vPQaomfCrww2o4wltu/Z8WqZIDIsxwkkxeGkcnWfsC5YwirtEOlQ
	PHYw0QoBE7UZi/EziFlDqKvLzpvkqbryD9oqasunU=
X-Received: by 2002:a05:600c:3e05:b0:485:3428:774c with SMTP id 5b1f17b1804b1-48555ab09e1mr173821375e9.4.1773646012257;
        Mon, 16 Mar 2026 00:26:52 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557777105sm142383565e9.4.2026.03.16.00.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 00:26:51 -0700 (PDT)
Date: Mon, 16 Mar 2026 10:26:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	greybus-dev@lists.linaro.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 1/2 RESEND] greybus: raw: fix use-after-free on cdev close
Message-ID: <abewuKnDKzUEt25I@stanley.mountain>
References: <20260311212511.82563-1-damien.riegel@silabs.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260311212511.82563-1-damien.riegel@silabs.com>

On Wed, Mar 11, 2026 at 05:25:10PM -0400, Damien Riégel wrote:
> This addresses a use-after-free bug when a raw bundle is disconnected
> but its chardev is still opened by an application. When the application
> releases the cdev, it causes the following panic when init on free is
> enabled (CONFIG_INIT_ON_FREE_DEFAULT_ON=y):
> 
>     [   78.451062] refcount_t: underflow; use-after-free.
>     [   78.451352] WARNING: CPU: 0 PID: 139 at lib/refcount.c:28 refcount_warn_saturate+0xd0/0x130
>     [   78.451698] Modules linked in: gb_raw(C)
>     [   78.451881] CPU: 0 UID: 0 PID: 139 Comm: raw_chardev_tes Tainted: G        WC          6.18.0-rc4 #212 PREEMPT(voluntary)
>     [   78.452386] Tainted: [W]=WARN, [C]=CRAP
>     [   78.452560] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.17.0-0-gb52ca86e094d-prebuilt.qemu.org 04/01/2014
>     [   78.453049] RIP: 0010:refcount_warn_saturate+0xd0/0x130
>     [   78.453311] Code: 0b 90 90 c3 cc cc cc cc 80 3d 4f ec 1d 01 00 0f 85 75 ff ff ff c6 05 42 ec 1d 01 01 90 48 c7 c7 e8 5b cb b4 e8 31f
>     [   78.453953] RSP: 0018:ffffaa0f80203ed0 EFLAGS: 00010282
>     [   78.454251] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
>     [   78.454472] RDX: 0000000000000000 RSI: ffffaa0f80203d68 RDI: 00000000ffffdfff
>     [   78.454690] RBP: 00000000040e001f R08: 00000000ffffdfff R09: ffffffffb510c008
>     [   78.454899] R10: ffffffffb505c060 R11: 0000000063666572 R12: ffff938dc210b468
>     [   78.455279] R13: ffff938dc1f5e1a0 R14: ffff938dc14710c0 R15: 0000000000000000
>     [   78.455549] FS:  00007f2f22741740(0000) GS:ffff938e11fbc000(0000) knlGS:0000000000000000
>     [   78.455806] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>     [   78.456129] CR2: 00007f2f228c89c3 CR3: 00000000020d0000 CR4: 00000000000006f0
>     [   78.456786] Call Trace:
>     [   78.456936]  <TASK>
>     [   78.457069]  cdev_put+0x18/0x30
>     [   78.457230]  __fput+0x255/0x2a0
>     [   78.457372]  __x64_sys_close+0x3d/0x80
>     [   78.457544]  do_syscall_64+0xa4/0x290
>     [   78.457697]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>     [   78.457883] RIP: 0033:0x7f2f227d1cc7
>     [   78.458097] Code: 48 89 fa 4c 89 df e8 08 ae 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44f
>     [   78.458692] RSP: 002b:00007fffab36fb50 EFLAGS: 00000202 ORIG_RAX: 0000000000000003
>     [   78.459155] RAX: ffffffffffffffda RBX: 00007f2f22741740 RCX: 00007f2f227d1cc7
>     [   78.459400] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000003
>     [   78.459648] RBP: 00007fffab36fba8 R08: 0000000000000000 R09: 0000000000000000
>     [   78.459899] R10: 0000000000000000 R11: 0000000000000202 R12: 0000558298427128
>     [   78.460212] R13: 00007f2f227416d0 R14: 00005582c72cf320 R15: 00005582c72cf320
>     [   78.460470]  </TASK>
>     [   78.460571] ---[ end trace 0000000000000000 ]---
> 
> The cdev is contained in the "gb_raw" structure, which is freed in the
> disconnect operation. When the cdev is released at a later time,
> cdev_put gets an address that points to freed memory.
> 
> To fix this use-after-free, convert the struct device from a pointer to
> being embedded, that makes the lifetime of the cdev and of this device
> the same. Then, use cdev_device_add, which guarantees that the device
> won't be released until all references to the cdev are not released.
> Finally, delegate the freeing of the structure to the device release
> function, instead of freeing immediately in the disconnect callback.
> 
> Fixes: e806c7fb8e9b ("greybus: raw: add raw greybus kernel driver")
> Signed-off-by: Damien Riégel <damien.riegel@silabs.com>
> ---
> resend: added linux-staging as Cc, this list was not part of the first
> submission.
> 
>  drivers/staging/greybus/raw.c | 49 +++++++++++++++++++----------------
>  1 file changed, 26 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
> index 71de6776739..b92214f97e3 100644
> --- a/drivers/staging/greybus/raw.c
> +++ b/drivers/staging/greybus/raw.c
> @@ -21,9 +21,8 @@ struct gb_raw {
>  	struct list_head list;
>  	int list_data;
>  	struct mutex list_lock;
> -	dev_t dev;
>  	struct cdev cdev;
> -	struct device *device;
> +	struct device dev;
>  };
>  
>  struct raw_data {
> @@ -148,6 +147,13 @@ static int gb_raw_send(struct gb_raw *raw, u32 len, const char __user *data)
>  	return retval;
>  }
>  
> +static void raw_dev_release(struct device *dev)
> +{
> +	struct gb_raw *raw = dev_get_drvdata(dev);
> +
> +	kfree(raw);
> +}
> +
>  static int gb_raw_probe(struct gb_bundle *bundle,
>  			const struct greybus_bundle_id *id)
>  {
> @@ -168,11 +174,14 @@ static int gb_raw_probe(struct gb_bundle *bundle,
>  	if (!raw)
>  		return -ENOMEM;
>  
> +	device_initialize(&raw->dev);
> +	dev_set_drvdata(&raw->dev, raw);
> +
>  	connection = gb_connection_create(bundle, le16_to_cpu(cport_desc->id),
>  					  gb_raw_request_handler);
>  	if (IS_ERR(connection)) {
>  		retval = PTR_ERR(connection);
> -		goto error_free;
> +		goto error_put_device;

"raw" isn't freed on this error path because we haven't
assigned "raw->dev.release = raw_dev_release;".

regards,
dan carpenter

>  	}
>  
>  	INIT_LIST_HEAD(&raw->list);
> @@ -187,29 +196,26 @@ static int gb_raw_probe(struct gb_bundle *bundle,
>  		goto error_connection_destroy;
>  	}
>  
> -	raw->dev = MKDEV(raw_major, minor);
> +	raw->dev.devt = MKDEV(raw_major, minor);
> +	raw->dev.class = &raw_class;
> +	raw->dev.parent = &connection->bundle->dev;
> +	raw->dev.release = raw_dev_release;
> +	retval = dev_set_name(&raw->dev, "gb!raw%d", minor);
> +	if (retval)
> +		goto error_remove_ida;
> +
>  	cdev_init(&raw->cdev, &raw_fops);
>  
>  	retval = gb_connection_enable(connection);
>  	if (retval)
>  		goto error_remove_ida;
>  
> -	retval = cdev_add(&raw->cdev, raw->dev, 1);
> +	retval = cdev_device_add(&raw->cdev, &raw->dev);
>  	if (retval)
>  		goto error_connection_disable;
>  
> -	raw->device = device_create(&raw_class, &connection->bundle->dev,
> -				    raw->dev, raw, "gb!raw%d", minor);
> -	if (IS_ERR(raw->device)) {
> -		retval = PTR_ERR(raw->device);
> -		goto error_del_cdev;
> -	}
> -
>  	return 0;
>  
> -error_del_cdev:
> -	cdev_del(&raw->cdev);
> -
>  error_connection_disable:
>  	gb_connection_disable(connection);
>  
> @@ -219,8 +225,8 @@ static int gb_raw_probe(struct gb_bundle *bundle,
>  error_connection_destroy:
>  	gb_connection_destroy(connection);
>  
> -error_free:
> -	kfree(raw);
> +error_put_device:
> +	put_device(&raw->dev);
>  	return retval;
>  }
>  
> @@ -231,11 +237,9 @@ static void gb_raw_disconnect(struct gb_bundle *bundle)
>  	struct raw_data *raw_data;
>  	struct raw_data *temp;
>  
> -	// FIXME - handle removing a connection when the char device node is open.
> -	device_destroy(&raw_class, raw->dev);
> -	cdev_del(&raw->cdev);
> +	cdev_device_del(&raw->cdev, &raw->dev);
>  	gb_connection_disable(connection);
> -	ida_free(&minors, MINOR(raw->dev));
> +	ida_free(&minors, MINOR(raw->dev.devt));
>  	gb_connection_destroy(connection);
>  
>  	mutex_lock(&raw->list_lock);
> @@ -244,8 +248,7 @@ static void gb_raw_disconnect(struct gb_bundle *bundle)
>  		kfree(raw_data);
>  	}
>  	mutex_unlock(&raw->list_lock);
> -
> -	kfree(raw);
> +	put_device(&raw->dev);
>  }
>  
>  /*
> -- 
> 2.52.0
> 
