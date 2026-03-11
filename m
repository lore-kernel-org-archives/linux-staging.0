Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132AE23ED5B
	for <linux-staging@lists.linux.dev>; Wed, 11 Mar 2026 06:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773212179; cv=none; b=q0Dq0a+9k2NHYjqqHhrr3OopMY22Jym5pKXNoviy1nW06pvVhE6mc6tJmM5LmqdJujzK7LJJcwp8XVxMKr92FfjjAGYByCXxpiKck17pDsW6GKdT2xiVIHO0gsCKJQ0auJKYuKO81Fm3OXIZpDCGVt9Lle6EFTPipK0PtZBDHyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773212179; c=relaxed/simple;
	bh=wbO0FXJ0RHu16QVceMlJ5juIdq1hptM6wSl2zq2Fmg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dQANTLUnuvI/JFgn645zER7orJKl5rOl8h1iNzjW/0tz1JcXS05gxMqE/rGxtfU6+36CxWUk2sSCs8ZoA3aXEdvK+P8jQaNcYjXVWe3kRNC84k5Wic3/wProjItFQgnWWMZex4XFEvJ+W3gH11V/y/nL9JA1x8wcO3gt6gaKVDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IpOZwKVO; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IpOZwKVO"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4852ff06541so39855315e9.2
        for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 23:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773212176; x=1773816976; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RQ062ZhnCTB6E4HEjtqVPgtjYSl8H/qH4Kr1bdrYG1I=;
        b=IpOZwKVO4z9R/Gd2jhIUvwtDj+cvIfAY2r4/hBFqP/qq+L+W7vitzd66ytLwnPrG8i
         B4R25KTC0yduwtn/s4iVIZ1eBKXGuhsnhLVffT3xF7f550napy1KLfS38Y8cSqlUgWtD
         xciPF8ZUB3LPmvdg+1zm8voL+TcZ9F7ldWBkmZRka1oWmPQcHYCDKE7aTmGY9o7gLDSG
         Q0lC0Y9ZToen12Di5DNuufjRO5tufhVIM0p7/Rjzf47xEC9tjGXn4DKQ56y0rsmyDrDH
         RP77n3v+MmIl4ld4t7d1XakNlwgWuVIpWmUmAhWA/kNRREFM0gFhHXZSsnWIGtzG5eLa
         Svag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773212176; x=1773816976;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQ062ZhnCTB6E4HEjtqVPgtjYSl8H/qH4Kr1bdrYG1I=;
        b=FPrAYqiMmwAgUMiSWstSzqJ48/77OcIhP8wAldzSMTZVYiDsHjGf2UtuKgM+mCyYFY
         AS0UD6KwABZ2bcDz+FcTFmE6BZDwtN3ps5y2NfwfMhjFlDd7xJ2Zvxb58dwsFjSlR6zq
         aQV+XZURA1TDtkw9PpshO02LJjB7vcemLRZAN4qOncSMBj7aHBZoNKBUIe6buJ6L+d71
         b3zXqdI50F9m5N4bLO8JpdacYV8shasV+CD/ledkfOhsFLOWVxk8hwcJXUfZEGDEJcN8
         BgL7hs3q5ewr8stEq4mnAPCha8NsEGGL2uncrKolrST0mL8U+aBpnLh8LFb5AJ0g1czN
         fD1A==
X-Forwarded-Encrypted: i=1; AJvYcCWueXgVmsgme+vHElcSvnEf243P03zK2h/eETotVkbD3XOLlzU6rUHU4S3YxeT/t0RHXwAH9ECMb42BZqHI@lists.linux.dev
X-Gm-Message-State: AOJu0YwbpKlAiQDqzEnvSl6u9krUSZaay4t34WYQQq4hte0duIjSUgCG
	JB8+VPTAa4HXNd/H9xvO3y1+ob6Kb7g4ZfnIV28ViUbwR/uLaXAvBXEZcaYuzl8lmN8=
X-Gm-Gg: ATEYQzzPQx+OuaEY74g6cz8Y9tA4eYmLJwGAIK3g6DNJ+/S47lMoL8QI/Q2PMnqV3HE
	kz2wwcHRRHW5dLfcLm1BVHYxepC0An/f0p+V0G2qyZAUEbBGi86rJxv50mJvQY9i4k4Sku0BGrr
	/AP2z1LnkgVlnGahsM/G8cpvXDQwHPTxpczDLqf1Rgh1hCNbawgPvDq4emEpkkLdom+Q31T9Fpm
	DJhX/d4v6UNG5CY/coMZ0e1vOJ3T8N8OLHgA3DVIELEzcm7+SDuS+jhEup0FW4gLycAan2v+4Xa
	C7rg8W5QAJ4dXULbuI4dAWnnr7MueBBLP3CapkjrJkdlH8bC+2IUfe8/L+dc/wE5KErBoa0mr8J
	VRTweZy8IOBNfl7mLT0cuKqx2ebeCZPBaxOlnhDbJWKtzbCpEuxIeYMNOJmIMQhc4475DG+DhMP
	X/+xI63giZ98yCZ2zk6v1OwDmc/YHy
X-Received: by 2002:a05:600c:1f96:b0:485:3bb0:194 with SMTP id 5b1f17b1804b1-4854b129e5dmr22302105e9.35.1773212176396;
        Tue, 10 Mar 2026 23:56:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b7f406sm124192055e9.13.2026.03.10.23.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 23:56:16 -0700 (PDT)
Date: Wed, 11 Mar 2026 09:56:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 08/28] media: staging: atomisp: Remove unnecessary
 return statements in ia_css_debug.c
Message-ID: <abESDdP51XffnQnh@stanley.mountain>
References: <20260310-atomisp-remove-void-return-v2b-v3-0-3fdddab41271@yahoo.pl>
 <20260310-atomisp-remove-void-return-v2b-v3-8-3fdddab41271@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310-atomisp-remove-void-return-v2b-v3-8-3fdddab41271@yahoo.pl>

On Tue, Mar 10, 2026 at 10:39:19PM +0100, Tomasz Unger wrote:
> @@ -809,7 +803,6 @@ void ia_css_debug_print_sp_debug_state(const struct sh_css_sp_debug_state
>  
>  #if SP_DEBUG != SP_DEBUG_NONE
>  
> -	return;
>  }
>  #endif
>  

After you write your patch, then re-run checkpatch.pl -f on the file and
it will catch these extra blank lines.

regards,
dan carpenter

