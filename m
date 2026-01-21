Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466F640F8ED
	for <linux-staging@lists.linux.dev>; Wed, 21 Jan 2026 13:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769001775; cv=none; b=sNLjE9vBPCLEcJ8j4Zay045z4Ih+Y5MPJsm/2X26PvZEDuXu1aOLfKONM5OGdGwMOAGtP+2YazjBUIBsDM1pifE+0BmNeXpCtLpZ5ysvjM7lZD9fjBRsG86s6C3uFTJ+TxC12jjxl6a2J5Io8oX6OjsjjGtpvreUFBVMd8m6Ulg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769001775; c=relaxed/simple;
	bh=ZavgKeWDWFbzS7ugt3+EwFwUx0NLOnAlsk8Wzc8/CD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Whx7Y7A9BycBHLkujblth+Dtr9rW9p3yDwUuzj+qkfJiUffzAXp5cKFtQXRAWTEFAeMh3uUWe7EgD6z/+WE2mLwAC+8dUveTyfcbPjh9wXf86owzCnkz6zt4MuI9jlp+qSVcJTFKlKA3awKw9psWnqY9G6/qbwY+xoyo8IO53Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hiWsM0FW; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hiWsM0FW"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4359a302794so478694f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 21 Jan 2026 05:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769001768; x=1769606568; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ib6Jai1GIKJu0DpRL1ZJv9udL93XPA+w/9VXfQNMmzg=;
        b=hiWsM0FWXVTX5bfnLIdGwwyhZS7BtATOcqCUJzHo67XA4Rz45ht0Jw/Mfsc4siijse
         03/muUAHIk1e8eFSyG1e2rZ86QMrtklyxscOm6bDz/oW3Axv4FxrfP8NDKi3vWbhNOeJ
         N80m20ciEteg4mrIcYvtpgX1a4hLpTGa3YQRoKjWjkBhapH+rFqfvNuKCNkB7EOGx+Y/
         y0rMTtFWJb0tDCJsgQj6a10OHDY0rt3BDfGvO2kQqNo6VKM7VZTVRJRBVCgbRXY/XGTf
         gsdd3CKtFSFOhmz9S8jZ0e5oE3fs/cvulMIt+WvWpLprciFfF/MpY6B1ku3AXNOwNAqx
         7fGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769001768; x=1769606568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ib6Jai1GIKJu0DpRL1ZJv9udL93XPA+w/9VXfQNMmzg=;
        b=cAPiWSc0qz9q0wvWkwFMX9ZxgTY5xf+oTQaTt4LPd2kBtNO6b5kGum7HLO8mpL4Y/4
         GBaCZseM5Z7C67tNXRzjSgWzSUHIrM/tgnBrq9qp8WUJ2uaBSi93j/EbjIMMeHRVyJCE
         w8tLpolXYEiBsLWQKRCvKn45sdk4mHBVSPNQkQ+BTYPuJr3paZ3culElqcXwNA0WKURA
         UJoAjz97mu947PCX6/GeQXoh557cV8H2E22mDyLRMcc7BD1YTkDnOWTpkAOhq0jQuLzk
         t+g73UdJlKn8drwuNkIuBa78ZLMg1jDj+6tvNP0mh1Q+WYpnFMKMGNptWOt7OmTbNRuF
         KGzw==
X-Gm-Message-State: AOJu0YxmlB4SeBkwoc061vCQOdrWPwGSSZWOhn8JBH+kGUFddpnC+JFA
	XAAOGJbJaOt9Xuz/JGeFVdVbc3COhfBKUYkah7iFzSX7uI53+uMxpPRVjt6+Br9anw8=
X-Gm-Gg: AZuq6aJCqbk0FCsEfpSoNNUovr9l0LfgTvRfFMHZNMyvdznvTVWhvXyXEORVplqbi2o
	HRqmdr5aAbnebbSlIqAvDY+1GrLmbTtfEXRR5xJI82lEL/GaTOD08iCwcSiSkVeCcSmGzWK47tR
	npAGmA4JnDkCkTlTcfQsJVtbMgglCq0DsUHsvCWnI/gwmvTw7QUG5eCybJ27tjvWmIvh+wrTIK3
	WKsSR3Us//avH2u5ZOhyuceBm9zpb0qjdoQ6e4sX8zLj1Bc00EDqw1G4+TOblfRLz9qgXhQlQDd
	Mv8pP+DxaR6ggEmPUaDV28zE2T2konyYGiL/uUU1/p/SaYt2sTFx2suof5VZmh96S1mhuaE2y4F
	voDjd/eafjtUOAbLBhFBfuDx0p0eFOlomNb8osayBGq3y9iRModlPJ/sJdhYuXKcU5v16OSs3+C
	4CqAFfiQess3GYCu8K
X-Received: by 2002:a05:6000:184f:b0:42f:9f18:8f59 with SMTP id ffacd0b85a97d-4356a060d83mr27589585f8f.42.1769001768495;
        Wed, 21 Jan 2026 05:22:48 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43595609c8asm8914386f8f.34.2026.01.21.05.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 05:22:47 -0800 (PST)
Date: Wed, 21 Jan 2026 16:22:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: 2023060904@ycu.edu.cn
Cc: linux-staging@lists.linux.dev, gregkh@linuxfoundation.org,
	guagua210311@qq.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] rtl8723bs: Refactor continual_io_error check
Message-ID: <aXDTJIERbdMPN8-b@stanley.mountain>
References: <2026011937-snugness-movie-9e32@gregkh>
 <5A122A378F3E53A7+20260120141129.8262-1-2023060904@ycu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5A122A378F3E53A7+20260120141129.8262-1-2023060904@ycu.edu.cn>

On Tue, Jan 20, 2026 at 10:11:25PM +0800, 2023060904@ycu.edu.cn wrote:
> From: Changjun Zheng <guagua210311@qq.com>
> 
> Refactor the error count check logic to follow kernel 'single responsibility' principle:
> 1. Move the increment logic (atomic_inc) from rtw_inc_and_chk_continual_io_error() to its callers in sdio_ops_linux.c (line 226/302)
> 2. Keep only the check logic in rtw_inc_and_chk_continual_io_error() (use atomic_read to get current count)
> 
> This change addresses Greg KH's feedback to move increment to callers, while keeping atomic operations to ensure no compilation/run-time errors.
> 

There are a lot of style issues in this patch.  I also still don't
really understand why we are doing this.  Was Greg's email this one?

https://lore.kernel.org/all/2025121757-crowbar-junkman-a96a@gregkh/

I'm guessing that Greg wants you to change this to refcount_t.

regards,
dan carpenter

