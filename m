Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8A321ABC8
	for <linux-staging@lists.linux.dev>; Fri, 27 Jun 2025 19:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751053169; cv=none; b=iRFE2iA0qCpgQvaciQynkQytmPXSjlmOVHkmk/RaDyHoWEtD2ly7t969bM72pLeNyIWyaRr6iVSOZeY1Qy1NvM53Y+CKzW1Xqh3oHsjng+trXrxgX36Ey9SVnwLk16nTmeU//6QbEHJfx/THYP4w+X2LUIe4zfJG7kny2p7bZuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751053169; c=relaxed/simple;
	bh=fN0Kh2ojk27IcYub4BPpYkImoeGoFKi6u7WjndHiWkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XegQJwB98OBqcs+WbY0X6AuaS/WdTtCN/cr5UEvUHrKdbgorjJcsDr0WgGqaLbhrU/xcJKrOBTKBlQcW3V226pc53oEj60g7PLNMlEb5qxxrlLQaYvkriHoY3ofYMEfbEuWq/DYyzvtyKeAzsl4M838Rg9xBt8nHjIXRWnWy4Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ofg/fL0M; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ofg/fL0M"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-60ef850d5fbso775298eaf.1
        for <linux-staging@lists.linux.dev>; Fri, 27 Jun 2025 12:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751053166; x=1751657966; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=suI3XDptlOt7dxiujjvASAv8boeYPAFXuAl8v0Kjmgk=;
        b=ofg/fL0M12FN49YYwcmZSaV3iLAvlrzj22b7KKFPGf4cayXRwAfmEv78hxmU634IuO
         1e+8hp8Kk3k98bPnny1T0pYxVSnKXmLNjUsVQX64Azsa2Zpid5imCpWJMvuX1iloBlj9
         CahkgUXVZugcqu76KvRqMVwbvwZvh8IfgXHXj/t8rbT1i/3mtkpqQ3M6B/Frz4DY6PzL
         Sfliop0NYLVgAwiU57cKzIdZPEYkx2eeQ2vTFr5B52U1VKJRxjuKjStOktCj6FFY2jd8
         wOE9N4X9snufJtsAP5QZX867TSltT8wrilsyuwOn9u12kJ1MmXdNywMX3Czwlg/haS2O
         sHzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751053166; x=1751657966;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=suI3XDptlOt7dxiujjvASAv8boeYPAFXuAl8v0Kjmgk=;
        b=Uk3m/iSrTXm2i1JkTW1twOJj5uWSoRzuxH5bGxZK6d+8hKBDkjMB/cKocoBWCohXNO
         vltwNKPpIQvM6TI1IuRtR7KDtQ5BpTNEEml9n1VqKX2YHXC8Si4kN/vIkMMWxxQ8rZSf
         sbdVeBsroxnQi6LRITS/pKyyppwIETGXKgK8qI2Tw1mE7BoNaJo6E+4GW2LJqjuM+8jK
         k0eCP78Kz4xJuwOHXLIAAPz7FxjBYSe6IZ5KGfwHeRDvB88mvFOmLa7BkaE8QhSxStFs
         q8IXF/KQKBiUIrL0IjvbUSQzIucuRsDIPD3tcB06WpOFqmVUXPEU0mNNTxyYWJdg38TR
         przA==
X-Forwarded-Encrypted: i=1; AJvYcCXl3vvtnSecAfjLEjSwjSo/OthSe0JORJVzCP0H0XLURzP49mz8bUuQpMTwWArXJjLvnM2tfg4UC4S97B0f@lists.linux.dev
X-Gm-Message-State: AOJu0YwgqeWNELfC+975KFDsb9xZGAjHf6mEs98w7wNB5ejHFG82cars
	5fJF2wG1Y+m45kzEAE0PzofgMG0fmLgNEhqfyLdA7sMuJEvwcNHsBmBVbVCHJ1emLM4=
X-Gm-Gg: ASbGncuwRd+Dl/B/Msz3wtfhS2WxyMRYcrbOp62qKubXJRMwCA8VrxPqo7zceM6UCZI
	8wRnsfQHyjqmEr3u7q2eQLUz7sA7VdXTiZfMMrnTj6s/0ncs4uUqPuaBZ3n6kndzr1dydx2190S
	OmbHmn3ELt7rnMkgZL3C5+k0cd0wx8QuLmae9i/k+jGxH6/Qu7MqlHM+zQWRhKbooCnHqhIUyn5
	Kg0xajgoXRuk1Q26x5RPVoKXBDxnrLzDgWeGuWZtvpVD707CpVJnm90CHc0EpYC+BbDpZ42ZXZA
	UXEiKXO86h3B9W00mYl5UPWqulP5P60teasUt91TDUMhLVn9EvuNTVWemIQZSIaVBnw5Vw==
X-Google-Smtp-Source: AGHT+IF/5yUXUJ1U/LstDtUP6YpGrdRLcEbQGFsZNqCq52p8mdReUkf+RyutYfRViO/wlG1V6E9mTw==
X-Received: by 2002:a4a:e90b:0:b0:611:80f3:eb44 with SMTP id 006d021491bc7-611b90eca36mr3218582eaf.3.1751053166574;
        Fri, 27 Jun 2025 12:39:26 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:f3a4:7b11:3bf4:5d7b])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-611b848d77fsm311990eaf.14.2025.06.27.12.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 12:39:26 -0700 (PDT)
Date: Fri, 27 Jun 2025 22:39:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdalla Al-Dalleh <abdalla.ahmad@sesame.org.jo>
Cc: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Rubin <matchstick@neverthere.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Paul =?iso-8859-1?Q?Retourn=E9?= <paul.retourne@orange.fr>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drivers: staging: gpib: minor fixes for some C macros.
Message-ID: <4edd380e-6314-4fa0-8051-ac55144e061d@suswa.mountain>
References: <20250627193613.552193-1-abdalla.ahmad@sesame.org.jo>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627193613.552193-1-abdalla.ahmad@sesame.org.jo>

On Fri, Jun 27, 2025 at 10:36:13PM +0300, Abdalla Al-Dalleh wrote:
> Ran checkpatch.pl on drivers/staging/gpib/, found the following:
>  - gpio: gpib_bitbang.c: wrapped LINVAL macro w/ parenthesis.
>  - hp_82341: hp_82341.c: Used comments instead of "#if 0"
>  - tnt4882: tnt4882_gpib.c: Used comments instead of "#if 0"
> 
> Signed-off-by: Abdalla Al-Dalleh <abdalla.ahmad@sesame.org.jo>
> ---
>  drivers/staging/gpib/gpio/gpib_bitbang.c    |  4 ++--
>  drivers/staging/gpib/hp_82341/hp_82341.c    | 14 +++++++-------
>  drivers/staging/gpib/tnt4882/tnt4882_gpib.c | 14 +++++++-------
>  3 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
> index 625fef24a0bf..45cf4571c58d 100644
> --- a/drivers/staging/gpib/gpio/gpib_bitbang.c
> +++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
> @@ -47,10 +47,10 @@
>  			dev_dbg(board->gpib_dev, frm, ## __VA_ARGS__); } \
>  	while (0)
>  
> -#define LINVAL gpiod_get_value(DAV),		\
> +#define LINVAL (gpiod_get_value(DAV),		\
>  		gpiod_get_value(NRFD),		\
>  		gpiod_get_value(NDAC),		\
> -		gpiod_get_value(SRQ)
> +		gpiod_get_value(SRQ))

This breaks the build.

regards,
dan carpenter

