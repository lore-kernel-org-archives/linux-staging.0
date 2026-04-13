Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B8C375ADF
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 07:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776065774; cv=pass; b=uuSlumMgcpFlSnmh9vIzYfY6r+aaksYP77P2FkokW2CDNQZi/UBjMNWivDIEr+HhgsEeX8dfUGF59T3DABZu0oAXRbqSzzmdCwV5PoVISRB/2TsNLeVxeKaK/nHrQRigbLNWKQPTXSK5ReYUIO0W0Y9uvaf2KhuPNkc12+oqyg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776065774; c=relaxed/simple;
	bh=oboIgUyu5VB6k3JA37msJUTW0oAI3/hO5x6qMzsS4nQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JU3yj3Frxl+RyU3ZkzhXEwR4oBlHIAgrF/Yk4Gh045fGIvvKZ2ApjgvT4tFuz5/McnZgqHM1KGBaUYCzvMJ7YYkdoCjg1nOnR6kA1ux6jBqFOccJmVBP+OBg+XGry2ls9bq3Tlh/YZiqP4GA2+1ocrQJaVfchGkb73yfKYRc1fg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XVl+/AKH; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XVl+/AKH"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b8f9568e074so658518666b.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 00:36:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776065771; cv=none;
        d=google.com; s=arc-20240605;
        b=dHAT+dapsrx2ir6558OZJvS40uhkBn6mIdlNLFDPsP+n+8lyxWX/HJ1i4E7losQBOn
         Z01JINpVM8O6S6xC0TcfPVABWL24lZw+Ghl5wylB12Q6EWY6W9lHwnr6Z2nwIhEAgsJm
         NfTgjx71Mb7fpOD/6MQA90xCeVq/QLLRl4r9jNTdEbMjHaTf9O7RIJh08vOCPPdmmT4p
         izm79//IaMX1XDVxRSK5XtrDp2IfFtH4CRmY60FYsoUVGgTBxcvow+6VNqxZohNXj1Tn
         qvxI1wLTVJxYelomjp3cKWi2tlfMGQANnz4ZrOgHIl+AQzAQHuY4u/RoQo6hNj/UFRWY
         Cvww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Thj1AaSn1ao+dErDYKFE38DjZNWkRUD67LFbETSi4WM=;
        fh=uWRrB4AQdSlcdHKVzOk4niB8qEj1kF7/uuK6gwmIjBQ=;
        b=Inq8i+KsgfXg60yxPhaSzzHs6J9Y/lMbQ3iDo4beDXA4Sjcg36qKCpebFpQsC/GapP
         MOBqAWysec/yf/wZcFmR+uC4FvdhUL/PbTtwUb8BS0mV61Ilxof3VSOU0TYaBx+jPqNM
         0Dy5JFSgRQiuhfr4fVjQTUvvNr1D8GHEZIw6aFlB4PKxJxUMuzD6hhN7eZHtmPb9FkHY
         /ivr0IFZfUGF2aNreG9rravwKQ3BggLbVjxDX55jYhV6Hni3anVuDf/5Uh0ADlcN7cJV
         omVskv1CpPpib5v6eRkU3nQddy2DJZS5NEk6WPHd9WTk2QcTNMzxK/h5ZkOOICb6Cy6P
         Qi/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065771; x=1776670571; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Thj1AaSn1ao+dErDYKFE38DjZNWkRUD67LFbETSi4WM=;
        b=XVl+/AKHlZxch+qDTVH92hDpS8u+VfGiB1r79VktWqpQqMO1K1L2q4vxrBhKSHHS+H
         CdsVumxn0SE02WSj+YLIvbB5eY+Yu4qwXurvjmfqxD61My3MEUJXyMdO3IWUh3YEt66a
         ML6W6/cu/5naRsubY2omc37uYRcf2MlLL38I27h5Ma+BRornKzmxjBMJP07y+TwUUgkg
         /8AUIepNEKHig7Ln6cQ7iWX88AslCYw3OD0yKOORJWvRyy/Mqu0fF+3NLoE2ZIZu/m5F
         yZ79j+q4H8jkjaa6mowzxPPCog/xidjDieztw6Oztic4HyJLoVHIs1JuQbVFO2yh7UZk
         bu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065771; x=1776670571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Thj1AaSn1ao+dErDYKFE38DjZNWkRUD67LFbETSi4WM=;
        b=Dy9zeqKlE9rvNqtEaT8ikYdqqHKLjo8BVEXxjP+Tkbb588TyPXBovE9GrUcLPdDGrd
         KIoBGOPKnn4zuLWeCBa5ErTT+fqjaVC1SMROERbYC+oaby4q0v/j9A62UmgCc2jepG43
         zpXWAz7wAqnWHFXaTgaZDvRGfK1xJSjRLnfy+0IckSIB1xwbPIA8iOGvii4bWJbOSl0N
         uGRkq1z/TCFLZg4zrs9EWiZK/24aAKt2/1b5X23pYg9emb0xFZbAqMCdxyUx/7UTK1cW
         KVXuL+JsXKFEiXUqg1hqaXkpZND4D7irDXVKeceLv0Q+YlYqfwOfe6SraR+t0b3EJPZs
         pVhg==
