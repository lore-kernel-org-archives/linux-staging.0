Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795159191;
	b=yStL7ufRLo091i3dSKqBpz4IFPD9rk0CIjSqIF7Hiab/5YcJ3wT8SsKxA6WlpVva7NS4
	 VKuFYxB3Iky9oMolvuXqQToEaGcXTIS2YyLNDT43BBoEgb+pMJ5vELaLYd2EcKfzWpRUR
	 wuhh2w92g/RPsFeBZ3NY9v6Cqn0V/NWKoY9hRVmgvLnTjB5V66axYa82qkXTKT2jQ6ojb
	 n7O36byVeLddUKtWsBkTEaRThbaVIDKQ00sEOw2Xz0GKUHI8Y5yKMtDTcklfFrkWHxEub
	 oVJZG6oibxIJm2OqXjlI+f5B5+c1pylILVfmGJ46X4lobKQ3/y54sx+IZpUvDqi2A1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795159191;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Sycd09Buu7yQJo1IYkUM/pUSCHj+J4vY7dZfCNlOBp4=;
	b=aQ8pQ4MciwPUHoEBXzCtkH+jG3GFWEgaJOV+DwqnCoUvwuezGxAIkLDl68QOYpBsB3an
	 p/ZWG1QEi+FYxlo78NgIJQvAQX9sZfu8KEYLcChPQEFi8kLJDj/3CW/ffP11OyOtct2MR
	 qmzcr8Xrb28gKstY+I2JNv1daPuDRhjs4HJfDNNL3p1ex2VXGVIvdydcxtEphUcpyGvdT
	 JLJmH4YgTiWL+rkjKOz8Cew98iXe2eXNHQiZJSqam1tqCKbGTwhdonWNZymmhJSCdLhT3
	 xcxkZM6byDdXauErDvNw2Rte5j4ETQgs5mbmMG6+4EhxxYdE1mSnM3DcYN52TdYDTdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=pXiHu+cm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2608D606A325;
	Fri, 20 Nov 2026 07:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=pXiHu+cm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C2B01F000CA;
	Fri, 20 Nov 2026 07:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795159190;
	bh=Sycd09Buu7yQJo1IYkUM/pUSCHj+J4vY7dZfCNlOBp4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=pXiHu+cm6c7luq1Ox54dWkXWIvKUCsrEQUMFWox87ikkJxi3UVG6wHDytiQXvpY5h
	 0nmMEhXAcSElff19iQFMwZt1WFRhgPAtDNSV2mEfkGS6UE3/q2R6InX7IlrJ2SDvyS
	 dLJ9GMEn/PqfiWzRkbFUUIU2xx12c2NQeHJ2hBVw=
Date: Fri, 20 Nov 2026 08:19:48 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: S Tarun Kumar Lywait <tarun.k.lywait@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: octeon: Align function parameters
Message-ID: <2026112040-unshipped-muscular-6354@gregkh>
References: <20261115135413.13482-1-tarun.k.lywait@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261115135413.13482-1-tarun.k.lywait@gmail.com>

On Sun, Nov 15, 2026 at 07:24:13PM +0530, S Tarun Kumar Lywait wrote:
> Align the function parameters to the open parantheis and change the parameter "pko_command" to "pko_cmd", so that it doesn't exceed Col 100.

But this line does :(

