Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB10839B952
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 07:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776237497; cv=pass; b=nRg57fH3cw71flua/6fPXz7YTp62XnDHIC6vtkJOppwxpnz6q17msKCoI4la8c/8j96lDGiN8tGrYdgs+pwIsvUy0uEqXLwhWX5tGlPIBMN5QEaLo2D169XoczJeDVJKTSBOBiUhFdhF0IRtZ4JweAzEI4m3rjDG5dBe0mbq2Y4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776237497; c=relaxed/simple;
	bh=h0rQ4cS9dWXY9la8FpZjuD/RIneVPSi9ZeQGJ/Hz3as=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lKvqhJUl3jAteyMrTtJaidLNNZpXsf2adWKsepRRb3yw9zcnLXsYGdukkycapw0piv0a7j//h9PjIOGvceINnefTRr42bJE0M8KLjHOUjt8E86mZDzEpIhyXwbhpsB317tCO1AWlxudOmiAxRYPX/1qR7dyclhqTDI+zTL2V9fk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7iUeR0c; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7iUeR0c"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d7e23defbso1304825f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 00:18:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776237494; cv=none;
        d=google.com; s=arc-20240605;
        b=G1rin6/ZMbo2JkEbTU9WnRUgaZWlNC7ByQhAU9LMXjRaDfw8Drr1n7N+JWEMTl2Xgt
         Bu1tXcqlT7TxIHiMGauYk5gfNBPz8tJPMemGRUo6+Ex6g8KpZlOYxIeOECLBPltP1OYF
         F9b4s9uNLTZFOaqLCxWp8OTVLYpa1Gw8geqNiXm3LQZnmFdrGOHsMiB5PmF3jDzi6mXM
         MEmt52nn0pepSDCycqZj8fn/5OGf2tuUmKY+WP0XOvwG2C1YIczgJrQgeGb2RjOC2Kn2
         INOUt8a6+8EYH1I193+rvnK0YAtr9yBtjA5fYC8qwSV2jyRyfEX/yUbN97W/8sSwPykW
         k0HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2nuKBbGlq7w6y0tHaaXEOwvqGYtxbGC9tRxpbGm9Imo=;
        fh=+dXiBghisr7A484r9aJ3J3uNVN7tZHvmwoYb3RN7h98=;
        b=eyYPytUU3nyerLDrFc8rPjoSjQY3TIwuIyrdgZKLfweARo2AGH+l61LqyZ7JnTd2+K
         lyLkM8776ODMO4ITry5oeE/KlmAplSweVaqjCkJkt1IDrQ/giwU8YxO/SmLuMhdImyss
         XCrcWG3bIRiRwky6FMkLfHinQveTw8bI7QhvSUBmiVaofKtFwmAxcinYIaENBqQ+2Bk3
         /sHoKP+acTmQU7CI6tog6c7EISne/P6k8/Ixk33OXF3GP8h6QMrHiZ81GAcP1lPLRyZr
         LasotoTR21wpKY2AzNDqunkz0wAe1pHl0ByviGnQinYB7gvjYt+N3rsIyHBaiVcTf7qb
         eaYA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776237494; x=1776842294; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2nuKBbGlq7w6y0tHaaXEOwvqGYtxbGC9tRxpbGm9Imo=;
        b=i7iUeR0csA2ytoXnkjshl7GXzPqvM2DR14CTgBgBkE4WbvA+kltEsPkGfkuzoNpe11
         D1KXVAmWxl+jAnngLIYiIADWXiOIYvhqtfYSVQtYv9fVmiF5s/kw/4ct9klp1KGiDx/m
         AFJgiU9cx8HtmnW3ZUPR3SfcKaUf616LDAv6r8iWQuwnj+mwZmmoAdT4/je/a3M55rOq
         O/ouSKK3tDyQjRJm4thqusdunExyR9M4aXOYaAmsmN83dqDfNXEgUSNxO3m9eqJRJXNU
         wvCxozvVl8py/5SGWMtga+7BVxT5g7iFGtwegFoffhlk9E5Jef3flSIoslkzHFeZVwcr
         OF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776237494; x=1776842294;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2nuKBbGlq7w6y0tHaaXEOwvqGYtxbGC9tRxpbGm9Imo=;
        b=TST+JcvBxofLHVTQFzK2dL/Wm29S0z8gg76l5MBsEgcaBds4PPCkVt1QZCrmg9PKIb
         Msb4vIVJ8uSQFv4AKhUK/m1Tc73c+F/o7XR6JvkaSqTKSCc4SWfxRBbA8oh4MSIc8THi
         8YYm33/pIsGVitCFTiNGk7gLsjKBAxL98B7tHGpsUOvT0UJrWy7Z+nYsTiK8GYZl2ik2
         xzCttbZCP8mDUTdsspLzc1chAnAbiJpogWNmVXdzNCpoRvdxPHy3E5DHArpdCOmoRiya
         RU9XDNnDcVgHe7mur0PX6yuv3vu9ev2A2vNxlgCTWyzjUQEpNju+DKFnhfnPXFWFwiZ5
         ps+w==
