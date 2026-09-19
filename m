Received: from mail-oa2-f26.google.com (mail-oa2-f26.google.com [74.125.231.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6622DFA2F
	for <linux-staging@lists.linux.dev>; Sat, 19 Sep 2026 08:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789806054; cv=pass; b=UtZLJiFhI8Wq8tgoYuZvbGVnp4laONg7sjEexPAIMoTQ9yogBCBSqQa8a1hZl2XuzYVLsoVUmKS9FFM8jrPoDiurwrl3Og6b8xOejwiC4DjqjWo5ck22pgAxtvf5HmHfyvRv04x851110iXVZLHaw2fy+OyN8WCESXL4/mgY6xg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789806054; c=relaxed/simple;
	bh=dRbSK/OKK8iimVXv289dck20Og0p7BV3a31l6knNHn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IyIA2NDuHcLRAD8fxjWFkFb6CtAPvyi3ppvysV/0EzMbsmztdHztOg0iC83TB5Sk4edqFgonG40V0Nxxw3MCHDr1DintHSuX1MjX44OGpEz29n/3evWY9VgTyY5ODF5WAFv+msSNLv85YaEwD2S3fesVMsDAqjH9nBuzIQ76QEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BLNdzoDy; arc=pass smtp.client-ip=74.125.231.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BLNdzoDy"
Received: by mail-oa2-f26.google.com with SMTP id 586e51a60fabf-466cc88a9b9so1101858fac.2
        for <linux-staging@lists.linux.dev>; Sat, 19 Sep 2026 01:20:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789806052; cv=none;
        d=google.com; s=arc-20260327;
        b=PAhMmEHWmCvBCTW+GkP8JILZPMJd6FVvjneTW58suFAVsiXMYRNPksSMLoS8gdHkWF
         jFfgKh01MO+X2txRshXKYRwgW3dSq7/9c7T4DWIpp8SDjQOMCPwk1uOANtNc3d3wFpsO
         2fFmb/yr0xXbhgfHk5ANeXJsnQCS+PoYaBDbRInVoKL62kcUmxxLItK9yUfvWNsYJVzv
         XhTGDknD7Q2tlgFX5ClpvzOBkm3rTpBgXGa0QouqH6xHjed1oQ7rXP90khQTyNl6+eP8
         DtO/OWRny4XzqWTCAal22a/54oME3at2YRgZipEOfkD1q01fmiqfSvJ0Fqs9JjYDYSZq
         OO+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dRbSK/OKK8iimVXv289dck20Og0p7BV3a31l6knNHn0=;
        fh=4fnckGe3+Q3Tf2TD4+PmtSSh98XWrpf6Qx745bkJxJ0=;
        b=ejbFDYb4HqrzP27YciCh1WUgbNOv8iVqqFmqoTImkpkInmKguIny+aN5Q+gKT6+dBZ
         LtxtAwFA5NdoJrXXc96wJ127lmSUmIkWhazK+cLp5Aqr74dNPFrenPkYnRRd+2fViVXC
         Ei7vsnEq0wp1O9saVXRKhobUNEvuNPUKs+JTfkmaPX7r2VsQoRk2zTrhrvzAxBlTLflM
         D5gszd3hbwR2owHOfv4jct2aXSYB4gD8V1JBEltmb8KzRau7pbcl6am3CeYhmv3Q+u5/
         /XqGn9vChaP50+m07iX/TWOKtIwtC/SKbpiAW4co9slhOOxm2oAQnLqsWGQv3lUVnujA
         DNPw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789806052; x=1790410852; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dRbSK/OKK8iimVXv289dck20Og0p7BV3a31l6knNHn0=;
        b=BLNdzoDyzmXODtLW8UQbWtdmBu4ygi8r1YtPDwYrDYvLc6i/I0ctNZ67YdG12X1eGa
         ABRUy8C0/yTY8m3XX92pKoua6LpQtvDdyZs7DWnUZL89ctIT1ZNLWDJTZKSuKEP+Kk9c
         aGuaaTpcUuc7x0qY1RiZIQjkb7c4jqC5P6zn1eCR3M4r/aHeEO8ndYCFsTCtbkT7t7qF
         iwOEAaZfZ32Oy5vP6tesf1VxlABc6N96at1zelZTEzDqori8YsIVMb7Gq/G4AjVqO8sq
         PCTgypljsc3t5af3Jtk0JW6T0hii4Cn2scpZGisLzVFh/I3bIRxTb9Jvk9+Q7DlU/JGt
         FOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789806052; x=1790410852;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dRbSK/OKK8iimVXv289dck20Og0p7BV3a31l6knNHn0=;
        b=V3MjHTci+eFMvnwsC/KzaejiNOfOwWzFYDNMm5Tostmfra10B+8Na5jd389sEFhb7C
         nV/mkuxpIp2nwqGKr6zSXgZKlQNsonx1UAwpbtiwOhnvo2DH3GWjVGqWQlUUzYd0kMuK
         saCyCW3ELHm0ww6La89OCFxmkIej24oMj+/ZjE6h1Ye80ogxoTkcbtDzX4CFEaX4UO3g
         kgnLvJfgkZ0ZGNKHCDmMCuOTPHHHAmyvdCjofFeWt4MZpypprQBLQJ2+1L23JeofTXpz
         gqN/utojLrop8D94vcqQvoGBDakooNpZ/RuPfNIjwGjtAmc/R1NjdNUvWmFmxuMHdjVR
         P9xg==
X-Forwarded-Encrypted: i=1; AKwUvBxWYaFI62MSsxkbjhVIjARilHtxjfkXkChAaxOyJNEsHhxuhIUjy7TJ6EDK05hk7g28d/XEKDQaO358OTJ9@lists.linux.dev
X-Gm-Message-State: AFuF++lbDRfjlsJ1m7kANxJ2qRvfuJZdpxfXF4ZtWWsrlrZo2d/G1B6W
	NfT3B1Ntw1kpi/xsl/8n8c9NDi+99VAJbq4F9Gu9XwJ5r9/kHlvV9JQaKr+emwaAAlm22Kz/iYH
	g3CpdJaNK1+6kiaRZRjL/ATVNP8eto2Q=
X-Gm-Gg: AYBFou3MJco3PPl1y+5sqPXllLZ9wG4KjqRDG0EjdBClMvn63BYIkdSludGNbv6K+tR
	t3UDHn2c3SJHJQkDMHrDJp1+U0dktTrEqQuFE2sBBCHDNPByGOssfNuiAqAIuUQ5S4fiBIkNCP/
	iNXyLjm1U1i4Zz2uHfa5PM7SFBg8iAL6YEegzwgNqIhsxitvI2oDay+N4Co+GRDsPlBtNlsoue/
	pTyaq4/jdVlJ9XweuM5EXrsKl/mexs3AOy2RMRS7l5Cg373aid/5ETAx53Vea2z8W97/ZKqK0+4
	5dDc4phkLWph/Jm0BeCHAaN19888ibf8gtfZYyb1JceHV8yS0odLWgx7vw==
X-Received: by 2002:a05:6870:af94:b0:475:e235:904 with SMTP id
 586e51a60fabf-486e7d8d784mr5164669fac.34.1789806051717; Sat, 19 Sep 2026
 01:20:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915075939.18180-1-abdelnasserhussein11@gmail.com>
 <20260915075939.18180-4-abdelnasserhussein11@gmail.com> <20260917042241.05bc81a7@jic23-hlaptop>
In-Reply-To: <20260917042241.05bc81a7@jic23-hlaptop>
From: nasser <abdelnasserhussein11@gmail.com>
Date: Sat, 19 Sep 2026 11:20:40 +0300
X-Gm-Features: AcwNN1VPFhT8_U74Se6tKxB-Bhi_wWnDBf7t9r-mJewyfUCjrFEfyYR3Twb_qsA
Message-ID: <CANpqX3ZUL4qhjKEx2DN8YOYrMMxe78w1O0E+aDGSR1NE3oprhg@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] staging: iio: adc: ad7816: Fix DMA safety issues
 in SPI transfers
To: Jonathan Cameron <jic23@kernel.org>
Cc: gregkh@linuxfoundation.org, nuno.sa@analog.com, 
	Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org, 
	linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, joshua.crofts1@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Jonathan,

Yes, it was indeed a clumsy copy-paste error on my end. my apologies for that

Thank you very much for fixing it up and for applying the series. I
really appreciate your time and guidance throughout this process.

Best regards,
Abdelnasser
