Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B5115B4
	for <linux-staging@lists.linux.dev>; Mon, 17 Jul 2023 03:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689564230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lWrIWrkg/Nt6GMrmG9sycYZY7DWCUhRBTqM65DDpl/E=;
	b=cM+4SY/XQst2B0gsKAzq+6Mxl923Qvcc7hah+eDt6Et0UX+cCBn2C/h74xE1LFO2NZLcPh
	LH5qCuIGc8Buz7FVfA56fEA9nsQzz5MgeV5P60r7v+EaWK2Xk+zA/cQ1Vi94Qh5Vrwj0f7
	EEg/kzRB1Yh70LoHpLc5MeQ1JBxX72U=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-T44o1VfCPQi37g8pbtJemA-1; Sun, 16 Jul 2023 23:23:49 -0400
X-MC-Unique: T44o1VfCPQi37g8pbtJemA-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7675581a4afso538929385a.1
        for <linux-staging@lists.linux.dev>; Sun, 16 Jul 2023 20:23:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689564229; x=1692156229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lWrIWrkg/Nt6GMrmG9sycYZY7DWCUhRBTqM65DDpl/E=;
        b=OttFGv6uGbPNNOS2fh18a0xmt+xDmm86/6mbnFe4ZlhP1SD2TMZN0Yms5wkAvb5Kkz
         4vZZBaKAKbp3V7fT8ES4lUs4zXk1+w+XUEAxt0rRCMwfguSDv/12Ll29aOuLmHbpHAQR
         uYFLFbEU5CG6SCAfytatMPfWMZiXQwjYylUAEo//WY1XQHnCv8it29ndxUldfoHPXzru
         9xdkCXvIN1PxzsfRDn37n9HlPEuu1OdDyJnUMs0Z9ze4+0WK9AKqNx3QbywtQlNc7VjZ
         uAmmZrrm3GL3bK39WSaoy9hpzH0Ud0vTrqzjb9oyoLNTpReh6GKqznebikml2tHfL3th
         SKkw==
X-Gm-Message-State: ABy/qLYafm/drwMYW+aX3NqnCrr/MT4mVxBYa2VpLfu2cUtEy1xS9aSu
	tlM207HtRmSh44kq5ExdbulHUV/sidi+NNL+sKT8ZJgrdu71d/qmB6UMZjgJwlF8cVkRUpn9nFr
	X2jZjiGrdbZk49y9F6ajIuUs9Ru7BhdVCgZpfSDuaSA==
X-Received: by 2002:a05:620a:3726:b0:765:36a5:9207 with SMTP id de38-20020a05620a372600b0076536a59207mr13633513qkb.0.1689564229160;
        Sun, 16 Jul 2023 20:23:49 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHnVQ140xGYT3kE+RxN5Bq+UJ/HInce9Q1DDrbKeIYvSbNy0mHLCOt0sZEi9qQShB0V96RzfMZabdFHm4dexy0=
X-Received: by 2002:a05:620a:3726:b0:765:36a5:9207 with SMTP id
 de38-20020a05620a372600b0076536a59207mr13633498qkb.0.1689564228906; Sun, 16
 Jul 2023 20:23:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230715170906.3627-1-hdegoede@redhat.com>
In-Reply-To: <20230715170906.3627-1-hdegoede@redhat.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Mon, 17 Jul 2023 11:23:37 +0800
Message-ID: <CAEth8oGmY+GTGw2Xs61GbD1uFycoCSetk1NQecphp4Sw9XbM0g@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: atomisp: Remove empty isys_public.h
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

Hi Hans.

On Sun, Jul 16, 2023 at 1:09=E2=80=AFAM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> isys_public.h is empty, remove it.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../hive_isp_css_include/host/isys_public.h   | 19 -------------------
>  .../atomisp/pci/isp2400_input_system_public.h |  1 -
>  2 files changed, 20 deletions(-)
>  delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_includ=
e/host/isys_public.h
>
> diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/=
isys_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host=
/isys_public.h
> deleted file mode 100644
> index 9dacef7a5cc1..000000000000
> --- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/isys_pu=
blic.h
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/*
> - * Support for Intel Camera Imaging ISP subsystem.
> - * Copyright (c) 2015, Intel Corporation.
> - *
> - * This program is free software; you can redistribute it and/or modify =
it
> - * under the terms and conditions of the GNU General Public License,
> - * version 2, as published by the Free Software Foundation.
> - *
> - * This program is distributed in the hope it will be useful, but WITHOU=
T
> - * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> - * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
> - * more details.
> - */
> -
> -#ifndef __ISYS_PUBLIC_H_INCLUDED__
> -#define __ISYS_PUBLIC_H_INCLUDED__
> -
> -#endif /* __ISYS_PUBLIC_H_INCLUDED__ */
> diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_publi=
c.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
> index 375c0db84b55..b1360eeb58df 100644
> --- a/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
> +++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
> @@ -17,7 +17,6 @@
>  #define __INPUT_SYSTEM_2400_PUBLIC_H_INCLUDED__
>
>  #include <type_support.h>
> -#include "isys_public.h"
>
>  typedef struct receiver_state_s                        receiver_state_t;
>
> --
> 2.41.0
>

Thank you for working on this.

This file can be removed and it looks for me.

Reviewed-by: Kate Hsuan <hpa@redhat.com>

--=20
BR,
Kate

