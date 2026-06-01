Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE1533E34E
	for <linux-staging@lists.linux.dev>; Mon,  1 Jun 2026 08:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780302350; cv=pass; b=HArWdbUHhJGM8eHQDK3sFJn6bKP9GHDZTuUBbh/dYnbNpxdlfwjKBEHtICUBxOsgQuNYoMSCsXwx5PobgvQ/Wsf9KgkJOvUdBXFXvdZiQUUB7fqBjMzoaOhth1Z9gIHjWW7g/ysVNw/SNeCixGdSukWhgcyMWsGli9LupCCs69w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780302350; c=relaxed/simple;
	bh=sLmU3apQyYy1PimvVG7oezFtVWtKWxxDaqeRDTtr870=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IXx2e1CXQ4sv0x99UYebK1ImWWvZd7KEsb6Z0vw1bSOs0htJQkr19OZPvjRPSrw5R2UgCg13Ns9R6+iyF6VI+axPCKadrxdQ3Z65wvc76GI2PVWjbDrTmXNZ39A6vWtgEqPle+ywQUbXSElrO62l13Bw5maX+6m0aJqf5U8qJcM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ERcAC6SI; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ERcAC6SI"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-68ad1e513d3so6069767a12.0
        for <linux-staging@lists.linux.dev>; Mon, 01 Jun 2026 01:25:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780302347; cv=none;
        d=google.com; s=arc-20240605;
        b=Wh3SvSO3qBSYAcHXIfDsa0yV69azozzczFW/08qbcqjOZSBBPQVjOoYbACmrPDwc8M
         lgWvIhZG5BzIxxZ/RD8y028mO2YkwoLgV2cSOqKac8B4/oKv0QeyXF7abh01BhblONQ2
         fYkI8DPS4m3crK3IKc1Wn5g8+U+1mkmUmwkpGiv1QQjG4vuW6pzy3QPBzOBAk7EmCXFi
         P/jDN1FR9lnrs8fU19kb8BQmGpGS5iVb2Ijv0TD82hUNSHNMEwjarIaLGMUhAi+Z4/Lr
         m/Ho7DFUgqsrRwL6ZzAd2YkGVjZ6NKMgieil8AbykJ+QRsYeQXpCenF/G0clpO7VKX05
         wLbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sLmU3apQyYy1PimvVG7oezFtVWtKWxxDaqeRDTtr870=;
        fh=zb4EuCDFcwH2zAx93Hc6mtPsWEdJXoKE1h8u0r0lI0U=;
        b=Us0H9WBKeXLVia43XKRdf4VaPR3r2zq8AMWlGQO8EolKQBk1S1Mr59MiDaxxbMnsD4
         aqxm7mCoOuBIdTbaCm0hitSFX1ddyeJrQ0QaYk/5t6gxsQFE043c9T7MazHdmrRvaY4c
         LID8r+PA+a9Gkg6nJlxVoe8Yl2Cp5kMWJMJGUUj+EiyS1BHKUd32eJYLWEd3p39CMbro
         0P3ZJqEfZcuBwEyScPWpJqwLKJrgg5kf3lCzZi/tADMmy3FbuL4heQbPWjbaTHUBw4iZ
         trZs+or76jS2SNRv/o9w7UfbIo8hnUlNmfqoHXTJ5R19lMye5AQOx840l4KpRbSWLg+l
         aSoQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780302347; x=1780907147; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sLmU3apQyYy1PimvVG7oezFtVWtKWxxDaqeRDTtr870=;
        b=ERcAC6SIn7xCW/Ml9zWso8ii07lymcJ5gUDOWB+eU5S3mjHCWwWLrvrBgrA6XZcOcL
         O24RUBxDAeLb50JdJJN+R7/xMtA3tHZGhTDegOLOXXCSMP+PDcxft9jInAEWrMghrnV5
         8SHSmOAmGlOLTq4OAfYXOTszpN+LfNhMVgLuKYBMbrFDMf8Io0EIkycpqpu9KsnC/zIa
         +xhAY1XYe2f/ZEjKpwhDy3aVDJ9yenfh925LmZvbR4PhSvTmpQEStBJP/9OI/76Pvowu
         RznfzD0KM0K+fIxHoc50Nf0OE00t0VvJFDl14qSocc5vhC+mMiZvu2/kvpg3BaKO7ZyU
         eYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780302347; x=1780907147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sLmU3apQyYy1PimvVG7oezFtVWtKWxxDaqeRDTtr870=;
        b=ANkqfleIzr6RiJW5wqXDXO4TJUanDPX6JSQTa2MlJbjxOqsB9Pwu0YML+SAMSDaYJo
         xpWfBZrYKN2EfOcv6/LT4ATmmQx6jL4QecEVWhpDpXTcBBRsLvJwLmTjI/EMNRsqiTm0
         FPwvQeE5avnPLvDswWj1l3fpqz0/cLFRiFAsSrYKKfsAcUN/sgqXVNWXG0jetLFUWQoW
         yyyTsssIsfFtbhOdp4OYLUYS26HoEP5Hzj82sdaoNOcz/EolqTNEyTun4OF/8ll2eBSP
         PBSSlmHD/g/UnJQzdZ8Qp/LhFkrIzRvLviEqdyUmAx7JXs99MRShg+IOq3oDSOMtzlhC
         MliA==
