Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A930E3FC7
	for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 18:09:11 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id u11so8980697uaw.3
        for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 11:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WXQl6xYHyo7VmGkogOZ2uCBbLxqiVuqGmz8mDC3PsVE=;
        b=RyN3JIcFIRv5HcRDNmaJXs0sPVG3iaG8G4p6T/woxXGgGDJyMVky1Qb/UdpUe30KJp
         +hwj4SYJX0Tw1JdrdDpGF/QUcAK+lytw0/3KVJ9fUqYtKMmkuOFVTog++LIeIaMjRxS7
         MZyJiwfHQKgjw8GA1vEN/Hl+oWlY0zowHuq/qzYf3/OFMlDArg8wn5JMV5u42l16ffzp
         0ABIgaTD7jLtYx9l8N0BMAGl1kORu+SiMXzfANpYHmATBYEk8Um3/gLgPVnsbWycguiI
         3qNezo/MTSpomvZBgS72bkv5xg9MStyz0oYiGvuAtJn2HxHVPU1uFS29ywB9WDpIQE8z
         kNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WXQl6xYHyo7VmGkogOZ2uCBbLxqiVuqGmz8mDC3PsVE=;
        b=sowudRHFViQv+Ce46NB8yTYTW8SkmP4+TgzhJyWRBaWg3M1LO4kYzeY62TB8BBk2GG
         DV/ZbHZ23pn7IJB2fwOT5kLl/94iegq0zQQw+m1ojKGZjvI815O2Ej0pQx/ZXIYZOCPI
         aRWXhIGY4WYl0LHPwQIhR5ZaWOcBuTkkqJWjjZusoblkB4orVl/7eBVkjDUojM/k9Tmz
         Adg7tL1taKx6BR30FyncYYQttu8Q2neq1lE6zBbciDZafeC3zzaq+ynI4nNMsIe0Ccrn
         JtUIiZNmYnfUcgOWZ7OoJRTnIsZgd6Ss1wn/vFxca0D4xC4KjBsItIaFhQN3wKglsYH1
         z9YA==
X-Gm-Message-State: AOAM533i/Tl0MZgFFazCXtA2AEXLvbpS5eZkWS6+v6lag+JDWzjeoMO0
	/idWGm1Y0/zY63bVUyA7yv9vRPPZnY2VDSW7+zk=
X-Google-Smtp-Source: ABdhPJxwiExLM3hzBCAfYUgeYdy55lPTeSgDo0znsn0D+vbB/KiyL4ObpmWFiOfukFEJXqJwZjiYBdvVrKix1Is/cIc=
X-Received: by 2002:ab0:538b:: with SMTP id k11mr11610115uaa.131.1632593350651;
 Sat, 25 Sep 2021 11:09:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210924211139.3477-1-sergio.paracuellos@gmail.com>
 <20210924211139.3477-6-sergio.paracuellos@gmail.com> <CAK8P3a3SpuioCVBfQpHFGuNQoXG7g8w9VL+V8rYd8Q80Od89HA@mail.gmail.com>
In-Reply-To: <CAK8P3a3SpuioCVBfQpHFGuNQoXG7g8w9VL+V8rYd8Q80Od89HA@mail.gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Sat, 25 Sep 2021 20:08:58 +0200
Message-ID: <CAMhs-H8jF10NpTgCP=_FEaBcedTN75b6MoyrEVrrayJEAdufwA@mail.gmail.com>
Subject: Re: [PATCH 5/6] MIPS: implement architecture dependent 'pci_remap_iospace()'
To: Arnd Bergmann <arnd@arndb.de>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Rob Herring <robh@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	gregkh <gregkh@linuxfoundation.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, 
	linux-staging@lists.linux.dev, NeilBrown <neil@brown.name>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Sat, Sep 25, 2021 at 7:32 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, Sep 24, 2021 at 11:11 PM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
> >
> > To make PCI IO work we need to properly virtually map IO cpu physical address
> > and set this virtual address as the address of the first PCI IO port which
> > is set using function 'set_io_port_base()'.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
>
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Thanks!

>
> > +int pci_remap_iospace(const struct resource *res, phys_addr_t phys_addr)
> > +{
> > +       size_t size = (res->end - res->start) + 1;
> > +       unsigned long vaddr = (unsigned long)ioremap(phys_addr, size);
> > +
> > +       set_io_port_base(vaddr);
> > +       return 0;
> > +}
>
> It might be good to check that res->start is zero here, otherwise
> the io_port_base would be off. That could happen if you ever have more
> than one bridge.

Do you mean something like the following?

int pci_remap_iospace(const struct resource *res, phys_addr_t phys_addr)
{
    unsigned long vaddr;
    size_t size;

    if (res->start != 0) {
         // Should I WARN_ONCE or just show an error/warning message??
         WARN_ONCE(1, "resource start must be zero\n");
         return -ENODEV;
   }

     size = (res->end - res->start) + 1;
     vaddr = (unsigned long)ioremap(phys_addr, size);
     return 0;
}

Thanks,
    Sergio Paracuellos
>
>         Arnd
