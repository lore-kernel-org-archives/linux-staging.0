Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F956344D9A
	for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 21:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774128283; cv=none; b=PNtzdKA9xmiE1Cy/b83TNYJiEYrHr+OJzPCPviEkMEth2TxHrFR1fhXzOk3zHyhYTc7Fvi6EUk8cvObsUHG/eML1+Nzt1lldLcnob535Z88xY7NjhUxRe8FPZhglZN2uakwNx1ZynrPa7qvnHudInyWtGe55weI/zbHqqGmFO7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774128283; c=relaxed/simple;
	bh=+TuDo7M8VZCHgqFs4xmkAYIivu5J9zxFCfo7L2BbJ70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rNiRFKy1MnHgwrEFtK/xFMBLEJf7pCBsyc9PWLOJBmltAfnkw5EXY9fhvefNgJizZKtq6zv63wslhFeqCa4pUqC0hH3ZVXol2RIF0xSqqVOQoPu4zVQJpQTE75U2nDSpCkCpAWXefgzulMeXtX4Z2lUwdjPP2FBI+hzw2WQIhsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DQLKY+9/; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DQLKY+9/"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486fe36cfabso9570395e9.1
        for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 14:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774128280; x=1774733080; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PDoqnGw7HDlr9N9BNQ4Al52U7CgdAKtxcFnBIWQyuoc=;
        b=DQLKY+9/YslPY7TRTBYis+vCjVl13urzJ+BQhFLHF77qkhWqBBlRbbOqiign+zMlLe
         Zk+sOvsJ0G94+v1CD2r8MBZaVe6zUysXs5uE6M3a0L4kocoWMzyqWwgz8dgSmSG6gnFl
         siIcp0SCM/OxExHipB0ylMMmVxMAzw2Ki8/d+4+CoTCAFBus3C2Jc+x0bqtFJd5od1NU
         Q3st5peCUz96iveR/VYEZVnfVBpbbgNLXuzi07OV18133d/xxoXDoJXXeBVA51Ft3UuX
         js37jMso2PCyJFXjxNQCPUboHTpYb+oW28KatByELwoPSPVc6cuJHsaLZJwo06uv6Q4V
         ryiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774128280; x=1774733080;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PDoqnGw7HDlr9N9BNQ4Al52U7CgdAKtxcFnBIWQyuoc=;
        b=lzcppmiQXkbly+jisbZOzz0yXVVfWq0J3nWOufHe/foItS2rYhFhcXJZFRExXKCpXF
         qP5SU+/wALBreBBNVQLJfUyToPgAwtvH9BlJXMdMjwt9YsqKuhsyHYEwgQDdg4Qu5DwR
         2FpLTxL3o7LbftI/Iza6RjlKbOYAz26EJvIB4dj9QHTy1ztnOiHhPH6A1GoJmAS8G7Y8
         aCTR3pD27WJentCxFs4pCV7zWJzrg9r4wMn8xYhplp7zDAf0BsRI6DsLLgEIgXk4gpQ9
         CGn5WD0zHU0gHJ8FepMzVWHg29PgPlKXPK7y+y+MvZrMk3uw1sFq15jojL5QJbK3Ni+s
         Lz/w==
X-Forwarded-Encrypted: i=1; AJvYcCV1lzdW7pA0MqqMq4d7xriNdMQwoK5XcLhmIUkOeV36e8mkQ1WjtjEH1pPsjjKjbqRwHmsv9RCDy02FXuRq@lists.linux.dev
X-Gm-Message-State: AOJu0Yxe8rCD4HBxKG14yRrY5+GeOYyp0hoC0MuBp/8caZU4fgyEU+z0
	AgA4j3VNZsZw4ciCOLXjxv3o+PKcK6g2n3gYrw9277Z0TJ2Vw9+7Xlj1AnRbXbMyLWo=
X-Gm-Gg: ATEYQzx/jnCVnWg8pQuGzisa+8U5tD2nhPdgNoQPg9hlLVzKTgOvITZiMjdQF5vc40V
	YPYiaF59GR0S3ylLaw0qrOJc9zsGEP/UD/Qh9sUZHsNzO0/SGVu87WwpmS0kg9IUvern9pRO4jz
	+nMoae4ePnMKvXL+POkAC7tcnHsTHZDAk182Wf04RAmn9DV6KLHBGJ2NfNvKX30cLnPgBjiMXwa
	oMaV5j9wRTXq7DU4RDzVMX8AttZiTNKfgEP/clYpp4cBKbafdJ8egcj8XnMGxiGyMS4Wp+ad+ZB
	C493838KnN1KYlSJXhF5zGX98uyySlOnrtBpACrO8bMvy1HIYKNU09i88tSUCwH4FqO7iFgzq6T
	I6aPnAsbTzsRx/9XMXp/2D3JkWUrnGtetjjD5WVLX6cF3ejaWEJI03OzOHCq7WPE83UhdOxC8gL
	5VETeR02WBLNYpeVH+THCgPJUZ/xWD
