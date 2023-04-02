Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F186A20FF
	for <linux-staging@lists.linux.dev>; Sun,  2 Apr 2023 07:58:30 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id cn12so22269625qtb.8
        for <linux-staging@lists.linux.dev>; Sun, 02 Apr 2023 00:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680422310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SgHFDIjB9kdprTZGQWAulvUWPjB6z0UITqA9gpqJqrI=;
        b=gl97JasQiCJKma+lsPdkd0scvbt0TgC0zOXjkuF7/N4ruUFQLpKRO46PvaUCnvFVdM
         T7I6BWxV5G+LlyyOPPxVOKqR4ASquKII36M5kG2L8PluP51Y6IQGcHnVTmB0e2mTDEJb
         XscnvR/y7bdmci3uk1Qk2KE39R99XAp4eLqWvfpbVWDawbDhDE5Mc1yZddFipvv6UAxE
         8nm4k5YkVOVEIkr48dny7eWpppLNDc0fURDAWFM1zd66agL2ns2SUS7kjqp670LQIdZv
         dMEPls4bsPlp/GDIWCzWwZpq3EXM0/vSBDoKMOyhOSAPCpAQWvdsPiTl5RiZF1stGi03
         s9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680422310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SgHFDIjB9kdprTZGQWAulvUWPjB6z0UITqA9gpqJqrI=;
        b=hc4qt7O9kURQIasMFtZ09/TIu25453jpDB6O0xwcKw0NNtHQbiLvz8JKDsxcV57s4q
         W+MM2yad/k1VWb1ITTH15L2vjUt7wE8l3SqQbyxoVmSxRBwwFxUff+uiOhmm0sO8IyKC
         84eSw5uTwazUd51sJgxs257JF9hBZXBa3jydEfGiG98CARM1IUfHGQznMuaCWI4Aq4bl
         8pT9N2jqobQwHxweO7iE1ajm9YK1qiqDUJsfpXt3OfZMNcDNzbrRXMhmfWBgRM0zCN0F
         0dlO+rxEciEhOZDL0IWawYOpcNTd6UudaDpF4qSIj5bRbX/r8Y+zoPV6Lf40x/3VO7Wc
         Hi6A==
X-Gm-Message-State: AAQBX9fLxoWs7ZIU8x2+wfcn0B0Zkx4C5/728WczZHyrdSvS6hs/ge+S
	Dbc5eLIZQAZDyctLXtDsKheKNn36Kqv4tHDPWdQ=
X-Google-Smtp-Source: AKy350bUv1gnBViZbT5HlAdVaw0CbH4r5Z7SUQWOv7Jz7VDxZm8ohYcMZA1oC6rw9RnBdDEBU+yhxuyUOtFLgXIT+Bg=
X-Received: by 2002:a05:622a:134e:b0:3e6:4980:6f79 with SMTP id
 w14-20020a05622a134e00b003e649806f79mr1186380qtk.0.1680422309775; Sun, 02 Apr
 2023 00:58:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230401145926.596216-1-hdegoede@redhat.com> <20230401145926.596216-20-hdegoede@redhat.com>
In-Reply-To: <20230401145926.596216-20-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 2 Apr 2023 09:57:53 +0200
Message-ID: <CAHp75VdFHESgTZJuE1M=pd+yH0Dn9QD2p1Kog42N-15Du+VgXA@mail.gmail.com>
Subject: Re: [PATCH 19/28] media: atomisp: Remove duplicate
 atomisp_[start|stop]_streaming prototypes
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
> atomisp_ioctl.h contains the atomisp_[start|stop]_streaming function

_streaming()

> prototypes 2 times. Drop one of the copies of the prototypes.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_ioctl.h | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h b/drivers/=
staging/media/atomisp/pci/atomisp_ioctl.h
> index 93139decf1d0..db6da77df06b 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
> @@ -53,7 +53,4 @@ unsigned int atomisp_streaming_count(struct atomisp_dev=
ice *isp);
>  long atomisp_compat_ioctl32(struct file *file,
>                             unsigned int cmd, unsigned long arg);
>
> -int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count);
> -void atomisp_stop_streaming(struct vb2_queue *vq);
> -
>  #endif /* __ATOMISP_IOCTL_H__ */
> --
> 2.39.1
>


--=20
With Best Regards,
Andy Shevchenko
