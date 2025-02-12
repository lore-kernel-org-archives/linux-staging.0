Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B112045A3
	for <linux-staging@lists.linux.dev>; Wed, 12 Feb 2025 07:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739345600; cv=none; b=Gd1Ce5FuTlCLeAsPynHdVvDcY3Fj1eT/Vg5dQNJi8xzpQStL6hmLVaNIkYy67moyB22e9O+Z09GDZxC8+OnKNS6Aus+OikcMBwT/LHhuhiQFKMkD2aw78wApnQiB10MgMFUHQD/hP9QLHdPChZfXG5WD6OZelEFjntSauFsvZcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739345600; c=relaxed/simple;
	bh=hYJSw/8vcXikwAiQGAZCaAebtEtzVdMa9zLS/tqsQfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RdeZjkn/SPSS6fL62McfcEFUhuBLE61W+i3ezbggQskOGdhrGuguQtXGzTthK7fx2tcQ2Xu6Mi60kHNXEW2n+tRdYSBIFwHlMqBLo4vaezN0S0OnZKG1T3ZLUq/L2Ob92uEPtT8wAn7GMkl/jwlgITlcLeF7zWOeT6AaDC8KSng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G8BkvI+N; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G8BkvI+N"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5de5a8a96abso6866567a12.3
        for <linux-staging@lists.linux.dev>; Tue, 11 Feb 2025 23:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739345597; x=1739950397; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iRzoLQjUR383Rec3XjmkK4huVUopwWO1GBDIhR8udRI=;
        b=G8BkvI+NJ6QAY405Nue1rcluwl1Z2vLp0n5kDBoswPM437Gpd4kgn/R3a2W9cCLH6K
         UMdPd1EvtiTRncjLPvaMUJGk35EG9j+ocfPv1JkINjQ9m3M52THZ4pYDun0js2MKaeJy
         TFbMedOn2FrPP0xbZ8LAX6C3hZR1moVDAYezJ56SE3U7pHZYb0gV2Gaf0u4t6PCl5Ex2
         JZf2/rTN7VK/nZr17aPHvje3Pn+CLfNIk8cSz4oYr39YAbXeplIJSMkhhQ/QV9Acc6MA
         dhH/3B++3QBnlSqRaVQkkqz6eFuTCzQK/mAz0BKXzvUtQYQ1UxI5m/TWDkTPJpxYCeMR
         cOhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739345597; x=1739950397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRzoLQjUR383Rec3XjmkK4huVUopwWO1GBDIhR8udRI=;
        b=p4cq9HPC5eqzrBwShvSVX8xG1VknqaKGKEKTt7yUlPwixbrNn2OrYhHVs6XVVmJfVN
         QmU7dghqPYPeCrYgE2oVrauU/6l9qgFcvH0FACPkUpLcou6UlxFYn5+QHJym8uIEJqvb
         HlEI4zWIkE4az0w/HJqSF9JP/tp0nZzNB5VvfOKK7cS5F9PxHJNxLyCZxS4pXpLbhQf9
         7gfl0n2LKRMtu6DmZIbTYWXC4nlqsiiHLzGZJjJFurPgnds1JeUR4xPWnQwvsyHzAUzr
         a1CxMTqnM4hRgQLe0QcOPvWc/dEmIgN1VOXBNik2CbpafxgLllMpjCRv7Sxm03/5evmp
         z1Sw==
X-Forwarded-Encrypted: i=1; AJvYcCV/4cDuRaI9I+4wm/Xe96OLErTptjBVrkbuWz/dBFjN3VddIu7UNqWZWFEYcXaYYIVNc0qd3DpbPGiPuZsS@lists.linux.dev
X-Gm-Message-State: AOJu0YzaIkQPldS9BXqPDzsv/Nt66mLd3RBR4WgERFYByJygY8d1DHUv
	cnatCZKFEAkXSaNdOFouoYG6RD1E4oL191CccTYIe6/MJscoGp+zKwuBRDwGkt0=
X-Gm-Gg: ASbGnctF4fsQu396K/fxXq4gQjdAazvL3/LgYN69gGAsn16MQPM9yM9flAxJitxfUdP
	ZkMFH+H4hzTwuUDunEU1J9kncS4//1Pt9FHw9xDbQjCS12vUIu4Glxliox+oIAkZxaHaHapRgBr
	ODZAoH81WonfbejC2CgiVzYoVJQ1vo4hwAe1/TUc1Ey8ZSCtLpFnXfIIBogo6J13x0oRplImsSm
	AYjVl1xf14lGQTgKHK8Hh4hPp1e5r7T9Xjl/z2C9fhkxSeDfhSDr/oUSJlr1Xg37aeIl5qsvIoY
	2FtBFIKBLWEKExO9EuiA
X-Google-Smtp-Source: AGHT+IHEkyu5VJUntgvHMtsslwDLby1dwnGZEm2O9JyjbaJVp2KAlFWei0TrRWLwCNwYOoR6u4aUbQ==
X-Received: by 2002:a05:6402:5250:b0:5dc:74fd:abf1 with SMTP id 4fb4d7f45d1cf-5deadd9cd42mr5209426a12.15.1739345596558;
        Tue, 11 Feb 2025 23:33:16 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ab7b30aeb7bsm696331266b.131.2025.02.11.23.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 23:33:16 -0800 (PST)
Date: Wed, 12 Feb 2025 10:33:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dima Volkovsk <s0ldw3ll@gmail.com>
Cc: marvin24@gmx.de, gregkh@linuxfoundation.org, ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: nvec: Fix pm_power_off reset condition in
 tegra_nvec_remove
Message-ID: <429e6aa2-b195-4624-a609-e1445dcbd150@stanley.mountain>
References: <20250209201752.66313-1-s0ldw3ll@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209201752.66313-1-s0ldw3ll@gmail.com>

On Sun, Feb 09, 2025 at 09:16:48PM +0100, Dima Volkovsk wrote:
> In the current implementation of tegra_nvec_remove, the pm_power_off handler
> is set to NULL without checking if it is actually set to nvec_power_off. This
> change ensures that pm_power_off is only reset if it was previously set to
> nvec_power_off, preventing unintended side effects when removing the device.
> 
> Signed-off-by: Dima Volkovsk <s0ldw3ll@gmail.com>

What everyone else said and also you forgot to add a Fixes tag.

regards,
dan carpenter

