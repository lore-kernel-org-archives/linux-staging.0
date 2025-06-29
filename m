Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3D01E2823;
	Sun, 29 Jun 2025 09:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751190710; cv=none; b=r3Koa98JbJ7vzYgtASBLFze3fEwBzsAXSqwH1/WQVgPrykiZmOQWRrSlAaMl3dGH1gzb95oiVw2Nagnok+YQh23eJC0f2zKNYNN4SQSSc/+sda0YYhw6TWxxnZGrXQdsJKqBUpIwKRTnlGB46DW0a9VGO+bKTkoNmDuYVKT5xOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751190710; c=relaxed/simple;
	bh=k8RPXE4zYKCqoyIqctDMrCRF2OjLbCuVKkOR4TUcHPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l6FrDHzPU79VXStHw0q93EbB9+M4UHwD6bjYOb/lsjVOGB7hvWSSGmk0i01DjK8NUVQmFUkGKiFjtB6Wt/Jx2RcoxzqiBV6xTs67hONvHQrWT1V9woa7h67aAcqP6Ho1Du+pVOYokFIjmlsC1HtzvUbYhkPNO3uIWqDPJLh7tyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WSgs9jTy; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WSgs9jTy"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e821a5354cdso257713276.1;
        Sun, 29 Jun 2025 02:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751190708; x=1751795508; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k8RPXE4zYKCqoyIqctDMrCRF2OjLbCuVKkOR4TUcHPE=;
        b=WSgs9jTyLECVsO/QhM4bM+oY5RYv2YSOmhm9QrrLvlR70C80tpn4Bx7oURhUqGppEY
         NqTQUP6pZs5A/u38joYK799YfBXwSnRF3YgmKc+1e/ytyZtNezlKT5KpNzouXy2d5+uM
         C2P+mtQozp5avmmkFKeMsk/RJ4wVKlY81qmU0Icm0x7TtFGinxScYQuvY5yzdEza5bnV
         aqSQVlwYKnSGzuz0c+Nx6T6f0fLc/Nu4D1GPtbR4WwfKcZIuXZjoTJSQ7q7Sq5TLb3BA
         1SO3f7kifB9IJWPygnEn+6PIb0iwss0MvgihgVsebGNWJb2hRTcZ6IcXhbZ5C3KAlvsr
         +70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751190708; x=1751795508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k8RPXE4zYKCqoyIqctDMrCRF2OjLbCuVKkOR4TUcHPE=;
        b=DE7UokTT0l96VOdoZY+EWvKZPiSfOJfct9S15nY4R1COxpYJFFfwWNwy9kGpt9HdIu
         Acy/w8G/br8heEL3dpaK411nEOMr91v+Fv7A0ohzkaLMGU07oXcPPGetaC7hRewQBCfd
         FWkcSObxBKRBuchZaaeG19WMhKWKRlqYgiFuC76hfGYxMscMTdaneHivgyPYZIk1FEOx
         vnwesbBfipyWOdrU8XCOQXVVJ5r9eC8PbichPlkNRVV1votLt/n6A8g7hvjA4U2Iqt+e
         ZYaaI/hpJo2L6UEuyukbozU7byVLsemuz+M56oVPYdZDb6BhsQcqcjxT104b9yu1x1j0
         nMgA==
X-Forwarded-Encrypted: i=1; AJvYcCUONWrE+u+FDLR/HyW3uXl3tCcM+h8nJz/UfSn/eiOV9J4qqVIuIvQZNOQ8SdEdrQDmBMUeDqjL+gFRBD2Dsw==@lists.linux.dev, AJvYcCUvJak8jTEpLeaLGTYZN9atjjQpddwgqueOH0qZcv3nmiVfJ0DOCg/u0kmftjHTVtAOQ6Vjdt6o8VMLCIn9wknk+tPODA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzaXCpkuQWij2gIPWgYeKONyksAb/MS8AUjnYjsUHIh1qEX9by+
	9N/AEoMsbU0WZsWt8QN7iVfa5OxlA/tI1aNXWjJLlP1HZ1/Fre0zDKB0EIzXSkGRkpk945cB4bx
	lQjrFD7DKzMqKdZdg6Dwn9c84iOJnYx4=
X-Gm-Gg: ASbGncs79f3QGIA4frp4slLbol6Pd5e3szle+9uExzCcqrLCH965ZLP9iMj+NbpI7tj
	Xn+jCvM0bW7v9iYhRZb4Zm52QzTfjyQO1SUAWowC/DaTR4TbAWeoLM/Ja1besK+e7qmGlIus4H+
	apxAXCig6VNqm/NR7uLm/0hBlnS75HHTII3WkOJC/BI6AMkM1T9eiWkQ==
X-Google-Smtp-Source: AGHT+IE1zCQGDrVAgfIsk+i6BRDZoB+gNhbxwwsjvBlz713nxeVKOW/UIDMxAwvWu/w30oxW2qIZHjo1E27CyJ/LJ34=
X-Received: by 2002:a05:690c:6611:b0:712:b566:bf7c with SMTP id
 00721157ae682-71522e96c9amr32474327b3.1.1751190707806; Sun, 29 Jun 2025
 02:51:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250628052536.43737-1-abdelrahmanfekry375@gmail.com> <CAHp75Vcy3dHRu8Wb2KZ=xK7adz=-P-iuRTeR8vOWzHzZL9uFeg@mail.gmail.com>
In-Reply-To: <CAHp75Vcy3dHRu8Wb2KZ=xK7adz=-P-iuRTeR8vOWzHzZL9uFeg@mail.gmail.com>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Sun, 29 Jun 2025 12:51:36 +0300
X-Gm-Features: Ac12FXwklc5VGuRrRt-QHyYEj08pYOpE8P7ygtuAwSEBQrfXn-83tECCPbBZaBw
Message-ID: <CAGn2d8P-uYEULKs+90cr1AZcJW+mtaaZv8oixpePD6ttYR-0dQ@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Fix premature setting of
 HMM_BO_DEVICE_INITED flag
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	skhan@linuxfoundation.com, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 28, 2025 at 10:52=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sat, Jun 28, 2025 at 8:26=E2=80=AFAM Abdelrahman Fekry
> <abdelrahmanfekry375@gmail.com> wrote:
> >
> > The HMM_BO_DEVICE_INITED flag was being set in hmm_bo_device_init()
> > before key initialization steps like kmem_cache_create(),
> > kmem_cache_alloc(), and __bo_init().
> >
> > This means that if any of these steps fail, the flag remains set,
> > misleading other parts of the driver (e.g. hmm_bo_alloc())
> > into thinking the device is initialized. This could lead
> > to undefined behavior or invalid memory use.
>
> Nice. Can you make some fault injection (temporary by modifying the
> code to always fail, for example) and actually prove this in practice?
> If so, the few (important) lines from the given Oops would be nice to
> have here.

I will look out how this can be done. Thanks for the feedback

> --
> With Best Regards,
> Andy Shevchenko
