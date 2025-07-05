Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048691C5D59
	for <linux-staging@lists.linux.dev>; Sat,  5 Jul 2025 18:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751739043; cv=none; b=VQC0++oxt3jr05iUX7xp8bSxjpn1VRhOWFAGsmhf0E+Im3V45Vx872ED0O2++3KOZWPfWpna35Dv/p2n8GZITlo6U/3pIVIWGA/YPpWMV7NNxQtO8UTOTI0xoPLw7PtZLibjeCEUZ0ZiVh5CQbFEFZ5OGqaV7JOqNURsNnNG3tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751739043; c=relaxed/simple;
	bh=ePrYXgOzX785VPMnMe2O691qcwwLURufjdOTHMlasXs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=biKq5mUqMvuClqWgLaPn8oPKxEbcuFeUvRfxLjCRkkLc4dL6gCr1Tv/o0UiO2k087droWMwg7ExCqvIEItNfpaQIHGsH58wbQpxA9bvjWzBPrgzbZg/mPkmXdioSLWcNfDII86WaCoj6VhGEaHA5vmDC9upbTqfPZMYnPg+lefg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HtMQTiev; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HtMQTiev"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ae223591067so302536266b.3
        for <linux-staging@lists.linux.dev>; Sat, 05 Jul 2025 11:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751739040; x=1752343840; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YNILwY6JtxDju730mgZnPVFOLO4HNV+nHw1JvlLMVAA=;
        b=HtMQTievXmOa4mVLvn2eKwBsEpWGQC6slrvY61OOcYPzFagENq44oXoACzpAEP/eOH
         o552c2lcWcF24azT0umf2XQGm9Hu1yqwXTFimPsK28tfTKj9g8dXex5tFiBwn10LYTD5
         W9VIBx9fbeJphDYgfkOxwBRAxO56ojGHWEe83qt1v+huA3K9ZGw6OXpUTeN+jnIAZTlr
         Mpo4Mqirn31S/4YzCBp+xexk1q971kbQlmoeSwFXJfoJI8CgK47EaaClzPpeWRMYd3uY
         gkUHffEynvNkLYk69KAeiHbZYlIcMRRoShHuqax9qxpFx3IOc3ZWGTlcWBXF2phwIpA2
         RGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751739040; x=1752343840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YNILwY6JtxDju730mgZnPVFOLO4HNV+nHw1JvlLMVAA=;
        b=H2ii5Be0gfYIB057SHdhucXBGt2AImfPncaeFE9RcXAmzUYRTf6BJ/GtzJwJ1hpa6J
         GksD2EFC/90WWZl1mpycyUuG7BZ05hg3dytzJQqRSOg2S8JAa3T6YPmaIAubhRJkrG8H
         yBkalpEW006WsXwn0nQ2jbDZ1AGbIXF8QoP3ADrYmZnpwFPGFDyTzgHa/0A83Nyc1PDA
         umy+nRi6tvdq07upi3LtlO29zuLggFMr72sD/5ESayeaXUsPjKDJspIxOSHlByVlQsX2
         qCJN8knMj4LjTY5I9PiZP374Dzdt8Mi9k6CTEL6Qz+Sq5/VXXW6ODJsNdVVHWh+yGacO
         C6fw==
X-Forwarded-Encrypted: i=1; AJvYcCUnzpWM6HvJdIgo1i9E1iyNj5tfu5s4YWe/Svx9U/58L4yBWauaVuUrNjRKuLOfvT5zUiLymYByRO4VPX4c@lists.linux.dev
X-Gm-Message-State: AOJu0YxdkwtAvAFD9WzD+34LmObYs3dhpi2Q4EIsiB/DMxGn1tYAIDe/
	V6zM9nYXCvxd4obWbpe+diYUNGJ6V487vZuHKn6pe7Wgt1vToBDbCZuI7g1AdQlQnrl0I79BGGV
	tVDifnG+pxRy3Uac+/OCPrbhazLbZrk8=