X-Forwarded-Encrypted: i=1; AJvYcCV/CMbyQQVnXh8B+qEYa4N9PHm4TCEbAWlhcC1/849nCgGwabhoH9mUQMbDZ0aH9ySTojaDhlH0q6F7r6HO@lists.linux.dev
X-Gm-Message-State: AOJu0YwG+Z6cx1ZV7wJiucB9PfZFc6okvrzugU/AeL6T4oa/CsoAoaSA
	FUADc3aMsaoTLkzn1GfVcmJWZk3eH9E/O4oGguhfA0bx1K0y840013z0J7UIHE4e7MOSsYGMoG6
	GTsCUnQjn90pmKdsabpkbDMIPCaqaA+Q=
X-Gm-Gg: AeBDiev7Ue+pyYBy4wjBsCcmN7SQdTtWTUA98uJiUAzydmIZyvJ+Qva0XVdwmB1jyq6
	drR5F6PfRO03KC7s90V+hfuAwC3ymm+Ehi2kXgafdH+OoRInOJCYVZ3tr1YYaj122NxNzU97Uo6
	ye7GrsQhZfeag/dB0skWc4+0Ro8QlVA1atSVfPKVCvSTlskEOA7g7vJNJl/nIIlcUJ1jdSr3nrN
	QKOABCO66y1xXx7OdK8gLEilwHcK2mg0lcwGRkqmKDXZWJF6f7srssNI8544FJdDLu7AIvgGgIq
	X1GenGKRXIxiEyx2Zps48atORJXS2Dwu/nZcjZXyAAWIdYe+jZtc3YzuNFrQwsyt2+XenYGXPq9
	FknxuMSs=
X-Received: by 2002:a17:907:1c16:b0:b9c:d04:e05f with SMTP id
 a640c23a62f3a-b9d72658a55mr684606866b.32.1776065771266; Mon, 13 Apr 2026
 00:36:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ziqbdajRR4fZ-_Ww25Td-vQI4lPfklpXD_pM87A2d1wMTKsMCgxh4hKyrZCFZSo8PXakp6_PYauSQWb3NUlsUnC-LCt6YeT_iIsD_M3GK3E=@innora.ai>
 <20260412000500.62475-1-feng@innora.ai>
In-Reply-To: <20260412000500.62475-1-feng@innora.ai>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 13 Apr 2026 10:35:33 +0300
X-Gm-Features: AQROBzAaFP7LBKqhuZaG2X09TM_U48r-N2j073LiL1fdfjXb7rCDLLaNmkS4tRI
Message-ID: <CAHp75VeL8S-ymj6Q8wfFY7GZ7LWdP365b9fVUmzaxrze1oueeg@mail.gmail.com>
Subject: Re: [PATCH v3] staging: media: atomisp: use array3_size() for
 overflow-safe allocation
To: Feng Ning <feng@innora.ai>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	andy@kernel.org, sakari.ailus@linux.intel.com, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 12, 2026 at 3:05=E2=80=AFAM Feng Ning <feng@innora.ai> wrote:
>
> Replace open-coded width * height * sizeof() multiplications with
> array3_size() to prevent integer overflow in buffer allocations.
>
> The atomisp driver computes DVS, morphing table, shading table and
> statistics buffer sizes using unchecked arithmetic.  When dimensions
> are attacker-controlled or simply large, the product can silently wrap,
> causing kvmalloc() to allocate an undersized buffer.
>
> array3_size() saturates to SIZE_MAX on overflow, so kvmalloc() returns
> NULL instead of succeeding with too few bytes.

...

> +#include <linux/overflow.h>

+ slab.h

...

>                 /* Generate Y buffers  */
> -               dvs_config->xcoords_y =3D kvmalloc(width_y * height_y * s=
izeof(uint32_t),
> +               dvs_config->xcoords_y =3D kvmalloc(array3_size(width_y, h=
eight_y, sizeof(uint32_t)),
>                                                  GFP_KERNEL);

Please, go further, id est

               dvs_config->xcoords_y =3D kvmalloc_objs(sizeof(uint32_t),
array_size(width_y, height_y));

and so on...


--=20
With Best Regards,
Andy Shevchenko
