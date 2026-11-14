Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794632542;
	b=AXzFB3bkL8hNIcpPr1lnIBvmsQmM5yKK7nB+aNkDfvyAH6azP3GlIH0HHUR2JseY/5DA
	 ZVNt+kWYIYwO1r7yNAmbGTGukAVaUrNES6U+8lBJdWfqk8GwzbHCvQZMR7dYtwRUI4uRN
	 8NySc53/v5xdCkrwa49Qo4l8lrjoJknmN+r5Y7GX+ICFSal9n5UH5QvuTRYdOJTY2WTR3
	 iARz/5WUoRGIScjXcGMk4hllagZby9cyZRv0V+B+04RCVW20gEaKFKC+/AYfhE++nyf4s
	 WzyXhvJvoyncOn2wQP2Z5jvCv5ftAEMznZ6Tzv0a+bqwUARsv8xvGaJycytpMftsE2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794632542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=lwHO5y1yVOzdcwLx30M+MdDMtIY8PDavuYBpBXrs2UA=;
	b=GWG/hEk2RxXIlDS+EV576I0vxYXiEJRqDS4fsCv+be8oNdOI6jeAf7t3Jo4qiq5AJV1E
	 RXQudhp3L5+TP+Gb0pa1NrYKKpXbVFflyBWGK2FT9Qz7M9hkLas7HYQf24mZIn4JKv1Hf
	 yzpFug15b5TVrvda1IZxNRVJPhzv0mxWQOw9viKZETCvQUFeV89/RGmq0TORwNXlAsr4j
	 OHP8b2t7Dc06epWEBao4lDoveeNbrSfDwhF+pALim99xT78hrRqwMUp/tDXiPdpUoBVE5
	 aQJfy34ZNahT5unQ0Qw7OddZy+z5FrHMU9zNcYoGjFdeEux5Av1KYm0mdT3nWrpUpAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PEPB6FLf;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AE7606A33B
	for <linux-staging@lists.linux.dev>; Sat, 14 Nov 2026 05:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7AE7606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PEPB6FLf
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso294555e9.0
        for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 21:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794632540; x=1795237340; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lwHO5y1yVOzdcwLx30M+MdDMtIY8PDavuYBpBXrs2UA=;
        b=PEPB6FLf+BbWSQjUtzfRbTAezwKoaILcRct5fBgSoMglvxN7rBDEMuyzRJa/DgA0eH
         K+VZCn5gPaMChCR5WivG1a86qJDIS5PFZxFjod6LlvtPUPPlYYMsPnEw7dYNHTa2+8QN
         UPjaKN/xMmxdkhcRpJq5Tsm5l5bXKu/Afruz/JpGPv2J2SGYyFVNKqGC4Kk1kuRb5mFY
         ECHf+iZEtYI3XpiknfyXsyw6ZTkR6thFg5pXdHYDpqmbh23Bk3ehGKrqWuCnBgppSwtO
         14g1RT2QoVPHUdYUo8SKdKJIClIYSxNFNbt3nNmSZh0CsOyBl/DVw9hNEZyPvOFRTY3v
         fxqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794632540; x=1795237340;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lwHO5y1yVOzdcwLx30M+MdDMtIY8PDavuYBpBXrs2UA=;
        b=uII0XYev+S2peMJT30/gTdIK0M/FxiIHLs0YVixg4pOyGX18I5m+KkiQ7jzYtGdj2U
         A/Z0sP2b+FtaGO/rH8vPQONt4Hq1JpOQ4X0sQ+cviK9ZX7GZXbEV7aogWb4Gww0D9xsb
         Dn7XNxr+FWaPZ0Db2aGtMGxBsW+D7UXtKHBDXzhJM0dA0FYJMeBpNFu5LVb6ix2Sw57m
         UDZXzdQcHvTtBWK3F2xieqQcTsP1CZQHX5ALzBiRf+Rk/mczZ1R2ctifX1oO5WEBWFcY
         7X0UiRqFWmv2RBPazgqG7YR+91MQGq/qOVY6/ZTOuuHYycR7wxSviU6cEMarhwPpwpJO
         uAeA==
