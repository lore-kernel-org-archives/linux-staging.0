Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0C32222A9
	for <linux-staging@lists.linux.dev>; Sat, 16 May 2026 10:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778926641; cv=none; b=UGGV+GyM86QsDEkacx/m9ktfcKubXBM7onsFtFnUQ+rYFr0clz1AiALfVFmDy8TZCWZtUeBK0ZiF9iBxP0+B8aO1ZEGd+QDwXUAxyGNSobh9ew2U+A7gusGMc9DyGcO1aVttCjhIDvKiYxaypJyn1GOZB1g5KcDl2DjeEMcAbrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778926641; c=relaxed/simple;
	bh=NqwOx+4QSqtICnoZc5QIHVRjDWwZb1taL4MrDYfRpFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sdDlHFMh+wsEOcR5givsENdwzEgSoXHcBIqBtk+RSlOxausTz8oOa0mOZExV2DibUc2zy4hf6CgqaAuXg81udIW7B8UHWN5bbATRIxyfYYT+O7iepSEt0CJPhPRm76WNCosZ9MrO0AdXiLNR0WCfcJR/URKJXP+aNd7z3T85c70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K+C+si+c; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K+C+si+c"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-44a5174670eso278955f8f.1
        for <linux-staging@lists.linux.dev>; Sat, 16 May 2026 03:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778926639; x=1779531439; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5BEJIrwSsTTUjmw3oWuaHvW+dyL6d8lTSMCI30LFX8Y=;
        b=K+C+si+c0FzrembYcg9VwnIwLEyZwORfUSMXWM+NmdtlUtWy3qS2//A6zfCzbzebPK
         GAt/s0uy3bdYmMSYzT/zLLWxJNiQirdH3N1oYbFU8QBAZPQbQKt9iqbdey9aaj3fqKWo
         NVIRoowImr/O7BuTgMHsFviEWgrAYQPXnn0Weh5i4dtm0Cui/lt9XTpXZ6OGsRs/ZCSi
         qrWIoIiLbm609tMregS7RI2VCRy0QXzrSSBti9nD84QjUluZPVIMC/w1o+GnNW8ntsRA
         Kz/SqBvsjnCZc1sVKfPtQ9G6lKmP2i9TSoU5rdVjQZg53tazepXx7H+uVsE2F7UKHeVA
         7yEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778926639; x=1779531439;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5BEJIrwSsTTUjmw3oWuaHvW+dyL6d8lTSMCI30LFX8Y=;
        b=d8cbeIVD7TLzxC/umoTM7b6bEjgKOy6VyAbgE2qlXi9wh3LPMaw5mHQCXaXScBmLGv
         W32EY+NKc9voexfRq/JT+nTCZ9m7/SMfeB93UlEnacuxEJazqbIreqwnQAZmle8F3AW5
         P7wDdLojmUeP0tQtBr/rleYva8PbFy52fJsHxLRHWE40o22QJlY8OeZc1MoIH8J29Y+3
         dHqlbak/HKrrFvG7niKE8KStJufVokIJIJSHmLpu2XW+yls5QXxLduETZPiuY1wIH41w
         XDKGT2YRQ75W3XPkZ3KOYNFxnnIzyviaS2Lloe4t7glj0jetho0znkjlNJgj7LYU+Y1I
         JQsg==
X-Gm-Message-State: AOJu0Yy/N6WoNGVhSNJFwRgKEFp+NnUNcYxEGJPf1wIF488JoLTroBp3
	xI1cjpa26ql/BdkArx4aoJKM5opegUhcuIixc5bwhS2ZQd94Bgur6BtL
X-Gm-Gg: Acq92OEofiKfJ8UnsoSDRAS3Jv6TqbuFcYVtf4UVHZi95oAWwLCcI9XCRnDwtCExTNA
	sYuv+NwHv0zxUXjgEFCEY2xIzyRvgQrbqzvoV1N10XQEihU1MV44pV7tMiSZn7naDd3BMhNTiRe
	XWaRaQ7SNoTZLOCM99HEFtLLlCT4lVm5sBIOg9tivv5RmYkUcDPHiw0SMqryjth4ZcffGCHVtp0
	5xxGtAhhoXCIzc9wswcvUtAtwDA3BeDKpfAoFTM3MR+KPUYryAxmAq2V4MTLXfK5yKchUlKMG9e
	G2DkcCaDoKlrlESUT98Gb3qAeza087S8aTJ/tVRqdmZKt/Uc9MdMDyQIy8eVJE+Rso/mkJMr2kI
	cA6XJsA7KmjGEdpj+1UyEIPWK/1EfFCzB7IP+2YJx7EyKh/5omR7mRtwUONsCmdrwMYqE+jjZ+v
	Oqncb5wLfObTOxKtpMH07LaRm1bq3daA==
X-Received: by 2002:a05:6000:2902:b0:43e:a81d:c475 with SMTP id ffacd0b85a97d-45e5c58fbf9mr10499187f8f.6.1778926638590;
        Sat, 16 May 2026 03:17:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39806sm21268538f8f.9.2026.05.16.03.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 03:17:18 -0700 (PDT)
Date: Sat, 16 May 2026 13:17:15 +0300
From: Dan Carpenter <error27@gmail.com>
To: Moksh Panicker <mokshpanicker.7@gmail.com>
Cc: linux-staging@lists.linux.dev, gregkh@linuxfoundation.org
Subject: Re: [PATCH 2/4] staging: rtl8723bs: add braces to else clause in
 rtw_efuse.c
Message-ID: <aghEK3CCbfhYQ-T8@stanley.mountain>
References: <20260516095103.12727-1-mokshpanicker.7@gmail.com>
 <20260516095103.12727-2-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516095103.12727-2-mokshpanicker.7@gmail.com>

On Sat, May 16, 2026 at 09:51:02AM +0000, Moksh Panicker wrote:
> Add missing braces to the else clause to satisfy the coding style
> requirement that both arms of an if/else statement use braces.
> 
> Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_efuse.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> index 987d05816c5c..2be74f2d4ac8 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> @@ -73,7 +73,7 @@ u8 rtw_efuse_read_1_byte(struct adapter *Adapter, u16 Address)
>  				break;
>  		}
>  		return rtw_read8(Adapter, EFUSE_CTRL);
> -	} else
> +	} else {
>  		return 0xFF;
>  
>  } /* rtw_efuse_read_1_byte */

Always compile test your code.  Also why did you send this patch
twice?

regards,
dan carpenter

