Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D430299923
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 09:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774861321; cv=pass; b=khe4iL4JDb9KwwmNnO5ZuRbc40QQxSryKYYw/0irc1cYT/eQdEYDcKSvA0gj1ANlo8w9tJFMgXaPbK4Tp3IVuClr3oANxV8QUteAE3Yq87aNVdnOHRSvGPLzeXWe0kV5B9InScF3dcl8FrPhepcw7Tho+hiTtr0pNBBif5VnqCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774861321; c=relaxed/simple;
	bh=SWx+yIyneng93JP9IOMXUMSod8jzy+wu3KSuRADzYrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q6a3BwM8Z2OyhyxWB7mlE7895AMoFgQAyXBiIB3OwCPzTaby6JOh8CYsqr6y1qCFTofxPnzaSzkLEk6kDkhLjlziRVa/cUKddFl+sISj3VdmSsUkdVwkHcr3tzgUUa5w0mLRxOsjTnkYI6rhCXn6nnSZh6VO0QafGVSqUGLOue4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YehCK8NE; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YehCK8NE"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b976536806cso535046066b.0
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 02:02:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774861319; cv=none;
        d=google.com; s=arc-20240605;
        b=OgGZc5gAUUFMJ21aMNrRHGEQ36w8qbHg/8xka3dMX0XO9uz9L6prVQKpuisun5JYpq
         KdVLKvMMy4yD0o4dHgyyON7rEM8PHzQBZpufimNp2zMMXi+p12IRTeYyaNbTi1RUoLcl
         RK4dqJTGVOpihWab2GsP+nHCTOEC+OFfFB854IIlzwTJwnmY60heVb3aJPM5chMyuaqn
         mZOY+AG5buUf6SAvGbJft/TPNAmNLZlKQFLumm3P6mulyACEZblm1CgJm6MTHRX/DLUu
         AOZFHelQN8XUlCLxdllAaqWMaPaKrvIf7BCQTt/XPFoxH/caNJ+v/FidRX9XCvnUODYs
         2TVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SWx+yIyneng93JP9IOMXUMSod8jzy+wu3KSuRADzYrU=;
        fh=2PWPHiW1IJGkAvxCJcOqgCJQZtNgl3bkV3+FRGIqwiU=;
        b=E1MjDExHSd9oys43qHEP4+0DI/elKa98E+JoLil19PwLaDp4ep64jPpNxLdk1emzRC
         fkBiXUzUr8OR4pqHl0B2rltUVGqLmr4W4Ao5ShTmjMgniIaG2OfznpxcE55Py4vcmNUz
         UuM9y9moddhzo1QSjN8J7y5yIuwuX7zFM4mfA2lDwz7akMlLK6DaAAHLCsVqCA6YQIKr
         pGv9CX4987lTwyrejxDPzQtqYslf+leXrRVUW7KDuXyCGusS4LV5qxEnoke/tS6J64GJ
         0UpqidABeBvzKU0se+MaFjVNVMdqPFqs6MXwuH0feA9lTDILKQc3kDRipyCZxNK184Kp
         sGLQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774861319; x=1775466119; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SWx+yIyneng93JP9IOMXUMSod8jzy+wu3KSuRADzYrU=;
        b=YehCK8NEETdue44CiLm/92bWQAo04BOm6eRI8RQ7lVwv2aVlCFP2f02YetvZKSIw7C
         QfyhQ7fNgcEgFMKXQop5GzdL5iS3dhKNY4rE0g6huiLILY+nugp4HIq9fP+WxnCDseEf
         3651HfgVOqZ//uHVCn884PSZVQMmPp026WfUD0pKj88Ugnl58TWsFNB6n7JqfbIRHbgw
         3+P2iElOKD9KrX1Un1qzlxfu8DHG/norURwSITjPi1DjYIankvpwXEAMnLXR2S0v2u6C
         YR4B9n5TDiG6RxFpCrJ9PvdiTGE/ikvvSCN0d9B5PpzgK+s0PTc6mpfkY4hz3cKA0Se/
         WrPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774861319; x=1775466119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SWx+yIyneng93JP9IOMXUMSod8jzy+wu3KSuRADzYrU=;
        b=l0WG7PgTW3WRsrtSiTshj5C4gGWEsGvnF+W54eWMWln+PrMBFNRHFPTgtCHWdrT/Wz
         G2tBpp9LY2d/STf9TYiHjKAlbjKyMoq4dfV/91+jQMJ406tOFWAJ1GXzEnlHV+hUDt9f
         B3mTMsdZnnLbOvCFp7NVE1T/4lrUxpuCHhRv1OoNwGWbnMtUKxLd7ZY7FkEvBfYCoEsM
         DflYMBh/zq51byDqJA130ue3JaeeZ/pimg0zE4euCi3bqNVKRDM9+6RoNxErXuv9+o7w
         H3fIb9WBLsABw1YIIhYtT4akHq9jJBQEDGEXdMc3dIM6EUJeLUo6XKi+mmuOuFvAJ9yZ
         D5Pw==
