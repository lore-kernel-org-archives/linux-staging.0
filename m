Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B5539935E
	for <linux-staging@lists.linux.dev>; Sat, 25 Jul 2026 08:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784969996; cv=none; b=NpMfPWHSi7QaiXt8TL25prtGx+i5sSSbTYhU1nrm+zV11iess7mmph3C0+9G5t7+TPt4EyYr+E3/1yhUyJYwWiLaYUao1vMlWFKiYOTokidb6WO8uz9uWVhHZ4zc9IZfFCX1HB/fqlLzgCMm61TcgyuUuKBa5bQLxy9INB8n85s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784969996; c=relaxed/simple;
	bh=5MwmaoaW95tVUWMj8ol9Sr1didcpfiPdV9xHydvh54I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A3dE6GmgtpymocDSRH1oz2kYQcKkeCkPukBke51ctcFQjfbDNtvrVYjIOlNmV9HIr+er2zrJ3EKO8ChsSprknfKwFWmRLSakI6uXuKcaKKm+CgPws7MmsVX4LODuMNi/lD0tamWlZdzg8ZE0Mstp+TBAP16PNownU140Tc3E9ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XEnKpVyM; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XEnKpVyM"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8487088510aso1063684b3a.0
        for <linux-staging@lists.linux.dev>; Sat, 25 Jul 2026 01:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784969994; x=1785574794; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UbQYEEJpzV2V7mwGYT8rwyfPdNnK/gZ6YuB02J3vSqU=;
        b=XEnKpVyMkWBSLjKmnZZwqGc716XGjTzL10lz2kuErXo4p7BNae5M4kBhB3vfb7eh0W
         bZlkzRY76NQzwpQfbp9KgnkUshCOmhlrczTxXF0LAeYPH+2tc5HF87LAJRLHmX/Z3KOS
         dGxiDQGXO6R0g2o1FEQH79l2lPSzd8YsV/lAblnQ8OME9h9XtJ80L7PNy+oDoafhIXjS
         CFKnqrZOQ/iihWHACY26X2lCo+VziNWs094z7NK9nPDX9WlgiYKxA4KXl0bT9t51CohW
         TGzbNsvcjgrvCE74OcRLPcXjYg2F3DPqvCfBYWZlD6NZ9flGbhtjuaXx60ijXHpMRwm1
         KxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784969994; x=1785574794;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UbQYEEJpzV2V7mwGYT8rwyfPdNnK/gZ6YuB02J3vSqU=;
        b=hhWcAJJ3HYXt3p6QJdj56oSP7TE0C0Ds+BZ4LV0pAhHVQsX5BxmyT/mipHPZBOe7/a
         paHQwjf2Z14hDpqrX3qNKUkL2hQl0K2VjZnhGWDJY5R+5DVfHfSRcyfm/+Zaz72TxkQQ
         6f/9iQ96g+JTe9C+p8Bsk5YHCpx/tTZ0J65m/ZjKV/txY5vQKHc7qH0ggTO481K9xtMM
         swahBmYmpPkONj27SfHrwg3+6DrlqcNUUrS56bd7ccBsAhGpxGUJM5PHLK1TtaJV+aVU
         QFx4OayxL5YvYDFK6SOcdbpicNxG62uJvSyHcMf1joOA0KKZCiCHsAdpmo7+Zmx85O8c
         vMqw==
X-Forwarded-Encrypted: i=1; AHgh+RrGH7EOysdJxdCAupw0w3GjRUSDF/JIbkOvD/41CwJ6QsPsaUiXkm3y7J9ne01ctu6LAdV3odoabmRUJD0f@lists.linux.dev
X-Gm-Message-State: AOJu0YxY0R1k10yUflYizP3crCkk5iXvBhmIrfue3V3KjNDe/z+l0kT0
	fc4oDXzU6Vbty2AdYHLGm5716CbUh2pMpNWGadqg9JOsaMeN5ZfZtLTs
X-Gm-Gg: AR+sD10CHQoGWxkL6xLd7AblW3BDEVDx0aHofeoiw7RjtjVtZHBouaZLpnskY+h9HIn
	9xY43zO3tg4VlgMk8kHoTHoKJFj80GS5qA/JW0l46vmCA3aqsqYpckMb1y4CDIlLjM8VYU0fseQ
	D4O8N01DXQUnv2ULsBLszo1M6mDZTtMnjL+qYsoSYRYOemEhbuPb7P8GpOMpHS3HJA1t9ZEmPn/
	ApJYTxexbMc2oNhUilnB5dIjZETW3B/ObuRD0Y6YH/VepwRCurpRKwtvi7QLnyy48G8Yud0b06W
	BjKDwIB9JwcDv7L5l6Uv2c4fa+bGovwySLw09NlHcqfr8Iu+EHxhywnAp4BjL+mPJB3KPVVYlAO
	9OfgnpO3miW4MPFrda2RGa5y+4OHQPEPOJjs8nuwIr0AFxAu+YHyNSBKffRxLp5QP/qI74NVD
X-Received: by 2002:a05:6a00:180c:b0:847:99b4:d011 with SMTP id d2e1a72fcca58-84e59554766mr1191339b3a.39.1784969994409;
        Sat, 25 Jul 2026 01:59:54 -0700 (PDT)
Received: from localhost ([172.216.252.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5325856dsm909382b3a.9.2026.07.25.01.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 01:59:52 -0700 (PDT)
Date: Sat, 25 Jul 2026 11:59:45 +0300
From: Dan Carpenter <error27@gmail.com>
To: Mohit Mishra <mishraloopmohit@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: sm750fb: Remove unused function
 sm750_enable_dma
Message-ID: <amR7Afw8WeJcQBY1@stanley.mountain>
References: <20260725084649.106589-1-mishraloopmohit@gmail.com>
 <20260725084649.106589-2-mishraloopmohit@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260725084649.106589-2-mishraloopmohit@gmail.com>

On Sat, Jul 25, 2026 at 02:16:49PM +0530, Mohit Mishra wrote:
> diff --git a/drivers/staging/sm750fb/ddk750_power.c b/drivers/staging/sm750fb/ddk750_power.c
> index d617f554f58d..e4bea8da1827 100644
> --- a/drivers/staging/sm750fb/ddk750_power.c
> +++ b/drivers/staging/sm750fb/ddk750_power.c
> @@ -90,19 +90,6 @@ void sm750_enable_2d_engine(unsigned int enable)
>  	sm750_set_current_gate(gate);
>  }
>  
> -void sm750_enable_dma(unsigned int enable)
> -{
> -	u32 gate;
> -
> -	/* Enable DMA Gate */
> -	gate = peek32(CURRENT_GATE);
> -	if (enable)
> -		gate |= CURRENT_GATE_DMA;
> -	else
> -		gate &= ~CURRENT_GATE_DMA;
> -
> -	sm750_set_current_gate(gate);
> -}
>  

You need to delete the blank line afterwards as well otherwise there
are two blank lines in a row and checkpatch.pl -f will complain:

CHECK: Please don't use multiple blank lines
#93: FILE: drivers/staging/sm750fb/ddk750_power.c:93:
+
+

regards,
dan carpenter

