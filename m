Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072981C5F14
	for <linux-staging@lists.linux.dev>; Sat,  5 Jul 2025 18:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751738782; cv=none; b=ruxFJm8881C0+86mkUyY7hz2wgAKM7NY3ZOq4byjJszqTOOjQviZw23CFTCDbssCE9USRkO1jYjEr8PlabeO+hquRcWRQfe3r+cOvZdUdy2Rxr2clfF6fyAlYwd4+2fYDVp53fcErutMaWA8B8jOX87uu0RwSuoJtWqIJ+qKPek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751738782; c=relaxed/simple;
	bh=uR59lb9H/lfgoU9Sn+rQKcQEZ1rNsprAnKuqExnCuvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DWBO7u41XIdRMH3NR3z4D0d4Dl1BfPwWaErnCPgmAG8yCJOU32XjgWyY3FpweNj0OR2VAQDUuixZE0dZ6jCcqHBG3uwtgVAYtydQTUQyQie70ezErdv2uSxntLUMCaaB2wjGbgXfMjCfj6nsfsxsr0DbsX9F0mQx8XK4WncE/Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+2LtI/A; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+2LtI/A"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ae0dad3a179so306197566b.1
        for <linux-staging@lists.linux.dev>; Sat, 05 Jul 2025 11:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751738777; x=1752343577; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2r57m1/rYYXdbfa/z4iUUp6uIVwbvm+uoIkvDFGx3vE=;
        b=T+2LtI/Af3t6eO0UVfsCGqN09k0xMLeutFNgXkleBTuxGfoOV4uQnj1V968laET2iA
         TkZDU1v6G9xzo/b0vQJ9dZzMFf0QiUMyadstEAQNd8xvFIQ3JKzmyzyavPN4Fc8vP6V1
         WCIbeJG0Tkw3uSKg7iDihVwRIZSAygwZc75sVfU7fk1He9HpGCD8rFd8sAVp9KRY+tD0
         yjpGHSFuD/5LsCRI3OsEuFqOhvS2biugSRYACIxMI6HYnyepiGheXNUhReuw8auCdlGK
         oXDzUfqKZf4BTjAnvyR/vxd+PAJ61h6QEoCFEhiTOSLCwvjz6Tw/SXj7wRWt8zzQB2SY
         pfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751738777; x=1752343577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2r57m1/rYYXdbfa/z4iUUp6uIVwbvm+uoIkvDFGx3vE=;
        b=J+m1QHHvKDQ9jSKfMvVJktad1wi0z08CsoNGgmGU6wfpVpzNNs6DsjIuA/KAJjKvwh
         5RmMrvPO8xojob4v+iO10TuvbnQKFSljrj7n5utQGPSgswWDkCRNyJK9Y59q+NiNmkKi
         XMbzPGWQnvOy2kTbdqzSZcyUZvjBwsqZStz6VRevRV0nCBUL3saZHWoDyxuR4i3ck/sQ
         WIlR2z+Gk3gPPfrgFupuX2wKMgiruetBPQKI5z1VK01JZ3xVmk0saVW55fp6TD+7TO+X
         YXwE0cUTX3jvpFfzzyK9Ug2PR6qexxH6H6deMaF15WvF5H89Lcrwz7GOGpZz0tUP3UL1
         vafQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCJPzkrnOJoseMYQVhOHA5XDGP2TSqKlvJ2U2dzH21CKuwHuYrWwzaOaqHjRNS/eBElrryO/jCJ4Q65yF2@lists.linux.dev
X-Gm-Message-State: AOJu0YwtwAb5LXuUe/iFu6gJ+kVG3PZRNGPoqWWGYI3UQBdsVdyjt8n8
	zlQHfI7AjT1aCZo8h5ytOYsvlM7i59WCcGDuIAp+kkvh01/ENQY6ALe09H621VSbYzugxWSe3xB
	0bomqo+hKdGnUKeyn+0nhr4hubFTlxEAxulGR1J9XyA==
X-Gm-Gg: ASbGnctnOPmMoBzL8Bp7wzLHYrkKGdtD4UeHfduS8byUNDRpaEUl7ul2uMj9abaKA5N
	IEk1j8jH3zkoVN9LlKV8QyEw3ovF4fJ5QSJYoCsiOgjW1rwhjrN8o8gg2yIfQ3Sn3rSLzXZ4Sir
	o2il3OesjPm974RCbyyRD53uap6K+mnsC0RNNTc2qc5H4=
X-Google-Smtp-Source: AGHT+IEDfHyDt38OunkkIya8vKcdY96VOV+ryvPNgk44Qbne1Sw/BiXVwzmd0z0H+gWDDQpeNgZYUITNAg1JkyW8CAw=
X-Received: by 2002:a17:907:7f8d:b0:ad8:9f9d:b139 with SMTP id
 a640c23a62f3a-ae41079eca6mr259561166b.5.1751738777030; Sat, 05 Jul 2025
 11:06:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250704-new_atomisp-v8-0-2a8560cbd9be@gmail.com> <20250704-new_atomisp-v8-2-2a8560cbd9be@gmail.com>
In-Reply-To: <20250704-new_atomisp-v8-2-2a8560cbd9be@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 5 Jul 2025 21:05:40 +0300
X-Gm-Features: Ac12FXxc0pLzjFm1T_riYbWX52EozYkvE-lyJ6R0GNlauuX5KTWJMb5xmhXu-8U
Message-ID: <CAHp75Vdd8aOhQ73opych5WohuM2CXq2dPgdgHW0ZdYHRU=u5WQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] staging: media: atomisp: fix indentation in anr
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 6:41=E2=80=AFPM LiangCheng Wang <zaq14760@gmail.com>=
 wrote:
>
> This patch fixes tab/space indentation issues in anr
> following kernel coding style guidelines.
>
> No functional logic changes were made.

...

> -       {
> -               0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
> -               0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
> -               0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
> -               0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4
> -       },
> +       { 0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
> +         0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
> +         0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
> +         0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4 },

This change is not okay. Please, leave the curly braces on their own lines.

> -       {10, 20, 30}
> +       { 10, 20, 30 }

This is okay, but also makes sense to add a trailing comma.

...

>  void
> -ia_css_anr_encode(
> -    struct sh_css_isp_anr_params *to,
> -    const struct ia_css_anr_config *from,
> -    unsigned int size);
> +ia_css_anr_encode(struct sh_css_isp_anr_params *to,
> +                 const struct ia_css_anr_config *from,
> +                 unsigned int size);

Don't we want to have something like

void ia_css_anr_encode(struct sh_css_isp_anr_params *to,
                      const struct ia_css_anr_config *from,
                      unsigned int size);

?

Ditto for other similar cases.

...

>  /* Application specific DMA settings  */
> -#define ANR_BPP                 10
> -#define ANR_ELEMENT_BITS        ((CEIL_DIV(ANR_BPP, 8)) * 8)
> +#define ANR_BPP 10
> +#define ANR_ELEMENT_BITS ((CEIL_DIV(ANR_BPP, 8)) * 8)

Doesn't look like a good change.

--=20
With Best Regards,
Andy Shevchenko