X-Received: by 2002:a05:6000:2011:b0:43b:4909:203c with SMTP id ffacd0b85a97d-43b6427d8c5mr12706193f8f.21.1774128279858;
        Sat, 21 Mar 2026 14:24:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6471a27csm17995499f8f.36.2026.03.21.14.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 14:24:39 -0700 (PDT)
Date: Sun, 22 Mar 2026 00:24:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Omer El Idrissi <omer.e.idrissi@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: change error handling to use
 standard errno
Message-ID: <ab8Mk8uOyKrNpykg@stanley.mountain>
References: <20260320072951.54045-1-omer.e.idrissi@gmail.com>
 <20260321201738.16278-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260321201738.16278-1-omer.e.idrissi@gmail.com>

On Sat, Mar 21, 2026 at 09:17:38PM +0100, Omer El Idrissi wrote:
> Replace non-standard return values with descriptive linux kernel error
> codes in probe path.
> Also replace the variable name 'status' with 'ret' to be more
> consistent with other kernel code.
> 
> Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
> 
> ---
> v2:
> - Return -ENODEV instead of -ENOMEM when sdio_dvobj_init fails
> 
>  drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 30 ++++++++++++--------
>  1 file changed, 18 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> index d664e254912c..47189c849b05 100644
> --- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> +++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> @@ -345,38 +345,44 @@ static int rtw_drv_init(
>  	struct sdio_func *func,
>  	const struct sdio_device_id *id)
>  {
> -	int status = _FAIL;
> +	int ret;
>  	struct adapter *if1 = NULL;
>  	struct dvobj_priv *dvobj;
>  
>  	dvobj = sdio_dvobj_init(func);
> -	if (!dvobj)
> +	if (!dvobj) {
> +		ret = -ENODEV;
>  		goto exit;
> +	}
>  
>  	if1 = rtw_sdio_if1_init(dvobj, id);
> -	if (!if1)
> +	if (!if1) {
> +		ret = -ENOMEM;
>  		goto free_dvobj;
> +	}
>  
>  	/* dev_alloc_name && register_netdev */
> -	status = rtw_drv_register_netdev(if1);
> -	if (status != _SUCCESS)
> +	ret = rtw_drv_register_netdev(if1);
> +	if (ret) {
> +		ret = -EIO;
>  		goto free_if1;
> +	}


rtw_drv_register_netdev() doesn't return regular error codes
but when you change:

-	if (status != _SUCCESS) {
+	if (ret) {

Then you're making it look like it does, which is confusing.

You're going about this the wrong way.  You need to start with
functions like _rtw_drv_register_netdev() which are where
the _SUCCESS returns are first returned and change those first.
You have to update the callers as you go.  It's tricky because
you have to be sure you're catching all the callers.

Then eventually, you'll get back to rtw_drv_init() and all the
functions it call will return normal error codes and you can
update that.

Do it one function at a time.  Update the function and the
callers.  Something like this:

regards,
dan carpenter

[patch] update error code for rtw_init_netdev_name()

The rtw_init_netdev_name() returns 1 on failure and 0 on success
which is non-standard.  Change it to propagate the error from
dev_alloc_name() and update the only caller.

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 7ba689f2dfc8..92b52b1a2920 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -407,9 +407,12 @@ static const struct net_device_ops rtw_netdev_ops = {
 
 int rtw_init_netdev_name(struct net_device *pnetdev, const char *ifname)
 {
-	if (dev_alloc_name(pnetdev, ifname) < 0) {
+	int ret;
+
+	ret = dev_alloc_name(pnetdev, ifname);
+	if (ret < 0) {
 		pr_err("dev_alloc_name, fail for %s\n", ifname);
-		return 1;
+		return ret;
 	}
 	netif_carrier_off(pnetdev);
 	/* rtw_netif_stop_queue(pnetdev); */
@@ -755,7 +758,8 @@ static int _rtw_drv_register_netdev(struct adapter *padapter, char *name)
 	struct net_device *pnetdev = padapter->pnetdev;
 
 	/* alloc netdev name */
-	if (rtw_init_netdev_name(pnetdev, name))
+	ret = rtw_init_netdev_name(pnetdev, name);
+	if (ret)
 		return _FAIL;
 
 	eth_hw_addr_set(pnetdev, padapter->eeprompriv.mac_addr);
