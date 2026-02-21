Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448621A4F2F
	for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 10:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771668191; cv=none; b=SeoVniHVPW8uyTUpuOzR4gTeb2CZQfFZ0VkRGLNLNTR9bJ7FZU8Eny4vUjzn94nPGhOFL6mODGYbED2KXMGN/0kCrTOvBj2GhMYOWnWObX87sZ6IfnpmbCFrre6UuoZEzt5lMu1h6l6uH5fhvBxZmAKKbnRdi9atzryJYvOjcbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771668191; c=relaxed/simple;
	bh=XK5QLp3a2c3P2hJSp3xXyr4epCTVdSBF/sBEGWbtrcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eDbwwDF/+B7OQExKmoyLuw8B38Z7L6CApNM2pY3+xwlsf4zT4seLCYTQEol7r6//hKKiXqzk2bg4UVtKN1GfUdtHVqkxUeYEYZncwDvycdMh0dZ5cxswnJwLdIm0fRtzedrfpAj5bzRXtgcs/nD5rfr8Z2zi2iFV84FniGnU2c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zC4E31ss; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zC4E31ss"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-43622089851so2846091f8f.3
        for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 02:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771668189; x=1772272989; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=svU+Z2Vt8ux3qugTk0J3lgz49Xbqx4CIYmFlgYC2GFg=;
        b=zC4E31ssB9ebOoHjxd6eV2xRVo1vbG4lw4UerD3U+a2BVcLwUNsalSZ61wawpJgHIi
         4neFqds5NTiPyBYuGtywZOejkFLYMQ62D359GEnlChohKQYqO2MTJPPrUMRCa7boeUwm
         d/KxnySFin6cK/b5jmQgNutdnJy2A/3IeQzrQX83QMof00HP8RRsCkUZ6xUlkTq3kAtn
         DROodcsmSoP5+mSKPCftmjP21vtNzc3LfMu2/UbKQHUwTKSy+oNZZ989d5G2bDv+Zw68
         R0aS/umPZeQrOqsEy1puWxDYu37HNOurerLISt0oCtc3uzrfWZo8gaK0zUD+bXyTK2B5
         G7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771668189; x=1772272989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=svU+Z2Vt8ux3qugTk0J3lgz49Xbqx4CIYmFlgYC2GFg=;
        b=RnMcONVPgwGleTo2ylFHSU77EniR1nkAhSYBq++8WZEyQNA6ujp4xIQLiD07/XlHUj
         jIsFqQI6q+p3mg3I7H7hkRhxpK/NIa1wM1nZaMb29b0RBgmeVh2pn0RvXZs9OrzBucI/
         h1pbTaKkecFThET3GfaUhrMAVK/QmJPISHqQnxjyogwA5eau9RAOLw4nCbvh+amf1f4H
         7WJNdnHJc6p6S3HxaWsm2nZtdacN3rwlH0hsxyNFc8Y3Zz3B6yHe7Ed75PFIE/Rw+e3I
         wsWfHNu2k8MYAgHhyhH9SP+U2tKgPrvcLIS1WwXtGP9+46vIDd+uO5/grG79bmhWgS4r
         B4DA==
X-Forwarded-Encrypted: i=1; AJvYcCWxqQIWN1wq7bBe3v/CtKvnOUCqFqfEvNrHnVxhyTyedys23Mbh9hJFADPS5m+M959qbKYyd5qtn7zgiB7Q@lists.linux.dev
X-Gm-Message-State: AOJu0YzGXmZH8MrzA7ABXKOeykJylkxomOkPgNPMBIa/RNEx3zT077FZ
	SK57E6RWVMGI9QA6YhH8lHwx3CsHRzEIMR4EVLe97aV33u42QXhE6fTLhCyqg6W0N0U=
X-Gm-Gg: AZuq6aJXiubss+iliwkmiuPPAkue5BR81GKRYfHuR39UO9rMe2eVeovyo/ILlw9rXSf
	Ao7GWvd46ugOi99vi5TgKkxxfWQSjX4fI92rn569f3hrdYxkrBbMuyGLrJVMx6Z/f+QHlXvuv7n
	YSXtq2sWMwnUPR64tyoXqqMVz0lOQpbRO6CFy2H6zSXdMBTjWMNYe1A7tINMH8//dx39z+ZVgNO
	1TPMwva3jWoxJARGIbcGJ+xzanTv2HVOwvAo02Ctyz+garILbW08Sa0bCIZcv2cKVzziSuIOqT4
	oqmsghJXnsP91hv/uOLTSW1yZ5a4cnqT3t+A140zMtHfyO4Cd+Xf2uJouyqBp1kkVmqo5qurKRW
	vKNw1KS1ZF3/LqZs+F87uMZR+CcsNzG9rJ94jDhO4iRX6SmwOIFVQJ5vb4G/fxjg/n3Q66UJ1hK
	/JtBhWtx9nN+Unwf6vt8STBVzuM0EB
X-Received: by 2002:a05:6000:4211:b0:435:a52e:7758 with SMTP id ffacd0b85a97d-4396f18a617mr4532872f8f.57.1771668188524;
        Sat, 21 Feb 2026 02:03:08 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d54c5csm4325859f8f.38.2026.02.21.02.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 02:03:08 -0800 (PST)
Date: Sat, 21 Feb 2026 13:03:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Harpreet Saini <sainiharpreet29@yahoo.com>
Cc: Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging:iio:impedance-analyzer rename camel case text
Message-ID: <aZmC2FvCVNNw4j4Y@stanley.mountain>
References: <20260221091424.56822-1-sainiharpreet29.ref@yahoo.com>
 <20260221091424.56822-1-sainiharpreet29@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260221091424.56822-1-sainiharpreet29@yahoo.com>

On Sat, Feb 21, 2026 at 04:14:24AM -0500, Harpreet Saini wrote:
> Rename camel case text. This was reported by checkpatch.pl
> 
> Signed-off-by: Harpreet Saini <sainiharpreet29@yahoo.com>

MV are a billion mV.  milli vs mega.  The original is correct.

regards,
dan carpenter

