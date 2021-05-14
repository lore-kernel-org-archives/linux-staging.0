Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5342470
	for <linux-staging@lists.linux.dev>; Fri, 14 May 2021 11:30:28 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id j75so28124551oih.10
        for <linux-staging@lists.linux.dev>; Fri, 14 May 2021 04:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I9A3nXY3kUs1dCLrxrDBTwMVEeu4aFNeSYtm9K3Kp8M=;
        b=Zu0kMNaA+VfdfU/cHDDtfr8znlbneoVWuur733RqIN4ZBC0OuXa/1ESBC9MKcs+yPV
         /3+grRzw6qjrCQmJssWN3/mN4sGd8q7dtv13xguBZr+OjR/jxL4N42JgtJb3m1SSM579
         Jrhj+faVyCFWmCikRk8hXucEfqbYHw5nPWa+Z4XGgwq7XrhihB67SQ+aghSKvtTWP2lD
         a+N+W95KUieb2Y5gyTH3BkDtkjyFXzyfrtqFRYxNJViYA1CkdOxd9JmUegm+xh+7RAaB
         kdXwPYuwAsqde8TfSBJhgKdYsuBTLQhHSartMAwBkhijZyhESWtibNa4w7L1+2qjyCAp
         vAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I9A3nXY3kUs1dCLrxrDBTwMVEeu4aFNeSYtm9K3Kp8M=;
        b=gNIBgdgxC1VETSxWMLNW5oTtWmxary3hVMz5gserwr8Mk6YvR5r4Fm6o1CPejxJvKK
         ACfJm7CGFCVPzj7SOXWdpOcH1j4ZHth5VEKwzfGhtJu5rNcG/l1vnoaB43OL7Uninequ
         tAVtx5DpFf97CJCOtZbr41YxjeIw3/AWoVjfAhDm40004qHnKf4OpeoBHFhQeyJw727i
         +ptjlnuMQG8y8sLMuTRDAqAOOZx/yYwztoK7ZHb78LdFJQKBYnpYQK62GTHrSs2AgMXs
         kWswTehMZzdjd57sVhctpe3ufyKZl+G3WK6EhbBiDml21CGhjKJW9rQ3WbLWrfKgsApq
         wUbg==
X-Gm-Message-State: AOAM530huRBVOU3/6yx8O5t3kj57mGWGnOe4SKoZ6q7/IZLlCiRpgwEl
	mW5S7N4LsR+FNPleYd95Y5u2KtBZnYQ+/K89dEE=
X-Google-Smtp-Source: ABdhPJz/ERXhEYZDgOaIYDv7u7TRctVMeZb1O535axRV9MDzBlsvmc6AlLq+npWyEpXhKg16Cv0rRZvByOjuJxWekg8=
X-Received: by 2002:aca:ab8c:: with SMTP id u134mr6631520oie.158.1620991827668;
 Fri, 14 May 2021 04:30:27 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210508070930.5290-1-sergio.paracuellos@gmail.com>
 <YJ5VHnZaLi4o31vL@vkoul-mobl.Dlink> <CAMhs-H8A1o3_TJGjPNUO3K_gf+kDkbj7mFy21LJfUEB0sEhvSg@mail.gmail.com>
 <YJ5ddkGytGI+kAt9@kroah.com>
In-Reply-To: <YJ5ddkGytGI+kAt9@kroah.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 14 May 2021 13:30:16 +0200
Message-ID: <CAMhs-H8kjL-TdX97mvw+Q3X-HybR3Ox8KrXUY3vJp2jKwv4Q8g@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 0/6] phy: ralink: mt7621-pci-phy: some improvements
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-phy@lists.infradead.org, 
	Rob Herring <robh+dt@kernel.org>, linux-staging@lists.linux.dev, 
	NeilBrown <neil@brown.name>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, May 14, 2021 at 1:22 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Fri, May 14, 2021 at 01:19:18PM +0200, Sergio Paracuellos wrote:
> > On Fri, May 14, 2021 at 12:46 PM Vinod Koul <vkoul@kernel.org> wrote:
> > >
> > > On 08-05-21, 09:09, Sergio Paracuellos wrote:
> > > > Hi all,
> > > >
> > > > This series contains some improvements in the pci phy driver
> > > > for MT7621 SoCs.
> > > >
> > > > MT7621 SoC clock driver has already mainlined in
> > > > 'commit 48df7a26f470 ("clk: ralink: add clock driver for mt7621 SoC")'
> > > >
> > > > Because of this we can update schema documentation and device tree
> > > > to add related clock entries and avoid custom architecture code
> > > > in favour of using the clock kernel framework to retrieve clock
> > > > frequency needed to properly configure the PCIe related Phys.
> > > >
> > > > After this changes there is no problem to properly enable this
> > > > driver for COMPILE_TEST.
> > > >
> > > > Configuration has also modified from 'tristate' to 'bool' depending
> > > > on PCI_MT7621 which seems to have more sense.
> > >
> > > Applied 2-6, thanks
> >
> > Thanks, Vinod.
> >
> > Greg, can you take patch 1 through your tree?
>
> Sure, can you resend it?

Thanks, I have just resent it.

>
> thanks,
>
> greg k-h

Best regards,
     Sergio Paracuellos
