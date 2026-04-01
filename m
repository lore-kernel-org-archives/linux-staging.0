Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB103B47F1
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 08:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775032967; cv=none; b=Ac6Ko0TPbEADbVW+rmDahfFHZNIS6TVk7xRkZv5Rby//FsBUwUte66Oa5FhteK10wIN1K3gMufWsY87x5DQeR8UQ+ZHwaUsHg2Uh6yUnXQZ593EgLxDt2whBd94jBcTVKfw2giOcpcRpfkTcE8zH5yeImDkUz0XRPCjiISbusL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775032967; c=relaxed/simple;
	bh=1IHQcVhdPtrP4RzyGECmc2J6GpJnW4gAE+8BHYTwBHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XSpfT6KPrffbNy7FKr69B3CDapt4/7CL1csIDla2A3cqTsDwMbNgmvHwDzachlne0C5uH0gxH+6isjSvgtJmzA3yUyd1AG6nEw0FN80F65LulYdc+9FcihsPt3J0asLOAWgU5CkOdUrro66H4BjVygelOTiM5jQYM8chzEzxXxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M0UGoeaX; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M0UGoeaX"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso68310675e9.2
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 01:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775032960; x=1775637760; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8gdmgWEdzunB3PxAHS6gl2YoRWrIXu+b+T+ZmdqwONk=;
        b=M0UGoeaXJXWfJPiOntPZUDEZCNx4OK6XGV4NfKQD2OY8ScRekkPT56+5kZ+FkkKl0Z
         PpPRIuERwsd+PiAmsDHNOuOKMqItTwowBVi1fvQG28skACic/EL0Ey6Vcwb+AF9Piv5q
         lw6lsN5yVP3LwWp3p9Yj8a+ttVKaJXcxK1BYDtGLlBgIUMDBm1nKyGnLEQml/OUT3qRE
         TlNfPAFHG4/eXm9qazkwdv3NDq+JrOQo4aXFfKatHuIeDirwqz9IdD2aWnRMAXIvD0V9
         p63MXIfyQYdvutmN8SkFsafLJ+bi0gjKD2FwO+YDNV5ugUf/QRU8kCF1CDbDmD7baIlV
         +dqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775032960; x=1775637760;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8gdmgWEdzunB3PxAHS6gl2YoRWrIXu+b+T+ZmdqwONk=;
        b=S1efmL6QwF6vbsUZPmth67M9pCm8zooL9iDJctm2/Jlt3xSNGo5ynkcclt9a4e00qL
         wFKg3jlRpRRNEkZjMqgOdGP4xVY9+Xj0+70SnpYDPebshvm3EKJkKRq7bj7qkinJJ2ej
         zbY6flr9wEfiWTmqfMRwwybeC2mldmSnCQyt5lI6w+M6AmFTmk2Q5cCDe0SuGiUSMInY
         KcHSe4OSuxOe0GJ3og0ziU+PSbgM5yI9rRnC7ydI80QEV//dr0PwOFcCf6H73rCVx5mb
         r6cSEv+UmNGqKFOWNLmhitOcI3h+jE7+bo2ING6LbEIjr6mAg7WM+Db8mMMGt5JV8WL4
         NopA==
X-Forwarded-Encrypted: i=1; AJvYcCWyDupVr9vO87zQBY/LfO4KZqBPscn5Ao2LHkjey6PFVT4unwc5VZfOEhZVAom+oyqZvG6Cgf6et8B/xPPx@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6gK1BvkNfIwzqpAoY18KKwse4H3ETPGXe+N4rUhuTdayJ1y/T
	3/fknr2ba1ovjbCuRb+/Z7U/qwKMDYesOT2RTrI4bn8uTuEPWCtYM6tU
X-Gm-Gg: ATEYQzxjgXcLYBU/0bLgu0nQjKgQgknUmuYZ24epY5e3YzfM7SUlcjzObHAQpXlvhXS
	Z2imazQ15ivW33+NOqf0D69t4cWu/OuCN5BaF02CLah0gET9qUcocwQupjrVCevFUonRMiLektl
	ZHpZuF06GBIxYJGq1AJzLJCAaSKtK6BAsppYPjNk99uSjvtVG5VxP2CPF8Hy4zJnysK72G2dpmi
	ipkwnlEyB5BBIqcrouPAmconuTpMMKNhvh3nrryFIAGfSaw7Gdetnap2SqqP5EONSAApkjQfwwt
	/0pi29HX7paVpQ6bz+O1loFTn0ihLSbog4i6F/CBoRSQX+TnsQvGZ2qyGea4pdIt+bnK/dpTufX
	V9UHdVDprpybux3LHj+8I3EZlIk61F4zpe7fH7KF3hC2MMd9jmsgzWRJ1SvexP5h3PT4P2gHyt9
	ZCaaL2+LP7hdJDu0LqguVC7ZY8q9thAg==
X-Received: by 2002:a05:600c:4744:b0:485:2a4b:7bc3 with SMTP id 5b1f17b1804b1-488835684c8mr40060125e9.4.1775032960217;
        Wed, 01 Apr 2026 01:42:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf245e4f5sm36961863f8f.19.2026.04.01.01.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 01:42:39 -0700 (PDT)
Date: Wed, 1 Apr 2026 11:42:36 +0300
From: Dan Carpenter <error27@gmail.com>
To: Omer El Idrissi <omer.e.idrissi@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] staging: rtl8723bs: remove use of vendor-defined
 status macros
Message-ID: <aczafAL_oVlP6Z-1@stanley.mountain>
References: <20260331153255.22764-1-omer.e.idrissi@gmail.com>
 <20260331153255.22764-4-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331153255.22764-4-omer.e.idrissi@gmail.com>

On Tue, Mar 31, 2026 at 05:32:52PM +0200, Omer El Idrissi wrote:
> Remove the check for _FAIL macro on two occurrences in rtw_sdio_if1_init
> 
> Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> index 8412331c4949..34ef40a86153 100644
> --- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> +++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> @@ -262,7 +262,7 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
>  	padapter->intf_alloc_irq = &sdio_alloc_irq;
>  	padapter->intf_free_irq = &sdio_free_irq;
>  
> -	if (rtw_init_io_priv(padapter, sdio_set_intf_ops) == _FAIL)
> +	if (rtw_init_io_priv(padapter, sdio_set_intf_ops))

Here _FAIL is zero so this reverses the condition.  You need to change
rtw_init_io_priv() before you change the callers.  And, in fact, you
should change rtw_init_io_priv() at the same time you change the
callers.  Do it in one patch so it's easier to review.

regards,
dan carpenter

>  		goto free_hal_data;
>  
>  	rtw_hal_read_chip_version(padapter);
> @@ -275,7 +275,7 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
>  	rtw_hal_read_chip_info(padapter);
>  
>  	/* 3 7. init driver common data */
> -	if (rtw_init_drv_sw(padapter) == _FAIL)
> +	if (rtw_init_drv_sw(padapter))
>  		goto free_hal_data;
>  
>  	rtw_wdev_alloc(padapter, dvobj_to_dev(dvobj));

