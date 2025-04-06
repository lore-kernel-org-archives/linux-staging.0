Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F7F19644B;
	Sun,  6 Apr 2025 21:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743976537; cv=none; b=t2IbqD0jLYmBW/orrU5pY0HYmJVY5Ocdshu3QH7OH9HdiJ29YoinPY+3a0V9rEOWLo3ChU+suiFUSqgolrgdjX4ldsxRBlAD4MQXKLrOfOVdczWzxYWsJEXQ9DdCfvHPIpZyqvwOxYCl9o0UZGY5MWec9HtktCoA+yLQ9Ling3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743976537; c=relaxed/simple;
	bh=g6pYceACoECe+Rhww/YIKfEe2jPzOt3S5mrtvjs+GLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DcQ7BbdT+9pMa3kFgEOOP0a6AWa45lz82qUyKf7+u61AvNQD9WM92hVjvyxruUnFm49lVK0pv0foi7H5RctOgckMd8RJBsAx2OoYmK8qUMwcEaz77UIN0wA+7e/AU6ieuEprzJJqElNntGkA3rJsiOZSoVKIBRYxfy7D8+WKzT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RGydYG5N; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RGydYG5N"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-523edc385caso1427786e0c.3;
        Sun, 06 Apr 2025 14:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743976534; x=1744581334; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6pYceACoECe+Rhww/YIKfEe2jPzOt3S5mrtvjs+GLw=;
        b=RGydYG5NpvvutozgPrCqyVvRt5Zi/A7EnReMBNXInY/nfnuBA1oZWzhIvq8ryufIwK
         ni0H9H7ZR4hpWTAlDLKKrPaE8Xkx2kQQxlM+See3xHFIuyrCujoZIBcRksXQlIA4KK84
         1sjWusP9+eKMlWU7MvyinKPzEfR4zOVoG4BZFFp3JaDnfz5dPcUf9z4Vj15tuXsKuQ30
         6EaVbXwv7wq+nQDDDcdheO5VJn1feAKmF13j9TFDenMKLg0pfr+sgILXRGvHOHQrKy3i
         WP3I6/51U6d1MfDwVxgOO+WxUDMf6gKRNyVS85roMjGfgoPOaLPMnAyPrlNBiT8mndUH
         B9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743976534; x=1744581334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6pYceACoECe+Rhww/YIKfEe2jPzOt3S5mrtvjs+GLw=;
        b=St3xhRxc5GqDdDv8WpXGbe0In3XfasjxA/KBp+alj6zTs9ZE4FtAMKkRLffPyvunYS
         az4XqjIZYyrVW9mrG/dyHvh8PCAMWDjriID0pAqo5LjAW9ZqK72Zi8fqsEsKFfOiCuUJ
         zdLT1WvYaMqWWarIdOZFl0HGnyKaoSmcUbLG4zD99oLGFhEqyhLzhXZwqCglRgLgg2Q2
         ywK3B9BRUibn+uDcYuXk/vaeKjmWasFCCZzv41sCTbOMgO4PZa9dGYxN9VFY9W4889Nw
         yoYOQXlOiiqSJaWDad5Mb8vQjbFvwabhyjoy/y+xOvRFGBEPhNUYAwdnbeNVf+V5u4Jj
         XXLg==
X-Forwarded-Encrypted: i=1; AJvYcCWPRbTjEYAGyaCTrEdJe9Ddlt1yvTiqTkV5HvYqSgbpZbqc30QjL+IE51m3RP5L2xSe32JhFeRIzmU0G/Lw@lists.linux.dev, AJvYcCXx+43zaEbSMW77ZVIPod3llGutvVh4kCoaM56tBVtN6AYL0JG8Ly6Qn2CuVehpDaYWMjbUiF6xggxx@lists.linux.dev
X-Gm-Message-State: AOJu0YyzwYOpHSy0XuA5deZF9NhHZJMzn0ufi8TWdZE+YWKPUSfzQ/7W
	VU+TpZDub3/6nvhpk0VuNgOOTA//g2YuWc9yRDQ8VPAY/UZ9KTYVAz8KjXAq858i4J2ft9DJVeP
	BwouQi/6c3UyrGNAMQ11UYaUZMNo=
X-Gm-Gg: ASbGncvfPZtlO8GIGkZYg8A+sHnLCzL8gcb2LvjtBgi6K8OSz6Es8W9Z0IqpCV6BzIu
	HXSIippiCpJ9i2S1JdIcEmdsyJIiUUzwkK8AVeE1AFDqPY0MxpjBzVZeVDPPThOcOCNylNAWMLx
	23SXfJ+3KZxM8uX6lNLA0lmFjTt+A=
X-Google-Smtp-Source: AGHT+IEt6764hA/Jd5CwgHqItb0CGB/8b/dQXtSSNDXlu2Lw2GtsrjMFepc4xWyzsjCSncnPV6m74bNb8JI24lFwZ1c=
X-Received: by 2002:a05:6122:8c01:b0:523:7316:7f31 with SMTP id
 71dfb90a1353d-52764494388mr8013512e0c.5.1743976534439; Sun, 06 Apr 2025
 14:55:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z/Bro47isE8zhcu7@ubuntu> <20250405101318.3fce2dd5@pumpkin>
In-Reply-To: <20250405101318.3fce2dd5@pumpkin>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Sun, 6 Apr 2025 22:55:25 +0100
X-Gm-Features: ATxdqUHmBJavuVTAsCOOoR4pbO5-Fac5DY2pAqOykH_Cgbax6-OmWNhMoXL3Aps
Message-ID: <CADYq+faLiL5f+HBxuZoKJLLc90wM0YRRbuhYwo+Or2w6O6SMEQ@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: Use % 4096 instead of & 0xfff
To: David Laight <david.laight.linux@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Julia Lawall <julia.lawall@inria.fr>, 
	outreachy@lists.linux.dev, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 5, 2025 at 10:13=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Fri, 4 Apr 2025 23:33:16 +0000
> Abraham Samuel Adekunle <abrahamadekunle50@gmail.com> wrote:
>
> > Replace the bitwise AND operator `&` with a modulo
> > operator `%` and decimal number to make the upper limit visible
> > and clear what the semantic of it is.
>
> Use 4096u to make absolutely certain an unsigned module is used.

Hello David,
Thank you very much for this suggestion.

Adekunle.
