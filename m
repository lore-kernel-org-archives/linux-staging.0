Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB369466
	for <linux-staging@lists.linux.dev>; Fri, 12 May 2023 12:49:23 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1aaf706768cso76155805ad.0
        for <linux-staging@lists.linux.dev>; Fri, 12 May 2023 05:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683895762; x=1686487762;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T4Bwu1/m+mf+/AYH3YMI2am9lWYECxCgwTG6fxXqnDM=;
        b=Mu6B2Vvx/likXVwX5YSuCzcOyDhO3nyIbg5DJAFv4Fh6jqbdmg/ukbC0//k395sBq/
         zVK+X/GG2r5Zm6ZyZ2JxbaCx/rUZaCr7KVsSsrT6KC5jSfYNuZuxfCHeG35Vhvc4Do2e
         HPsmgPNlHgGU+b1IHVepxDytxTHrhHw+ik87sxTJtVk4E0v08GlUHENGtbK6TvDnAiTr
         yLbe6CXu1c0z8pJq0TrNYPohEzWnU0+YTl8XG8FOsVsM2KV7G+Ooyrj1KM+ReEmsVoDZ
         p2y7O1CDheFOJkuoQN8OZPPJmSCJdpdz5Hy07XkF0K0C7bCoeMpZXxj/4VryZjvx3ol4
         rNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683895762; x=1686487762;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T4Bwu1/m+mf+/AYH3YMI2am9lWYECxCgwTG6fxXqnDM=;
        b=cUTCeaWG5l4SIOA90nPuWZmp1RNvENjNMX0VTI8JCX1KrRtnwGBH+VuzJlvM9SCxWf
         LdUo5eVsSPJrF0sPrd37hdVVSJtHAb7tV4DBPK7ClBuoPvGGU0mnw2Mw/uYPuylOKhwK
         d9vX0WNnABYd2NffGerXBORx8MFZ8KoyVxaF6ea3dLoWO3oW9TgSMYMG8bdUz5TqBfGn
         TlKaxAzmb6mD0bA4jtQLrxh8+hyxI9taWYA1huCs4tvHJncvbt/1ZnjfxenL+7OrJKtQ
         nKmIK/vACZOazcjtqu0wa2ADwZ7qz3KTV6p8yRqxdgUUKfBkRuTcv202PN1zAfJnuOkv
         K9Hw==
X-Gm-Message-State: AC+VfDz4Y8KwzgEAXHYA8AD7rtYfUbqQKNIeKqA3HGCWKdPWbVrWUmY2
	cwgU2aYrsLdaeOm56+sZE8w=
X-Google-Smtp-Source: ACHHUZ4QC7nOkGyG6InsWHZK7DO6lQ0Qk5Iwug1SSjWnugCY3MVofbA1+NsVDZnCTOxusMijiERaQg==
X-Received: by 2002:a17:902:d34b:b0:1a6:386f:39a3 with SMTP id l11-20020a170902d34b00b001a6386f39a3mr26966779plk.31.1683895762478;
        Fri, 12 May 2023 05:49:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n13-20020a170903110d00b001ac741db80csm7882876plh.88.2023.05.12.05.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 05:49:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 12 May 2023 05:49:20 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux SPDX Licenses <linux-spdx@vger.kernel.org>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Linux Staging Drivers <linux-staging@lists.linux.dev>,
	Linux Watchdog Devices <linux-watchdog@vger.kernel.org>,
	Linux Kernel Actions <linux-actions@lists.infradead.org>,
	Diederik de Haas <didi.debian@cknow.org>,
	Kate Stewart <kstewart@linuxfoundation.org>,
	Philippe Ombredanne <pombredanne@nexb.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Airlie <airlied@redhat.com>,
	Karsten Keil <isdn@linux-pingi.de>,
	Jay Vosburgh <j.vosburgh@gmail.com>,
	Andy Gospodarek <andy@greyhouse.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sam Creasey <sammy@sammy.net>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>, Jan Kara <jack@suse.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Ray Lehtiniemi <rayl@mail.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Andrey Panin <pazke@donpac.ru>, Oleg Drokin <green@crimea.edu>,
	Marc Zyngier <maz@kernel.org>,
	Jonas Jensen <jonas.jensen@gmail.com>,
	Sylver Bruneau <sylver.bruneau@googlemail.com>,
	Andrew Sharp <andy.sharp@lsi.com>,
	Denis Turischev <denis@compulab.co.il>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Alan Cox <alan@linux.intel.com>,
	Simon Horman <simon.horman@corigine.com>
