Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE4936A
	for <linux-staging@lists.linux.dev>; Tue,  2 Jan 2024 00:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jmnhf3Sh"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7815547f2c5so344801185a.3
        for <linux-staging@lists.linux.dev>; Mon, 01 Jan 2024 16:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704154827; x=1704759627; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTaEp3XVmk5hBWJHtuJ1RqHFEs+keboZK7LqcHaxz3c=;
        b=jmnhf3Sh5LenuHvPzaI5V8YF7WipCbh7EOygw+mT1lIWCBljMP8LaUQSNWQOjEqTGV
         JLBKUpQhcgXhiXewDnjyUxWLzSKGAHC7YbrvaDfQU8metJ/O2I+HIupqO1xrpEH7BYP6
         Door4CF7mD3Z0ZAJBFdVIoBkC8KOHE7ryZI8/63+Y7MfdYAR7ic77Nq/xxG94uqMUp3f
         yfomlID1xNXYw+ZG3OZmTiVdDZ85llueE/ppNQ9e4rI3ngkXjMZxPJOkEeKHGLH8td4F
         fXbtOetxKS9aCSzu3VXq8pOOfEI5U4dUtijkSE9jAO+N4gd32Zr+GzDJ3v/po8fJTJqD
         oJ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704154827; x=1704759627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rTaEp3XVmk5hBWJHtuJ1RqHFEs+keboZK7LqcHaxz3c=;
        b=CC7M77KD7Hjr75+WwEG5XDs9bFHpcU4LPcmUe0y49QFndUr1b/HIW6w28y5znM0CSx
         SlT2E4E8YC4zkC0JfpyVaHYpX8muV1Zs+KmBq+/7uoWJ1aDeI3yrGAxvcZf09bT9rE62
         oRjJJ8CCqeSXcfLHOYK8vF5zpPF+XOBFXXQg4GWUhFuMvGO7b1lNSEQGq3dIhm05clJL
         hOnPNfT3v2xXjXJZ972guCuV9kBB6ucjXsq8biWz7XGjviy6rclvDBwkCHLoZf+0AgvE
         eJL6XW/5i7LhUF0pUZAkK/t19B2PloMontc08Vzm7U0eo8IejkTSWzW2o33vDhY9NWDp
         GaPQ==
X-Gm-Message-State: AOJu0YzyUQ+zGncSV7mbYojYo2Gj9Z991FiA3RMLXDcr2clL3BVULcNy
	8Agri1KycfBA9bgg5GRYlf9htlSFcjTvOOHxtXk=
X-Google-Smtp-Source: AGHT+IG7C6zjsI21HK5RH9vZz18r3pG4+41+gLHtVqdN9XItmbIvm/ebng0goKX7sdhkxsUxf5ePHdQAaO9hJp0b0eE=
X-Received: by 2002:a0c:eb84:0:b0:67f:be16:819a with SMTP id
 x4-20020a0ceb84000000b0067fbe16819amr10962323qvo.72.1704154827014; Mon, 01
 Jan 2024 16:20:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231231103057.35837-1-hdegoede@redhat.com> <20231231103057.35837-6-hdegoede@redhat.com>
In-Reply-To: <20231231103057.35837-6-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 2 Jan 2024 02:19:51 +0200
Message-ID: <CAHp75VdRny9rUSb9Y9rgeiAFkhHR=9LO45BsQbZk0X4U7CEhfA@mail.gmail.com>
Subject: Re: [PATCH 05/15] media: atomisp: Drop is_valid_device() function
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 31, 2023 at 12:31=E2=80=AFPM Hans de Goede <hdegoede@redhat.com=
> wrote:
>
> Now that a single build supports both the ISP 2400 and the ISP 2401
> this function is no longer necessary. The main probe() already
> contains a similar switch (id->device & ATOMISP_PCI_DEVICE_SOC_MASK)
> checking for a known device_id.
>
> Move the revision check into the main probe() and drop
> the is_valid_device() function.

...

> +       if (pdev->revision <=3D ATOMISP_PCI_REV_BYT_A0_MAX) {
> +               dev_err(&pdev->dev, "revision %d is not unsupported\n", p=
dev->revision);

While at it, can you fix the logic error in the message ("is not un"
-- double negation)?

> +               return -ENODEV;
> +       }

--=20
With Best Regards,
Andy Shevchenko
