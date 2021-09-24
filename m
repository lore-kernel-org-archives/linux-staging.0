Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A779D72
	for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 13:33:23 +0000 (UTC)
Received: from mail-wr1-f53.google.com ([209.85.221.53]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MBltK-1mZJ933BbY-00CBXz for <linux-staging@lists.linux.dev>; Fri, 24 Sep
 2021 15:28:09 +0200
Received: by mail-wr1-f53.google.com with SMTP id t8so27672029wri.1
        for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 06:28:09 -0700 (PDT)
X-Gm-Message-State: AOAM533J+MahPCryxW+1juvxlFVL23VSIinX+F/cwd7oDw0wE4LUk7FS
	MuYyyIyWVxqo9APlo0R09A3IuCZ9SdCbGfnqEPo=
X-Google-Smtp-Source: ABdhPJzM3QVWlDWl9O9PVMbkk54ItVxgQmlG7vgvUmkivSCUC8cK58oe7WVemGT0uxg3hhg7v6G/Qeb1GuFgaELom84=
X-Received: by 2002:a05:600c:3209:: with SMTP id r9mr2123128wmp.35.1632490089268;
 Fri, 24 Sep 2021 06:28:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210922042041.16326-1-sergio.paracuellos@gmail.com>
 <CAK8P3a2WPOYS7ra_epyZ_bBBpPK8+AgEynK0pKOUZ6ajubcHew@mail.gmail.com>
 <CAMhs-H8EyBmahhLsx+a0aoy+znY=PCm4BT97UBg4xcAy3x2oXg@mail.gmail.com>
 <CAK8P3a0fQZvpNCKF7OUy_krC_YPyigtd5Ak_AMXXpx84HKMswA@mail.gmail.com>
 <CAMhs-H-OCm1p6mTTV6s=vPx7FV8+1UMzx0X00wvXkW=5OgFQBQ@mail.gmail.com>
 <CAK8P3a1iN76A5ahTTQ6rCS4LjKHz8grkNGHGehLJnd0xQSnHXA@mail.gmail.com>
 <CAMhs-H_hZk3hruCaWRjKjUSj6vhVE+JZfk9nT7v1=mcc-H9wnw@mail.gmail.com>
 <CAK8P3a3C0rG_JWWCU6T4B=+j2-+6S6Gq+aw_9e6XeVun9LoF0w@mail.gmail.com>
 <CAMhs-H8kH7CMXENqDW_6GLTjeMMyk+ynehMmyBr=kFZPFHpM0A@mail.gmail.com>
 <CAK8P3a2WmNsV9fhSEjqwHZAGkwGc9HOurhQsza7JOM2Scts2XQ@mail.gmail.com>
 <CAMhs-H8fRnLavLfdw7jZO0tb8rWqdF81cGHhYT6gGp4UY1gChg@mail.gmail.com>
 <CAK8P3a2MJO--xmAZ_71h1QQ5_b8WXgyo-=LaT7r7yMMBUHoPfQ@mail.gmail.com>
 <CAMhs-H_xdkpinyj-Y1u==ievpGWZ2Ze-_U7aCUcfu0=NKBq2xQ@mail.gmail.com>
 <CAK8P3a0OWyW9Wk0kHXsj_7qTd0fVXQnszzun+HacHeTKYETXhw@mail.gmail.com>
 <CAMhs-H9xrXgbuwYe2STzuq0aBwj0onJGc0Oka6+pzgoHb0j8rA@mail.gmail.com>
 <CAK8P3a1AwaSi_J9p4tKwNKxENHhwofDu=Ma=F29ajSmMXoC7RA@mail.gmail.com>
 <CAMhs-H_wxoJC7ZVnkhXNfAcP-P9BNN99ogszM_iJhErHLq8Rdg@mail.gmail.com>
 <CAK8P3a3dvhWT=Xq22xTNn_VbX29s3t9wrw1DbffPbWuHxtTTmg@mail.gmail.com> <CAMhs-H9OhXHA3_mq2PSoaPvYCstqqHL7TfL0zf=OFNeFmWVTRQ@mail.gmail.com>
In-Reply-To: <CAMhs-H9OhXHA3_mq2PSoaPvYCstqqHL7TfL0zf=OFNeFmWVTRQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 24 Sep 2021 15:27:53 +0200
X-Gmail-Original-Message-ID: <CAK8P3a36jiomsqSr0rP8_BL8HwceKvV78bT2Ym+iomSGyYuOGA@mail.gmail.com>
Message-ID: <CAK8P3a36jiomsqSr0rP8_BL8HwceKvV78bT2Ym+iomSGyYuOGA@mail.gmail.com>
Subject: Re: [PATCH v3] PCI: of: Avoid pci_remap_iospace() when PCI_IOBASE not defined
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-pci <linux-pci@vger.kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-staging@lists.linux.dev, 
	gregkh <gregkh@linuxfoundation.org>, Liviu Dudau <Liviu.Dudau@arm.com>, 
	Rob Herring <robh@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:QvwKTh2fVIeSXGvJveOyFGtXuSu0c7BzXBlSIVqGrxJEzl2e4OZ
 TjmcFxBfw0MvGLj9jh/4JmMW9m31KbzkvM6NYIOZAgLdwLma2vMoO8PquR4/18g6OifXN0Y
 aQA6QcZKrySOZEAvbelbyde6IWe7Iqi3nxlEL0WAzqpVHCieOVJbmTSxxtbcdAtW1/4w+xy
 gATMEWIN6Q/bxYy5I70ZA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wTp7eHPUbhI=:JGgZbG4a9kCqXCWICIaSdK
 JfbZ3eafg+X7f10DWGL3+dtNO1B1k478MhQwwOscQ54LBZaiaxyGt0y6Wd0xzIEwEpk5PRm8T
 hDWd9YWVoF2K9Jj1nadi7JaHmSl3HROlA2Rfmmgw+pLJKvkDCDduHiMTus7tzi+1882b6inUL
 B4+a8VungwNSyMHbii/eniAKM+pIKbC5uGSH4A1F3EwvFfZEFedMxCmHJfYfehtHuMrTNahiG
 Pj7i0aAmQQlIe1X+8kf3l96BKENU3KMxBH1/I0bBfpG2YrHgereTJ2uBI/njFH8CrPLNz0Zt3
 DVx1eBbDROv45eBEd17E3Yk2f29NKnxriozWGRKZxg3vziXsQdBdrvV/11WCA2Vn4n5HF/yUP
 LdvGeSMfblGUhcCgI7fFt/6gORIKOnBV3iHo52UczO1pf9t9pwsLfd5p/hY3QabxpPvCAgl+J
 mED/pqd4qK6PVNd4tcOIyhWR1QbJc/omFF7nvQnBrkk7wFsiytJpjZVN9KGqh8TJU2B9QONBS
 ayoGF3x+D/z9J2vIrk30fJm5aJEBJQwfR+q1o4li6F7e4HlZpg2iNpnkXcbY4YxQleNxxnXIn
 k7gFkB/esVIWtibU7rnR+Bqdt36Dtp6pxd0Exwj6qlZuPlkbDh3+IPi08N+1V7Axil7fAc9Fw
 YaG6ovgdUHErDQqNQGxm6BH7vAq1lBbNPkFApFHg0qikUVGeyeAUQzEvk05sL1TdZH4FJ7Z7o
 pbVdIZ1xRP8kc4Z7tj7VLTlz0XyapCQ/qrfFX3t0aCKMARvcE8FritOC1IOeEQHGE7dktcAcM
 7yb7O6NemBER0DK6IQmUkAP+eNvBWfvRYqi3mbl7aS94Q5qFZSN/xE1Osv7W6rWKJuMhadgYA
 k1D6VYVWHHaD8SqRgyYA==

On Fri, Sep 24, 2021 at 2:46 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
> On Fri, Sep 24, 2021 at 1:39 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Fri, Sep 24, 2021 at 12:15 PM Sergio Paracuellos
>
> > I meant RALINK_PCI_IOBASE. We do need to write both, to clarify:
> >
> > RALINK_PCI_IOBASE must be set to match the *bus* address in DT,
> > so ideally '0', but any value should work as long as these two match.
> >
> > PCI_IOBASE/mips_io_port_base must be set to the *CPU* address
> > in DT, so that must be 0x1e160000, possibly converted from
> > physical to a virtual __iomem address (this is where my MIPS
> > knowledge ends).
>
> Understood. I have tried the following:
>
> I have added the following at the beggining of the pci host driver to
> match what you are describing above:
>
> unsigned long vaddr = (unsigned long)ioremap(PCI_IOBASE, 0x10000);
> set_io_port_base(vaddr);
>
> dev_info(dev, "Setting base to PCI_IOBASE: 0x%x -> mips_io_port_base
> 0x%lx", PCI_IOBASE, mips_io_port_base);
>
> PCI_IOBASE is the physical cpu address. Hence, 0x1e160000
> set_io_port_base sets 'mips_io_port_base' to the virtual address where
> 'PCI_IOBASE' has been mapped (vaddr).

Ok, sounds good. I would still suggest using
"#define PCI_IOBASE mips_io_port_base", so it has the same meaning
as on other architectures (the virtual address of port 0), and replace
the hardcoded base with the CPU address you read from DT to
make that code more portable. As a general rule, DT-enabled drivers
should contain no hardcoded addresses.

> However, nothing seems to change:
>
> mt7621-pci 1e140000.pcie: Setting base to PCI_IOBASE: 0x1e160000 ->
> mips_io_port_base 0xbe160000
>                                                 ^^^
>                                                  This seems aligned
> with what you are saying. mips_io_port_base have now a proper virtual
> addr for 0x1e160000

Ok.

            Arnd
