Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAC93FC8
	for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 08:53:43 +0000 (UTC)
Received: from mail-wr1-f43.google.com ([209.85.221.43]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mv3I0-1mlDsc0qOW-00r2Mk for <linux-staging@lists.linux.dev>; Fri, 24 Sep
 2021 10:53:42 +0200
Received: by mail-wr1-f43.google.com with SMTP id u18so25137100wrg.5
        for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 01:53:41 -0700 (PDT)
X-Gm-Message-State: AOAM532sdg5LZj0k/pdisnESGxcsxLLM8QBdmygq4JY1SXIAMEnMZrX1
	Qrxl1/3hjkPWJ3p/I8/wskf3XodPPp5QXywknlo=
X-Google-Smtp-Source: ABdhPJyPu1kIql0u17xRVgQRJGaYD/zgnJdUJvEsA5NSxOXpHQrUJVnFrpQxg44ZwAOpD5GkNjOPsUJijumnxYh7HtA=
X-Received: by 2002:a1c:7413:: with SMTP id p19mr868659wmc.98.1632473621615;
 Fri, 24 Sep 2021 01:53:41 -0700 (PDT)
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
 <CAK8P3a0OWyW9Wk0kHXsj_7qTd0fVXQnszzun+HacHeTKYETXhw@mail.gmail.com> <CAMhs-H9xrXgbuwYe2STzuq0aBwj0onJGc0Oka6+pzgoHb0j8rA@mail.gmail.com>
In-Reply-To: <CAMhs-H9xrXgbuwYe2STzuq0aBwj0onJGc0Oka6+pzgoHb0j8rA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 24 Sep 2021 10:53:25 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1AwaSi_J9p4tKwNKxENHhwofDu=Ma=F29ajSmMXoC7RA@mail.gmail.com>
Message-ID: <CAK8P3a1AwaSi_J9p4tKwNKxENHhwofDu=Ma=F29ajSmMXoC7RA@mail.gmail.com>
Subject: Re: [PATCH v3] PCI: of: Avoid pci_remap_iospace() when PCI_IOBASE not defined
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-pci <linux-pci@vger.kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-staging@lists.linux.dev, 
	gregkh <gregkh@linuxfoundation.org>, Liviu Dudau <Liviu.Dudau@arm.com>, 
	Rob Herring <robh@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:g5FJanpMFI133iKb85yfJPuxoU2D7iETQpkfLx74y/VrmJtAc8K
 7bXTZdf2QmH3euI8o+kaHDfPvIYgAu0iuZgiVYUPDdI3TAPRhCMEUdP+iL161OODIyLjwqA
 vxjkPxmZtDqB7LyFeczo6QACcuVHhx5RfZYghgPniV2pf8v4pe0bDEAiTzY44hr/bzUgYp2
 l6ULCAQtapXKwYgLyZkuQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:sUhgYaZKhBs=:NAGQtlracxawshLwwi4wLa
 mgP7q9DGDHsCOeH98ItsgShRxLEEx5+8lW8DrBtsGHEqaSbPI30fArXPAtkshk8+cXKed8xcG
 irNSjnKW4bLvaTNQD22t2ASpRFnqArO/RPCOr+WWUuCa+Pxhe6bHrI72gpc2LP+vboWMYaL9J
 aI5nHh4OIO81muzSsBz0xfVjP5967S23meQck6xGSN4mMiVjehNIBTP1zNt+h1Naf4OdQMjjJ
 BBgiZixlO/0hmo5kcLn3QQfqTMPPw7LU3TC7fEy3r7R44xSKpoJsfhjZKxdiRSoJzisKfbRAI
 5Jc2Cmm9st70VOMb2qZf8Mc+l6h8XfiKsxrwM2u1ekwXSMHfZg5KjJLJglicHYqYqUC64e9xR
 DhTZMxnZxfkTc5EGJXaq6hYk/MnzP2v7M5tljrNJT32BbSjHSFXyKvCm/Wyo0MTPo9hKDgQmm
 nLhAz8C0m5aSTqk0WPpm5ckSnh4kH+noeOXCkL6cfiC8/8WPm74MQBaAJHFVNmmVVY/Cf4BPb
 OuMC1DIhgQIR+Ao6vw01K1/2ENXGdRLRzMrA08loEXM04b+PIGvLF9hkdfgbAW2wk+ieL6OUi
 pnTPe+6RipmbtUUdB3JWnKzmvWPJkV9U9bYx3D7/bR4Eh2hw4vafZr4ZtQmaKNH0jZINU7AHb
 8Wx7kD4334KjY7xzq2ghwPPzCKWCF072OFW6FAzD6h4AMy0skWMgwyU2kcEhBXHircoAJynv7
 dtMjxubH8INfe8CwwHC6qN1fhEI9NYQYqUcUBg==

On Thu, Sep 23, 2021 at 10:33 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
> On Thu, Sep 23, 2021 at 7:55 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Thu, Sep 23, 2021 at 4:55 PM Sergio Paracuellos
> >
> > Ok, got it. So the memory space uses a normal zero offset with cpu address
> > equal to bus address, but the I/O space has a rather usual mapping of
> > bus address equal to the window into the mmio space, with an offset of
> > 0x1e160000.
> >
> > The normal way to do this would be map the PCI port range 0-0x10000
> > into CPU address 0x1e160000, like:
> >
> > ranges = <0x02000000 0 0x60000000 0x60000000 0 0x10000000>,  /* pci memory */
> >                <0x01000000 0 0x1e160000 0 0 0x00010000>;
>
> This change as it is got into the same behaviour:
>
> mt7621-pci 1e140000.pcie: host bridge /pcie@1e140000 ranges:
> mt7621-pci 1e140000.pcie:   No bus range found for /pcie@1e140000,
> using [bus 00-ff]
> mt7621-pci 1e140000.pcie:      MEM 0x0060000000..0x006fffffff -> 0x0060000000
> mt7621-pci 1e140000.pcie:       IO 0x0000000000..0x000000ffff -> 0x001e160000
>                                                    ^^^^^^
>                                                     This is the only
> change I appreciate in all the trace with the range change.

Oops, my mistake, I mixed up the CPU address and the PCI address.

The correct notation should be

<0x01000000 0 0  0 0x1e160000 0x00010000>;

i.e. bus address 0 to cpu address 0x1e160000, rather than the other
way around as I wrote it.

> pci 0000:00:02.0: PCI bridge to [bus 03-ff]
> pci 0000:00:02.0:   bridge window [io  0x0000-0x0fff]
> pci 0000:00:02.0:   bridge window [mem 0x00000000-0x000fffff]
> pci 0000:00:02.0:   bridge window [mem 0x00000000-0x000fffff pref]
...
> pci 0000:00:02.0: PCI bridge to [bus 03]
> pci 0000:00:02.0:   bridge window [io  0x2000-0x2fff]
> pci 0000:00:02.0:   bridge window [mem 0x60400000-0x604fffff]
> pci 0000:00:02.0:   bridge window [mem 0x60500000-0x605fffff pref
>
> # cat /proc/ioports
> 00000000-0000ffff : pcie@1e140000
>   00000000-00000fff : PCI Bus 0000:01
>     00000000-0000000f : 0000:01:00.0
>       00000000-0000000f : ahci
>     00000010-00000017 : 0000:01:00.0
...

These are all what I would expect, but that should just be
based on the PCI_IOBASE value, not the mapping behind that.

> > Do you know where that mapping is set up? Is this a hardware setting,
> > or is there a way to change the inbound I/O port ranges to the
> > normal mapping?
>
> The only thing related is the IOBASE register which is the base
> address for the IO space window. Driver code is setting this up to pci
> IO resource start address [0].

So this line:
      pcie_write(pcie, entry->res->start, RALINK_PCI_IOBASE);

That does sound like it is the bus address you are writing, not
the CPU address. Some host bridges allow you to configure both,
some only one of them, but the sensible assumption here would
be that this is the bus address if only one is configurable.

If my assumption is correct here, then you must write the value
that you have read from the DT property, which would be
0x001e160000 or 0 in the two versions of the DT property we
have listed, but in theory any (properly aligned) number ought
to work here, as long as the BAR values, the RALINK_PCI_IOBASE
and the io_offset all agree what it is.

The line just before this is

pcie_write(pcie, 0xffffffff, RALINK_PCI_MEMBASE)

Can you clarify what this does? I would have expected an
identity-map for the memory space, which would mean writing
the third cell from the ranges property (0x60000000)
into this. Is -1 a special value for identity mapping, or does
this register do something else?

          Arnd
