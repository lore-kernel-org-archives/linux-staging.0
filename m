Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2AB1DE8B3
	for <linux-staging@lists.linux.dev>; Fri, 29 Aug 2025 05:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756444462; cv=none; b=bd83/q6S1hq9heEZVulxFlapxzPsRZ+aCOKzWXYfB25aF1hJPTvTwGGotYBlT7FIVdvKosPnghrSOjWfH5REauof3ipHmMDScRNTU0QSiFB+r6IwcEQoqG2b+qx1aggH26iHPzWHCTG9kzOS5XjBFCduTPVsEnNpFj30jCv5cRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756444462; c=relaxed/simple;
	bh=XvxzWgF0tVpSBEanJzBrM6B3ZbAaP+LtEnf7mGHux6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HNR+raXWa1pPNvrvcMkqzf7YxoVpdHbuFLyw6ugdayhdqFBhTivFTVWGx1CWNUzJfCbZm9f/EUh1oaKu2i4OiaCfbgy2c7j14S64u1ZBp0R8o4QM2Eg5VQXRDgtPJ4dypj+u1EKQcE9BiTPlm3Ma3Sjwbsb3jLY+EhheAuAIs6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iQ97VKUB; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iQ97VKUB"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3d0dd9c9229so52218f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 28 Aug 2025 22:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756444459; x=1757049259; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c7UODCIXZhdTmzt7aUneD9LIvgM+jweZ/BcMDAqopHc=;
        b=iQ97VKUBYvKiPeTMomtz9s4K22OfgMKeDhQqJrda1WMsA8Hq84rRLviN9t2jvUaN1z
         VfwB175wpaDOribz1Cjv41E+vb/qmwQO25F4HgrHQXhjTvxSsJmqXoV2D7mhAsuATDkM
         G6lLsrjhulbfruSE4Wp/9YGxXAF1ZqChaFOuMMMdaS+ckPdUZqFtmYAi35dbN8iaCUL7
         uJKz9xX2BJGmIyuwyasn9WD8GwZhe3aoFljiOCTyAnA6MI9QsAqbAij6tyIhunIAVPGK
         RelukvJ68fXn3Sw+NKA8QKErVuDoP1YQmO9uaMVPyi4ZaaQQdZrrbSXIlLXjMj7gWJEp
         uQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756444459; x=1757049259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7UODCIXZhdTmzt7aUneD9LIvgM+jweZ/BcMDAqopHc=;
        b=QnGy3/7VmKghBCZW7gZ8lMC2vd324oOWyXQyfQr8MjllDL2HaY8CjO66ZMjVPdibfk
         p9xZofMciRMwVFuj+7gjjFWOU1z5ALUY+adKEmk8n1P3lOMPgfbbLY1Xuaic1alsYbZL
         vGM+niQbZ0dLjTwlH3U9u1N+ZSnUkYK/NgASURKZfTXwj2+ZJMEpKsf9R0zURSRbHn7O
         hw6I+uabtvNIbQxhq9TqxJ+jruKfvE6i7p43We8VXaD46mtX2Dfw/o4wUShnabx3Ed1h
         OcLk2sQOtIzOJXMv+IDyWIGxLWqrbyioDNB3UH4IEnwrONjDuRzrAcbrSB6hEQYcH0kZ
         Qweg==
X-Forwarded-Encrypted: i=1; AJvYcCWjpX9MORMioC6bNNjwOupVUWmAAwjGAzxz5VYq37zfG7SgBoMe2JD05yQe2Tb3bV2oU1ynb1R1JqQbcs00@lists.linux.dev
X-Gm-Message-State: AOJu0Yym6NXexPGVrkYI9zz/Jx6ew6Ij0YTBhGt7GuGReG/H/ytiHgip
	swHwvyNKO1OGH+OutN88pq9v8gSYd5bIroN60tjQZchjx3K6Z6xSTNxbIbrpUS9kVygqtF8LxWR
	8cL29
X-Gm-Gg: ASbGncuQwjBQ0r5mA3ybXD2SId39jkUWE93EN4FdTZefehcaEtLBBQUD1FATOX6jsl/
	5vs2BGKeYA2Dy1moYx8uRZYSBmJjZgBiTuYVioy/IroTBd86S8v532CxfKn7fI1zp4SoHEnJAkP
	2byMTLLARIPpJOpTPlWwqBcqP5e1VJNBdbdOOddf3PHMTQIN3E5JdHiabHDrTyT7HpZJmaMOXrp
	Pcdxae21YvmbIdOMDUS2Ja23ptkaBDKrjh8kBhS09pEKdK1rUeUIXX0ub8QKHztG1Toqbu7s2uc
	ljOOr7Um6dd+zE26ScxJ1Ctvyu/zfjPWN1IL6Tz/XHGTst94HHCs42R477C6+Pva3r22dq/I7sG
	36I6m0yJ9vstx5Cd9PIq42ZsBOzE=
X-Google-Smtp-Source: AGHT+IH5pdSjboysPCn2XrxwCkBFPtLeBzZ4Q5yRET3A1gZcifDhgAPI9FpftrUsQJLw/YseU2kF2Q==
X-Received: by 2002:a05:600c:45ce:b0:459:dba8:bb7b with SMTP id 5b1f17b1804b1-45b517ad7ebmr226210555e9.13.1756444458949;
        Thu, 28 Aug 2025 22:14:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b6f0d32a2sm111769355e9.9.2025.08.28.22.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 22:14:18 -0700 (PDT)
Date: Fri, 29 Aug 2025 08:14:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: yingche <zxcv2569763104@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix fortify warnings by using
 struct_group
Message-ID: <aLE3JgL4WQW2BA5k@stanley.mountain>
References: <20250828094537.884046-1-zxcv2569763104@gmail.com>
 <20250829040906.895221-1-zxcv2569763104@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829040906.895221-1-zxcv2569763104@gmail.com>

On Fri, Aug 29, 2025 at 12:09:06PM +0800, yingche wrote:
> Fix fortify_memcpy_chk warnings in rtw_BIP_verify() and
> rtw_mgmt_xmitframe_coalesce() functions by using struct_group
> to access consecutive address fields.
> 
> Changed memcpy calls to use &hdr->addrs instead of hdr->addr1
> when copying 18 bytes (addr1 + addr2 + addr3).
> 
> This resolves 'detected read beyond size of field' warnings
> by using the proper struct_group mechanism as suggested by
> the compiler.
> 
> Signed-off-by: yingche <zxcv2569763104@gmail.com>
> 
> ---
> v2: Use sizeof() instead of magic number 18 (Dan Carpenter)

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