X-Gm-Gg: ASbGncsiSKQwnmoEnYg75ZXqJ6Lezht6MZP8X5zBXOW1+f4Y+9adGJ2uQEUFjaL7TxJ
	YBJUOeuMS4gg8BSDvsfEut9xj6YvNlPwVx+rVY2DniNTJQc6XX5EzIiwqTTF/HYyYs2vzYNt89E
	FaDvWMZ4TbJFY9pQDPSdUaqpsxzZv1ncaNWqorC+b9tMc=
X-Google-Smtp-Source: AGHT+IFeU1lMqRJti7UDXI9CMm8KR3it2mi8/2mz6fFw3tT4TDTp0OI5K7lZjffRjb77cUhX2MCcMe0QXmqS8UQtBBc=
X-Received: by 2002:a17:907:d93:b0:ae3:61e8:c6a8 with SMTP id
 a640c23a62f3a-ae3fba363a1mr671064566b.0.1751739040048; Sat, 05 Jul 2025
 11:10:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250704-new_atomisp-v8-0-2a8560cbd9be@gmail.com> <20250704-new_atomisp-v8-3-2a8560cbd9be@gmail.com>
In-Reply-To: <20250704-new_atomisp-v8-3-2a8560cbd9be@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 5 Jul 2025 21:10:03 +0300
X-Gm-Features: Ac12FXyxsUmqOwiU8nL9e8ipr59xYfjyV_c2ZD-BbyFglJsuEQ2Ta4EOOMuy2-M
Message-ID: <CAHp75Ve7y3pmZ5g8YXLNHyZgmZpiZNAuDdNfmhxYTOATrDBz5Q@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] staging: media: atomisp: fix indentation in bh
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
> This patch fixes tab/space indentation issues in bh
> following kernel coding style guidelines.
>
> No functional logic changes were made.

...

>  void
> -ia_css_bh_hmem_decode(
> -    struct ia_css_3a_rgby_output *out_ptr,
> -    const struct ia_css_bh_table *hmem_buf)
> +ia_css_bh_hmem_decode(struct ia_css_3a_rgby_output *out_ptr,
> +                     const struct ia_css_bh_table *hmem_buf)

Same comment as per previous patch.

...

>         to->y_coef_r =3D
> -           uDIGIT_FITTING(from->ae_y_coef_r, 16, SH_CSS_AE_YCOEF_SHIFT);
> +               uDIGIT_FITTING(from->ae_y_coef_r, 16, SH_CSS_AE_YCOEF_SHI=
FT);
>         to->y_coef_g =3D
> -           uDIGIT_FITTING(from->ae_y_coef_g, 16, SH_CSS_AE_YCOEF_SHIFT);
> +               uDIGIT_FITTING(from->ae_y_coef_g, 16, SH_CSS_AE_YCOEF_SHI=
FT);
>         to->y_coef_b =3D
> -           uDIGIT_FITTING(from->ae_y_coef_b, 16, SH_CSS_AE_YCOEF_SHIFT);
> +               uDIGIT_FITTING(from->ae_y_coef_b, 16, SH_CSS_AE_YCOEF_SHI=
FT);

Not sure what's going on here. But I think this is just a churn.

...

> -#define IA_CSS_HMEM_BH_TABLE_SIZE      ISP_HIST_DEPTH
> -#define IA_CSS_HMEM_BH_UNIT_SIZE       (ISP_HIST_DEPTH / ISP_HIST_COMPON=
ENTS)
> +#define IA_CSS_HMEM_BH_TABLE_SIZE ISP_HIST_DEPTH
> +#define IA_CSS_HMEM_BH_UNIT_SIZE (ISP_HIST_DEPTH / ISP_HIST_COMPONENTS)
>
> -#define BH_COLOR_R     (0)
> -#define BH_COLOR_G     (1)
> -#define BH_COLOR_B     (2)
> -#define BH_COLOR_Y     (3)
> -#define BH_COLOR_NUM   (4)
> +#define BH_COLOR_R (0)
> +#define BH_COLOR_G (1)
> +#define BH_COLOR_B (2)
> +#define BH_COLOR_Y (3)
> +#define BH_COLOR_NUM (4)

Doesn't look like a good change.

--=20
With Best Regards,
Andy Shevchenko
