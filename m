Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F68915B4
	for <linux-staging@lists.linux.dev>; Mon, 17 Jul 2023 03:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689564295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rVPhlDWWstYuQhE9rPW0moAPj4vPnjdpcShE2QGExrM=;
	b=a/4LgwfSI/27cvCtgqe70PRaCmlgWJxhtK/9MDFqQ7VVAe9WPkqTjrRFBbgliqXraoXEqv
	KKf8GGB0r3zPM9dlu3YQ07TI9RbexcwGHRjqVoKvBnpD5mrdF4ZWns1ytFYQaXslb94IwO
	LC08eDrE/SgrsPEwU32baoWY93f6rK8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-IbXnIuuCNVObNBSZC3cLeA-1; Sun, 16 Jul 2023 23:24:54 -0400
X-MC-Unique: IbXnIuuCNVObNBSZC3cLeA-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7679e5ebad2so632662185a.3
        for <linux-staging@lists.linux.dev>; Sun, 16 Jul 2023 20:24:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689564294; x=1692156294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rVPhlDWWstYuQhE9rPW0moAPj4vPnjdpcShE2QGExrM=;
        b=ZLmg6aa6UMxpXIeYAt1eqNh4wk1I7v7T8meoQPgwYROKdcEFiIUQgYwn3l7dL4tUIR
         GRxPy87kdXW0Z7Iu82iB39cpfvSuaT5i/sZmlNUV1CS2LOcpfpTP2Pcipb/Nu7q7lCFC
         vAp6j8tAphSMZ8ViZjlzC+E7fKx4Nh1XIsgCB5V2r4ZlRjIDJzGYvBFkixVBSebmWSbd
         NzFwSq0WO+MTGjcwBnIWuNVK0yKg3NyqvfWFI7TOdFAP5Vc2HwEb/MZXue2ryWyzADS0
         gpNzRtJTHiiLQ98AGFCNCuwwaXelvClc/4lexSrOPckLUFCVkHD3ztAntqUODn9KI+pI
         0SLw==
X-Gm-Message-State: ABy/qLbSZc8eTViDad51cPWbrGjmQcZAfP6kmOknQ2f1euH0dMFbhaVX
	ghU+PSGKrVLxX/kwdnNPEdrotk0Y8nEhIOPPwlhkInXiMbGCQqtzKxCMvoT05KYbHbNjpTXhuoU
	j5Q4g50q6a7Qkr3VyzHrVTapI/mUqemcVy4IXk+pj9g==
X-Received: by 2002:a05:620a:e1b:b0:767:f130:8f8a with SMTP id y27-20020a05620a0e1b00b00767f1308f8amr13099974qkm.49.1689564294191;
        Sun, 16 Jul 2023 20:24:54 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGohHM0GTkSYl2RPmZokxDtvdLmqusAw0AogptqmV9By9unoIHTsuJDI2cnjr//K3wz9uRRjDfKVX+bVgwzg4I=
X-Received: by 2002:a05:620a:e1b:b0:767:f130:8f8a with SMTP id
 y27-20020a05620a0e1b00b00767f1308f8amr13099958qkm.49.1689564293904; Sun, 16
 Jul 2023 20:24:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230715170906.3627-1-hdegoede@redhat.com> <20230715170906.3627-2-hdegoede@redhat.com>
In-Reply-To: <20230715170906.3627-2-hdegoede@redhat.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Mon, 17 Jul 2023 11:24:43 +0800
Message-ID: <CAEth8oHkGVRkE09R5VUO3-3wruOQzP_ZRvfZqk5w6tMusUdi5w@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: atomisp: Remove aliases for MIPI_FORMAT_2400_CUSTOM0
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>, 
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com, 
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Sun, Jul 16, 2023 at 1:09=E2=80=AFAM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> isp2400_input_system_local.h defines 2 aliases for MIPI_FORMAT_2400_CUSTO=
M0
> MIPI_FORMAT_JPEG, which is entirely unused and MIPI_FORMAT_BINARY_8 which
> is used once in ia_css_isys_2400_set_fmt_type().
>
> Drop these aliases and directly use MIPI_FORMAT_2400_CUSTOM0 in
> ia_css_isys_2400_set_fmt_type().
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/staging/media/atomisp/pci/isp2400_input_system_local.h | 2 --
>  drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c        | 2 +-
>  2 files changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_local=
.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
> index e7b84fdbb4e0..6319d6449f20 100644
> --- a/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
> +++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
> @@ -200,8 +200,6 @@ typedef enum {
>         N_MIPI_FORMAT_2400,
>  } mipi_format_2400_t;
>
> -#define MIPI_FORMAT_JPEG       MIPI_FORMAT_2400_CUSTOM0
> -#define MIPI_FORMAT_BINARY_8   MIPI_FORMAT_2400_CUSTOM0
>  #define N_MIPI_FORMAT_CUSTOM   8
>
>  /* The number of stores for compressed format types */
> diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c b/dr=
ivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
> index c8316e0965d0..deb4130f710c 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
> +++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
> @@ -271,7 +271,7 @@ static int ia_css_isys_2400_set_fmt_type(enum atomisp=
_input_format input_format,
>                 *fmt_type =3D MIPI_FORMAT_2400_RAW16;
>                 break;
>         case ATOMISP_INPUT_FORMAT_BINARY_8:
> -               *fmt_type =3D MIPI_FORMAT_BINARY_8;
> +               *fmt_type =3D MIPI_FORMAT_2400_CUSTOM0;
>                 break;
>         case ATOMISP_INPUT_FORMAT_YUV420_16:
>         case ATOMISP_INPUT_FORMAT_YUV422_16:
> --
> 2.41.0
>

Thank you for working on this.

It looks good to me.

Reviewed-by: Kate Hsuan <hpa@redhat.com>


--
BR,
Kate