Subject: Re: [PATCH v2 08/10] drivers: watchdog: Replace GPL license notice
 with SPDX identifier
Message-ID: <08b5be32-0da5-4614-9c3c-b3a821492397@roeck-us.net>
References: <20230512100620.36807-1-bagasdotme@gmail.com>
 <20230512100620.36807-9-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230512100620.36807-9-bagasdotme@gmail.com>

On Fri, May 12, 2023 at 05:06:19PM +0700, Bagas Sanjaya wrote:
> Many watchdog drivers's source files has already SPDX license
> identifier, while some remaining doesn't.
> 
> Convert notices on remaining files to SPDX identifier. While at it,
> also move SPDX identifier for drivers/watchdog/rtd119x_wdt.c to the
> top of file (as in other files).
> 
> Cc: Ray Lehtiniemi <rayl@mail.com>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Andrey Panin <pazke@donpac.ru>
> Cc: Oleg Drokin <green@crimea.edu>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Jonas Jensen <jonas.jensen@gmail.com>
> Cc: Sylver Bruneau <sylver.bruneau@googlemail.com>
> Cc: Andrew Sharp <andy.sharp@lsi.com>
> Cc: Denis Turischev <denis@compulab.co.il>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Alan Cox <alan@linux.intel.com>
> Reviewed-by: Simon Horman <simon.horman@corigine.com>
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  drivers/watchdog/ep93xx_wdt.c     | 5 +----
>  drivers/watchdog/ibmasr.c         | 3 +--
>  drivers/watchdog/m54xx_wdt.c      | 4 +---
>  drivers/watchdog/max63xx_wdt.c    | 5 +----
>  drivers/watchdog/moxart_wdt.c     | 4 +---
>  drivers/watchdog/octeon-wdt-nmi.S | 5 +----
>  drivers/watchdog/orion_wdt.c      | 4 +---
>  drivers/watchdog/rtd119x_wdt.c    | 2 +-
>  drivers/watchdog/sb_wdog.c        | 5 +----
>  drivers/watchdog/sbc_fitpc2_wdt.c | 4 +---
>  drivers/watchdog/ts4800_wdt.c     | 4 +---
>  drivers/watchdog/ts72xx_wdt.c     | 4 +---
>  12 files changed, 12 insertions(+), 37 deletions(-)
> 
[ ... ]

> diff --git a/drivers/watchdog/sb_wdog.c b/drivers/watchdog/sb_wdog.c
> index 504be461f992a9..822bf8905bf3ce 100644
> --- a/drivers/watchdog/sb_wdog.c
> +++ b/drivers/watchdog/sb_wdog.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-1.0+

This would include GPL 3, but the text below explicitly excludes that.
No idea how to handle that.

Guenter

>  /*
>   * Watchdog driver for SiByte SB1 SoCs
>   *
> @@ -38,10 +39,6 @@
>   *	(c) Copyright 1996 Alan Cox <alan@lxorguk.ukuu.org.uk>,
>   *						All Rights Reserved.
>   *
> - *	This program is free software; you can redistribute it and/or
> - *	modify it under the terms of the GNU General Public License
> - *	version 1 or 2 as published by the Free Software Foundation.
> - *
>   */
