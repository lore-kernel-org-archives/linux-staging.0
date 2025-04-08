Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D08326159E;
	Tue,  8 Apr 2025 07:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744096807; cv=none; b=ZJ9f84iZ+W8U+a7Do3Ss6i6btPA5CXY5+m2ZN1Qv0nqembUvfMxtSUVDKuaX/TKJeTjSvo7VfEucOHBOuxQZEe4pH0k/Ey0ESX5AdzqPL9lc5zx1C1H4cJtwOnANM+K9jYeKkIzD+jTym6ZQJ+cah0rPzQo3nKGVum4XhwRa1Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744096807; c=relaxed/simple;
	bh=4plZsCaDVN7RgvklUTtag7VRGzOr6OPuSI5iKrIgaLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cukFwWrBPqwR1NSbg28W3ZS92sZrfXVNZsDvg/NTJjSULtgecgcI344Z4Vybr/zY8dpYlEe1m03o5L4nmdAkNJkvtbU+k15JK3CP3VZvVLWa6SlGXs7KBdpY55Qb6eleV/qQTGGFrxetWYhD8icScokSEx4X6Z+JwX0MzUHlYOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QoXrCvVY; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QoXrCvVY"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so939356966b.1;
        Tue, 08 Apr 2025 00:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744096804; x=1744701604; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTwOlrF0d24dlqedylD50cDl9x2rs1fVLzWN9clcz/E=;
        b=QoXrCvVYRZwOvO5f0Gd6ObzP49N16Xk7wY9wvuolf/nXDfSNjRYuNs9OrcuAXYCPVh
         8uIfwy8r6BCV6iABmQBtJ55yLImIIh5Poe9VMcH33N6wmte0MHS5kiiL23d5Dr0Ln2dC
         F8aK/lsW3n6ScB31iEsMnG7PYX4iDLFB/f/LdjxgNgwxyiXSQnT1NnarM4Ny450KxKr6
         ZUDXNbvAsf7jFBz9uSe8m4fMe+MpLY+Ecu8akcAxbjr4rsFV7QnLBtC5T66a7LG0cKdn
         Ryet1cj4hYxQTVwLxy2z2tF4tLHVpcg8AdnhG62g4ugh7dwO6qlguvD96XwSsTk7Cqz1
         W6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096804; x=1744701604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UTwOlrF0d24dlqedylD50cDl9x2rs1fVLzWN9clcz/E=;
        b=cIhIyV1BaLVsM4nJWkoALZofzIUuhazQZa4Prlu2nUXBScRGjpvXOV/45lDej6iGef
         bHygHgWbhsBQjXsVkUBt+FTePUIqulNYGHDx9vW5aBhspyU262ZDrTA866e9fpuw5VuN
         vzhdhHKKdAPOEk9zfWMpJHs8jMAAf37/8Cn//qxJLKwIeFkvJS5Ebta+vKfxpx/rJjDy
         yeIowqH+pJNCbIsZCFCw/Clgv2g/qpsvMO80WVTnx1n/q9gVw+XNAeg5tlnTPaDV6tql
         K/Hh5J/bGtSRO+7TEbpGMn2fJfeWHe0hcCuoN9PfUHNMa3AnQJZDC7vcdpxxHOdWPCPY
         Th+A==
X-Forwarded-Encrypted: i=1; AJvYcCWJkVQmVUFAjK1G/M2A+DWrrQMOrZy/0KPuXWdVEVNMri4ipoCXTvQ/rttscz0QD3+o79FiOPjOrYw6txCY@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3LeVuPAChvJkvKRDYMK4p4aGJtcu1e9QqoRxSSnLXlCfK7SZv
	Kq+iz6MbuO0VmQYcSEJQbR4pS3PV1Eh7d5i7h7mN3ilcTcmV2V4yI2pT2h2ok4zaBHuRC8mA1WQ
	Rdy+eA4r/x47fzzQQJhtfVuhKe7A=
X-Gm-Gg: ASbGncs1tJOLLWCTvdZhyW48He5rK10fEhVq8zrWGj3W4j2DjVlKrjM5uBoyU6E7zNi
	1LU0L/HdsMkdBdHGkRQaZQRMECKmR7tbBbSzW9T1sDApv4vHL9SoGrBCyJRI8t4r0S5Ql45PcWX
	J07kVhfYu8bwWEyA/E581Y3rM09QBCdbY9c8Cq
X-Google-Smtp-Source: AGHT+IFnLlNvM1BA5x+l9kSxfc3WTETqn0b1CZzN+qipP7jflKN9kpZoK/A0y5io6eZihIBFI4b84z5Kk0ND9TuW5jU=
X-Received: by 2002:a17:907:2d11:b0:ac3:413b:69c7 with SMTP id
 a640c23a62f3a-ac7e76232e7mr756892866b.39.1744096804095; Tue, 08 Apr 2025
 00:20:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1744061673.git.abrahamadekunle50@gmail.com> <4ccdbfd3e8d74d99679927f294f71cfb694fcc6c.1744061673.git.abrahamadekunle50@gmail.com>
In-Reply-To: <4ccdbfd3e8d74d99679927f294f71cfb694fcc6c.1744061673.git.abrahamadekunle50@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 8 Apr 2025 10:19:27 +0300
X-Gm-Features: ATxdqUEJnYGusuodtr40_5xWJ_LxPs_XfjyQDlSUxGueIZpjAE19pNnaLRe8eqU
Message-ID: <CAHp75Vfp8Je1fUavSwTDAM_5_rDaDfXETa2oM5f0CjL1mxWX_Q@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] staging: rtl8723bs: Add white spaces around binary operators
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: outreachy@lists.linux.dev, gregkh@linuxfoundation.org, 
	julia.lawall@inria.fr, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com, andy@kernel.org, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 12:54=E2=80=AFAM Abraham Samuel Adekunle
<abrahamadekunle50@gmail.com> wrote:
>
> The code contains no spaces around binary operators making it
> hard to read. This also doesn't adhere to Linux kernel coding
> style.
>
> Add white spaces around the binary operators to increase readability
> and endure adherence to Linux kernel coding styles.

...

> -                                               psta->BA_starting_seqctrl=
[pattrib->priority & 0x0f] =3D (tx_seq+1)&0xfff;
> +                                               psta->BA_starting_seqctrl=
[pattrib->priority & 0x0f] =3D (tx_seq + 1) & 0xfff;

> -                                               psta->BA_starting_seqctrl=
[pattrib->priority & 0x0f] =3D (pattrib->seqnum+1)&0xfff;
> +                                               psta->BA_starting_seqctrl=
[pattrib->priority & 0x0f] =3D (pattrib->seqnum + 1) & 0xfff;

You mentioned Linux coding style, which also requires lines not to be
so long. These lines are. That's why a few versions ago I suggested
you to change these to be two lines each. I don't know how many times
to repeat this (it's third one).

--=20
With Best Regards,
Andy Shevchenko
