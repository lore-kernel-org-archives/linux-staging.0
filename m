Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD873BB40
	for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 13:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771680013; cv=none; b=PBGCMjbQ0zLHI1kp2TaZFPW4yVolJDLpIs4o4Brk1PKSvO/ZhOW44ZIwWVV80q3dHlWn890XOX6jTxw1shdsr+RpK/K1Dyl3yYwWqsdgmU7Z4qpx3345yZfxmKEm9QSxI/POi2zrqZSQOVmiFaYX6eIb7iU11pSwoQoiuJTf9w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771680013; c=relaxed/simple;
	bh=yhItmu6FwILqw3juiZ762Wal0BhMMNKFmFnYzaB6CTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YwM2z9Ef37Y44Qf8ROQFiEke8usjfodxjRMO6jjHWuMpdpPri5UdsZ6PeNJeM/ntmpWL5w31uU8wYkOKklltiB/T8EtXXw6QZ6eWsaWYddaGRxDEPsOq5xkaHF4cY08ARMWzPFs+Gz58dGPfm+/A/wJPO00gV4LuEBhVCbr49+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eMnJ/Y2Y; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eMnJ/Y2Y"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4833115090dso27952915e9.3
        for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 05:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771680011; x=1772284811; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ygKOGn/6qB099OqOl4y/DQB2ZJZmO/cFE4lvTvj5L4M=;
        b=eMnJ/Y2YYHJuQYJG62jYEGFnJAHF5HrYrtxJKWYHa+gF1iqq9D2CsNz5uWPQChAZyb
         1DW1SdxtEUWQnb7js4DHCnDw0LI5is6h/lgc2G/m0AguG1gtHkslZQLtqMUVQGAsEhQO
         Ae1ZxNEe7TfgJ60hnSlLtXTJUyjHS4VaUdzvEtSWzA9uwfXApcRUuEMXP9xeuCUuHgFB
         +QdZw8YHZQpe1Bz9guIugInSWGH9cq0n/RKNp5lt41Dws7HzRRJO/ltI/GX29ICdUNEK
         JXr+VA1KGl4l79/ZhZWE6Eb/nIWDrjVEHOhpUC0e/NR96ZqQQ9Y01fYMjtHdyuSMEjeF
         rJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771680011; x=1772284811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ygKOGn/6qB099OqOl4y/DQB2ZJZmO/cFE4lvTvj5L4M=;
        b=ntMUg6uLNhArPcpXru/q155O0rx9ae8Q1znMp4+FChLheZNGgMvB5eMuId4LtW/zFf
         7YujHNiXlmrM4+lyvPOoolpwu/0XpyqBgN9jMZADee0LT16+xv8EUJlYojrCVUMLa3sF
         2/VLgDiYSUGgdbmcodQU9E29K1LyK2rfDNa783xEt+vHq7G5FCqyi+cC9A1Bsypu7Tya
         btFGYb5ahnpfXzWhMvAh59FZ/RnGlPPXOaz0vrCe1K12TLN9WYQ+gRHYZAuqNp/e5/F8
         fQCeBjKr6WxVvdi/8ceWorZdWeii7ITLRcILrUMMRLNLthquSoRqcMNj1IeQnOYUDEPF
         smKg==
X-Forwarded-Encrypted: i=1; AJvYcCX7FEp9zbES2xU8FRR3A+AmA6Tr8RoM/nDdqqU/9x0KRDqd9PLoD6Y5wXklGTvtH469YM8BBLFYGIGzYPyY@lists.linux.dev
X-Gm-Message-State: AOJu0YyUwcMN5dNHLaumuNDmkNMgaxx2vyRM3rOVXDFBgOuiXazGRDnk
	FZw2C/9ch9Km9g0pmNmOFQOFbXTwvvAWMeRSkg/gfn2TcS0arU2/F1CPHhMmbq+NzkluG1x0W/E
	75b3E
X-Gm-Gg: AZuq6aJ8thD4s0NY5OBNN4miga0cWLWb/t8raLlquW2T/xIuxzrXKGsXojPiYu3XLg2
	yxMae852HZEYoTzuxzrvS+t0Pgs0KNEMa/s+xXKGWxdIuGYOLsQXJpZVFWqbQiDkHLoMiJ+dqAY
	dao5VwnCM0f5U+bCmUN5y+ucv0Y/aEueIhmXwLxf/oQNyBzmzOLQ2gZkQm/9WsrOGxN2n4euTMu
	aGFn7z5TXBHY411llLhhBRggzsXObSVa0VNU6RDW4SiUXYpb4e8t34MnHdIn68ZLa7lW0g2CctH
	BJUrvUjLts/Y7i4HPj5SkFLBh10NF3LrK0o4FoUTkF3HfDhakrYW9n8B4w9SbZlNaANfcGZjiFE
	cguGUS0OuWWHjLbCFN4/kMOoizCLIbGIgp+YgJSQvtDjjjbXdQrJLwyueEIRkyNOHx4+kOchYDE
	FK9Uc14vy03mYixecbO+/XqX2Fm/Sy
X-Received: by 2002:a05:600c:1e1d:b0:483:456a:514b with SMTP id 5b1f17b1804b1-483a95befe5mr46388145e9.12.1771680010849;
        Sat, 21 Feb 2026 05:20:10 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a9b7fddbsm52095355e9.8.2026.02.21.05.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 05:20:10 -0800 (PST)
Date: Sat, 21 Feb 2026 16:20:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Use kmemdup in sdio_ops.c
Message-ID: <aZmxB8Lr13KLj4lA@stanley.mountain>
References: <20260221105148.309255-2-giorgitchankvetadze1997@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260221105148.309255-2-giorgitchankvetadze1997@gmail.com>

On Sat, Feb 21, 2026 at 02:51:49PM +0400, Giorgi Tchankvetadze wrote:
> Replace kmalloc() + memcpy() with kmemdup() to simplify the code.
> No functional change.
> 
> Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/sdio_ops.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
> index c9cb20c61a2b..6e03d3d8a6ab 100644
> --- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
> +++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
> @@ -583,11 +583,10 @@ s32 sdio_local_write(
>  	)
>  		return sd_cmd52_write(intfhdl, addr, cnt, buf);
>  
> -	tmpbuf = kmalloc(cnt, GFP_ATOMIC);
> +	tmpbuf = kmemdup(buf, cnt, GFP_ATOMIC);
>  	if (!tmpbuf)
>  		return -ENOMEM;
>  
> -	memcpy(tmpbuf, buf, cnt);
>  

You need to delete a blank line here as well.

regards,
dan carpenter

>  	err = sd_write(intfhdl, addr, cnt, tmpbuf);

