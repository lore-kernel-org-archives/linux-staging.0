Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAFE1D5147;
	Sat, 28 Jun 2025 19:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751140362; cv=none; b=h7muwqiWR1cA+t18vyRYqEoNMhftMfXusLum6xKTROd4SvW1kj/PruvWAmV8RU37YLLRCxtRcPLLLTRFXcV7jFIK8Y+G4kz2SDSzOpaRbgNi1W28vjlbVQUlTksLk0cbnoGOkSNAPLZbm+mi43Fuo92/Un4hTHqvzdOFseALCcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751140362; c=relaxed/simple;
	bh=p5dDr/QmlkdAT4RE6psUgiwKICVbxaJ/GCmdG5WoHkg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hYtoDYRiUXeH77QkcKOEM+0QVL1iMdaW+/LuLdqYMIx1DlUsU9rhruAT7gb6mnXxLfawfPldm7aYK8tVIqusTrjrQf514+8STLMOSEgqLIWtWgxdWy8ZtgdHQU8YHwuy7SCIBYwBKIb8kD/g0jxIIsRXvcoNRNvLLBewEnD0M10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7jfsZUE; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7jfsZUE"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ae0de0c03e9so437125866b.2;
        Sat, 28 Jun 2025 12:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751140359; x=1751745159; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5dDr/QmlkdAT4RE6psUgiwKICVbxaJ/GCmdG5WoHkg=;
        b=D7jfsZUEpE86oS1JKtPbAfZ4M6oASMa9Sk0egzJPW1dYDL20rCW7EU9rGu+NTc0n3+
         +tRte8X655s8ve7GnHzt4wmg666Ph9GvqnzfiTfxzW432pPfMqlBXn9BPD3pHGG5WIR9
         zoFGA2/ACbMxEbqphgu8D2ds09ojzImSZ2PCfDeKYsrxj/aZIDdqtdtq+LPv05SwIxls
         st4S6U2PL9BR9EWXTJsnzSJrYZUO8aTz2Hi97bSkPMiFuFCi2Ee8wgj0fv57pto5pxAR
         q+uGdSMM1m588wCa9hOAhBJJjpc+/0AWQDlzNPg4NQS9rOWbWBmopRek+qBWCwbHPOKK
         JHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751140359; x=1751745159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p5dDr/QmlkdAT4RE6psUgiwKICVbxaJ/GCmdG5WoHkg=;
        b=ccaJNqm0ywNGZw/16QJz67n0+iGHfoHMsShYiesvRYZfgp4NH1ih16XIvnsxQzooVT
         yPS2x0IPAuNIIzFZAFp6HNbeyYVy8AyFZPQzWRzHnJrCXyoProem6afeC7Ol4Lqwpl90
         iqwE4yzEHwsybnFLMjkxcSH3XfI7QPF74c1r/nhVFxXYHJ6Pu/YSxxy+5grF+h9Z+SWM
         I23+qHOexNJgiW/mzerVDGkyddCWXopEqrOeU5X4nGm9bEqUu9+rQsGRIRNqmMVislAQ
         E3PnUA4CgkJDqZfkXxrPAuL59JjAzMoIHtGkuV8ia9V1ZQOanvms9t2DCnWXsmQA01Dv
         cvFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQtEGFjJp0KYMxwX3cZUhdvmVcQTPH/5z3uh7NtpLcyzxJBUy9JpGQJ9Bg+vSytZPr+fMgbpYAf01eslvBO4YmD163uQ==@lists.linux.dev, AJvYcCXlg9EKId/Mmxe2WE1+BX6cp5kY8Hg4T0ZhUhec4rVfaDhLhi4ZPe6kLUJi8hvhmtWG3+fNJBPHPJq0cobKdQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzUf3WSOwqKSWFTsxQkcGsAscQ65lfrTq6UaYL3pAbR1abTzuKK
	PG8mqZ1qwxcACQ4nf17WNcl0Z43frKtgG0CuxE7gbx9fgpySSA+zQLXNHGePb5ApzlNljjVNJSb
	SzHb42yetJBxUIZyQlpTkWH0EHi95vbM=
X-Gm-Gg: ASbGncsTm9nN9SSVnCORPNDnYCxRPTw8sYoHKE/LdvgNkWJhKn5H7s446T9Td5gUNaG
	9xDJq2Q2H+yMFXoidUoq5ULsARoHytvYEjFge1OJnJklxVIOY87M0oQDf/8O0Q1KjoWULfuwk4d
	/5nm+IPCz7domTbv/yqUpx/Hm9YSNFoNoxLw1m10ZzBiY=
X-Google-Smtp-Source: AGHT+IFBHBg3vA0AFVg02J52ULkzSBs1nSVBKO1AVzpVaER5V/vml4hMtzUii6kiTf6eFhi6SMgNg7P5g/X4e+kpJ/4=
X-Received: by 2002:a17:906:d554:b0:ae0:4820:2474 with SMTP id
 a640c23a62f3a-ae35015c079mr767127866b.43.1751140358759; Sat, 28 Jun 2025
 12:52:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250628052536.43737-1-abdelrahmanfekry375@gmail.com>
In-Reply-To: <20250628052536.43737-1-abdelrahmanfekry375@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 28 Jun 2025 22:52:02 +0300
X-Gm-Features: Ac12FXwisHFwiusykwimkGfvNJfdF3Mavaq2pBz6g46Qc34NpDDwkbGORGvQ7S8
Message-ID: <CAHp75Vcy3dHRu8Wb2KZ=xK7adz=-P-iuRTeR8vOWzHzZL9uFeg@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Fix premature setting of
 HMM_BO_DEVICE_INITED flag
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	skhan@linuxfoundation.com, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 28, 2025 at 8:26=E2=80=AFAM Abdelrahman Fekry
<abdelrahmanfekry375@gmail.com> wrote:
>
> The HMM_BO_DEVICE_INITED flag was being set in hmm_bo_device_init()
> before key initialization steps like kmem_cache_create(),
> kmem_cache_alloc(), and __bo_init().
>
> This means that if any of these steps fail, the flag remains set,
> misleading other parts of the driver (e.g. hmm_bo_alloc())
> into thinking the device is initialized. This could lead
> to undefined behavior or invalid memory use.

Nice. Can you make some fault injection (temporary by modifying the
code to always fail, for example) and actually prove this in practice?
If so, the few (important) lines from the given Oops would be nice to
have here.

> Additionally, since __bo_init() is called from inside
> hmm_bo_device_init() after the flag was already set, its internal
> check for HMM_BO_DEVICE_INITED is redundant.
>
> - Move the flag assignment to the end after all allocations succeed.
> - Remove redundant check of the flag inside __bo_init()


--=20
With Best Regards,
Andy Shevchenko
