Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BECDBA56
	for <linux-staging@lists.linux.dev>; Fri, 12 May 2023 11:28:10 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-ba724ec3b06so587531276.2
        for <linux-staging@lists.linux.dev>; Fri, 12 May 2023 04:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683890889; x=1686482889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jRL0mFkBIJ4KpIHNQ0nXnFUPNdCjxMZJfjytXJxyHUs=;
        b=l7fqKq0DCCYcBzEhr+VMVsjbwTWlo+xMHpxCpOX3Co3N37m87xrWzBWd+fspbQf4Tu
         6Mpqy9vsOe4eAQdGqA1BZ0/W/cLMX1KnRriDO0ltXjc53v55FEuIWjFH6bnFuDpYLY/T
         fB8ilXduRtpw62AqXiL9BWuLYm3meEm8XdK3V/MbTfLKdU47EX+25CdskHtVYQlH6siG
         Kuq1x5b2FXLsgt8YJcSvX0kW9KAg1qpiUfYKebkEsEBVtCrb62DGeyZuuRRH6DjzVsHg
         NQWMZpMs/P6dzYhJz3ou1z2+IBejOL/LgD8dQUTJrToGC8eavcawiqoJ3506xuoj15Tf
         UiOA==
X-Gm-Message-State: AC+VfDxKRSa4mW40rK2ZOwj3qkoQ4+tMMuVeIi2vK9GISMb4PEMnzVEg
	YKfM5nZAQS7p902bOl4ZEEjZ83zwH/hKlA==
X-Google-Smtp-Source: ACHHUZ4d70gE0Opfjj22GQyXvolCA8W4S0qz/mJUU51+h7Ia+xopYSF1d+LdUw9USL4L/g+tz83R6A==
X-Received: by 2002:a25:3212:0:b0:ba7:1ea1:1298 with SMTP id y18-20020a253212000000b00ba71ea11298mr854603yby.46.1683890888730;
        Fri, 12 May 2023 04:28:08 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id k66-20020a0dc845000000b00545a081847fsm5611806ywd.15.2023.05.12.04.28.07
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 May 2023 04:28:07 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-55a20a56a01so173327427b3.3
        for <linux-staging@lists.linux.dev>; Fri, 12 May 2023 04:28:07 -0700 (PDT)
X-Received: by 2002:a0d:d691:0:b0:539:1b13:3d64 with SMTP id
 y139-20020a0dd691000000b005391b133d64mr23825102ywd.48.1683890887026; Fri, 12
 May 2023 04:28:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230512100620.36807-1-bagasdotme@gmail.com> <20230512100620.36807-5-bagasdotme@gmail.com>
In-Reply-To: <20230512100620.36807-5-bagasdotme@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 May 2023 13:27:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWrApnnmC+p_+jeVsswc-_JRSK3FtvpS2X4PrscBCZtAA@mail.gmail.com>
Message-ID: <CAMuHMdWrApnnmC+p_+jeVsswc-_JRSK3FtvpS2X4PrscBCZtAA@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] net: ethernet: 8390: Replace GPL boilerplate
 with SPDX identifier
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux SPDX Licenses <linux-spdx@vger.kernel.org>, 
	Linux DRI Development <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Networking <netdev@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Staging Drivers <linux-staging@lists.linux.dev>, 
	Linux Watchdog Devices <linux-watchdog@vger.kernel.org>, 
	Linux Kernel Actions <linux-actions@lists.infradead.org>, 
	Diederik de Haas <didi.debian@cknow.org>, Kate Stewart <kstewart@linuxfoundation.org>, 
	Philippe Ombredanne <pombredanne@nexb.com>, Thomas Gleixner <tglx@linutronix.de>, 
	David Airlie <airlied@redhat.com>, Karsten Keil <isdn@linux-pingi.de>, 
	Jay Vosburgh <j.vosburgh@gmail.com>, Andy Gospodarek <andy@greyhouse.net>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Sam Creasey <sammy@sammy.net>, 
	Dominik Brodowski <linux@dominikbrodowski.net>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Jan Kara <jack@suse.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, "David A . Hinds" <dahinds@users.sourceforge.net>, 
	Donald Becker <becker@scyld.com>, Peter De Schrijver <p2@mind.be>, Topi Kanerva <topi@susanna.oulu.fi>, 
	Alain Malek <Alain.Malek@cryogen.com>, Bruce Abbott <bhabbott@inhb.co.nz>, 
	Alan Cox <alan@linux.intel.com>, Greg Ungerer <gerg@linux-m68k.org>, 
	Simon Horman <simon.horman@corigine.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bagas,

On Fri, May 12, 2023 at 12:08=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.co=
m> wrote:
> Replace GPL boilerplate notice on remaining files with appropriate SPDX
> tag. For files mentioning COPYING, use GPL 2.0; otherwise GPL 1.0+.
>
> Cc: David A. Hinds <dahinds@users.sourceforge.net>
> Cc: Donald Becker <becker@scyld.com>
> Cc: Peter De Schrijver <p2@mind.be>
> Cc: Topi Kanerva <topi@susanna.oulu.fi>
> Cc: Alain Malek <Alain.Malek@cryogen.com>
> Cc: Bruce Abbott <bhabbott@inhb.co.nz>
> Cc: Alan Cox <alan@linux.intel.com>
> Acked-by: Greg Ungerer <gerg@linux-m68k.org>
> Reviewed-by: Simon Horman <simon.horman@corigine.com>
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Thanks for your patch!

> --- a/drivers/net/ethernet/8390/apne.c
> +++ b/drivers/net/ethernet/8390/apne.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-1.0+

As per the removed lines below, this should be GPL-2.0-only.

>  /*
>   * Amiga Linux/68k 8390 based PCMCIA Ethernet Driver for the Amiga 1200
>   *
> @@ -19,12 +20,6 @@
>   *
>   * ---------------------------------------------------------------------=
-------
>   *
> - * This file is subject to the terms and conditions of the GNU General P=
ublic
> - * License.  See the file COPYING in the main directory of the Linux
> - * distribution for more details.
> - *
> - * ---------------------------------------------------------------------=
-------
> - *
>   */
>
>

> --- a/drivers/net/ethernet/8390/hydra.c
> +++ b/drivers/net/ethernet/8390/hydra.c
> @@ -1,10 +1,8 @@
> +// SPDX-License-Identifier: GPL-1.0+

Likewise.

> +
>  /* New Hydra driver using generic 8390 core */
>  /* Based on old hydra driver by Topi Kanerva (topi@susanna.oulu.fi) */
>
> -/* This file is subject to the terms and conditions of the GNU General  =
    */
> -/* Public License.  See the file COPYING in the main directory of the   =
    */
> -/* Linux distribution for more details.                                 =
    */
> -
>  /* Peter De Schrijver (p2@mind.be) */
>  /* Oldenburg 2000 */
>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
