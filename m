Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A584A19E6C
	for <linux-staging@lists.linux.dev>; Fri, 12 May 2023 12:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683895626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dJgqlXLztFl0MBoQFQIqJTCsGooWxTVjQq7Oro5jGqw=;
	b=c3OBITSi0iAvjxYyegQPs7BuhxJZVs3ltIJyrOoR/jQf39v/6qbqFdRMyeKrenJYJN/P34
	eVIjwn7XrDEwr9ItFT3hJ6Bac++h3TvU5fy4zhXLdorqkr9WJ7ZhLjCJItmG9HZkQvyaxP
	yM/syhzx2v2XClpYbdypIhisEDoOQSA=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-2AMT_Z3nOwqLDLHQKp0eqQ-1; Fri, 12 May 2023 08:47:05 -0400
X-MC-Unique: 2AMT_Z3nOwqLDLHQKp0eqQ-1
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-44fb0ee32e3so2089963e0c.3
        for <linux-staging@lists.linux.dev>; Fri, 12 May 2023 05:47:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683895624; x=1686487624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJgqlXLztFl0MBoQFQIqJTCsGooWxTVjQq7Oro5jGqw=;
        b=AvqnZEqfGMw45g4mTCTnT3eDoAjdX2Ln2P9pYLFC5BehVFOzqJ+6wdhMp4CIuu3S2k
         paq0MwuXtt3BNuGqEkUgdUSLSpun7rrN/o6XPZJa1DYwHp09F0vICDHcSCQtXZt5EhDx
         bVPAGA0GBZyOcZRaTDDhMOxNpZlxdqNDXBU7JSBSuegEAU2o6aoJ1msSzzA+A+U7aAac
         3Y7K1x3+2GN29hpZalEvxwt8VDRdAbohpEIJyJna1gD2X20VpUV/Sm9DL8jWh2E5hETw
         53TjeU8P002gjvAoaha/tNUi90yJi16ljpsKanrSC4WaY0yilaaDy3gXlpnYZPaupfNm
         111w==
X-Gm-Message-State: AC+VfDwyk22D5Pxd4InZ1+FmcF+WISX+dCa/fR8pO5HgZM/LlmuCLkl2
	rkdvu2cfTSfdBI1/wiPGUHN3XoscB0/er0rMn90GBM444wOQsgxKh1+dyBBZsDEhsk7TNKMlvyO
	zbEvrTWDUvTiZ/Fhz+B9vQJimVKZocu2BYYmcmKTp6Q==
X-Received: by 2002:a1f:dd42:0:b0:43c:290c:25e8 with SMTP id u63-20020a1fdd42000000b0043c290c25e8mr8337230vkg.6.1683895624618;
        Fri, 12 May 2023 05:47:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7yZxumejHu+zJzEaaKqa6xt9pvg90H/4AFuwccsjqfjD5b2ojZakUIS11JCd4jdY0ELP7Fv4O8lj5wR8QlcEU=
X-Received: by 2002:a1f:dd42:0:b0:43c:290c:25e8 with SMTP id
 u63-20020a1fdd42000000b0043c290c25e8mr8337198vkg.6.1683895624367; Fri, 12 May
 2023 05:47:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230512100620.36807-1-bagasdotme@gmail.com> <20230512100620.36807-9-bagasdotme@gmail.com>
In-Reply-To: <20230512100620.36807-9-bagasdotme@gmail.com>
From: Richard Fontana <rfontana@redhat.com>
Date: Fri, 12 May 2023 08:46:53 -0400
Message-ID: <CAC1cPGy=78yo2XcJPNZVvdjBr2-XzSq76JrAinSe42=sNdGv3w@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] drivers: watchdog: Replace GPL license notice
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
	Manivannan Sadhasivam <mani@kernel.org>, Ray Lehtiniemi <rayl@mail.com>, Alessandro Zummo <a.zummo@towertech.it>, 
	Andrey Panin <pazke@donpac.ru>, Oleg Drokin <green@crimea.edu>, Marc Zyngier <maz@kernel.org>, 
	Jonas Jensen <jonas.jensen@gmail.com>, Sylver Bruneau <sylver.bruneau@googlemail.com>, 
	Andrew Sharp <andy.sharp@lsi.com>, Denis Turischev <denis@compulab.co.il>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Alan Cox <alan@linux.intel.com>, 
	Simon Horman <simon.horman@corigine.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 12, 2023 at 6:07=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:


> diff --git a/drivers/watchdog/sb_wdog.c b/drivers/watchdog/sb_wdog.c
> index 504be461f992a9..822bf8905bf3ce 100644
> --- a/drivers/watchdog/sb_wdog.c
> +++ b/drivers/watchdog/sb_wdog.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-1.0+
>  /*
>   * Watchdog driver for SiByte SB1 SoCs
>   *
> @@ -38,10 +39,6 @@
>   *     (c) Copyright 1996 Alan Cox <alan@lxorguk.ukuu.org.uk>,
>   *                                             All Rights Reserved.
>   *
> - *     This program is free software; you can redistribute it and/or
> - *     modify it under the terms of the GNU General Public License
> - *     version 1 or 2 as published by the Free Software Foundation.

Shouldn't this be
// SPDX-License-Identifier: GPL-1.0 OR GPL-2.0
(or in current SPDX notation GPL-1.0-only OR GPL-2.0-only) ?

