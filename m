Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77483FC8
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 19:57:41 +0000 (UTC)
Received: from mail-wr1-f53.google.com ([209.85.221.53]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MmlGg-1nBZzh3nGQ-00jqOj for <linux-staging@lists.linux.dev>; Wed, 22 Sep
 2021 21:57:39 +0200
Received: by mail-wr1-f53.google.com with SMTP id w17so10255320wrv.10
        for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 12:57:39 -0700 (PDT)
X-Gm-Message-State: AOAM531z7Yo0jRngiRQ5fObLXlDALe83a/pvkhSE8dR6FfE/4AfAdard
	gta5ZR+eCYdIGQdHjOv5sn9twvzOA45AGAauq5M=
X-Google-Smtp-Source: ABdhPJwgGZ9USpTQcbjF1tGcTxsBwqBG1jppN6hfyIkZHEanRUZjCnfn1k1S8QsRU2t3uS2PlP2EINDKZA9arVayJqE=
X-Received: by 2002:adf:f481:: with SMTP id l1mr780247wro.411.1632340659471;
 Wed, 22 Sep 2021 12:57:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210922042041.16326-1-sergio.paracuellos@gmail.com>
 <CAK8P3a2WPOYS7ra_epyZ_bBBpPK8+AgEynK0pKOUZ6ajubcHew@mail.gmail.com>
 <CAMhs-H8EyBmahhLsx+a0aoy+znY=PCm4BT97UBg4xcAy3x2oXg@mail.gmail.com>
 <CAK8P3a0fQZvpNCKF7OUy_krC_YPyigtd5Ak_AMXXpx84HKMswA@mail.gmail.com> <CAMhs-H-OCm1p6mTTV6s=vPx7FV8+1UMzx0X00wvXkW=5OgFQBQ@mail.gmail.com>
In-Reply-To: <CAMhs-H-OCm1p6mTTV6s=vPx7FV8+1UMzx0X00wvXkW=5OgFQBQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 22 Sep 2021 21:57:23 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1iN76A5ahTTQ6rCS4LjKHz8grkNGHGehLJnd0xQSnHXA@mail.gmail.com>
Message-ID: <CAK8P3a1iN76A5ahTTQ6rCS4LjKHz8grkNGHGehLJnd0xQSnHXA@mail.gmail.com>
Subject: Re: [PATCH v3] PCI: of: Avoid pci_remap_iospace() when PCI_IOBASE not defined
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-pci <linux-pci@vger.kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-staging@lists.linux.dev, 
	gregkh <gregkh@linuxfoundation.org>, Liviu Dudau <Liviu.Dudau@arm.com>, 
	Rob Herring <robh@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:mkUu3tAaBZHPxUnVEmVZhYIZLBcCEow/JOkJlsyHro2BW/GYOvn
 fjz9Lx62KetWoayJ54WIgKCrR5fAfjCenPGHzV2B6xy3KXHdCWWQnZBVJ1fxSxmYAlc6jCC
 WOgYp+iqFWh/ksXSgX0aWQHy/+3PbJ/IYsgs/vzcix7XfBti4Tv6GJSyIH7vtWeiTfQ1Ygu
 1dAEldAW5pZiFb2b/IR4g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:c+JI68mFeLg=:DTghU1ZuxZ0ysM/yM4BP84
 871FSZJuJ7MwmldoeY7UYCzuk9plbcYaBrOw+e0I/FCJFH47s+eQdgQN0JdtZ7r6NRNeXh1MD
 8ggrnrAsPCLJNf8b0Pi+xhisuBroAOMe2MO87oSDHQAlvAuAM8MUuA68BmEajRtxYEZMxoqAI
 Z5ulChLW4YYer72gp2sQ1hxTbGDxgV02uLzF8xQz9eKqn+h+0GzIBTSIuKdGcgBJ4JpsqTAGu
 qKawB8On949aieFcYk1HMlcnylI0sfAnDjO9cULvaV1wNWuru+elvrtce2NDd9J93JJP1q1rt
 a8xM3X9P1+NBt+XlkJOtIG3LTHZLHgNdZCgMlaP53+LqTjZs/F8oaBlEB71pR1o/puezSE21g
 pmpCJ8OeLh3T8c7W7Zm6m9j4E3pv+QJQcEG+JYKFoXzT6lObeo706jGNC59xn3gVWRzCI4Iwu
 kWO8DBy/OqL53TO3lwLWXXdJBphJhpQ36maj4VYlQT30KqioH+vXSY+KEDPwvPw/qpVms0Xzo
 qLXNpUwTBvTo+gRzjH8paEVTDEDCFOk6Gw9ad+Nvp4dyaSEeRN6I0mPLh+AWAavnJDy+FLTSS
 FuQ1v6VlVZTZvFbSEUaPLGyXecSwdvG4WzLmThDu9FwvpwXlPCGchmEMt8dCcZjiGOMKqB8Ih
 iaP1+dzFuNRfDZseR1LVWd9eL8x1bCOXkcTLDSfPW7H1j9sJQiN87P1wDr9Y1TmOgcHCdLIG2
 mWnJAA4D+RzVv22AWznqHKqH2dpeEsXD9U06Zw94Du4cuxWip1/nOtvdUALYHOKDVRYe2glYM
 7FALB16UIrkRlN7dr82DBTEz2hpE5JttWE2mN6sZDSyU1oWHFIKqRce49cLTNZ2I5gylOtrlw
 mubgOZbRafGWQBFzXjiw==

On Wed, Sep 22, 2021 at 8:40 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
> On Wed, Sep 22, 2021 at 8:07 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Wed, Sep 22, 2021 at 7:42 PM Sergio Paracuellos
> > Ok, thank you for the detailed explanation.
> >
> > I suppose you can use the generic infrastructure in asm-generic/io.h
> > if you "#define PCI_IOBASE mips_io_port_base". In this case, you
> > should have an architecture specific implementation of
> > pci_remap_iospace() that assigns mips_io_port_base.
>
> No, that is what I tried originally defining PCI_IOBASE as
> _AC(0xa0000000, UL) [0] which is the same as KSEG1 [1] that ends in
> 'mips_io_port_base'.

Defining it as KSEG1 would be problematic because that means that
the Linux-visible port numbers are offset from the bus-visible ones.

You really want PCI_IOBASE to point to the address of port 0.

> > pci_remap_iospace() was originally meant as an architecture
> > specific helper, but it moved into generic code after all architectures
> > had the same requirements. If MIPS has different requirements,
> > then it should not be shared.
>
> I see. So, if it can not be shared, would defining 'pci_remap_iospace'
> as 'weak' acceptable? Doing in this way I guess I can redefine the
> symbol for mips to have the same I currently have but without the
> ifdef in the core APIs...

I would hope to kill off the __weak functions, and prefer using an #ifdef
around the generic implementation. One way to do it is to define
a macro with the same name, such as

#define pci_remap_iospace pci_remap_iospace

and then use #ifdef around the C function to see if that's arleady defined.

> >
> > I don't yet understand how you deal with having multiple PCIe
> > host bridge devices if they have distinct I/O port ranges.
> > Without remapping to dynamic virtual addresses, does
> > that mean that every MMIO register between the first and
> > last PCIe bridge also shows up in /dev/ioport? Or do you
> > only support port I/O on the first PCIe host bridge?
>
> For example, this board is using all available three pci ports [2] and I get:
>
> root@gnubee:~# cat /proc/ioports
> 1e160000-1e16ffff : pcie@1e140000
>   1e160000-1e160fff : PCI Bus 0000:01
>     1e160000-1e16000f : 0000:01:00.0
>       1e160000-1e16000f : ahci
>     1e160010-1e160017 : 0000:01:00.0
>       1e160010-1e160017 : ahci
>     1e160018-1e16001f : 0000:01:00.0
>       1e160018-1e16001f : ahci
>     1e160020-1e160023 : 0000:01:00.0
>       1e160020-1e160023 : ahci
>     1e160024-1e160027 : 0000:01:00.0
>       1e160024-1e160027 : ahci
>   1e161000-1e161fff : PCI Bus 0000:02
>     1e161000-1e16100f : 0000:02:00.0
>       1e161000-1e16100f : ahci
>     1e161010-1e161017 : 0000:02:00.0
>       1e161010-1e161017 : ahci
>     1e161018-1e16101f : 0000:02:00.0
>       1e161018-1e16101f : ahci
>     1e161020-1e161023 : 0000:02:00.0
>       1e161020-1e161023 : ahci
>     1e161024-1e161027 : 0000:02:00.0
>       1e161024-1e161027 : ahci
>   1e162000-1e162fff : PCI Bus 0000:03
>     1e162000-1e16200f : 0000:03:00.0
>       1e162000-1e16200f : ahci
>     1e162010-1e162017 : 0000:03:00.0
>       1e162010-1e162017 : ahci
>     1e162018-1e16201f : 0000:03:00.0
>       1e162018-1e16201f : ahci
>     1e162020-1e162023 : 0000:03:00.0
>       1e162020-1e162023 : ahci
>     1e162024-1e162027 : 0000:03:00.0
>       1e162024-1e162027 : ahci

Ah ok, so there are I/O ports that are at least
visible (may or may not be accessed by the driver).

I only see one host bridge here though, and it has a single
I/O port range, so maybe all three ports are inside of
a single PCI domain?

Having high numbers for the I/O ports is definitely a
problem as I mentioned. Anything that tries to access
PC-style legacy devices on the low port numbers
will now directly go on the bus accessing MMIO
registers that it shouldn't, either causing a CPU exception
or (worse) undefined behavior from random register
accesses.

       Arnd
