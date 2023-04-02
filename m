Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F0A20FF
	for <linux-staging@lists.linux.dev>; Sun,  2 Apr 2023 07:51:49 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id cr18so21785739qtb.0
        for <linux-staging@lists.linux.dev>; Sun, 02 Apr 2023 00:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680421908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1kev5lGnYl9exBxbo7HITOJ9okxdqV36iQsHfcoheo=;
        b=e7w5V/xv/AGhql2BTs3CwsK9aQPdfyfjYXFwxfQL32wQrSe6POx4o7f8KzZmUWLuAj
         wyIpxh+i/WXm7+xG1XCZh2kmvMNtE6LzyGGpfOVku9Rc+efspfqo6OkWR+vffxZGv9HA
         vxkWu/WtMk6YenBVOss/xkJarOSio90ga46AatutbryxbztrcW3pKbAwxsRhTP5IVKzQ
         ITrQPG+NDGOtkdkyeNUrxWmfKxKPg05cstDjETwz1/d1D1IqQp0oHLO3igKP0GAqdTJN
         PyYMYTLW2FZEYCinNzh88X3JltftX6DZsSKUHJtwCYNlO7apEllTcJ2gHyZfnbJnGxhB
         Bpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680421908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q1kev5lGnYl9exBxbo7HITOJ9okxdqV36iQsHfcoheo=;
        b=rUq8EVMBMi0D3KOTi65tv7WmlrV+WTbxlGeCKevYwYu8qAmGF0GewHKZ6ViV8njMJX
         zGMlb9J7OZ0awNi/yDicsPmLfx/WeNR1UQWHl4Go1rVndQkZxwF+AjG8k4RHU+6MHhYR
         0UuzGfVCgcj20Fo+RuxDjrqCNHjhRBtFkPeHM+j4OHBTsmqCPqXoOUmB1ErSLtP3kji5
         GLfiU/zgOowSnCSRQPhwpoS32WbgJovRSusl8P8M75x2eupjwkQin4A/i/CMNEKyHiRZ
         ujalxx2WcNTVb0hvLkW7dhcD2XoVzJ5iUEk+o3cBsIz5jXigeKdlAxTC+nSqyBW8Kmyb
         YyqA==
X-Gm-Message-State: AAQBX9db9zlP1toNt31nOBdGtUXN+Qnagm4rTTyqJlvWMOeg9IWXiT6r
	tlWfdJtYiCl8FMgdzHVpPhugdzze3MSxXx+K+no=
X-Google-Smtp-Source: AKy350bgDNQl8bnuQC5gGutq62OJ+gAKaLCOz5ngp/ih/eA96sFu2L5254x1xvbHlnKClbQvEBCu2R3NqqBAD1U6VY4=
X-Received: by 2002:a05:622a:199a:b0:3de:d15a:847f with SMTP id
 u26-20020a05622a199a00b003ded15a847fmr11911098qtc.0.1680421908600; Sun, 02
 Apr 2023 00:51:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230401145926.596216-1-hdegoede@redhat.com> <20230401145926.596216-14-hdegoede@redhat.com>
In-Reply-To: <20230401145926.596216-14-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 2 Apr 2023 09:51:12 +0200
Message-ID: <CAHp75VeytuuGQ9QWpH0447V=rhuPmKxRphJhst+PZU-q=2K1xA@mail.gmail.com>
Subject: Re: [PATCH 13/28] media: atomisp: gc0310: Add error_unlock label to s_stream()
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 1, 2023 at 5:00=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Add error_unlock label + goto error_unlock on error to remove separate
> unlock-s in all the error-exit paths.

Another possible solution is to have a separate (unlocked) version of
the function. And hence call it from the callback like

  lock
  ret =3D ...
  unlock
  return ret;

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../media/atomisp/i2c/atomisp-gc0310.c        | 28 ++++++++-----------
>  1 file changed, 12 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers=
/staging/media/atomisp/i2c/atomisp-gc0310.c
> index 6c0877ab96e3..239fc9012910 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> @@ -432,31 +432,27 @@ static int gc0310_s_stream(struct v4l2_subdev *sd, =
int enable)
>         if (enable) {
>                 /* enable per frame MIPI and sensor ctrl reset  */
>                 ret =3D i2c_smbus_write_byte_data(client, 0xFE, 0x30);
> -               if (ret) {
> -                       mutex_unlock(&dev->input_lock);
> -                       return ret;
> -               }
> +               if (ret)
> +                       goto error_unlock;
>         }
>
>         ret =3D i2c_smbus_write_byte_data(client, GC0310_RESET_RELATED, G=
C0310_REGISTER_PAGE_3);
> -       if (ret) {
> -               mutex_unlock(&dev->input_lock);
> -               return ret;
> -       }
> +       if (ret)
> +               goto error_unlock;
>
>         ret =3D i2c_smbus_write_byte_data(client, GC0310_SW_STREAM,
>                                         enable ? GC0310_START_STREAMING :=
 GC0310_STOP_STREAMING);
> -       if (ret) {
> -               mutex_unlock(&dev->input_lock);
> -               return ret;
> -       }
> +       if (ret)
> +               goto error_unlock;
>
>         ret =3D i2c_smbus_write_byte_data(client, GC0310_RESET_RELATED, G=
C0310_REGISTER_PAGE_0);
> -       if (ret) {
> -               mutex_unlock(&dev->input_lock);
> -               return ret;
> -       }
> +       if (ret)
> +               goto error_unlock;
> +
> +       mutex_unlock(&dev->input_lock);
> +       return 0;
>
> +error_unlock:
>         mutex_unlock(&dev->input_lock);
>         return ret;
>  }
> --
> 2.39.1
>


--=20
With Best Regards,
Andy Shevchenko
