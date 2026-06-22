Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951BF364E9A
	for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 09:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782119263; cv=none; b=PCG2227XIb9uHkh9TryRV42IvG2kKRw3y66rrBLTuAoPPsE+6OqkKChnmJX0CeGblaB8vZzQ98zh0NzlioVECOOjjmdEzWymxyD1iVfHP8ITw584VxEQbxELVa78XiNegleemit6kdi5nLSAJYb0r4BWVnGdLr7uIX56smHGZOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782119263; c=relaxed/simple;
	bh=j83wHl1vgswEJj6jURdFdB1HRy2jCHOk2WmWIh52g8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eWMp3kyLKZRSK7kdYBjVClSaKZnwkDOmxLDeyljnGaoISTvotahL8G5MfQnthCu2s4ZtUxpw9HALTxac/q6IJq85Bzs9CmiUGeXvCBlYmJKaLQXNatRwetjVpTMDHoYguRWe3ml+YQrVgCLVd6tQl0BhE1AkQEtVfl705PMe7vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AhvB6Tac; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AhvB6Tac"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6974f511dd3so3797940a12.1
        for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 02:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782119259; x=1782724059; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RDAFwnUnM/TDiKNBHO8fQu7Y5AzSk6/sx2Rrw7B/zJc=;
        b=AhvB6TacI8JJ9+qNzJJRBG/BcbC1TE/VOX9Qxd58bV31ODlCrlaDE1G84Lv23E9zz5
         Spie47RDGGEbLyb7hysGlXUligLDOtAR0ocGmoVvsOMFPySq5VRjF7y9Vc4lm7MpxjJM
         J+v1MM20CuloOrJRj8+PWutwELBYmPUUXNDdbp9Z7n+P9Ofg9z9HgYEtqMoNfmqlmNWf
         ElHxpv0Bt0t/s+Pa3HkQV0oKp9vLuMj424Nn4E14qUw2cgr4hEElwGTgHZaQw2+Y/u+O
         W1JeouCkVn5QFK5KRvuW8NyFNffqQ3OsMgvumQ9J4Dhv1+p4wuvu/Q3apVyly2QLAkDI
         XkRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782119259; x=1782724059;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RDAFwnUnM/TDiKNBHO8fQu7Y5AzSk6/sx2Rrw7B/zJc=;
        b=aVhpXUvmcNJNNpS1dhj1/AUj08/3WDoSI1SOp2hRH5hUC0oQsWHbVFC7UT+uCOU+lv
         SrIAkuBQnUCcfUd5CIiSJ2eS8jxHJh+b/mbBJcoYg7ll/q0tI3SZXnVO4DaW/EpI9lfs
         Ur5VAeF1WH/cOg18gmU2Iy/U9N41QeBxOLtvMXui+lP0EGFTgvS4WrCm+Wwafb/qFudc
         afs99dImwZz+9ytcSYciMs9SSFPdVbzzlL8FGgBFooTWo4DEw7ki/JNIYfuGTB2dIUQr
         +fy7fIW68UWePotYCrAAYw8Oyiual6cb+Jl9cNzEwwojMoKkLFNV3LlmPEx3kJ0Mt4J9
         g/lg==
X-Forwarded-Encrypted: i=1; AFNElJ/RjWGZJB+tcVAtuBAQl6vYY8OmbjbCaiCwFNfW2wlStIKP9wtTWAtmvjBNAlCLJR7gGuoi2dE/SFcSQixX@lists.linux.dev
X-Gm-Message-State: AOJu0YypPOdUryg7gjEF+W1rloYfsqZ1IsB1sUZKJEIlHb4E/EBFao0j
	mMBB07xUZQ1CrqlE5CJ6dQ/mQakl7QlcGsnayQx/fF21JGBIJy0C1XHS
X-Gm-Gg: AfdE7cnLBo6WtFQwnz57XVnyA6EAroAnWLAIJGXhv+ZjC0lmVB0fLI1tQLrhYqJckGD
	MO9Skemug7Yh9hs5bqXYlJWIRc5aE8xCYoo5JV7DZWo1zvvRkjfAWyQ5s4bqgDyRF8UpDU0CiiO
	I/hJIM7d3SOXUn7J0EQML1jXG/iB2UzRlTnGsiqNvmnb9UMXqaJaLIENIi/zDIWrCFrkkKJAOxC
	ufzWh7kIpYbFHuaYOZ/f5Szw53uGpr/MokOmFrAHPHX/3Mm8FWm3thZFCAKPM9H/b6ZpDR79U8u
	E+FmNobIWf5imbusgxn48HqdBIQWZk9vEvDht/mCWSro2FoOeLa9FJlxThHH4lPBEPHeEyiHri0
	1dlsklZM1HUxmOvQroo/R653UHLXojhdsV5tMkz6Y1P2BDCYdZpKLznA4vLozltfvCzYYVIzo3d
	e2slpn33GU
X-Received: by 2002:a17:907:25c3:b0:bcb:66df:819a with SMTP id a640c23a62f3a-c097cccd477mr720797366b.40.1782119258537;
        Mon, 22 Jun 2026 02:07:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c610e4c76sm320651066b.46.2026.06.22.02.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 02:07:37 -0700 (PDT)
Date: Mon, 22 Jun 2026 12:07:33 +0300
From: Dan Carpenter <error27@gmail.com>
To: Serhat Kumral <serhatkumral1@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] staging: rtl8723bs: use usleep_range instead of
 msleep for short delays
Message-ID: <ajj7VWARSs8bO0Zd@stanley.mountain>
References: <20260621104058.7408-1-serhatkumral1@gmail.com>
 <20260621104058.7408-3-serhatkumral1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260621104058.7408-3-serhatkumral1@gmail.com>

On Sun, Jun 21, 2026 at 01:40:58PM +0300, Serhat Kumral wrote:
> Replace msleep(10) and msleep(1) with usleep_range(10000, 20000) and
> usleep_range(1000, 2000) respectively in os_intfs.c, because msleep is
> imprecise and discouraged for short delays under 20ms.
> This fixes the checkpatch.pl warnings:
> WARNING: msleep < 20ms can sleep for up to 20ms; see function description of msleep().
> 
> Signed-off-by: Serhat Kumral <serhatkumral1@gmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> index 89e41c26e..5e41f518a 100644
> --- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> +++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> @@ -986,7 +986,7 @@ void rtw_dev_unload(struct adapter *padapter)
>  			if (cnt > 5)
>  				break;
>  			cnt++;
> -			msleep(10);
> +			usleep_range(10000, 20000);

The first two are fine but this isn't.  Do a search on lore for
the reasons.

regards,
dan carpenter

