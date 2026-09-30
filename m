Received: from mail-oo2-f36.google.com (mail-oo2-f36.google.com [74.125.231.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E724A263C
	for <linux-staging@lists.linux.dev>; Wed, 30 Sep 2026 11:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.164
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790768132; cv=pass; b=rPuX6sDtop4dZT8UltqJbZyw7OorP1STAz5cMT6FwfZNmMtDhhcEVqYF6AnXlCzR9BsJ5p3q7VP6+nzR+HSD5x2U5oxFB/8xxwTK7bUHzERH9E/muMrvhOqvZbeFMV1EOs+MDOjvC/Ai4/zRgGJU3Ec52E/MsQyTx2jTWg8ssPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790768132; c=relaxed/simple;
	bh=Ai/Jf8BwEUO5H8StrVs1vR9aM5EMKcYU9MwuHF4t1kQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NDv9vkV6URRf0Db5NL9jxXDh66RQkuZhr34Lvr8FxTUn4s5QoJoyuQV6clTHqyzTyJaKkuAz3NpSSwOcgEPfnmrrETyb8bdJrqiEjtBZcHBtePC9Y4I7iNV0GwGrqUekck19gG7qbm9ejhOBhhlCktJFczY0leg11VLfHtIeMH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQnEcqpw; arc=pass smtp.client-ip=74.125.231.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQnEcqpw"
Received: by mail-oo2-f36.google.com with SMTP id 006d021491bc7-6d762782f99so1886456eaf.0
        for <linux-staging@lists.linux.dev>; Wed, 30 Sep 2026 04:35:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790768129; cv=none;
        d=google.com; s=arc-20260327;
        b=gzXw3/Zxo39QQ/MuHLnkQ0frYHVLejuKc4wonkQxPrGvfmP9MkS4uPZP7pGCXKlSZa
         4Mz2NmS6xIzapKkV+/yheea0LrsR1B6VrPXptQeaUBqjau6Chftr6kJELrK9djH9HJNe
         WiGvJx2LdT+N/elwqz9FPF4UW/1D8zwhU1sdEuG5mBn0uFINkC4Dbe+P9sthzL+olyCm
         1P3LOamY0zAwrb644YvjzIdwgUDnx3q0nrgicFyda86y3LYeLoyyO5QOH8lkk+/kBfLq
         xPGjSA7UZCbjZq1P1flgGKI/wWmnIY2pstLNpavD690TYW3wmooUgB4Fa0ZPDp2M+TGn
         aMxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ai/Jf8BwEUO5H8StrVs1vR9aM5EMKcYU9MwuHF4t1kQ=;
        fh=NeaWRFvQVb8v2TE9dTQyTtx6b+2zvvksed8UwdbMdh0=;
        b=FvN4GGkCJXBir1+F8hqS2Pvmz9pHbDyR994a/R+wyLesQY7hfKK5fZUkEIvWz1xzR9
         4aaixFqlFr3Ayb5hT+FeBl7yFaoKe12j4JcUYj31S+vohNBPjhu3hvDeJM3rFOtPEhMA
         UhDFgemXe91u/I2IEyRM2zDl85pK9v9vcH2OgTcp1Yz8J3D33EkNxWvvGXojULr5EomY
         kpQkkN9iLd6bBbZ/LbW4wBXRalgIdgVIfu/skyhojy/Qxzt76vHhEXu+eU0BR/tWQWXm
         AnJkiWgfWkTkk3lWqFrB9ZrceGVh94bc83gBghGEjDg4Wg/cDcY+hVpAf4j/kkt8YM5q
         NAEA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790768129; x=1791372929; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ai/Jf8BwEUO5H8StrVs1vR9aM5EMKcYU9MwuHF4t1kQ=;
        b=FQnEcqpwSzGV2jLq8jYZ3HSmZZHIqUDRJ8W+40ERWDgijlHxke77VpUBsq6hgBOerb
         qYIznzba1SxKiwr9UIyeh5bqLnLGmSCk+mJVpdwO64Dtu8gqgmBoFOqErGIQ6YXJj/cX
         GPjvr3ScKguwlBxroF/HN50bwQ9Il8E5plqte4+L4wdF08vY5mSAW6leppW1DseXSFYa
         mCsYJKdAYLi0GlY9TcIoWZGP/0fu1KVqSUZ2d7zTqTb0Fg0mWx0Irz90+ZiJezbMZD3v
         oVnJVQUyQf7RmOp7xyIf2Arl9LZhdfiVoLojoluNn77Iq+26amrvF5j3aQadbhSQCPY3
         JYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790768129; x=1791372929;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ai/Jf8BwEUO5H8StrVs1vR9aM5EMKcYU9MwuHF4t1kQ=;
        b=R7edvcYe/Imzur/SnINwq7tpbJ6mm4BwItMBJGwvwpM/M9hNfwOyJ+yuNEdAgEkSIM
         oVehZADmbDdczRXsS571Jb8h73/XBoc6Y8CrQOIkU7QwFR0wGWUyj7Xi0xA7ZndRpvci
         qvfR9dvYqNjUQAWgffH1OebHgZXYcGdIVY8/BdvwAgDimCgJ6M7eurthw2ROuPpDOGuN
         xEICCiLw9g3Ezf1ndq7L10OBTaOQm4NLQIFaXQv2kbnNWYMRqHZ3OvCcVtrmxTBGka8v
         A2UKgBEopv+ljnMoaGYbDN4i2jVMMA2/LMcjE1nMy2vVDabyw6WKfnyARQUsJDlIolJt
         2lYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbJZzcBoC/4+RBPKnWiQ2FOHnqT/1kUL6MGBObYbqvyvAra+bsKyfhAS4ImEr2hSI/uWcXAc6xkB84oR2h@lists.linux.dev
X-Gm-Message-State: AFuF++meRW77Eb8tOOLpDEP9Ty9dSy53lv1r2aIZzQyerSxVgiksYxXo
	M2m7Apm3iG9Udb+sTCr7lX1oEuPBMJkLCyi0HG2g20apawsxcD/T7+5/soVAY54FKxIHufbY4Si
	cvNDk57Ltg89mLiYTAPez7NY9qTCgT+g=
X-Gm-Gg: AYBFou0xzK/YJj782jXZErlZXh9JXWu4p26COnb0wEBE/PL06HoFdP2NKN32adUzMVK
	rykzh37Exaylok/1XnyQ+Cml9k+W4AtHJS29xFUJUz7XEu/ElkkPbyuPWzMG3FzM7lARPhVSMKW
	oIHVRLaFqIN8KxwsRKy3rSXhXqLBJN0vV5MVMNi+MIeZPJf2NLGZ5f2eyuTbplVwFpqYLduCqQS
	ThF9Pd6t0+luFOMRKhIpIT/mBsTDC+N9UCDyIh73k4Tl0nFgCOljzNJF8qTgDFs4ZJX8q/kCKFs
	WOJOoSHg/UeJT7idIqIpJ/xoAWuedNQZJ7W9sd08srWSRlE2czMH5XUZkQ==
X-Received: by 2002:a05:6820:4df3:b0:6ae:8fc0:dbaf with SMTP id
 006d021491bc7-6dcf1fa7093mr1040549eaf.1.1790768129547; Wed, 30 Sep 2026
 04:35:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260929184900.39515-1-abdelnasserhussein11@gmail.com>
 <20260929184900.39515-3-abdelnasserhussein11@gmail.com> <20260930085640.00000377@gmail.com>
In-Reply-To: <20260930085640.00000377@gmail.com>
From: nasser <abdelnasserhussein11@gmail.com>
Date: Wed, 30 Sep 2026 14:35:18 +0300
X-Gm-Features: AclHuK8untSyrCd6-KRO0IrW6AMVzxM1NtGbJFcEt_bom4eFkclVEvnnxJY74KM
Message-ID: <CANpqX3bDL-C_w1ttuarPyUvOysCPYOsoLMS6Ri24oFnYmzjOVw@mail.gmail.com>
Subject: Re: [PATCH 2/3] staging: iio: accel: adis16203: add missing
 spi_device_id table
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: jic23@kernel.org, gregkh@linuxfoundation.org, nuno.sa@analog.com, 
	Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org, 
	linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, error27@gmail.com, narcisaanamaria12@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Joshua,

Thank you for taking the time to review this.

> No need for mod_devicetable.h, this is imported using spi.h
> C99 initializers please.
> Additionally, you should delete the MODULE_ALIAS("spi:adis16203") line.

I will drop the unnecessary header, update the spi_device_id array to
use C99 initializers, and remove the redundant MODULE_ALIAS in the
upcoming v2.

Best regards,
Abdelnasser