X-Gm-Message-State: AOJu0Yxrl8jkcVhnqpRoaZNPNd+Ezyec3jJu9PRL1x/c2Lc4mpiua1i5
	6sHJ0eBOWaHdLLeK40gu0wgIzGXBKOxKa0TWwC9ELPe5fL4h859vJV2DNhWP4kDWIl2X1dmwR8H
	BVs1OzRhVJG720G+lfKFPiWmTY0+E1e8=
X-Gm-Gg: ATEYQzzZzmIQz2t6QZ8+gN/nobUiYLs6mTsBS3JQh998RjrastF1dwkWp4OhaPeMHyH
	Bqq/J0lVn1t+LM9gj9rj546MyOKLGOJ5Q45x4toU0O+t5hJcHcNeNcJGyGSf7xZwZtMNkYWte+i
	hhDagtFTLcgexj6cGtUiZhOhc4wzADTxJ9ivq8RX1ysUtoblJ45Np9dIIDQYITnuUZuod9QbGTo
	GQzDYuDBTWk9d0WJorRxyOfF0++UUVsEiAy8gg4ntL7NMDsxjSwDLN91CfuMMCQuRxu07b0cnU3
	XSzgguS2A9/o9ISOARl2Nsb5ziJDti0tREzpRQInaBmyqzqMNfnglTHfSKaucpVafgeMGrbDcHz
	/pzsVqhQ=
X-Received: by 2002:a17:907:1b29:b0:b9b:3a1b:e2ed with SMTP id
 a640c23a62f3a-b9b503381f4mr745202866b.24.1774861318493; Mon, 30 Mar 2026
 02:01:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260328192721.255493-1-azpijr@gmail.com> <20260328192721.255493-3-azpijr@gmail.com>
In-Reply-To: <20260328192721.255493-3-azpijr@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 30 Mar 2026 12:01:21 +0300
X-Gm-Features: AQROBzAJlCYZ1qksJI6bEc5kZz2msgaviXs2W8o_RrnvqF0jEUpazJKF1xxV-BU
Message-ID: <CAHp75VcOi_fhSGnYn0KzsRMdSFmFhzc1kzesW52XEQVJY06ndg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] media: atomisp: remove redundant call to ia_css_output0_configure()
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: linux-staging@lists.linux.dev, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 28, 2026 at 9:27=E2=80=AFPM Jose A. Perez de Azpillaga
<azpijr@gmail.com> wrote:
>
> The function configure_isp_from_args() contained a duplicate call to
> ia_css_output0_configure() using the same output frame index. Remove
> the redundant call to simplify the configuration path.

This requires more information, in particular to explain if the order
has no side effects. It might be that double configuration has side
effects and removal (wrong) one may lead to other currently hidden
issues.

--=20
With Best Regards,
Andy Shevchenko
