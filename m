Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5153B3BE9
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 14:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633528; cv=none; b=P+Yfgmoj+1Jamadp3TIpNGf2ZLN0uEopFR3zLA07UZ3EdLb2UrHG0CYaiKMtuN0GnAbNVi4ofVbuudxfR2c1tUr4MYG4PBrnFZMcDIrvAVi9E96ZT7KjV8TsQIKs8780MYfPLl7OF9tLQvipWG2jBkJoTNzA1pvBg24aozFd/6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633528; c=relaxed/simple;
	bh=fYkYiiWDCV0YZLGuiXOMcbkzcFgkMg8u6U3v5cwfDTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J8MdhUVJ2RqqPR1DFajsqxaM7IWVHrUwoTQx0jCMcirauzwwDdBra0hec4RM4KT8zSdvD/DJ2tGzEIqABqt8JcWa8QwKxIf5+Spomh5QUtkKRR9vKljGx72NJqQ1MHgaIMIr5ZE/bt1QKjef+VnTvRkZeQ1DqZz3Tdw7J/LZets=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZHN+Y1Vv; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZHN+Y1Vv"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-483770e0b25so59129275e9.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 06:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772633526; x=1773238326; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oFvwRQT+OVcEB+x3IOoQu0A/G0gh0DEwGhj7UgsZ3lE=;
        b=ZHN+Y1VveBubKyFnHmTtIaMO6N1bEwRaNxpcV2phm6Sbm6hko1Hs1bctARFCo/vqn+
         bSmXrNPUnDVmoyusohLD/Fx12nlVBNLbzKLiJpGDXP7YA+36a2B/0AkkkPIccqibZFPa
         uwVzv3t/7FaoDzo4v2PJHK45ohakGftf+BmrJoYkPgp/DEMG7VkwKw5I9HM0atFCiL4H
         2QtQzp+9OdQu77mEpm4Y8zEBaVx3QrqaLM5fllnBv8VFt+8OoGOFx3XJVWI6Be1Omp7Z
         f13Miq73+HRtb4oZ/G6ivb89bqnxMx1sks2mpwzvlj0//ba0siGPLgOX/DrFDLunTo9s
         w+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633526; x=1773238326;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oFvwRQT+OVcEB+x3IOoQu0A/G0gh0DEwGhj7UgsZ3lE=;
        b=Xqp8uNXBCsoGy999Ik3ICkA2MQ6H8DUmTGtEILf8+PIPO4mGjU5ccDhuWUWYPRyXRm
         4IZ7EGvB+z/vAXLJdNS8dFxCDUs/nsH+oyCX2iBXILn6g5Fy7mOJSxHsbxirzTQUNMER
         gkLtlHUc3nuf/s4oy0E6+Ii8r7JhK8QIhflrLFlQoCImW+bswme6qfm2k9qYk6QzhaOd
         s4kwkRLO50HrPJ+d1wri79/uNLrPS48wTTeuN2Lw/Og1fvkRgVFMyZ0IWIqqgUKfB5m5
         tZ4dtrxEIQF3vOMT3p5tZSWOWVqKaH3cInu2PDvhBufabAa6a+/h4UN4V6vXkCuMB2Vl
         ES6w==
X-Forwarded-Encrypted: i=1; AJvYcCX/r+r9yUTM5RtwgfyMTz51dcJzunhV2diwBdHG9utDiZtJGZQvMWRAc53+F1jj3wJ82y73hPKkbz5ful8R@lists.linux.dev
X-Gm-Message-State: AOJu0YzwLe0393CMFAypOIPxYEHOaRS9IO/rg7UBIC344rrX2mOEXmIb
	kkAhpORQNAuN0x7h3Y2MGl3mZndu6q/LzgziZ8uYF1tof+1KmjQEgpUASjCGLAd9Tas=
X-Gm-Gg: ATEYQzwrbdC5pXqiiH3R5CTeQ2fG03g++c9oG4awUOpOhD2dSzw3yQtCDKCGOquNRr9
	dwHfuQbnXCXbp7Xh9UQ/rdRLhxtoM63vhP3wL7UPAN2kcKH6j/W5c8XOzA31oCWqfJ4zqKvXVrx
	dBN/atgz2vWJWUN5EtYVSNqOXG3pzLQAooqB31QQhmlsw4xF2QVRt+vQkq8e7VF9lDSreBX3UDT
	ZdDeD4yuk6SD4cablSRC/4u/pvJvQtSohsnNSRVgQyFYEbMovJNPfg7WqlFeVrNwD9gDbCA5cY3
	52PyezPWHNh1xNRra/hwYa0QaqgR85TTgC/oHLsqZbyNaDYXyzIPn+5TEFjZOSo1ZlHuzk0+xxQ
	gRCC9F7lmhnwkpyYcZEoi5pAgt3oX2HhCkFawB/9Ly7+r/DmXOmm013KUhMdqSVBYelsXVmxXqS
	cYNKxCeNVMJK2aB80Wqa/pot26Vsf9HMpPMD2qwVI=
X-Received: by 2002:a05:600c:6992:b0:485:17a7:b9c7 with SMTP id 5b1f17b1804b1-4851984fd72mr37672115e9.10.1772633525715;
        Wed, 04 Mar 2026 06:12:05 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48518807293sm51540475e9.11.2026.03.04.06.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:12:05 -0800 (PST)
Date: Wed, 4 Mar 2026 17:12:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org,
	jollys@xilinx.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] dt-bindings: misc: xlnx,axi-fifo-mm-s: fix
 interrupt-parent property
Message-ID: <aag9sgjkjQwIy7Db@stanley.mountain>
References: <ae0a95f4-8dac-4690-8810-79ad5fee7895@gmail.com>
 <0eea78fe-59ab-4ca0-9e29-d68fa298ac09@kernel.org>
 <fbb68131-03ab-460b-8d11-e4892d91807f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbb68131-03ab-460b-8d11-e4892d91807f@gmail.com>

On Wed, Mar 04, 2026 at 01:46:00PM +0100, Alexandru Hossu wrote:
> v2: Remove interrupt-parent property declaration as it is a standard
> property that does not need to be explicitly defined in the binding.
> 
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>

Please, wait a day between resends.  No need to rush.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

