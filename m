Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D294923763
	for <linux-staging@lists.linux.dev>; Sun, 14 Apr 2024 12:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713096081; cv=none; b=mCAl2cMwZ17ZqMsOBvSJ/o87B0sPJZb3EfzOaLcEgsQ01UmCT8QrsWJoMvm0/hlFpwlA8koDJeODnLdelastfP3OcwRrxuPGElwtThkFy9AkaYlmyifZHIzX/qKV7ArMIVNKDwv3oHH9fX2AkaHe+eEqB+7N6qQNN/CSi4RhTfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713096081; c=relaxed/simple;
	bh=F45wyCH/yvtLsraLaFA1Cm7IOhcG0+SPVbdow795DSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W+MchHX0ClGjSpxvzb6ABghkgd4dklKf20Fx1bOE93V0yjMQkatlXc0UtPrb+PeFQagVbO+DV3bn1SPaUV35yoPqnV/ywfOleMLSjhFFFuSkJzKqZOlR+RAXx9bzmGTfgVGnBHmR4RxGgeSs+p10aU1OnB9uIuZQ1nzC6HlpLRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oqBsmnsW; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oqBsmnsW"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a524ecaf215so100777466b.2
        for <linux-staging@lists.linux.dev>; Sun, 14 Apr 2024 05:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713096078; x=1713700878; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o3xLXUr9vcEfv0klzxRfEpsHKjTa9YKhPpRmE4GTk+M=;
        b=oqBsmnsWRiRmIFC9+n18Cf08DQZrqRYiUX5dN/BzctSAfPwbmCm7Lt5EbfVZc4SGgY
         kWHFjhtQfvzkzee7CWAa2gL1igMYNv5IQePccuYwvHh2CaQwkZ+xTPqj9mzYFwgIG1wR
         3l24a7Ffw3s5SA8f+ZttZNd3S2Ku+t3TiKCOvdEmCiKAXTQKsd+aX5R/FI402Oa05Zms
         KSnhbxq8zG/SS5mkvrJW8iCkuuYfiqiFgrOQseeiKhFvyyPUxcI3RuKIBpSSRil+I8ag
         4fFbCf3y9BLFGVb/AoGoRMM2GeieSMKRLQb/xY4RJBSYA0VkNxxFrBWM8Ro5pjuNakJ7
         HO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713096078; x=1713700878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3xLXUr9vcEfv0klzxRfEpsHKjTa9YKhPpRmE4GTk+M=;
        b=Cgle0Q88FTSC9nrZC6Zb0/GvMbRR9Hk2tGt/Denfxqp2/yyPt2YNmCQa7fcXbYtjdt
         TGEaWLWsTMw1cdyzCJ3/A+SLrUFzz/4f7UVfsErFbQHX1RAFT0VFrVHvlPb8oca4hhwH
         T5ZQPJvnnne+hQt3fCFUx3do9zQpY+FrhzHxNNw2j8gV96xV3j+5CmQK0JXkSB5+Qi+y
         S4D+hKNbj4qqbtmrmgXAayhNU6IL194tTT1oFF+dwRqTkPZvMt26B/XBS+JNWPkp+kr2
         5WICiKKk8j40hcA1ASzHlb3u5PwySVsTWXKIHDo26u20vrnYQTgEzICTo5eI9EwFAxb4
         LSwA==
X-Forwarded-Encrypted: i=1; AJvYcCWhO/lArnzNnfrZgrWd5BKiO3gwqDDLSMwCyTBfZNQuV2Pbqqk6OOldwoJHmiWByhcJq+wjFQptA4HmKOSc5//ZnLxN8JlnULaMaN6LyQ==
X-Gm-Message-State: AOJu0YzF9PRbhTxu/HVnoSahuMYMH1QFfWUZD5LhLBdV8I5+aeoP662W
	Qe8PkfnGoGw1Ks3RjUMopuPa9T7UXDnQAGbLw+Z0SefgYtg1byUiUhsiEF9l/ks=
X-Google-Smtp-Source: AGHT+IE4l8NuWRi3LGRbcaEm/pf7jfykdhFqopERDMjXIqAiTZanPEmTOGy0Y2lumPxAHYbI1bGh5g==
X-Received: by 2002:a17:907:72d6:b0:a46:f9c2:f059 with SMTP id du22-20020a17090772d600b00a46f9c2f059mr6026141ejc.22.1713096078015;
        Sun, 14 Apr 2024 05:01:18 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id gf15-20020a170906e20f00b00a46d2e9fd73sm4118761ejb.222.2024.04.14.05.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Apr 2024 05:01:17 -0700 (PDT)
Date: Sun, 14 Apr 2024 15:01:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: sumadhura kalyan <opensourcecond@gmail.com>
Cc: florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	gregkh@linuxfoundation.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: vc04_services: Reformatted code according to
 Kernel Documents.
Message-ID: <a3c1d471-849b-4d4d-8657-4ad73493fca2@moroto.mountain>
References: <20240414115106.105946-1-opensourcecond@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414115106.105946-1-opensourcecond@gmail.com>

The subject is too vague.

On Sun, Apr 14, 2024 at 05:21:06PM +0530, sumadhura kalyan wrote:
> Issue found by checkpatch
  ^^^^^^^^^^^^^^^^^^^^^^^^^
What issue?

A better commit message would be:

==================
Subject: [PATCH v3] staging: vc04_services: re-align function parameters

Checkpatch complains that:

CHECK: Lines should not end with a '('
#45: FILE: drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h:45:
+typedef void (*vchiq_mmal_buffer_cb)(

Re-align the function parameters to make checkpatch happy.
================

> 
> Signed-off-by: sumadhura kalyan <opensourcecond@gmail.com>
                 ^         ^
You should make these capital letters...  It's supposed to look formal
like you're signing a legal document.

regards,
dan carpenter

