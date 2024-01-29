Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776C615350B
	for <linux-staging@lists.linux.dev>; Mon, 29 Jan 2024 15:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706540923; cv=none; b=FI9z7lE24HgxQbfRA5s0WU1pUYyGGtP0AavdYwnjVThjkt4APo7XgDSLOwhx2oDSp6DtFh2LNZBTWJaSP42HzHKqlrZq7llWoyTsuBC6lEB7HLON6jUS+hausJ7WsF35hbvy4YsCu1Ybrk2TjJ0vHCv1IL+Rc5FJZ2HmRtUEhAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706540923; c=relaxed/simple;
	bh=TvYc0o6580YbXidZl8mC8lUkNACoSav70Z1m/H+6tY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sITOj3+jIYS8+NgBiNUoRUGsyPv6MsPtBWZmmO151HAOJwKi9zXds3X0rQS0eCVfgdutJ+lBd0KwV9d8WY2ZNLyObF/nH/S5soyGqVvb5ET1VizsFeHbs8KjUDMmopCVOuwx1G5gGcIqBtpYmig7DB8ZBReVbtp9aofqxiG197w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YUPfJqxP; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YUPfJqxP"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40e913e3f03so35310025e9.3
        for <linux-staging@lists.linux.dev>; Mon, 29 Jan 2024 07:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706540919; x=1707145719; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n6cwbDbWLh7v+Hr7qWbFBpGzaMo6CtewwpyzoCKYp78=;
        b=YUPfJqxPe6m6wMufC9apQxuxlAh44w6UNpQ7m3xOcUGh0XL7a4p8eB18NGKiorbHV0
         MO9SYOv6BT1mBxZqQ3/dCAHlUehz8dnKB1g9hoYOrHAekptp/5jl+utUogdCBvSOiSFS
         VnMfuaCA556zGHwcUEsJqyr3MAxxhdv8ctLIDQPTuwZ2ogFGHCtGTVtxT/85za/ay7yt
         gksItqZ9jsx+fXVNkLeNknJkGot7XcIf01kfPPOudB6tpzJzVK1AudHtD1CuTrdMfKYj
         FKhFdG0c+F25lFEzkKaLy44G39cK33pEHVvXxcqHnIk8IRAY1M2u0yZuBWtCw9ecpBK2
         Hijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706540919; x=1707145719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6cwbDbWLh7v+Hr7qWbFBpGzaMo6CtewwpyzoCKYp78=;
        b=r/n2u8GzTRriwJQyBH4Lgn6rJ4GsMvte6dS8upb/0fMP3s4i+iWVJf+EiixUqzPOou
         z7Ruthq+CIoQNzI6xXGmAhCHssTkv8o/7o8DhI+K2Efg6coCpk2+tXOO9KzeKBwRKdjL
         DWprxi9OtZfbS6Xqk73Klr8vCt4JQCLXiYawgRaOdRty44yMDlL23yYe7K/QEBleru9p
         DtzeaG1wWHy2rajmafxtuPe1DBvQC1C6OPB0iZompfBfYgAUVt9Rqitm+yXjNHH2qWsI
         9lh0o6oTN3HIj3RP+ZCr3zN6In7KS4wGq468H6LVxjjXcrcAr1qPW+d4/CnWXjgxYoCw
         zVjg==
X-Gm-Message-State: AOJu0YzBHmIh9JojM/Wjim2QzOB2k5vB7C/XVccOk2FGAFV4HrJpq296
	AorhQRZOLF6Ms6/Hl5fG2yfQXHyV+C4CuMyNh7J/eF8VzSKjjqCxWbaW2o+3eSzlN2iD5TPcD0R
	okBxEZw==
X-Google-Smtp-Source: AGHT+IHMJzhv2MnPPwPMGGUmJ06IHYBSMp+B4effQYkqj/MHj3BYszh4U8CN5g12VqY/IR2e7km/ng==
X-Received: by 2002:adf:f884:0:b0:33a:e4da:2214 with SMTP id u4-20020adff884000000b0033ae4da2214mr3796745wrp.50.1706540919694;
        Mon, 29 Jan 2024 07:08:39 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id er8-20020a056000438800b0033af0234b3esm2148627wrb.49.2024.01.29.07.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 07:08:39 -0800 (PST)
Date: Mon, 29 Jan 2024 18:08:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Meir Elisha <meir6264@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ruan Jinjie <ruanjinjie@huawei.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] Staging: rtl8723bs: fix else after break warning
Message-ID: <83d0680c-e057-4fb4-a6ee-ed7e0ba06599@moroto.mountain>
References: <20240129141856.416532-1-meir6264@Gmail.com>
 <20240129141856.416532-5-meir6264@Gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240129141856.416532-5-meir6264@Gmail.com>

On Mon, Jan 29, 2024 at 04:18:56PM +0200, Meir Elisha wrote:
> Fix checkpatch warning: else is not generally useful after a break or return
> 
> Signed-off-by: Meir Elisha <meir6264@Gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 38 +++++++++--------------
>  1 file changed, 14 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index 044483f3d678..efaac84f22b4 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -1540,30 +1540,23 @@ void _rtw_join_timeout_handler(struct timer_list *t)
>  
>  	spin_lock_bh(&pmlmepriv->lock);
>  
> -	if (rtw_to_roam(adapter) > 0) { /* join timeout caused by roaming */
> +	if (rtw_to_roam(adapter) == 0) { /* join timeout caused by roaming */

The comment is wrong now.

regards,
dan carpenter