X-Forwarded-Encrypted: i=1; AFNElJ+VfqzSrKas1lQc2zPKSL6OmlaUkJ/r2vb7FEj4AER7RWcjqoqeIoG6KiAQhXa/eQQ3vnTP82Y3pWSf3Wfl@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2Cbo3SL5M16QzzpMq2CapE/AA1m/vVf4xJCQH6xamEhganyv+
	SIc6tmykqtLX2JARO+ZjoYBbtS44rVEZghiZQOJKIbMAGPX/iJULC36pypzwaGpEICS58flvbrW
	kH5fV5yaxDsuFHFm93CFHjhcZMQZTkjo=
X-Gm-Gg: Acq92OECdc2m/3+IIcal9sBDC5qghNAiOrS3x1j00S84jdZLqVKv14gyhdzwZpLYO2/
	bVKTO4xmjxt78pagCwzVSm1KrSS8wh3m0AglzTgCeoEVZyDUNjVXjgprwFPWfkZ+w4m2tmgsRid
	MnYlvnLRzxLehrRRJnB7QWZX0SbaJSN6IausYKgVSwDJZz/5HgRtg6CdKzV52YuWAXBVvTEgB9X
	8EoE9YAPR9qAu2hg86egcJo9S1Od2f/HxD2QLrOOL7dJFJdDN7+mp0zMoMOzLaA84fVxHyODQnY
	vHlEe2LkItPYYvCw+zQ1ELlHTuHszd6Kp1uUQ33ndgBB61BXT8sC0s2mnkgN+1X/5rdOPeO0/Z5
	Z7zqUS3kGyz+0fhqpIB6QFyd4DDQwLL9WudrUVAkjJ1IIfRG/CcHoPkci+JeUL46V9ibLTKobz9
	0NQeg=
X-Received: by 2002:a17:907:1dea:b0:bee:323d:1239 with SMTP id
 a640c23a62f3a-bee323d1a79mr47098966b.38.1780302346810; Mon, 01 Jun 2026
 01:25:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAOSULec2OpwTGB3OUb_n3CdKO6H_DGJnxw=qsBswbd+JBjemKA@mail.gmail.com>
In-Reply-To: <CAOSULec2OpwTGB3OUb_n3CdKO6H_DGJnxw=qsBswbd+JBjemKA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 1 Jun 2026 11:25:09 +0300
X-Gm-Features: AVHnY4ISm8xxaxYs2i3jMM2LEcmjqM5kfzxGqhgIogRKxnB6Q3gXYQUiYHQb_g0
Message-ID: <CAHp75Vc15t7zmNGeuNG_fLHwCN=Ym9w5Cn92+eqbtsioGxFzCQ@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: replace sprintf with snprintf
To: Enchanted Hunter <enchantedredhunter@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, andy@kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 3:44=E2=80=AFAM Enchanted Hunter
<enchantedredhunter@gmail.com> wrote:
>
> This patch replaces unsafe sprintf calls with snprintf in
> fbtft_register_framebuffer() to prevent potential buffer overflow.
>
> Signed-off-by: rat1bor <enchantedredhunter@gmail.com>

Does this change address any compiler warning or something like that?
At a glance I do not see any usefulness of this patch except an
unneeded churn.

--=20
With Best Regards,
Andy Shevchenko
