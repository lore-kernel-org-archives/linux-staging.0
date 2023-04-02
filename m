Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9032B20FF
	for <linux-staging@lists.linux.dev>; Sun,  2 Apr 2023 07:21:51 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id g19so25566330qts.9
        for <linux-staging@lists.linux.dev>; Sun, 02 Apr 2023 00:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680420110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjdq4i/yvr99yDoA8fH6nnKaTHAm/8hSqA9UfaiODCA=;
        b=eWQpGXmy4MRER1kHXqDABDPZXyJRPZbBC40LgLO9t5Ds1cc3iFnmDs/QxenV0ZigMZ
         3ty3a8km3R1ZUF+rmHM99XKhrOq8sa1WEPGjNt6QCSuSdeLEFPJHHfiqPxZUUQYtXoNV
         lpCn4sF0Dr8cgsOyF0XUABQZ1m80YoP3Stnp3rRMGP1ePIP77tlcyoK/jXFrpbml18fa
         l54xsZDWU/vCkw1G79i0EE74cUQfPLOy3aT9DnqGr+9m5zz+9oy2YoXfJlw+rWLa18iZ
         i+SPilGcg/gw0QmtjkGscOMBJGvaqMblXSEMgWeZqPteI0duy+CiuqdKzbtaOmj+lMKg
         YG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680420110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qjdq4i/yvr99yDoA8fH6nnKaTHAm/8hSqA9UfaiODCA=;
        b=MbPLAT5NbZ1RMP8aOryzH7WukgV93Cco+AFDO+6ZaT/9Im+XaL7s4iJp/pJMxxuWRK
         t5N2uzp4UuG5z43R38EsXN/HNHa2yVj2U4ej/F/eFfnIRQBj422Mzq1jFO5g/mH+x2Pr
         Fh4WAsuDJMnx+fsfcSyHmHOrgp9T4TB35mhnz9DXAOXpTp6guwTPNZylZ8xOwGFBCZIl
         5/fk2H06pOfmqy0Z/LR9Lly97QNoyAH09aesExI6ikOybdxDl2tAabQ+XmSKWuEORHYw
         rA+qHPmFUgxIUCjBZ9/Rx/pIi/t1zgTx4y4DzLyG8g+G3nonDZZAIoW0mLL4zgDCBXJn
         1Dcw==
X-Gm-Message-State: AO0yUKWAZHcIdNdNTKPLWp6ySU7sw1g19ya7MJCWYJSBwfp39tKy/xAq
	39sIsdEdJaH3ZKcLEEuBQi51FxSeUknDq8uC/Bc=
X-Google-Smtp-Source: AK7set+/o8I+pOM249w+yltK84BH9CxqpLGT0JxmGLIHPa7+wKv0vGMsmocxR3xdstMrH2OiHznM3LrlCcLjvqviypQ=
X-Received: by 2002:a05:622a:b:b0:3df:58e7:4aa5 with SMTP id
 x11-20020a05622a000b00b003df58e74aa5mr12411156qtw.0.1680420110420; Sun, 02
 Apr 2023 00:21:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230401145926.596216-1-hdegoede@redhat.com> <20230401145926.596216-4-hdegoede@redhat.com>
In-Reply-To: <20230401145926.596216-4-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 2 Apr 2023 09:21:14 +0200
Message-ID: <CAHp75VeOtAsXLDjn4zQ9JZ7LvbLkGPGw_wt_iyW3GrMAJStRSw@mail.gmail.com>
Subject: Re: [PATCH 03/28] media: atomisp: ov2680: Error handling fixes
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 1, 2023 at 4:59=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Fix s_stream error handling

This looks like it should be part of the Subject (missing period).

>
> Fix 3 error handling issues:
>
> 1. In ov2680_s_stream(), when pm_runtime_get_sync() fails it will still
>    have incremented the pm-runtime reference count so we need to call
>    pm_runtime_put()
>
> 2. In ov2680_s_stream() sensor->is_streaming should always be set to fals=
e
>    when the sensor is powered-off even on i2c-communication errors.
>
> 3. In ov2680_probe(), call ov2680_remove() on ov2680_s_config() errors,
>    so that pm_runtime_disable() is properly called to disable the
>    runtime-pm which has been enabled before the ov2680_s_config() call.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-ov2680.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers=
/staging/media/atomisp/i2c/atomisp-ov2680.c
> index 3181276ed027..63de214916f5 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> @@ -419,7 +419,7 @@ static int ov2680_s_stream(struct v4l2_subdev *sd, in=
t enable)
>         if (enable) {
>                 ret =3D pm_runtime_get_sync(sensor->sd.dev);
>                 if (ret < 0)
> -                       goto error_unlock;
> +                       goto error_power_down;
>
>                 ret =3D ov2680_set_mode(sensor);
>                 if (ret)
> @@ -447,6 +447,7 @@ static int ov2680_s_stream(struct v4l2_subdev *sd, in=
t enable)
>
>  error_power_down:
>         pm_runtime_put(sensor->sd.dev);
> +       sensor->is_streaming =3D false;
>  error_unlock:
>         mutex_unlock(&sensor->input_lock);
>         return ret;
> @@ -644,8 +645,10 @@ static int ov2680_probe(struct i2c_client *client)
>         pm_runtime_use_autosuspend(dev);
>
>         ret =3D ov2680_s_config(&sensor->sd);
> -       if (ret)
> +       if (ret) {
> +               ov2680_remove(client);
>                 return ret;
> +       }
>
>         sensor->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
>         sensor->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> --
> 2.39.1
>


--=20
With Best Regards,
Andy Shevchenko
