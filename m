Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242B43B8D70
	for <linux-staging@lists.linux.dev>; Thu, 15 Jan 2026 16:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768495276; cv=none; b=aAVv1Y1R4xJOdV57v9oWaZYn1FdyxXT8BD3cbhgOvUkmnjOxKhz3lobr4OuySUEgK1+Vz9CBPmZUf4OEWSlLOvDEb9eRh1ZTyyWyZMeiNTMCnstbEdBZGfTIkcqu5sX54SJhFiQs8Jhc1pOPuQA8I9i6RuTUAUeVR49457M6+Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768495276; c=relaxed/simple;
	bh=+4PWdSBg60IK47JG9Drbm1wnM0TZv702uNZZZfQzlR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O6JmVD1MXiGsLS5DqWefJU0LsttPnw6LCLVjJUkVdKXNTXthcWgvJfm4hoOcN2cQh924c6NRVEfzLj1Wc5QP0UztuuE1TGv7yZ7LLDy/SodbCwle31tfFTq3GF9S6dYWoyY75tS48RYQZuCcJymemWpSjO7uPBJgx9s85Syicxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ksKsZ8yZ; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ksKsZ8yZ"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so272639166b.2
        for <linux-staging@lists.linux.dev>; Thu, 15 Jan 2026 08:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768495273; x=1769100073; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/JU/8ioXQOx55JlcUUUaOWyXEMvHCOB13Q3XcCjMtog=;
        b=ksKsZ8yZekDtN0V7vMy6/mTXjtSF5fmv2e9iLnt5DXUxERi/fsYorfllwjwwu5fuNr
         a0iyPOLfmFgfcYSYcyvE8DbVgYTKGnqYJcoJd6VyJJH7g4XiXLsroyHwDZkBsoCCyOA6
         xc2oi3GitYZ08mP5E8vdkR4tVZ8R/z8RGEqlJbhxmityGtEMBroqYubnPuBgjjOfKr4y
         BfdNGoToJeWOeSIr/jhbqixBQJDtqDNkeb7zN0TKiju+BmEViBtj5rEORF6Pim5ltnqh
         SRjjNg/q9S44FGME/iJFvXJzEfUooHkvO0FrV6GE7cNA1enzES9Ckc0Ny3U7Wml2pRgS
         KsHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768495273; x=1769100073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/JU/8ioXQOx55JlcUUUaOWyXEMvHCOB13Q3XcCjMtog=;
        b=vgZ/QOKoVFM41sGBgOvmu9xl2OOSR58YL0rZriArz3ePzpWMv5KOwpxDGddSo0OCJa
         0w7000mZMrTmORe2fQWROcQFnodCrBjRpI2aeYnNE9XyGbEvzkgEMqh2ec8vL1pIT4qc
         g4yARAioHkuv8cCflQLvXx5zHPxj6YkBGI/CB8KVHq/+dJJs1/1ByxZW1scIdsqYNReO
         dm4G6XQ7cctmyOP5Ipv8r7dhJQZnLMdcMK7/3yB0fggiW3neUrtpuRIuL9JUT3naecmN
         FI0y/MPb5M8gQXEa2ZqJW2W7GwH4Q2MBt9ipfAV3GBzEBbp7NeFaATBQnqPDdHwxTyIl
         LQuw==
X-Forwarded-Encrypted: i=1; AJvYcCU7ofk5nGrrFMgAxA7+1Ag6iVK//QQe34/DtzS0fyg/Jv4KkhNoL92VeYFPNUB4KzzkkNaBNoQPl6Peanr4@lists.linux.dev
X-Gm-Message-State: AOJu0YxHNCVfdts7yFh1OXxWYPzP8yUZ9Hyt+UWvsQbFt2nppTV4/qj2
	rSxg6hsbQInqvixGDEmpExKQYGeHpwUFikCT3F292JKV5oIb0vQSyZ0cAgAdAegBio5YyfUNzEP
	pC1RQPivxBYqduMpVR3G53ivW0ntNtRQ=
X-Gm-Gg: AY/fxX4gxU1Uf9SjZu9o6+LTIOSnSkxMd4ijawQIXlv0Ozy1rgGRKo1MsozsLDLNFse
	01MAfpfcx2q82ZLJAcGfBWpdU7Bm1iKPVGarlh87p2L7ng8n09c4dNApDTHMJyQ3DKpPpOl2ipg
	P56TDilYF8FcaWIS1pjp6OIK3eE0phq895TRnJQ5EY0W5gGa9kYh2kgsXD2OkjUvYcdpfLaloFA
	wEt2EUvVpFX/e9lsmW18Pw7g5XBBJLnGqo4XssIl8ygFSXNYg1INgiqR7nt7E2HqyLBl31C6wXZ
	Q57H22DxKNm3a1hAccL05RjVAo5urfiCYszNc2n/6lbBlNqP+86aTarN0mvg0FQoeblKdzo=
X-Received: by 2002:a17:907:6d1d:b0:b87:2abc:4a32 with SMTP id
 a640c23a62f3a-b8792ddb989mr21591466b.18.1768495273050; Thu, 15 Jan 2026
 08:41:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aWjiwto4BQS8Uudz@smile.fi.intel.com> <9980e019-d95a-4618-887c-2126e38cba73@gmail.com>
In-Reply-To: <9980e019-d95a-4618-887c-2126e38cba73@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 15 Jan 2026 18:40:36 +0200
X-Gm-Features: AZwV_QgH_P1lsy51S6XSbgBuUjhJnYU6hcNQlnwXZPC1uHXxEMDopLUuvkCLPxc
Message-ID: <CAHp75Vc4DSk=-tf2oFJyd16GSSdWO1NELsCPe26BKVKUuq_Byw@mail.gmail.com>
Subject: Re: [PATCH v3] staging: media: atomisp: Fix typos and formatting in headers
To: Hamdan Khan <hamdankhan212@gmail.com>
Cc: andriy.shevchenko@intel.com, andy@kernel.org, dave.hansen@linux.intel.com, 
	gregkh@linuxfoundation.org, hansg@kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, tony.luck@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 6:32=E2=80=AFPM Hamdan Khan <hamdankhan212@gmail.co=
m> wrote:
>
> > Have you tried to run kernel-doc script against this file? I believe
> > it will be a difference between before and after.
>
> I just ran the kernel-doc script for both the previous and updated
> comments. The script doesn't detect kernel-doc for either of them,
> comments even with /** because they're missing the struct
> definition in the comment like:
>
> /**
>  * struct atomisp_dvs2_coef_types - Brief description
>  * @odd_real:  Real part of the odd coefficients
>  * @odd_imag:  Imaginary part of the odd coefficients
>  * ... so on
>  */
>
> Though, these can be converted to be kernel-doc compliant if you
> prefer it.

In this case it's not needed. Please, clarify in the commit message
that even if some comments look like kernel-doc, they are not.

--=20
With Best Regards,
Andy Shevchenko
