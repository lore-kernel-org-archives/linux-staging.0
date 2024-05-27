Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BBD16415
	for <linux-staging@lists.linux.dev>; Mon, 27 May 2024 07:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716793589; cv=none; b=l4Eu3jEfPueRGPixtGXNRUQWvUxsIc8QQ2XLQENyz1EIMdE1o5ynUKWD9/LUjDXwBE4YTVolUHqCP7IinxrymR88AOLDSFQBxyw+jo2htgRL6BHMiRUmE9Kls5+KGS1T0PK5EBYTAxypddyjYbTa1SlKMDWiYi3NS3ma2ym9RQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716793589; c=relaxed/simple;
	bh=vD/fI/si68FnOskGxoweJMK9vp7Gw+FaLiLMBcj+XIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MZ3kE/RgyKuzx7KIhAXpvTXNg6k/XaJRQQ4vIXey1YQ62I5q6xiCymgl2XaJFk9hNP+ur6SaAhGfgSjUJvkh517POdNKNM49UAzfqO+/D8kLoud2NxoM63UUAyGA2bvG+XnBZlXHZ8PnKuxyMmF0EtPSZYlOl29c4AI+qEBnK/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sa7lNCi8; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sa7lNCi8"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a59a352bbd9so894833066b.1
        for <linux-staging@lists.linux.dev>; Mon, 27 May 2024 00:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716793586; x=1717398386; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9iiWAsBL4sUAAyXN1wW7ThRR/ve5l1Ot65zaK9TenVg=;
        b=Sa7lNCi8iNqtVzzVBphtVzXL0WD2/x2odh28axoL2n74iOj8gycPzYshucEjlU2svB
         5s3AMPlrtGCnGttvclJZ0acoBq05JZG8f3U/6BJ0D3/Vllz9TmiMf2eYreAyqxSpT5lD
         ABMxlhH2iTIJEd4uEuAZ+991yxOXsBfqKhkVFFABEJQOpniUBHbdplirs50BlmdMV/WR
         I9c/F/r+jwl81g5HN5D1SBwhTppE+psbBTPIKLW7U5U8yNwEPAwNyGVeb+kKFHpzLkuU
         Yt3sJIkFPARuHj85Tmy4hVpvLfC+VstPOuqG0A4bIrHOfBzZzGKHXDGqc/Ftvg4rhfoC
         1Kbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716793586; x=1717398386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9iiWAsBL4sUAAyXN1wW7ThRR/ve5l1Ot65zaK9TenVg=;
        b=SbGsdsvDw2/vrATLJ2/L8aLS+p/AlD2JxEIiMrm3enuMJhY3D+o2VTWp0I/8Egdg92
         CKIAvEEVkti1fRlaH+V/wNP1ZgyNYtT2twA+dS7d5sPcsplWrZwvU7MW9VIpW2OA6b59
         SLUCb9+JHXBkW2Ay12Q+DfwCA0QYzDIrODTmD0+HSncGYL5P5HT7NgfYSRDeykEwBKIG
         8VfmEiZObwu8nl9FY6WhJ25pjTxNMxpvsFeLqLnokONbW1YP8mUixt1colVfAXukXe8S
         7RSz5pnUXap4SrlXrqrmknaIjjMudRm/48ieECKEAV6V2Uh5tsWmwwFv7OMGReKAkRnt
         zBiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlCLRx8jM4Rcc0g5cEHOvIyY2eRRAQv3y2UPEd70VswjqGM2JmzVe90KEubluOuxiWyYz56WL87GFHnFy+xXpYk9eBMpkazAiU8IYU7A==
X-Gm-Message-State: AOJu0YxbEfO2tEbksv1rwSEVD1M3hzSiyQ/0fe8FRAbsFk9ziqNbGtKJ
	/1Vqg5F0W6Pf6s03ihCfsbyj+7zJinQ6ib8VTzeIfx/kwHwHMpwReEJWlxBDJTSTZUdXejnw/sO
	J
X-Google-Smtp-Source: AGHT+IHyaeq4wv1RvLBXozqFAsVhATzJUUONek4ppAnjG7f+qKPIvRzF6NbSHVgqGiOXrsqQqZ6oKw==
X-Received: by 2002:a17:906:459:b0:a5a:8896:73de with SMTP id a640c23a62f3a-a623e9d51f2mr923081066b.26.1716793586266;
        Mon, 27 May 2024 00:06:26 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc514f4sm457491966b.108.2024.05.27.00.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 00:06:26 -0700 (PDT)
Date: Mon, 27 May 2024 10:06:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nam Cao <namcao@linutronix.de>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	syzbot+83763e624cfec6b462cb@syzkaller.appspotmail.com
Subject: Re: [PATCH] staging: rtl8712: remove unnecessary alignment of
 pxmitpriv->pxmitbuf
Message-ID: <92412c38-8fb0-4a81-9205-7735ae21459c@moroto.mountain>
References: <20240525073229.4144612-1-namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240525073229.4144612-1-namcao@linutronix.de>

On Sat, May 25, 2024 at 09:32:29AM +0200, Nam Cao wrote:
> This driver wants pxmitpriv->pxmitbuf to be 4-byte aligned. This is ensured
> by allocating 4 more bytes than required with kmalloc(), then do the
> p = p + 4 - (p & 3) trick to make sure the pointer is 4-byte aligned.
> 
> This is unnecessary. Pointers from kmalloc() are already at least
> 8-byte-aligned.
> 
> Remove this alignment trick to simplify the code, and also to stop wasting
> 4 extra bytes of dynamic memory allocator.
> 
> This also gets rid of a (false) warning from kmemleak. This 4-byte-aligned
> buffer is used to store pointers from kmalloc(). For 64-bit platforms,
> pointer size is 8 bytes and kmemleak only scans for pointers in 8-byte
> blocks, thus it misses the pointers stored in this 4-byte-aligned buffer
> and thinks that these pointers have been leaked. This is just a false
> warning, not a real problem. But still, it would be nice to get rid of
> these warnings.

Are you sure it's a false positive?  I've always wondered what happens
when you do:

	p = kmalloc();
	kfree((char *)p + 4);

regards,
dan carpenter