X-Forwarded-Encrypted: i=1; AFNElJ8kkkwK+CZDSV8UautPX34u704Jt6naVEuAwfNGeuHs+h/mG1lg838RwsGoY2qNuIcitQbo+JiLHgSm+iYk@lists.linux.dev
X-Gm-Message-State: AOJu0YxdIwFDsav6XO0pe/yMq5owNBc7lEyoYvq6lbnxvf2SJ3CnupP6
	54WF0xU5J1MX+GJzQbiJxHEEpr4eMa8H2YWaw30ocQlntbw8ySZCJWVB87Bci/zU865JBHB4FnC
	UO+W4ru8kbNO9auiHUjjcs+PElsSxm50=
X-Gm-Gg: AeBDietAaSeON+i7CCU8h5k3cBlM8w17tVTA/U0g/bE4/EhzCOEeQguNh2aflgMRW26
	dsU4jKy9SAre5obJNSebYSGKhb7b/soZQZfcaKaKehnEmdTSlEKlzGpwjG9zxVveSawwHzXklhu
	nT9Iy0o0GlSiLGGpH3zM93QKiFBCA3g2XAaigBinDEKiHAx/UBI6JE0NuCOCkJ0TMjFSy3dAMzd
	vGeBhQSUVlWSSigqIg6IZBlE2zXVF9ds5rjQ2I2BvR8yoVzY3mq47Swv1vzjOGc6PEXElNYBDqa
	hF05rKtudl6ILQwagpUmLo1+EpieKMWTJgXNtAQ4fz0BFCyUIEIo/oPjQFpntlCbpPtE1bGBtTm
	rIp6h/o8VW9UO2/OOzWD0hSoPeXT1w4HCUTtTTcAWQ0HNvkdiFDW+eYkNvXQ71vEqk3fGGQ0rUd
	rCerdfwkncuCMptU+D
X-Received: by 2002:a05:6000:1ac9:b0:43d:7d24:b51e with SMTP id
 ffacd0b85a97d-43d7d24b893mr13620760f8f.14.1776237494064; Wed, 15 Apr 2026
 00:18:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260411123512.84739-1-joshua.crofts1@gmail.com>
 <20260411123512.84739-2-joshua.crofts1@gmail.com> <ad4K-K3MpwD3U4F-@ashevche-desk.local>
 <CALoEA-wikg1aDAfhgHYR10ep8a0Ab+hJ4mAUyAR4nuV4Uysj+g@mail.gmail.com>
 <ad4oX0Py3T8j9Y7h@ashevche-desk.local> <CALoEA-zbi1VOv86FrU2Skkuota0UGcMyHVJwffyEY7+ZsMSNcw@mail.gmail.com>
 <ad5zXNdMTxbt1GHS@ashevche-desk.local>
In-Reply-To: <ad5zXNdMTxbt1GHS@ashevche-desk.local>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Wed, 15 Apr 2026 09:18:13 +0200
X-Gm-Features: AQROBzB4RhFtUOA-KA34_X6NSkJKMmJIUrhiZ_fFhqXxMp5KZX-F5S4m5xUEeZo
Message-ID: <CALoEA-wKJsjyOuVMOAyOVetB=N_E_K8X+85Kg6JVEthX3JWVpQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] iio: frequency: ad9832: remove kernel.h proxy header.
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, 
	gregkh@linuxfoundation.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Apr 2026 at 19:03, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> Up to you, but that would need to be a separate patch, because it does
> the opposite to what your patch is doing. And justification is most likely
> that it's preferred to use linux/ generic over asm/ in the drivers. Or
> something in those lines...

Okay, I'll send it once I get this patch series done.

-- 
Kind regards

CJD
