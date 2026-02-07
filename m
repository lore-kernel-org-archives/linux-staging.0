Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F2F22B584
	for <linux-staging@lists.linux.dev>; Sat,  7 Feb 2026 18:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770489016; cv=none; b=qMr64yZW1H6h3kCkQpqjsWUaPD6CRqmn5ZYeWqHsh6n95NHYs+7Bf6JfSoGpTt4FfWnd9AUlg0cNAuaAWxK7MdQhpfG7fOh+Je4oG7DR6THN1+n1BYFMucNkhP+/YsjndkaK3gngEy0W+hq31vk3KhoYq67VK7eyEmVksSpdGa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770489016; c=relaxed/simple;
	bh=dlkthKQRMIPEZpWvY38gRWTgff+MjXJCY7WupIrbsTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZcLKzp1x0dqw9xJPTOP4vF6TSq0cRdysBjoZQ+cvUuqsDJQr13l0Y9mcP+2r6IxvCgKfEp0uXVvoYw/oaIg7Wn9vvrd9xSMKJU/Tg57eFp953tfXWjat7RsZd3GBm6vb2WlnZtTnJBR1WY6ypREb6LSwFGhAYO1e/5pMqIRm2FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eGZONNE6; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eGZONNE6"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43591b55727so1426622f8f.3
        for <linux-staging@lists.linux.dev>; Sat, 07 Feb 2026 10:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770489014; x=1771093814; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H2e6ma/O+7GkxdFqApyuWmQdinPOZP/n23z1PelwvgY=;
        b=eGZONNE6aFwKJEmdkn6qhqU+fAYo7zDuexChRnrAKmS6Xll9a7ZM2OldoHCY8HiFFY
         OEel3AmcWIo5fmI6cUfQ92A6trzzC23ujTBHy+eokrzWMFZY8WLXWI7BnLYhvkYhWecL
         JLlslWqT6CdMaFzcALtliSYlz1akE8m3OWKhUQ1kqNFJTxJbIzsD6XbHbLePjs5pkICE
         GVDnJ5KSP1+xUE6YOJ+0vG4h6jG+aUqkSjmICDEIKJ6ZuCgALyqdqkodpQh3QnNbwJZF
         HZZ7PZ+C+NVUNlAocKoIJUrWdVgH4y7vRtARp04ZFiYYr89OCQSjXCj7TMAQ0VGouwVY
         HwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770489014; x=1771093814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H2e6ma/O+7GkxdFqApyuWmQdinPOZP/n23z1PelwvgY=;
        b=hVxpGs6FOlhMumeADBjaeOT9AE+Ppr6QzPZW8ESBjtzH6JG5vWviq8iNQcSObs/Jze
         4JVHSKMV0uHCZvzXDQ7gBR0lEiqcoGFAsyn61Qs3iGKLjQFsL0v6M2c3LU81Uv3gDY5V
         EuUVwAtZsFrVAjG170HDWy8ZtzXPIW4IAuqvNT64LMAWupP5zlDj7/BMw3gZpsKJiHP6
         HQ5qPdepRW0/ZavhOH/BBOKITcx9I5i3is4pGOMEzeKyPR6wllRZYGMnfG+4Vpug99KF
         zIPbmIw3MHu5pvVG540r4nYm56ljoGhXnTZjYtXHxRZXY7j73RVWTpjp1t92XPrZ47Wg
         pJ5g==
X-Gm-Message-State: AOJu0YyQ0Qnf5u6nCgtRMmBVJV1X+Kti0snDD3ZDcnG+JB5ZS08JjNNG
	22SO+7QkicfAmHkLbZZaoAQOPMa/kSQor+yypPQlTp0OEWO0zZNxosxvAbAKDPjlhrY=
X-Gm-Gg: AZuq6aKpXTrwrXaQE9gsXPZrtjuzzKgzVz/BFTW+4S/k4A/jsqnhhpgerwVngY6LFt3
	gnjAl/AXxuvH2O/3yAmfq792ODMEdzuOhtFj29Kn+sH2eMhapvXR3CVaqZM+IEEKlwAnp1gFshu
	Jw724xqujsbZTvqo8K0hBTQvEGlO6mAXlafuQ4XxZ8lkm+VYR8D9anPPoLoKQXMwhWroTCuJev1
	8sMy6kVHZyvsA8xVGCYqbGpFIMhqJcRll9M1TcjqWVp3PgX0Kd/xn7CV12CIkWE5Why6XBbh2Ee
	Pg0K7oAAhB3wZF1ujU5CDpGYyfzDsRciMn0vbSPYON5ZfKk4gTG9bsAinLyrVSF0QBVZdMCMU8i
	HkDBd1hTNBDQsfNXgOu/MFrnDqYx5sagvv6XnA4Y7HHpiWG6Hu8K0GUVmXGCofkTEvpt8zNDeh5
	QWAcH/B7ORg/BG
X-Received: by 2002:a05:6000:2087:b0:436:1b1:6cbb with SMTP id ffacd0b85a97d-4362933be62mr9115275f8f.7.1770489014342;
        Sat, 07 Feb 2026 10:30:14 -0800 (PST)
Received: from fedora ([46.19.136.254])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629745f7asm12693889f8f.33.2026.02.07.10.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 10:30:13 -0800 (PST)
Date: Sat, 7 Feb 2026 19:30:10 +0100
From: Filippo =?utf-8?B?TXVzY2hlcsOg?= <filippo.muschera@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: add identifier names to function
 prototypes
Message-ID: <aYeCzbrwDeIqYOLh@fedora>
References: <20260130152807.111025-1-filippo.muschera@gmail.com>
 <2026020748-audio-earthling-48d6@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026020748-audio-earthling-48d6@gregkh>

On Sat, Feb 07, 2026 at 01:44:02PM +0100, Greg KH wrote:
> - Your patch did not apply to any known trees that Greg is in control
>   of.  Possibly this is because you made it against Linus's tree, not
>   the linux-next tree, which is where all of the development for the
>   next version of the kernel is at.

Hi,

I have checked the latest staging-testing tree and I see that these changes
have already been applied by another commit.

Please disregard this patch.

Thanks, Filippo
