Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC71C3FC2
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 22:21:57 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id z24-20020a17090acb1800b0018e87a24300so996618pjt.0
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 15:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PgbvL7tZGMqN04fDtExmC53uM/OuoTpyNovFpG01h4I=;
        b=mrfk22hXw3iD2OUWsdXxuk5BJuJLQ1zikfGhw1rbU2nb8fdvWwNpPsf3sF/QHs87iH
         wm/9XU4v0sV9oZ1SaEiH2iLHsmmLbWdpXuK7SO1kTRwdpJrJcihx8lI5sV2kry9Q/cy2
         hro2P8TOOdwzdLtUcV/H3NzVbSIx+YfVLMfq8zk6IDTTBANlA1odwcPMucqGJLnf6r+2
         XKC3l+eOOgjNs7q0T8B1Hbnc5uuh1d7iuSDgNSdcQIq5f0kYF16TRnNjXHDzRc8MtwdQ
         b59dXUMgD9cp5C06cSmjHDB/uwfa75Ki50MOfuZeJiNJ8fb6C5m8+LTngHvFm7/MxcO7
         fhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PgbvL7tZGMqN04fDtExmC53uM/OuoTpyNovFpG01h4I=;
        b=Q2bucB9MVDrh01ORlF7zXpW1rf2fRVOi5FLSvKMYRG0DQZ5mHhdTBGOttnfNIFkQgg
         vgPEK9Msosz7vUEuYgQLb7RuDYOOxX/QtbFlxIBdMxwF4X9MHyuo8qWetVUgc1N5kCYC
         YJiX9mTlAxpW5m2ShFvb7YZ1EgYR1i2dNvwfLIx8Ah0bs8rnBw8EGo8jn+E/39JmUhh1
         ob+oL9AUOsa8FueRn+NZNiyEzJ221vmgbl8/TODSGrNqb0jBVCSL8VGCfaXMlvq603HL
         W/nMG7qVjuRbYRoWbc50VFP0InYqLSrcijQMliI3olHa92EnsO8UU8od9rRkvKNAeZwm
         jiMw==
X-Gm-Message-State: AOAM53000hxEXlmBmugVrH7/4YMHPr2C4Oh9kLsB9dhE6YIvovanwsRg
	R20BECl0nAS18Tdcn+BGh+JBz8pc/J2j52VTX4mqjg==
X-Google-Smtp-Source: ABdhPJwivijEkTPOuWanRWlCqTFVzEGxja92JdtnMNzJTERT+YaM6O8hzAFMzfmiajkwskVaO4vKkUTfnlzux7LP8sk=
X-Received: by 2002:a17:90b:3748:: with SMTP id ne8mr796003pjb.162.1629757317164;
 Mon, 23 Aug 2021 15:21:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210823081820.9724-1-straube.linux@gmail.com>
