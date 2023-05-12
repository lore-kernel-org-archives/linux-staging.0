Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545F29466
	for <linux-staging@lists.linux.dev>; Fri, 12 May 2023 13:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683896627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7vyYqKowntrH5TESdu+nnql3fraQEOqrTs1VN1eLvlA=;
	b=SmEv43e9EZGDR5zs9OIMIXPmcyK2uri3cHd3O2wQiLdDvfRN/unMSN3JRBX3awdXQ0JFOI
	NMuMVe1kUHoS7tMn1jdOLJN2PHuvFv+gGOtALTWyL941i8eyQq3LZvVWq6k38hwMiq8bFV
	KOnFxbAqkqsQJ/LMWVQ/5FGkgcSQFa0=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-IsbS6faVM6ubchx38olzwQ-1; Fri, 12 May 2023 09:03:43 -0400
X-MC-Unique: IsbS6faVM6ubchx38olzwQ-1
Received: by mail-yb1-f200.google.com with SMTP id 3f1490d57ef6-b8f6bef3d4aso19456682276.0
        for <linux-staging@lists.linux.dev>; Fri, 12 May 2023 06:03:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683896623; x=1686488623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7vyYqKowntrH5TESdu+nnql3fraQEOqrTs1VN1eLvlA=;
        b=e42XYGAW4wxK5+0fwcF4L2QBflpdFUftD4Oa/CAFJ+uRpbfQmV1oTa3Tuz0D/HZnZ/
         nSu49ChrwimQuW67SHxCjsRRj4jf04mIdCGOhEsxgXOrez7zgV7OH4kIU+zdwXxhAld9
         /7uw3ctC2Gjt0BTUa1rRLn0tQHO6qKr67SgsBCD1LVfH1xSpdhTbTRgdzHgM4sMzV0N/
         qKlpanu2ivXYCg5zmLv8R8l4WQxcAP0nWj+KeQi9QTGAQnJG/ts7oAJf2BgFuxnX4md3
         CIDtxLzOO4BpG4H3+pC4GAkxpWguHGR2t/sjbq5lUXXMHZUXSCoWS1RwcMnn/ABIDxGp
         GxOQ==
X-Gm-Message-State: AC+VfDxcvCOc7YA0HvnLStxz8hvYCfppV10FuaYq97oQqwjn58Nlvr8C
	TaTAzae/z6XyXS6Qc8oB6nbGfu/iSa/rcOtjE0NNUHWLZGZNgOIDe90pDx5GaXyPu5TyG+Aimcx
	MG9vmLtuDYaVakNwJqEPiZa3Em0DR/hQounV6b3QN1Q==
X-Received: by 2002:a05:7500:e56a:b0:105:7a07:8604 with SMTP id rh42-20020a057500e56a00b001057a078604mr943434gab.61.1683896622959;
        Fri, 12 May 2023 06:03:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5dVexvddLUcjN/zVlZgJrAoivqibOPzux2/Wn/gjHcLQ5Nb6s+25KWtNakTprxdBljBky3vIfmIcNIUXqFI88=
X-Received: by 2002:a05:7500:e56a:b0:105:7a07:8604 with SMTP id
 rh42-20020a057500e56a00b001057a078604mr943377gab.61.1683896622432; Fri, 12
 May 2023 06:03:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230512100620.36807-1-bagasdotme@gmail.com> <20230512100620.36807-5-bagasdotme@gmail.com>
In-Reply-To: <20230512100620.36807-5-bagasdotme@gmail.com>
From: Richard Fontana <rfontana@redhat.com>
Date: Fri, 12 May 2023 09:03:31 -0400
Message-ID: <CAC1cPGxxOhmQS6J9tDCSaaaMEAgpCVRv2XpndyNnyEfvUKcQoA@mail.gmail.com>
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 12, 2023 at 6:07=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
>
> Replace GPL boilerplate notice on remaining files with appropriate SPDX
> tag. For files mentioning COPYING, use GPL 2.0; otherwise GPL 1.0+.

> diff --git a/drivers/net/ethernet/8390/ne2k-pci.c b/drivers/net/ethernet/=
8390/ne2k-pci.c
> index 6a0a2039600a0a..ea3488e81c5f3c 100644
> --- a/drivers/net/ethernet/8390/ne2k-pci.c
> +++ b/drivers/net/ethernet/8390/ne2k-pci.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-1.0+
>  /* A Linux device driver for PCI NE2000 clones.
>   *
>   * Authors and other copyright holders:
> @@ -6,13 +7,6 @@
>   * Copyright 1993 assigned to the United States Government as represente=
d
>   * by the Director, National Security Agency.
>   *
> - * This software may be used and distributed according to the terms of
> - * the GNU General Public License (GPL), incorporated herein by referenc=
e.
> - * Drivers based on or derived from this code fall under the GPL and mus=
t
> - * retain the authorship, copyright and license notice.  This file is no=
t
> - * a complete program and may only be used when the entire operating
> - * system is licensed under the GPL.

I don't think you should delete those last two sentences.

"Drivers based on or derived from this code fall under the GPL and must
retain the authorship, copyright and license notice."

The notice has:

 * Authors and other copyright holders:
 * 1992-2000 by Donald Becker, NE2000 core and various modifications.
 * 1995-1998 by Paul Gortmaker, core modifications and PCI support.
 * Copyright 1993 assigned to the United States Government as represented
 * by the Director, National Security Agency.

Nothing in the GPL requires retention of "authorship", as some other
licenses do (you can argue that GPLv2 conflates authorship with
copyright ownership, but this sentence seems to distinguish
"authorship" from "copyright" as does the listing of authors). There
is (arguably) a tradition of treating extra author attribution
requirements as legitimate, but if you view them as extra requirements
you can't, or shouldn't, just remove them arbitrarily.

Then there's this:

"This file is not a complete program and may only be used when the
entire operating system is licensed under the GPL."

Whether or not that's a correct statement of GPL interpretation
(perhaps it depends on the meaning of "entire operating system"), it's
significant enough as a nonstandard interpretive comment that I think
you should probably not remove it.

Richard