X-Forwarded-Encrypted: i=1; AL+hErHJNsq6eZocXzXF1/SOwSGxUkd0rOoMuWYwyfVrQNq+1DP7JNcuWx472/x+hzSjgn2Rb1vzbWMGuy2GbObB@lists.linux.dev
X-Gm-Message-State: APuU4Z9i+OfCG9Yim3VR8oqdI4+MJ/6r2IvJooWFDdE3iDRbSkM6OrDy
	2j+5qkIzBU7OQCBvAqmL4BdtoV4lVjxCbQxZbBCenNp6PHm7m4xcQODt
X-Gm-Gg: AYBFou1FVF7y0++UxIHRE2ukNDtrrFotzv4oglVwGBuBFPxm3sVGH+PCBJsHrZnvagB
	Yesb9YNWiTkMljXgSkum3Rrndtt00Kj0IuHQV8uNDjS881+TwY/On8tbJSB8nDEGptbIB+cGbiw
	2PQIvkuOYuCj24d7kklfRznpscgxbC1AX0tKiHTaiMrmEw6ijulo9gHk+F2e2zRsmlvp8KWDS1f
	oBmfGzBYTURffeq86DxEwqXKXbTESswwt7ICIq+Z1zbXo10Qi+eJiHfrp6JDhX/MA9YKolIgzTL
	jJOoHITSAXScEGGb3o/v+w8KiHF6JEKQzKHADVL1+dYI1bNn33Sp6hkLjhqOKL3gaoZBa5RgWTz
	gsB+0A7YUkBIcvAVLJQqVCiCcTctC9wWiRsuNYPduUHLXr0epXSsD/oWx+cBnuk57eG14g1Jm5s
	Ff265CUigh2QFFdWmq7UXb0Un1v2z5mfv6P8gxWeF6QG635f8NkEjuEpwWu7os6tjdxIURA7GkO
	Z++3JcRZodZaWf3dJbBq1vdOk5R/B/30JYH3gWLsUms0RxhQ4H3yoJvwLIRZR8M6yH8r12z1atW
	ktUkl+zsLlmZla33nT04Z6uUzU+nsjTrSxQvUGtHlKdNN1Ro4v+ZWQxxXMxLoZn2sm6zw2xwm0b
	quGupk0mrnd6GGhHqQQl7mAh45L+QT5O1APV+Zso84DAlH939mUimk3cVlnIUKdq8ilY=
X-Received: by 2002:a05:600c:8903:b0:4a2:1104:7ca7 with SMTP id 5b1f17b1804b1-4bb4e2e9c80mr157513265e9.11.1794632540081;
        Fri, 13 Nov 2026 21:02:20 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d22394esm9298512f8f.3.2026.11.13.21.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 21:02:19 -0800 (PST)
Date: Sat, 14 Nov 2026 08:02:15 +0300
From: Dan Carpenter <error27@gmail.com>
To: Rishiraj Rajgor <rishirajrajgor@gmail.com>
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
	elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio_manager: add newline to
 sysfs_emit formats
Message-ID: <avfrV0bQO3nvDkbH@stanley.mountain>
References: <20261113130324.34353-1-rishirajrajgor@gmail.com>
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
In-Reply-To: <20261113130324.34353-1-rishirajrajgor@gmail.com>

On Fri, Nov 13, 2026 at 06:33:24PM +0530, Rishiraj Rajgor wrote:
> According to sysfs guidelines and checkpatch SYSFS_EMIT rule, sysfs
> show functions should terminate outputs with a newline. The show
> functions in audio_manager_module.c omit the newline character from
> their sysfs_emit() format strings.
> 
> Add a terminating newline to all sysfs_emit() format strings in
> gb_audio_module_*_show() functions.
> 
> Signed-off-by: Rishiraj Rajgor <rishirajrajgor@gmail.com>
> ---

No, see the mail archives for why.

regards,
dan carpenter