In-Reply-To: <20210823081820.9724-1-straube.linux@gmail.com>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Mon, 23 Aug 2021 23:21:46 +0100
Message-ID: <CAA=Fs0=6=ueb53iNhyjSE5B8CdQvrpijgihAaN9YVwdDgNGiFA@mail.gmail.com>
Subject: Re: [PATCH] staging: r8188eu: remove ip.h header file
To: Michael Straube <straube.linux@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Martin Kaiser <martin@kaiser.cx>, "Fabio M. De Francesco" <fmdefrancesco@gmail.com>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Aug 2021 at 09:19, Michael Straube <straube.linux@gmail.com> wrote:
>
> The struct ip_options declared in ip.h is only unsed in the optlength
> macro which is also defined in ip.h. All other definitions/declarations
> in ip.h are duplicated from <include/uapi/linux/ip.h>. Remove the ip.h
> header file and its includes.
>
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_recv.c      |   1 -
>  drivers/staging/r8188eu/core/rtw_xmit.c      |   1 -
>  drivers/staging/r8188eu/hal/rtl8188eu_recv.c |   1 -
>  drivers/staging/r8188eu/include/ip.h         | 109 -------------------
>  drivers/staging/r8188eu/os_dep/xmit_linux.c  |   1 -
>  5 files changed, 113 deletions(-)
>  delete mode 100644 drivers/staging/r8188eu/include/ip.h
>
> diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
> index 52236bae8693..8802f24fec3a 100644
> --- a/drivers/staging/r8188eu/core/rtw_recv.c
> +++ b/drivers/staging/r8188eu/core/rtw_recv.c
> @@ -7,7 +7,6 @@
>  #include "../include/drv_types.h"
>  #include "../include/recv_osdep.h"
>  #include "../include/mlme_osdep.h"
> -#include "../include/ip.h"
>  #include "../include/if_ether.h"
>  #include "../include/ethernet.h"
>  #include "../include/usb_ops.h"
> diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
> index f242f3ffca70..38183fd37b93 100644
> --- a/drivers/staging/r8188eu/core/rtw_xmit.c
> +++ b/drivers/staging/r8188eu/core/rtw_xmit.c
> @@ -7,7 +7,6 @@
>  #include "../include/drv_types.h"
>  #include "../include/wifi.h"
>  #include "../include/osdep_intf.h"
> -#include "../include/ip.h"
>  #include "../include/usb_ops.h"
>  #include "../include/usb_osintf.h"
>
> diff --git a/drivers/staging/r8188eu/hal/rtl8188eu_recv.c b/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
> index a44c9598186c..216a752e6246 100644
> --- a/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
> +++ b/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
> @@ -6,7 +6,6 @@
>  #include "../include/drv_types.h"
>  #include "../include/recv_osdep.h"
>  #include "../include/mlme_osdep.h"
> -#include "../include/ip.h"
>  #include "../include/if_ether.h"
>  #include "../include/ethernet.h"
>
> diff --git a/drivers/staging/r8188eu/include/ip.h b/drivers/staging/r8188eu/include/ip.h
> deleted file mode 100644
> index b7388c8c1b8a..000000000000
> --- a/drivers/staging/r8188eu/include/ip.h
> +++ /dev/null
> @@ -1,109 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
> -/* Copyright(c) 2007 - 2011 Realtek Corporation. */
> -
> -#ifndef _LINUX_IP_H
> -#define _LINUX_IP_H
> -
> -/* SOL_IP socket options */
> -
> -#define IPTOS_TOS_MASK         0x1E
> -#define IPTOS_TOS(tos)         ((tos)&IPTOS_TOS_MASK)
> -#define        IPTOS_LOWDELAY          0x10
> -#define        IPTOS_THROUGHPUT        0x08
> -#define        IPTOS_RELIABILITY       0x04
> -#define        IPTOS_MINCOST           0x02
> -
> -#define IPTOS_PREC_MASK                0xE0
> -#define IPTOS_PREC(tos)                ((tos)&IPTOS_PREC_MASK)
> -#define IPTOS_PREC_NETCONTROL           0xe0
> -#define IPTOS_PREC_INTERNETCONTROL      0xc0
> -#define IPTOS_PREC_CRITIC_ECP           0xa0
> -#define IPTOS_PREC_FLASHOVERRIDE        0x80
> -#define IPTOS_PREC_FLASH                0x60
> -#define IPTOS_PREC_IMMEDIATE            0x40
> -#define IPTOS_PREC_PRIORITY             0x20
> -#define IPTOS_PREC_ROUTINE              0x00
> -
> -/* IP options */
> -#define IPOPT_COPY             0x80
> -#define IPOPT_CLASS_MASK       0x60
> -#define IPOPT_NUMBER_MASK      0x1f
> -
> -#define        IPOPT_COPIED(o)         ((o)&IPOPT_COPY)
> -#define        IPOPT_CLASS(o)          ((o)&IPOPT_CLASS_MASK)
> -#define        IPOPT_NUMBER(o)         ((o)&IPOPT_NUMBER_MASK)
> -
> -#define        IPOPT_CONTROL           0x00
> -#define        IPOPT_RESERVED1         0x20
> -#define        IPOPT_MEASUREMENT       0x40
> -#define        IPOPT_RESERVED2         0x60
> -
> -#define IPOPT_END      (0 | IPOPT_CONTROL)
> -#define IPOPT_NOOP     (1 | IPOPT_CONTROL)
> -#define IPOPT_SEC      (2 | IPOPT_CONTROL | IPOPT_COPY)
> -#define IPOPT_LSRR     (3 | IPOPT_CONTROL | IPOPT_COPY)
> -#define IPOPT_TIMESTAMP        (4 | IPOPT_MEASUREMENT)
> -#define IPOPT_RR       (7 | IPOPT_CONTROL)
> -#define IPOPT_SID      (8 | IPOPT_CONTROL | IPOPT_COPY)
> -#define IPOPT_SSRR     (9 | IPOPT_CONTROL | IPOPT_COPY)
> -#define IPOPT_RA       (20 | IPOPT_CONTROL | IPOPT_COPY)
> -
> -#define IPVERSION      4
> -#define MAXTTL         255
> -#define IPDEFTTL       64
> -#define IPOPT_OPTVAL 0
> -#define IPOPT_OLEN   1
> -#define IPOPT_OFFSET 2
> -#define IPOPT_MINOFF 4
> -#define MAX_IPOPTLEN 40
> -#define IPOPT_NOP IPOPT_NOOP
> -#define IPOPT_EOL IPOPT_END
> -#define IPOPT_TS  IPOPT_TIMESTAMP
> -
> -#define        IPOPT_TS_TSONLY         0       /* timestamps only */
> -#define        IPOPT_TS_TSANDADDR      1       /* timestamps and addresses */
> -#define        IPOPT_TS_PRESPEC        3       /* specified modules only */
> -
> -struct ip_options {
> -       __u32           faddr;                  /* Saved first hop address */
> -       unsigned char   optlen;
> -       unsigned char srr;
> -       unsigned char rr;
> -       unsigned char ts;
> -       unsigned char   is_setbyuser:1, /* Set by setsockopt?           */
> -                       is_data:1,      /* Options in __data, rather than skb*/
> -                       is_strictroute:1,/* Strict source route         */
> -                       srr_is_hit:1,   /* Packet destn addr was ours */
> -                       is_changed:1,   /* IP checksum more not valid   */
> -                       rr_needaddr:1,  /* Need to record addr of out dev*/
> -                       ts_needtime:1,  /* Need to record timestamp     */
> -                       ts_needaddr:1;  /* Need to record addr of out dev  */
> -       unsigned char router_alert;
> -       unsigned char __pad1;
> -       unsigned char __pad2;
> -       unsigned char __data[0];
> -};
> -
> -#define optlength(opt) (sizeof(struct ip_options) + opt->optlen)
> -
> -struct iphdr {
> -#if defined(__LITTLE_ENDIAN_BITFIELD)
> -       __u8    ihl:4,
> -               version:4;
> -#elif defined(__BIG_ENDIAN_BITFIELD)
> -       __u8    version:4,
> -               ihl:4;
> -#endif
> -       __u8    tos;
> -       __u16   tot_len;
> -       __u16   id;
> -       __u16   frag_off;
> -       __u8    ttl;
> -       __u8    protocol;
> -       __u16   check;
> -       __u32   saddr;
> -       __u32   daddr;
> -       /*The options start here. */
> -};
> -
> -#endif /* _LINUX_IP_H */
> diff --git a/drivers/staging/r8188eu/os_dep/xmit_linux.c b/drivers/staging/r8188eu/os_dep/xmit_linux.c
> index 60e0eea7ad84..80546a886c0e 100644
> --- a/drivers/staging/r8188eu/os_dep/xmit_linux.c
> +++ b/drivers/staging/r8188eu/os_dep/xmit_linux.c
> @@ -6,7 +6,6 @@
>  #include "../include/osdep_service.h"
>  #include "../include/drv_types.h"
>  #include "../include/if_ether.h"
> -#include "../include/ip.h"
>  #include "../include/wifi.h"
>  #include "../include/mlme_osdep.h"
>  #include "../include/xmit_osdep.h"
> --
> 2.32.0
>

Dear Michael,

Thanks for the patch. Sorry, but it seems to conflict with your
earlier patch titled: "[PATCH] staging: r8188eu: remove if_ether.h
header file". They apply fine individually, but not together - can you
confirm this is the case for you as well and not just me?

Regards,
Phil
