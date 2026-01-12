Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251CA30EF81
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 07:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768204550; cv=none; b=RU1BFx2PHv9T1T7PlCixTP+MUIlSITbOj+IIXsMCACSdMt74MaklBw0+kHogTctzHwa1vU4fbcLxE9u4MFCWtZwfoMECdW0On7wduPRiN/mtErAPpDgX8kOZ4ZMUYsyeI3JcjkgWclH4L6srPItt5D4BD9vBy3QaWG+F29v/vfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768204550; c=relaxed/simple;
	bh=anx9En/JIDl8AILRrMMoMqcvbdXvKc6xp7QNufV/w8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f7d+s4Whwia3FcpatUSxukuZF7EoNPR+HmftQ5BVhxiX87cvqVbc4qk3b0nA0jm3561YWTQut3ozyebMYGi80auy3tCPeqkT7G3x8nZwGheRKoAKEQvceujAznA+oWHrFko4Ix3rnbSo/QikKiaImSY4EFa8wOAxhW/LSLW8x9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z14Tlgme; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z14Tlgme"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42fbc544b09so4778783f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 23:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768204546; x=1768809346; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kMNv1efcOlEhsDfhmhYD4j/vQ0CBh/NDVWT8ixEF3II=;
        b=Z14TlgmessoAAxIX4j2tvy18tYMs2TEIsXR+Y7FujyGwTcpPVrocqAR9+N7I91mFCK
         r+zuKeB3JlAJXAweYb9NVqyXy+9HiP0U/jSAu/18gcmO1ym5gsnPsJAjPgUnsN1dXGN7
         fRJ7NhMDaxhPJfV+9dk0v24Lq85CZYEXT7zJPdEm6hXHJ13JZ4EXWQnf/OGy6x6Z21Vc
         s3daI1w+zkfink8fgZMHBWN6LexsjDRwbc6K6gqMPZ4YayyvsIcdpsC6NW0L0lTBvVwf
         6pRhsLXXNv28upbAWpPKfWFdU2ZtQ0LKt5XL2pf04SgkgOLdpE0JnfTKDQ8kNr3aHdu3
         F3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768204546; x=1768809346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kMNv1efcOlEhsDfhmhYD4j/vQ0CBh/NDVWT8ixEF3II=;
        b=ARt8HWFpCQSXXg6PhkDgHdevDsd+dpJvgI0ioMVs7X+Zog59zUA30Haixw4PUDkchZ
         v2tsLTL5VTAAEhbzB0rizdp3RIGE1TzLDz0TzA5Rypy/fVuaeLcMOvl6+smXFfX8Xgr3
         i1qq/Pj9V/gpBg9Zm+n2q/q0CFrW8PfmlYvXIPjFMxCth5lJd05m+t6D63+UYv1yyUA+
         1LV9KTMSg0xJuulzb35wJ79Vg9zBXCQdbGTZQkAz/ABy4jcl42vDNTpqqkQZz9tsMoLK
         OnylTQpE70LZ7Vfpj1k0dQMbERTjGeVKtxjA1WNbKM6Evm9LfBujlBdOgsPJpHObEme1
         s4xQ==
X-Forwarded-Encrypted: i=1; AJvYcCXU+l5j/Qsdrlgfq94UK9r5mpzwj6fbw0wMwdzJasZXLQfX6F+SYNpOfGRqkXC2xF4xld5TtsTxFvRSdSYL@lists.linux.dev
X-Gm-Message-State: AOJu0Ywc5kouL7cQ7rpQdBoYgVvB8Zek89cWCtmWBDl/9vlSTd3hlXDi
	mqoc5G1zW+YI0bGV2owuX9rbbTHjPhraPoChCgs0kjnkm18gyO/RIySYh8GBmQtI2ws=
X-Gm-Gg: AY/fxX65+Nh2mqEbqfZJnrYhYHkxnFSO/mYlFzZS867EJ3EGGsRS08awFUfU4w2LjDI
	Mr6TXNJv8xQ1N7fwY+fB/c921F6iYdfT+RPKR7p4006KF1ZFC7D9YBfPoLcTfAj+lWwuHHWOy0U
	uN8Koxwo8eCL1IJf0KuN0sEbzhOjnsZRYDBtRykSONV4UgPHmj1TOZ4jFxDP7+WEENQxow55H+D
	e2whr00tro/t/LehYE4GlL5nfLbBNlxjXlreU7GpZy55sUYiQQALN+oKnt088aTFuViw+fwtINT
	cwWe36kRxpwGvF2aSV5nS39OkZnckXoZiOB4cc+dvbjGFJl6+IFcyv4cO5owp1NHuo+fwAUbnew
	CPhE/h07VqyujXYFzmXJVv4wsWpysqG/oNdYtxM61WhBqZ1c5kVz9CjmIJab8M+1sXa4epZk3KM
	JjU8LL9D5BzOjFU8PSqIScSUDMP6Y=
X-Google-Smtp-Source: AGHT+IEwV6E8LNaRLpqECPGzftpWWd4dux6Ti28U2R5tBdKbVyEfX77NkCO2988JsMKhDpZY/fGKCA==
X-Received: by 2002:a05:6000:2dc2:b0:432:c0e6:cfda with SMTP id ffacd0b85a97d-432c378a800mr18263914f8f.7.1768204546424;
        Sun, 11 Jan 2026 23:55:46 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ede7esm37609522f8f.32.2026.01.11.23.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 23:55:46 -0800 (PST)
Date: Mon, 12 Jan 2026 10:55:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: 2023060904@ycu.edu.cn
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, guagua210311@qq.com
Subject: Re: [PATCH v5 1/3] rtl8723bs: io: Add independent
 rtw_check_continual_io_error function
Message-ID: <aWSo_vk5mK6Zbrj7@stanley.mountain>
References: <20260111032136.7078-1-2023060904@ycu.edu.cn>
 <2048B07E5179CB78+20260111032136.7078-2-2023060904@ycu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2048B07E5179CB78+20260111032136.7078-2-2023060904@ycu.edu.cn>

On Sun, Jan 11, 2026 at 11:21:34AM +0800, 2023060904@ycu.edu.cn wrote:
> diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
> index 0f52710e6d3a..cd455cfcf046 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_io.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_io.c
> @@ -132,19 +132,7 @@ int rtw_init_io_priv(struct adapter *padapter, void (*set_intf_ops)(struct adapt
>  	return _SUCCESS;
> }
>  
> -/*
> - * Increase and check if the continual_io_error of this @param dvobjprive is larger than MAX_CONTINUAL_IO_ERR
> - * @return true:
> - * @return false:
> - */
> -int rtw_inc_and_chk_continual_io_error(struct dvobj_priv *dvobj)
> -{
> -	dvobj->continual_io_error++;
> -	return (dvobj->continual_io_error > MAX_CONTINUAL_IO_ERR);
> -}
> -
> -/* Set the continual_io_error of this @param dvobjprive to 0 */
> -void rtw_reset_continual_io_error(struct dvobj_priv *dvobj)
> +bool rtw_check_continual_io_error(int error_count)
> {
> -	dvobj->continual_io_error = 0;
> +	return (error_count > MAX_CONTINUAL_IO_ERR) ? true : false;
> }

You've broken this patch up in the wrong way.  This patch removes
the dvobj->continual_io_error++ and then the later patches remove
the code which uses it.  This introduces a bug and then fixes it
later.  You can't introduce bugs even when they are fixed later in
the patchset.

Also I don't really know why you are doing this.  Have you tested
your code?  I don't really know why they wrote it like this
originally, but it wouldn't surpise me if they did it based on
testing.

regards,
dan carpenter

