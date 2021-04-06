Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C166E6D10
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 16:02:04 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id f19so16101888ion.3
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 09:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y6td6U/wgXJy1PKxkTx+qADiVVwnBDVWbevDjru0nls=;
        b=XvPpCjYxNmJmPbhWQwWWLjNrOfwWJekG5FGqReCq3HR7smTKgok8w/+146+n12sXYh
         g1SrBLJkHm6800/a8NRq/X+CMSiz6G/JNNS8hv/BXu44w47pWOn4xjF227zQ2lkprOIh
         eGWepOCNQdmUWzQmHnj7HDx92mhDsbhqkmNXhEA/G8FyxFn6hoH1IVrtQ7PnvK8DwgzB
         PpYChXnoMFzZkwxfV3WUOwaNcPHs1chU+ro8WE+MMTT1XaElw/fgi6L1oS8RhBNtOjdF
         OYxHMqvZRgAwps12+XvU/yKiF+SLtPa48N5qxjKKm0GQe2t7kykpeRwCrm/FaC3hYWj6
         A/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y6td6U/wgXJy1PKxkTx+qADiVVwnBDVWbevDjru0nls=;
        b=luErrmScP/2Ncs4R3TtS7BoG4ukd95NHGu73r9h+klJKF0CHY/kHHA1WtHTKOrdXkB
         ezdx8ZGxHKsd8RX8W0oUkA0kqfsMwFUwuiOPUzFmTIUuIInaHdmxXWIGMh2ObxrIzp51
         iiVzA8SpyO1doM8sk9zEMu6Hj7/fB+Uupwpru2MIO+pi0Fk0X8dvvkGSh6EKdBua8XRb
         EhK71gorAPm3kYzdYyr6R7sED2R/Q4jCwWGAEUjYzYDkY64yIRBCpl7O1QjccM3cdSNr
         8a1CUDdX3HJQ5gpnSufD/pWmiLVaeP1liTLldAI5SaVzMBbjnA3gHGWYGB0SS/C28HKl
         rc1g==
X-Gm-Message-State: AOAM532bZoAMmpIgaQczLBd07fFYmjiqK1m6AW/scVVZi9PgOKWKyluJ
	sG/7TEYe4P6SuvESbKxZdPjVxfFJWHXMJHu+TB0=
X-Google-Smtp-Source: ABdhPJzrupn5Tqo/qGYiJFhgY4pom3bPfOsFnrJ4YLA/PGWrDxckk5HncixtyDHTPC1rXWyNlr2qX0SRG+OFMzNoklo=
X-Received: by 2002:a05:6638:144e:: with SMTP id l14mr29148356jad.76.1617724924002;
 Tue, 06 Apr 2021 09:02:04 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210406141819.1025864-1-dqfext@gmail.com> <20210406141819.1025864-3-dqfext@gmail.com>
 <YGx+nyYkSY3Xu0Za@lunn.ch> <CALW65jYhBGmz8dy+9C_YCpJU5wa-KAwgrGjCSpa3nqUNT+xU+g@mail.gmail.com>
 <YGyC9liu9v+DFSHA@lunn.ch>
In-Reply-To: <YGyC9liu9v+DFSHA@lunn.ch>
From: DENG Qingfang <dqfext@gmail.com>
Date: Wed, 7 Apr 2021 00:02:00 +0800
Message-ID: <CALW65jaTfcJoMqZPfLjbYXd+JWvG8CciUiGRmQwc_bf2538kog@mail.gmail.com>
Subject: Re: [RFC net-next 2/4] net: dsa: mt7530: add interrupt support
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	Landen Chao <Landen.Chao@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>, 
	Vivien Didelot <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, linux-staging@lists.linux.dev, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, netdev <netdev@vger.kernel.org>, 
	Weijie Gao <weijie.gao@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>, 
	=?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 6, 2021 at 11:49 PM Andrew Lunn <andrew@lunn.ch> wrote:
> O.K. So that makes it similar to the mv88e6xxx. With that driver, i
> kept interrupt setup and mdio setup separate. I add the interrupt
> controller first, and then do mdio setup, calling a helper to map the
> PHY interrupts and assign them to bus->irq[].
>
> That gives you a cleaner structure when you start using the other
> interrupts.

Okay. Will split the function in v2. Thanks.

>
>         Andrew
