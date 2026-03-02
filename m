Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7271C423A6B
	for <linux-staging@lists.linux.dev>; Mon,  2 Mar 2026 15:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772466942; cv=none; b=QDaB5vyJ9RGX6ko/J3xbthz+xZoaJxB4GiSMFs8P+fI59FEi5LFbOnBPSMlE5JSvVWvX3Q9GpKxmxGNV2gcqgtllmdtwwEk1bvt3BKbfSqn8ZoGOSzWPjdDDAfUimV2VglzVxjFETrNVltGViW4zeFO6XFyoreFEBxhn6d/neJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772466942; c=relaxed/simple;
	bh=C6W0jUfyg1QgWkjEle06vcjLdencsCM/62Zm6sY9Zak=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=kXBWvjGB9YfUtkb21+ZJYmQoXfPY5TQBm6Grr2BqcIfBPXIgSQLjzMhepZp+u7Ghyc7azc1npM6TO1xOiCMv66K/bO457EmcbLIU1xmCXEwP0PWHiaFuP3sJYRxbvkE/sZcsMgFTQRl8KkMDl/InY8wEmMboY9i8IEV9m6WeA/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bLOothh7; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bLOothh7"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-483bd7354efso62175545e9.2
        for <linux-staging@lists.linux.dev>; Mon, 02 Mar 2026 07:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772466939; x=1773071739; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6W0jUfyg1QgWkjEle06vcjLdencsCM/62Zm6sY9Zak=;
        b=bLOothh77V5M1uRS63Oq8ruKK6/S5QF+hWZRVzhyN5hbMFtSbPgDcbNL2ua9ZfnWEa
         AELAl18az+1pQfqljFaHnckQ7W6ENgOb9ozemVUVNwtWwsoDDH1RIri1+jTkFKtbcGHH
         NT5Nq0//44qiuoC6dfc1tbMu0k0BTGwubzzHVn8N2hOpOHsXo8B9iTngxiZbv0WUQeTG
         2UsQw6NiALWe3EwX2QB83TxhqDK2QUMY8Y7TVabqKUnUoDGS1mXAEmZcm5T4i/xYVicS
         Hg9frcTA+436b3lsvLUmgLEqcdqVr0wqQEY5DUovaH0PhPDDSU+cjopOYbmoCD1346lg
         nGZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772466939; x=1773071739;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C6W0jUfyg1QgWkjEle06vcjLdencsCM/62Zm6sY9Zak=;
        b=GAWJ6fBfvtFXC1uUWbVtjrhouV7G+CsuqhgUyI1yLJw5xfCsspdFOCcOKvok1svrNK
         F6yiI/Fhmn73PxhFrPqKUzAJITsZnHOMyrLB5j1laCAaJA1P3TlFlmUiZCIhzjHUGuqe
         DDo/hyQFAyqFWPyuwU/tRroEupoIDjADhb01R/Y2WpRv0QPbDQXfTxn7CNZg7YdyLedt
         dihldPT8+Hp0bmP+PPuWjhanUwz3quHJe1CLunZcU6BX+ywu/SoJrOR0mazU/CvTstqX
         ozSWaPM8jGLAjWg/ysAuMRpMhRtSmNyqGlVxwbwAjG9YzyEvgyRkYLXH78IBHzy2qZBa
         EIvA==
X-Forwarded-Encrypted: i=1; AJvYcCUbh2xh4z1PpaqNhD4B0OPKt7J4J7tkO3brQGGaoq/1FFjwrey5KYTE+nRCk5ZQxEwB7f4THoMeS3ZethBd@lists.linux.dev
X-Gm-Message-State: AOJu0YyeDuFn2TV916yoGOI09haM7EC/tY2YDddukA+tvIyRy9JoOpcg
	QXEi9LMtZ/XOYMk0GOlPs1QJDPtMBDfKb9U/lfC1omHnd5R9cdODZ+MeaXv6snHz9Dw=
X-Gm-Gg: ATEYQzz8LVh0cTFn1e52RBfPMPldgQj+DFTNOdZPaP8flujcDuuyeMk1EyP9IX6G0Oi
	gjNaVOwxx1N8Bbfne9mFT8qlW8x7MM9YxyzMXT/BwQJ0onMTne8XCag130t3LyHnMN6wSYB8+8x
	Jvet3Tdz5H1gU6GxRIoIXw/qmBSv0EyuSYSnRZe5UomWyBfIRZ4pfaeZUyOw+kSRvNPiOxXzmLF
	ugnrtYPNnR2VWX6ITZdeSXpt3D+//4fEVc8TgSzb+yRB2i+7zCp3jEHyE45Q0/ORE8OfCzIOihB
	pZvUBYgIfimqxIVAnXcxYNg5oyFgZYFMSn1edGzVyeUNu25KePpsuYo7Z32JKPz0veJckqfdqUr
	POrSmthton3TlsYiO+RTC/Axza/Hq8evbXACTToIuYNpUBsCkQL+3OldMgjGleYcQxjGhaY3Dn0
	seoJMRyzW6atX04ohn
X-Received: by 2002:a05:600c:548a:b0:483:aa2:6bce with SMTP id 5b1f17b1804b1-483c9bdb0c2mr209683915e9.30.1772466938483;
        Mon, 02 Mar 2026 07:55:38 -0800 (PST)
Received: from [127.0.0.1] ([86.1.69.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd702e7bsm462189065e9.5.2026.03.02.07.55.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 07:55:38 -0800 (PST)
Date: Mon, 2 Mar 2026 15:55:36 +0000
From: Josh Law <hlcj1234567@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	Gabriel Shahrouzi <gshahrouzi@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Message-ID: <f8772114-a495-409b-a590-a9b1d8ed1d41@gmail.com>
In-Reply-To: <aaVEsCIacXl-kuxa@stanley.mountain>
References: <20260301214815.2628942-1-objecting@objecting.org> <20260301214815.2628942-5-objecting@objecting.org> <aaVEsCIacXl-kuxa@stanley.mountain>
Subject: Re: [PATCH v2 05/10] staging: axis-fifo: improve IRQ handler
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <f8772114-a495-409b-a590-a9b1d8ed1d41@gmail.com>

2 Mar 2026 08:14:53 Dan Carpenter <dan.carpenter@linaro.org>:

> On Sun, Mar 01, 2026 at 09:48:10PM +0000, Josh Law wrote:
>> From: Josh Law <objecting@objecting.org>
>>
>> Return IRQ_NONE when no interrupts were triggered to avoid spurious
>> interrupt storms, and only clear the active interrupts instead of
>> blindly clearing all interrupts by writing 'intr' to the ISR instead of
>> XLLF_INT_CLEAR_ALL.
>>
>
> Is this something you actually experienced in real life?=C2=A0 The commit
> message needs to be clearer about that.
>
> regards,
> dan carpenter

Hello Dan, It's just code optimizations, making it cleaner, etc, I also ran=
 all of these latest V2 commits through check patch, to make sure they are =
compliant, I own this device so I hope I can be the maintainer of it one da=
y, I'm learning this Linux system day by day, so I am sorry I have to annoy=
 a professional linaro dev like you haha

V/R
V/R

Josh law
