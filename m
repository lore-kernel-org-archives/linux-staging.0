Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CFB1EFF8E
	for <linux-staging@lists.linux.dev>; Tue, 18 Feb 2025 19:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739905758; cv=none; b=nSw3MHgaDS6zMdKfrPB69rWNkZQQDX2dg0Hx/yyAQ9zxE3CR3scE0FX3stPENemS1Sehjcq4vRmCx+7VXH8zQu1Dnfrkz2mjNAeFRBZ91EaTfWGDqTIXbw1Yl39+ztJX9DXaA4WeYxknbM7eQ16JA5VRLGgIV3n+mdpcB0JtO0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739905758; c=relaxed/simple;
	bh=vtkAZPDRpeVOssKKtc3/ZBtyBpcNLoSSRXvVxehsrIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LDYZDBOK+94ADU6NzWGuYICzV/W7SVft3giqf8wYdKmjs6osZZ06nfxyQe4tk6vUrUSYeyWd01E12Fg2+g1MYjDiow8Hamn5qsQaZPzvJods3a9iOQwatUVPCaA13/y3bx2CLWgen5dZpVg6XMnom+CveICewX9UtfTamuFBLko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y1dDcPXu; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y1dDcPXu"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aaedd529ba1so688245266b.1
        for <linux-staging@lists.linux.dev>; Tue, 18 Feb 2025 11:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739905753; x=1740510553; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xsPSNeOLOsrs5K++JmVDCL05j90mUH/WwZrpY1dTXqk=;
        b=Y1dDcPXugqSZswGugiPWHuEP7NpVxeSx+QsATaZsNM41uVHT6lzhzDdYngusTeqdeo
         /op4MUGfMEzLwfKwdm0bX+aRxgC2+gb6qlQucKBdk2V88+BeZwLoo/XViXiRSt2d+q0/
         Vi1cPkmK504JfBjQy1Opyf2gUJ4msXc895jQcRFgcCaP/KYZNkUHwu3dWfQodyrE50j2
         H60E1c/I9+BV979GYLc1Q2aeHwg6rVm1ABwpoz5dX+/kQwDXVUFAudJNvIQBNR2rOvsv
         iKOEzUHU3fgipjyShBKK/s5k1z66mXJyeV/uNPtS45b+8UtP++Bz66z65/4MVLLNvLVk
         U6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739905753; x=1740510553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xsPSNeOLOsrs5K++JmVDCL05j90mUH/WwZrpY1dTXqk=;
        b=kJ3hdlKteE9Z+FpZ4vENP4zyl4/GhtlBHVp7iiAYWQkYZLepiBzKgFP6UKcUoXpgoi
         UrbP5Ls3bH3YTYk4GByK6jnLS/v8R1yKS/KOUseA6cnbuopaxJeNBYOQQiIypwUBB3rb
         HSBzodV/3IsN+joUbmFbSa6GfUITjYXJ7xUJPW5/Ik+jvve9y7ugOtD2PW5p8aLE8HEk
         eDQSHoF9JY050S8UIeueADQmSXz+THIZE1woYj1eOB4E4DzeKOTJbE9bWCKtviVLf6Xj
         x/Pgbz5+SYhaW4oOhH4Zlj0jGa/qrAtKlMFR+2AHglhveaODb7REGKdSFNc/hMKTrL5R
         Rigg==
X-Forwarded-Encrypted: i=1; AJvYcCUZpCL7So/ffzIWfcnQ4ImiaIi4WikeYIIqz+R69VqIA84XzkK9fENpao6J3NT0vnQM0jajtT/8cO03a15e@lists.linux.dev
X-Gm-Message-State: AOJu0YxHEyUoqrt9zNRI8526BWuTfjoVkg4YSBb71DkF8cCMLf7hfVbz
	dH1GaGhHS/R0vkx0fYzaNVVYBfwVA02VbO0okGwfuK002bFqk/vZ48gMOzsyidw=
X-Gm-Gg: ASbGncuRZbaDRg9NreOQOJXfHMn6ifbRHLB261USxMPsyxeNJcLXIVyUjdramtS0T4F
	SPhE6NghLgrHXE41rLN9gFLKjNWHALnvyaa2Cqlh7/mMUp/S797KSLc0chRwE0SX5+pwWi3UouW
	z0sY7FyyqGkAMU2+QJoDUEneLHolK5mEmrE/ENAXHFJzydtBI7CV+1IeLqq+PtTpzTOQ7E+JJh7
	QyqegE3ac4cpDnIfUhqH4CgW5bViwJO4BJ14sXDpDLhmKebxNmzj6+XaPT42ZtgrItS4n1lqlFI
	q4UHbUc9eHGwajtkgHtA
X-Google-Smtp-Source: AGHT+IECzgx+wcz5EbHNUv+RuNV/8qTPAQ4z0nfTNLzDceNq6d1mjgLqh6ZvP2PHnq3FwjFOEYPEyw==
X-Received: by 2002:a05:6402:42cc:b0:5de:4a8b:4c9c with SMTP id 4fb4d7f45d1cf-5e03618aa7emr37791483a12.32.1739905752903;
        Tue, 18 Feb 2025 11:09:12 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5dece1d369esm9063291a12.37.2025.02.18.11.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 11:09:12 -0800 (PST)
Date: Tue, 18 Feb 2025 22:09:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Madhur Kumar <madhurkumar004@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: sm750fb: Remove unnecessary volatile
 qualifiers from the file
Message-ID: <fc80577a-2dfc-467f-bb92-db9e0cc7151c@stanley.mountain>
References: <20250218185749.22144-3-madhurkumar004@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218185749.22144-3-madhurkumar004@gmail.com>

On Wed, Feb 19, 2025 at 12:27:48AM +0530, Madhur Kumar wrote:
> Signed-off-by: Madhur Kumar <madhurkumar004@gmail.com>
> ---

No commit message.  No v2.  Etc.

regards,
dan carpenter

