Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACB02FB8
	for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 13:13:11 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id u11so18111403oiv.1
        for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 06:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tWfCA/cj4bP11aI8fVw9bNbVzWrfY1MM09q/MJvO4sI=;
        b=i6NFfe6OqKkc2GjuixTIl6bkyFY/nAnyVpdf6bF7QM61nCgHovApujmDFYzOF9lwJm
         y2eO3cMlFvpPzJVoJmJ8C1GNWbNvG9YSnnR+CRENe040E4Yn0GQp/2t40HEXb4sPHOsm
         1hxQMJ9R5UtmttEvYcGQZFzVbur0cec6vjjFiDXuxexdrga9fOqJIVXgSEZ0CNepuRdf
         y/E6FpOxc+0R36qQBew9l7ZRd09QcUZECSzMe8kdByHUEbyUKqwCfjjbCvaDwydgNzJ3
         ebb2vGKoFEZm7tQhhp3bPrJkUcjv0YvWWb1H5oAV8CghI66nsj2TUs+1bXrQYjSJMQ6n
         VJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tWfCA/cj4bP11aI8fVw9bNbVzWrfY1MM09q/MJvO4sI=;
        b=sPFdKi603c09/LmcyNtWjl9L2IEuEWBlAXxDFrYyE+SG45w4mum+pQp1aMECkQu2ss
         nJ5Pe3heYi557XBfC+S/47DyyHfe/CD2xHP9n1br92+Ay3e1aZhzZs5NRo9paz4BY/SU
         he3b3IjxpqBePEIznTgIo+FUm/G0Co/2p6KsR5QYa8T1NvhhDlyC4P3IowQ9aZatpCS+
         3y1EOMrRWn6NRfrYYbpMTtNO7re+uwuSMTDcBMzCxAj1dU4kG20t/TWfGAUwzEk2l8mi
         +uiD/uM/YBRWI+wKDsbt8d+30o4RXD6ZIAQjvbjYdQmdHL5W0n9eaN74ALDFgxS9uZu6
         aoSw==
X-Gm-Message-State: AOAM530TwYSA6moymLa2Cn57zuE2zvBG+M2gJUiCDSD+T/Wn83LSBL8g
	+DxQH0XBvvdvldp1lN400UDBktClxMFiDLdtJWA=
X-Google-Smtp-Source: ABdhPJzjl3D4rly1033Ap18MIjyOPpXtFkFicUf+prWCfDN1Vg3sD2xplaKOs9IMGu15u/DVE6jFV2V9s/wiOyN2EXA=
X-Received: by 2002:aca:aad4:: with SMTP id t203mr14189684oie.149.1623762790534;
 Tue, 15 Jun 2021 06:13:10 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210614100617.28753-1-sergio.paracuellos@gmail.com>
 <20210614100617.28753-2-sergio.paracuellos@gmail.com> <20210615130830.GA7029@alpha.franken.de>
In-Reply-To: <20210615130830.GA7029@alpha.franken.de>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 15 Jun 2021 15:12:59 +0200
Message-ID: <CAMhs-H8TM=m2ULVYwOFR8kEw4h1EDHOeGaVh9WpvxmY8oP8NTg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] MIPS: ralink: Define PCI_IOBASE
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-staging@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>, 
	NeilBrown <neil@brown.name>, "open list:MIPS" <linux-mips@vger.kernel.org>, 
	Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, John Crispin <john@phrozen.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 15, 2021 at 3:09 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Mon, Jun 14, 2021 at 12:06:15PM +0200, Sergio Paracuellos wrote:
> > PCI_IOBASE is used to create VM maps for PCI I/O ports, it is
> > required by generic PCI drivers to make memory mapped I/O range
> > work. Hence define it for ralink architectures to be able to
> > avoid parsing manually IO ranges in PCI generic driver code.
> > Function 'plat_mem_setup' for ralink is using 'set_io_port_base'
> > call using '0xa0000000' as address, so use the same address in
> > the definition to align things.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> >  arch/mips/include/asm/mach-ralink/spaces.h | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >  create mode 100644 arch/mips/include/asm/mach-ralink/spaces.h
> >
> > diff --git a/arch/mips/include/asm/mach-ralink/spaces.h b/arch/mips/include/asm/mach-ralink/spaces.h
> > new file mode 100644
> > index 000000000000..87d085c9ad61
> > --- /dev/null
> > +++ b/arch/mips/include/asm/mach-ralink/spaces.h
> > @@ -0,0 +1,10 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef __ASM_MACH_RALINK_SPACES_H_
> > +#define __ASM_MACH_RALINK_SPACES_H_
> > +
> > +#define PCI_IOBASE   _AC(0xa0000000, UL)
> > +#define PCI_IOSIZE   SZ_16M
> > +#define IO_SPACE_LIMIT       (PCI_IOSIZE - 1)
> > +
> > +#include <asm/mach-generic/spaces.h>
> > +#endif
> > --
> > 2.25.1
>
> Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Fastest response ever :) Thanks!

>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
