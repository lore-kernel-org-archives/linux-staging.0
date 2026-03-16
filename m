Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0BC355F48
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 08:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773650347; cv=none; b=VNMBuF36tyBVbsLLKH5DxOW6dJO0QLyRNt/Tm8pWYyAa0ZzZJvNza4WBaT+POWSYbg80oh+nTTzGQW4ympZtyGo3bYgYzv5RRHoSHXz2iD3zl9+nyN1MmfN9kapwSVhdArdbLfZYw/4+MgGlOU3/X/B9evI6hXzjpVqDRAz0zOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773650347; c=relaxed/simple;
	bh=WmACGjpJUyrlIhAuLH3s37LBu5hERSx4CXAxIyHWZtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QBWMpE/tdMM3lPvmBJ3HFGnBH77VZIskIUx2uGr8KdASgs9A/AZtfCHDYjkAnM5KDgzCHGrgo1vlVR8QNtQXlITgWkWlEL6wLlyehX76rmFMINXju3hWppUS+dVtXfMDMQ/TsuEq3WhASCYG1uUBj3KPe9zGoJySJmnLFqDY4hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RAIxR9TA; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RAIxR9TA"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4852fdb36a8so51312205e9.2
        for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 01:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773650344; x=1774255144; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yEABYwNdY6HId95UN7nvcrERhrxtkbIlOTy8nffmn4E=;
        b=RAIxR9TAvkyHcIITw+YIww8e+Cj+A/8TjKPII97UZJV/5+yqDV8cOQYSUPwbPFjfia
         mv3szrxpjkxn4N+jFG5bL0v3GvYejMuD9kB9Itcnu4inBc5poBo1fHqUkNyHxelHbJP5
         Du1u6AKOqRIfvFvhHm+sK7S2dIi2rIYQIG2y4lnhFP2aMLK33hOtYtMysiZ6H6jhm/7m
         FTM8T7nsnbm3A1kXkKpsnLGmnJvHepca+elgbqKFKqZczhkONW3jSO4QrQdCyHbuPuZ8
         oRmNCJCpuP7nsFMSpsN9prPd1LbkKUkflFVjYGOSNhvqqPuWXXzRxrm29UV3IuSNPM2E
         mvnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773650344; x=1774255144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yEABYwNdY6HId95UN7nvcrERhrxtkbIlOTy8nffmn4E=;
        b=Z2dEdGn0QEDbgc03TD7XzfsFYVfa3SZ7EDPrh6jBnVHb4cUQR6ajknR9lNjCK8O+MC
         8RuTTB451VmfdXKFO6GylYiic8sdlKUy+8DwQAUGweEcT9P4Zq9CGlCDpocGnBtXPObI
         t6Llyoyfs6M18+9gw97VK/4xP6ZmzhAINlxQPC31Ls1BFyEDUbX1oce4qmZJ5JYWcCbC
         wOqhVR5s3ttOY2zXCoYSWhnqETcY/Sp5ovZLjrV4X4E8jZX0Pfk6S4+GFQWJeoEWZeO2
         G+2wxrdsIJQ2X9EJp7hFLQ+t02iDa3zwB0Gagi5uSAk4Rd624c0zKhMrpcbV58Kz/H16
         m+ig==
X-Forwarded-Encrypted: i=1; AJvYcCXY6vFsAjhSOqPuua0xk4TZrAz0SDAR3O0v7p778BHP5wDdlG/l5gdk3N+zDHSAUC9/2DLi8bskeK84jD6z@lists.linux.dev
X-Gm-Message-State: AOJu0YwV6mkT/1ZE6Yyoa8HhfLXNYTdaAYFbzm9Vb2OTJzoT4A34PeeK
	cQttg+fJxD5S9ilesfBgr9Hikl51oxFIqenvNuSlStzgqWVu/eH1GeKqnau0miEsn7I=
X-Gm-Gg: ATEYQzxMFE/FyiudQnZx9aKthWRXLxCsnwQemcR/jJvWRhVjhWIVEqRgfGEdEc90AO0
	hAJUNZM5zbA8h4gshEq5/AgQkW7mra7Ip7JmN+lqqZm9/hlK7ylQfySjWZTQC7J+Oi7WiEw2nw1
	O0FnYIrX0cYQk6mxR+SPIGRAF17hf1AA/wteqx+fAY/EkUpZEXLwM1pQFgZH759k1Z0k5ui/P3p
	7X6W71++0N/yzmy5oyoLyLxDeWogjzv+X+msviRfnfaZsan4Wh4gIfPZmGitePYDEMcCvwYf9Wp
	0k31IOBOhL/OABb4OdjfW9QswW4XsRaeaYwDhfXNXES13spDarJsdI7BL4M5jnUZWUSzgPF1ldw
	M8o5tvMlWTPkmEyaYMXazFJ4T0anAJz/Rz4otxBcPjDA2hL73fBpPxzCpUAnRCbC/0TtP8TWzPI
	fDc3mMJPmPDAKs18BZTUtV+/djmheB
X-Received: by 2002:a05:6000:4312:b0:43b:436d:782c with SMTP id ffacd0b85a97d-43b436d7ab2mr5103239f8f.4.1773650341793;
        Mon, 16 Mar 2026 01:39:01 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1abf84sm36422187f8f.14.2026.03.16.01.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 01:39:01 -0700 (PDT)
Date: Mon, 16 Mar 2026 11:38:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Omer El Idrissi <omer.e.idrissi@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: rename 'status' variable to 'ret'
 for consistency
Message-ID: <abfBov9fdPUuld1h@stanley.mountain>
References: <20260314165600.17146-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260314165600.17146-1-omer.e.idrissi@gmail.com>

On Sat, Mar 14, 2026 at 05:56:00PM +0100, Omer El Idrissi wrote:
> The kernel commonly uses 'ret', 'retval', 'err' etc. for return value
> tracking. No functional change intended beyond style and error handling
> improvement.
> 
> Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
> ---
>  drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> index d664e254912c..dbcde683789d 100644
> --- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> +++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
> @@ -345,7 +345,7 @@ static int rtw_drv_init(
>  	struct sdio_func *func,
>  	const struct sdio_device_id *id)
>  {
> -	int status = _FAIL;
> +	int ret = _FAIL;

status is actually better because these are non-standard error codes.
First fix that, then rename the variables to ret.

regards,
dan carpenter

