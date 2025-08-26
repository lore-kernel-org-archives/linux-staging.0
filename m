Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53DC29B20D
	for <linux-staging@lists.linux.dev>; Tue, 26 Aug 2025 12:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756211790; cv=none; b=cv93DiIiLV99U3wW+W+BPmhnCBhlZuLDJGx4dLC/fJCziVN+6ImsKwszK57Ky16hfSxx/+dWtxxDctj4R5aNzCYJ/8VNxtK8f1He2ALlekh8E8eLwBLjM1mXVbxoqmV9O3/XcjQW7wfMtwGg+DvEEOv4JZD1cZiS1Y06pcVg9NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756211790; c=relaxed/simple;
	bh=GG0OZ6GLiRlZltpTWxyq0wPNaZPep3i36UPYib9zmGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=izRUZI6Dc0pZ6HpnJ+vLIbRlh4eHsAi3J3+WRdrKzmNvZWZcR2DZDIcFE65xMvu4g+ZcXtFE7aQhPWGwX1y4qeNs8dIK3zWCop5z7k97Y4GIDl6HYlk8xqTWoymLCaEya9rmnPvBImM415IkHqje2xSVW7CYuXPBNmiV+UFx/H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bq4f35fY; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bq4f35fY"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45b618b7d33so16696225e9.1
        for <linux-staging@lists.linux.dev>; Tue, 26 Aug 2025 05:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756211786; x=1756816586; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gBeiE9LNukLMGwDkFXIG3w4fI05jvJOIyYobYgQIygk=;
        b=bq4f35fYWzKHLNSgIHJagQdi9ro+MJVUS5Vywj5+wPHNOXzQoB3WUAJArttcsqv58W
         QFJZd139xe0ngSbKn4K63FSntShEtHvYG6VFOdSW7tueOnER35njEe0qFI+U4cJp02i8
         ZeZ19ibLgLAbsEmrJFFLseTEY4ew9X5cycCa1pnFSsa2aR8KV2/qQIC8XzLzGcz/8ZxJ
         +rW6Gx7mLy6rS2YHcjR43VKYU+BsiObo+AISwSQZtySs9tnZXUfT7srSERsvesIh5W4l
         pTinoT3NjXo646PW7LUJx3GVc6MHIt45J+AGxSbUKMdHk+9+vS7GyskBDYfEgRmQdQUm
         9Liw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756211786; x=1756816586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBeiE9LNukLMGwDkFXIG3w4fI05jvJOIyYobYgQIygk=;
        b=hSrqoBKwhGo/KXI8PAfexzQT/3wDMQlIvj3Jah5fedznTEiwOYOYuB7Sva+LNVWNc5
         TKX5Hy9ZknsQkN10i5DbAO3gS6IJ2ymh+Mm+R8xyB6lUrp6LN/AnCOkRDUbe9MkxHU/C
         lt6N3sLAOwcZbP2rmTEZhh9ibdhdCPJ8/rDpso+knT3Lcbp5xijPQU7wVLacpHAtQ+BB
         V7aodXPGsCW/YVAMfI+1yciix9P8QJn1bSia7jml6O5pGTCyh2crtlyEhm9uzrsn8EpJ
         OYBET2st49ZgfJSsBazuvRhCA6KXcnQ/mjCq0Wm4f+u4e27PDgiNQqCVRRoFdXBB174Z
         G5Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUz1ICIo7Uv9nPQAXtquwy1+V7OM6F6r2/YN9YrhjfwdMsadvcWvFEBqQfj8Ic8JGuGnzOj4q/JaFjHt9J1@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9xlfzLWil4LpeiSngvUA1xHSzsZ9nXdtVg+ZNpDEq6BWZmZfD
	5miyxVTY3XgvhUbdGcYeEgHx2wSJy1doTFVt37JfXtczdsqaditWvSnLfon0RIFM74w=
X-Gm-Gg: ASbGnctkhfoUodT5AKmKj4Zk1/Xu6iIya/dL219nVLvJnmdPYBPaoHH6P+qTICaRSGK
	0STwHrCE5jh0uzYUwHCAy+fyFXhydw6Fxx/yl6GX9bWF2GLxv36PMitNC/GI7AlUQdHzcxyQXmk
	txRYTi/Yte5N0LEjPRw3hlHm6uM+8RFS/gx6Lp6TpYv/vj3m02n+MsyE3BZlrPaCBwJCJTGQpej
	e1DPa5UZkqsmnp307+3niSr/gBgblSZ9fEfuM8rSXJsYPcHU8NRszzOGtj2Uog45wo2ouMuru9b
	ToQfo0Ncfa5rlhJ1CeXw93uIV6Bu/C9TtQMwrd52TnMySfrn/H/Ebz3jRiNq5erkMeWlzdGXwkb
	2qPovVTPjq702Pdsgw+B4PgVoYmEy9Tu9e1E3vA==
X-Google-Smtp-Source: AGHT+IHMe18dV7JNEUnQGXIlUU6xJmQSIHVCHST1ZqMCllJ6NRHrhQ+rT4IdFNx8d/Wdk/LNZf+F8w==
X-Received: by 2002:a05:6000:240e:b0:3c8:89e9:6aa7 with SMTP id ffacd0b85a97d-3c889e96e2fmr7372053f8f.2.1756211785879;
        Tue, 26 Aug 2025 05:36:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c7116e1478sm16017950f8f.46.2025.08.26.05.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 05:36:25 -0700 (PDT)
Date: Tue, 26 Aug 2025 15:36:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Rubin <matchstick@neverthere.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: gpib: use int type to store negative error
 codes
Message-ID: <aK2qRRoXViUS-0HL@stanley.mountain>
References: <20250826123208.300145-1-rongqianfeng@vivo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250826123208.300145-1-rongqianfeng@vivo.com>

On Tue, Aug 26, 2025 at 08:32:01PM +0800, Qianfeng Rong wrote:
> The "ret" variable is used to store the return from bb_write() returns
> either zero on success or negative error codes on failure.  Storing the
> error codes in size_t which is an unsigned long, doesn't cause an issue
> at runtime but it's ugly as pants.  Change "ret" from size_t to int
> type.  No effect on runtime.
> 
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> ---
> v2: Modified commit message as suggested by Dan.

Awesome.  Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

