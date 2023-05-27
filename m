Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFABD11CA5
	for <linux-staging@lists.linux.dev>; Sat, 27 May 2023 16:55:59 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-3f6affdb6ddso20619441cf.0
        for <linux-staging@lists.linux.dev>; Sat, 27 May 2023 09:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685206559; x=1687798559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lH0bUvk7oNCPhxWVOtStQj8MA++WeEbKtVXwYNQy7Rs=;
        b=aLXhDlfvNxkNa5WThTTi0r/KAqgFZrOPVq780/1xREsIn2l75c1st5w9280J1stx9t
         K/AFisqbcxIHcaTGG79RUNXmLt2iZKKYL3Hcy293nV0yQE5adrBHlVOQ6jD1TkrfkEVM
         CDszVSMAu8/3+pTPWt9g4EE2tPzWoA+upUdtx1vmW4U7LEab6iVdXQFcKG/srykFS2Z2
         prDXk4xd4yG41qVUq/PMUaPpUewd/p7RkP33m22PMNiLqe/mgJvnQ49Wn3+rYPIbi/rv
         k645NisJb4yJCLUA75Yz1p2QfnbtRj85PPfaelItnjUJdFkRTJ0NmspKe5CHe9qzW3MC
         Kikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685206559; x=1687798559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lH0bUvk7oNCPhxWVOtStQj8MA++WeEbKtVXwYNQy7Rs=;
        b=Q8v/iLGqLZmjnFuyBptl4roRnzQ+TkhYE9f22mTczhLqd5J8A1EQRyEeOuxjyuVqo1
         csQPF+xHcEkuGwnZb2fmPPyQNo4YyVsYroZi5N5jNk9LDXNtsUyhtw0D26Owq3EMp9ZU
         CW63GWyvfHV9FKnh7m00od/IDkZVnu1JVBPlltxoYXGKQreYRrIRfRMiylzayt4/T+wZ
         fQrWOfOtSs+aKiBN5Z8q17S7BufIIOtcniwAwNFCWgBgP200QbJa7tB1r2tj/wUbtnVr
         IpH+/8H1LE1BIZB0qU5ByWx/unVcEIUfTxkClQaKapvKA/EUWKaoNOKjbV+k7N4FX2F9
         uXWw==
X-Gm-Message-State: AC+VfDxx/FGtoR9ZTKcswqJuV1D8VsrlI6CPXAvhp8M2Pyyo9ml5d7KJ
	pqaLJgVzxIdLCWOmkRbTauT/ym6dzaOR2e66ZgU=
X-Google-Smtp-Source: ACHHUZ6l6FvS3s1PCavnbOgAvnFktfcirUFQFse24VKtzOAVMKvayFb5XfzFHS6Lsp8yQjCzHhO38mcrLC1AX3ILZFk=
X-Received: by 2002:a05:6214:1c07:b0:5ef:5049:f49a with SMTP id
 u7-20020a0562141c0700b005ef5049f49amr5552124qvc.32.1685206558825; Sat, 27 May
 2023 09:55:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230527155136.61957-1-hdegoede@redhat.com>
In-Reply-To: <20230527155136.61957-1-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 27 May 2023 19:55:22 +0300
Message-ID: <CAHp75Vf7bCQp+vJH02yJjmooxZSgNna5sRQ=UEq=4LmsDZPsFQ@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: Fix buffer overrun in gmin_get_var_int()
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 27, 2023 at 6:51=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Not all functions used in gmin_get_var_int() update len to the actual
> length of the returned string. So len may still have its initial value
> of the length of val[] when "val[len] =3D 0;" is run to ensure 0 terminat=
ion.
>
> If this happens we end up writing one beyond the bounds of val[], fix thi=
s.
>
> Note this is a quick fix for this since the entirety of
> atomisp_gmin_platform.c will be removed once all atomisp sensor
> drivers have been moved over to runtime-pm + v4l2-async device
> registration.

...

> Closes: https://lore.kernel.org/linux-media/26f37e19-c240-4d77-831d-ef3f1=
a4dd51d@kili.mountain/

Is this a new official tag? (Just to my surprise)

...

> -       char val[CFG_VAR_NAME_MAX];
> -       size_t len =3D sizeof(val);
> +       char val[CFG_VAR_NAME_MAX + 1];
> +       size_t len =3D CFG_VAR_NAME_MAX;

Why not sizeof() - 1? At least it will be a single point when change
can be made and not breaking again in a similar way the code.

>         long result;
>         int ret;

--=20
With Best Regards,
Andy Shevchenko
