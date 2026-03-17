Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373C42F39CE;
	Tue, 17 Mar 2026 16:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773763841; cv=none; b=RGoxm55Zx34H6qakKBE7GJCu9XT9raibspSoVcDYVr2FpW9aYmTVvuob6Ll0/BI7sQuUXqhARTHGTHeWj6mH4DgP+a3QOKR5xP5GXTxGRwiI+JYAkb4EPnuKPy+DFkyBULsQcevUsK47sDuOFz1t+DjlgqlsWg8qdS7w6DkQC2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773763841; c=relaxed/simple;
	bh=QwGMsmRZfWGlxpUF8Zoets+uuPHm+PX2JPY1WhB3Gb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nbf2gcRqJhlF+dCVG7pRUbBCRd26qhjhLsTYI9IU8VtkNrLefJDdmGPluaOEF8Twiqx04J0fHNMwCmIUaQhgiF7qSY3bPvMHe+u3M/+pBTgJDgjI6U4vAq9+9u2KiMdCZ4pEPwuZS/ilTjUYlJiMzqZ0DWpcRFHhc2W65oSGhWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NGRb6L5L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NGRb6L5L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3278C4CEF7;
	Tue, 17 Mar 2026 16:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773763841;
	bh=QwGMsmRZfWGlxpUF8Zoets+uuPHm+PX2JPY1WhB3Gb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NGRb6L5Llj1Quy4x+dfj7X6R1VV3tizB2Du54mn8OeBSVBf+9oxtitUeEvQJoEU5Z
	 9n2dwMb5QyJzvemkJKh2QnUoWymybg2sdRqy+f67XrcJGzN0G8AP4GaLPOWg1vV/cE
	 m2B85bFRzbs5HGmZIZHhMufD70GgflmT9fANE5f4qPwcInMhvSO9Wj7LPFFnO8bRxk
	 IlS0XBDaK1raN9KFMIAV4+tsnBVcpYKR4sLK8UsPiW15Txh7bs1g6D+nfdFt71SFzt
	 E4rayJoJuzPsqUUBvsFKmXnp2auV0pubbQG80yq1DcUrq3t8/kT8E0Lyp5ZBkhKClJ
	 hOPyEN0xOtMVA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w2X0A-000000007oj-1m08;
	Tue, 17 Mar 2026 17:10:38 +0100
Date: Tue, 17 Mar 2026 17:10:38 +0100
From: Johan Hovold <johan@kernel.org>
To: Damien =?utf-8?Q?Ri=C3=A9gel?= <damien.riegel@silabs.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	greybus-dev@lists.linaro.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Elder <elder@kernel.org>
Subject: Re: [PATCH 1/2 RESEND] greybus: raw: fix use-after-free on cdev close
Message-ID: <abl8_pFXH1cncEhi@hovoldconsulting.com>
References: <20260311212511.82563-1-damien.riegel@silabs.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Please trim oopses like this in commit messages (and reports). The above
(after the WARNING) doesn't add any value here.


>     [   78.456786] Call Trace:
>     [   78.456936]  <TASK>
>     [   78.457069]  cdev_put+0x18/0x30
>     [   78.457230]  __fput+0x255/0x2a0
>     [   78.457372]  __x64_sys_close+0x3d/0x80
>     [   78.457544]  do_syscall_64+0xa4/0x290
>     [   78.457697]  entry_SYSCALL_64_after_hwframe+0x77/0x7f

You can keep a (partial) call trace, and skip the rest.

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

s/are not/have been/

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

I think it's more common to use container_of here (and skip the
set_drvdata below).

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

Skip this.

> +
>  	connection = gb_connection_create(bundle, le16_to_cpu(cport_desc->id),
>  					  gb_raw_request_handler);
>  	if (IS_ERR(connection)) {
>  		retval = PTR_ERR(connection);
> -		goto error_free;
> +		goto error_put_device;

As Dan already pointed out, you need to set the release function
(initialise dev) before calling put device.

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

I think you should move this to the release function as well so that the
minor number doesn't get reused until all references are gone.

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

Johan
