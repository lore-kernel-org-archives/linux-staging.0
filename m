Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5810A1365
	for <linux-staging@lists.linux.dev>; Mon, 17 Jul 2023 03:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689562922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UbJG4dHyZ5/q/VVWsWG+GOVp19fXI6CF1MdILq4BY4Q=;
	b=ZHjz0d2UI9padRI13XgPwLOhNUXo2kw5Evi/iEUW3M4MT67aKILEmVfYkGsiFNbLEYMJbi
	VpmAQHwHsA3JvBEh7R867jwiND+YgLUluvnJOGeDwc/xVfpoCFkRiYkBrxnxJl/Mj0/Mpk
	W5V+NOi0lUSVw1JX0vpuQ7Cc6czLowo=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-fJToHlbSMHCksZv0GjWmbg-1; Sun, 16 Jul 2023 23:01:58 -0400
X-MC-Unique: fJToHlbSMHCksZv0GjWmbg-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-262dc227ca9so3154401a91.1
        for <linux-staging@lists.linux.dev>; Sun, 16 Jul 2023 20:01:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689562918; x=1692154918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UbJG4dHyZ5/q/VVWsWG+GOVp19fXI6CF1MdILq4BY4Q=;
        b=NQNiXBEa7jTMMzQsVHlBHjpr42KsuQcEhcYAbpROOOlY+szD8sFT0K5wC7qPYA+H92
         msFWNE3djqYGuJ/ezLAuJzSGGxgTH4yd93eDebuuOzq86sM9Cyjar9TLQvs8rfbbF8It
         mJ4lDjCmILL80zZ1p6WJ1TCVKTiuNkgCXqVooyUlCL3Qh7m9BLNiNfVhvjD4vakMDgeU
         0u5RhGIH57+hSFJra1lABu0dC5790Ll/UKacGad7xXySYFsSDEnOkwSkMG4902hzKqQP
         6NkhRjVYn9vOWype/P4EzacJ7chngp2hQDTs/VZl+TTYPv510UQLA/sUhFPExpQIaJHx
         Bypw==
X-Gm-Message-State: ABy/qLYtIx8J6GyzCZaDhhic4a1Xy2IRGoMxZsHuiGF4tBdXisjsJyvh
	Hx70pVW4ZCr+XMXBVrnMG9pXh877TtvmI6YOrxc2toxQq3QnsYYq03g15Z9kkCvtvyRzXtNBorM
	NkUeZbw9Fn6OhcvHIB2lJXZezcXVht2mzufNUAOj/Fw==
X-Received: by 2002:a17:90a:6a82:b0:25e:abc9:3cb1 with SMTP id u2-20020a17090a6a8200b0025eabc93cb1mr10509109pjj.4.1689562917794;
        Sun, 16 Jul 2023 20:01:57 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHCoix+M+feetdiw/m8iebGWratbh4c0crQs1pPKpXlLg2pIXRiZlnnd7Ed1BSyEI0lfZxeeaD7ifehCYeKxxY=
X-Received: by 2002:a17:90a:6a82:b0:25e:abc9:3cb1 with SMTP id
 u2-20020a17090a6a8200b0025eabc93cb1mr10509091pjj.4.1689562917435; Sun, 16 Jul
 2023 20:01:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230715170906.3627-1-hdegoede@redhat.com> <20230715170906.3627-3-hdegoede@redhat.com>
In-Reply-To: <20230715170906.3627-3-hdegoede@redhat.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Mon, 17 Jul 2023 11:01:46 +0800
Message-ID: <CAEth8oG-Hae07g11miFQh0=_KY67ER4vc60L+G9NaGMa9ByqDA@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: atomisp: Mark ia_css_isys_240?_init() static
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>, 
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com, 
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, kernel test robot <lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Sun, Jul 16, 2023 at 1:09=E2=80=AFAM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> ia_css_isys_240?_init() are only used inside the C file where they are
> declared, mark them as static fixing:
>
> drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c:24:20:
>    warning: no previous prototype for 'ia_css_isys_2400_init'
>    24 | input_system_err_t ia_css_isys_2400_init(void)
>       |                    ^~~~~~~~~~~~~~~~~~~~~
> drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c:87:20:
>    warning: no previous prototype for 'ia_css_isys_2401_init'
>    87 | input_system_err_t ia_css_isys_2401_init(void)
>       |                    ^~~~~~~~~~~~~~~~~~~~~
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202307152046.rvhFGrbz-lkp@i=
ntel.com/
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../staging/media/atomisp/pci/runtime/isys/src/isys_init.c    | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init=
.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c
> index 1a7b45bb4544..18bfe1010989 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c
> +++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.c
> @@ -21,7 +21,7 @@
>  #include "isys_dma_public.h"   /* isys2401_dma_set_max_burst_size() */
>  #include "isys_irq.h"
>
> -input_system_err_t ia_css_isys_2400_init(void)
> +static input_system_err_t ia_css_isys_2400_init(void)
>  {
>         backend_channel_cfg_t backend_ch0;
>         backend_channel_cfg_t backend_ch1;
> @@ -84,7 +84,7 @@ input_system_err_t ia_css_isys_2400_init(void)
>         return error;
>  }
>
> -input_system_err_t ia_css_isys_2401_init(void)
> +static input_system_err_t ia_css_isys_2401_init(void)
>  {
>         ia_css_isys_csi_rx_lut_rmgr_init();
>         ia_css_isys_ibuf_rmgr_init();
> --
> 2.41.0
>

Thank you for working on this.

It looks good to me.

Reviewed-by: Kate Hsuan <hpa@redhat.com>


--
BR,
Kate

