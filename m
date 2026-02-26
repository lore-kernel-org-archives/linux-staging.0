Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CF538F92F
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 08:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772092814; cv=none; b=ZMKBbOrwVDgYPyiQR9FrDCzUqfk8WuK5OUYA5mgHfHS5bYOxMZQmF5TWCleLyvP62xrawP3JM9OSAcIAm2bty7wE80R1vRe0fNyqABHuOEOIkOS/lT5293t89G2csd0mvh+HTgIQdbULFaDldEzLZ2Xq++ovcajwAfFH9Rv64RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772092814; c=relaxed/simple;
	bh=Cs2HOWVMSl0LT0MUkOnTph/1WtHB6lPLfpy1IpPXD0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b2udiQW7bpaoG4Q+eZOrHhv+cS+HCew5TwtlKWyDwABzAdcqHA3n8aDjmsn7zz3aob3CmM48cM2MFFWGEN0bvWFnkNWbCwSL/DqtO4sKIJEabn743PS4LAPM73cqLaVhJS31sPaL8RsbLQir5eKfYTfQ7hSV5+XEmuEoA2Hzs1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vIje4ipQ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vIje4ipQ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48069a48629so5763525e9.0
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 00:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772092811; x=1772697611; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DhhLSJx/NkkogoubBZaHI7OfYKzmGyTd4xSdN54lguo=;
        b=vIje4ipQl6Kygwgqg5zPXIdGzbQyJX1ZkLth820SVAVKPL+9XFKs1HrBOlaBogd0D5
         sZQoM1YOTLgjYdw9EUpPm0vT+GU4lyNqGHvyUEvx7LEHkdpufuvG0Zab/KNCXWtbkLjC
         +I+KF39e2soA5c1gN8I3QRCwjvtsecsXEvLEl0TwflhWVBH6JLTBL3VQBiXDjI8BafMP
         ULvYxtns4uFx8s2uIUCzu+n8/2qVQG2q3mqtTXORwmjnizKfjf1SCUkfMocdB4Yy+Y/i
         B4k0pl9zhKwtvBeebcr3c9LgXJwBt+2UGPliMMz8PvGo3H065Hyc893nkSqSEN34tJuQ
         VzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772092811; x=1772697611;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DhhLSJx/NkkogoubBZaHI7OfYKzmGyTd4xSdN54lguo=;
        b=fuYdH20mwNGOPSKHThGv+DZzlkCVJr74IrtNXbq1h+kRG/l8FRW5pd9q2vrIpZ6wWt
         AihMd45/LpMLJ6xwlrz9PLK4Z0CjBEV8kk9jCYLtN2QE7JWS7ttHl9HwoV2SRWKIC5/B
         lW+OqUDJf9EEqBQlcGhAytcMrvhafd9UqXsQ/JclK+1NRl2QOHZardDnbeJPQgtrk1AK
         YGPbXq/EHTQReTdnappVNLRKcMzE4wsxSgyBUh3cDnB2UNsU+gxkEpe0OqTSasTRTHFp
         hLt950wHFe+4AqOC1NccFGEHNHOBnQkgM0psMukRq3OcSncrQmxWj6lmz45cyH4pMaxt
         gyrA==
X-Forwarded-Encrypted: i=1; AJvYcCVOSSUq/3oKTKF5G7e2soRnMD5zRYfKe8JX4L4MCl3gNK00K/WXi8K+btPydQaLr+GV3+fhavUFW39BeMEq@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5Cu0iRJQ8/smh5RCsUJTmLpuHn0dJl3GQa8FqS3ObcfN5KztP
	8YqMEqJogHSf44PewEPFo7o3hVQVzpmdKzEGuuK3nQT+4yq7fTbZ5KlAPXPKPyKH9OQ=
X-Gm-Gg: ATEYQzxnOfh3fBTx4cXgHfgjO+G4SAmX/kJCMT8ZP4qtB2itSCDrAp/U+iJqSCTmwTn
	myIriUlrkoV7Ah9OIVT2xz1doWhVypyWq01NrfCE+rd2mn6cOslAlFUgFlyhn8AwZZAHGszSsvY
	EZmwjacb5BkCF5aWJkKXMRP/7IqaOU+BtCIAFUL76SRSlBuRweH9Ri/z4lUa0HT/uwMprznnJy0
	FwhihXtFHwcW88Sie7l5sXaW75pWO6PiPuLczM+b+N5vMxfKFq5dtwGu3ExsXiihZvXD7W3PPhR
	VYagyFDOmnB8GnUCC9xTblQpSMMV1Yo+RNXVhxpNmqPbNBfOoxcr+bVhK2jJu/hzP83bTj7xffZ
	j7WLSyEHAgxJg633MBURcng5EEJtY7287Pnk9mmNnxDkxfMQHrSD9Ld9XwauP7ItonEba/xyTHy
	ULOB7Lr88Kou4JlvEapewgkgp7OW1y
X-Received: by 2002:a05:6000:310b:b0:437:66bf:a9d4 with SMTP id ffacd0b85a97d-4396f17cc72mr32819273f8f.37.1772092811208;
        Thu, 26 Feb 2026 00:00:11 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43992ced321sm7296891f8f.35.2026.02.26.00.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 00:00:10 -0800 (PST)
Date: Thu, 26 Feb 2026 11:00:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ruslan Valiyev <linuxoid@gmail.com>
Cc: Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: greybus: arche: use sysfs_emit() instead of
 sprintf()
Message-ID: <aZ_9h0TFQwg48amY@stanley.mountain>
References: <20260225212955.57102-1-linuxoid@gmail.com>
 <20260226074858.67635-1-linuxoid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226074858.67635-1-linuxoid@gmail.com>

On Thu, Feb 26, 2026 at 07:48:58AM +0000, Ruslan Valiyev wrote:
> Replace sprintf() with sysfs_emit() in state_show() sysfs attribute
> callbacks in arche-platform.c and arche-apb-ctrl.c.
> 
> Checkpatch complains about code using sprintf(). This code here is
> obviously safe as-is, but it would be more appropriate to use
> sysfs_emit().
> 
> Signed-off-by: Ruslan Valiyev <linuxoid@gmail.com>
> ---

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

