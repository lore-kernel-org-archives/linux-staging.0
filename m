Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C392C9C
	for <linux-staging@lists.linux.dev>; Thu, 16 Dec 2021 13:00:36 +0000 (UTC)
Received: from mail-wr1-f43.google.com ([209.85.221.43]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MORIm-1n9Rga2dSA-00Pwjs for <linux-staging@lists.linux.dev>; Thu, 16 Dec
 2021 13:55:22 +0100
Received: by mail-wr1-f43.google.com with SMTP id c4so44026378wrd.9
        for <linux-staging@lists.linux.dev>; Thu, 16 Dec 2021 04:55:22 -0800 (PST)
X-Gm-Message-State: AOAM531dwJI1IirqfMpQ6kF017l5F2yupF51b8AJ5UruCAiK4BeLehPb
	rSBalGlbg8jhDShgzka2dABCMhumo3onUgm0wW0=
X-Google-Smtp-Source: ABdhPJxqiJNKIPDPxQiAYD/ADzEnUGacnfrfwb+mwnEiDpqRpaRAA43q41TWNAdS96RDEsxEkkrg/T9kHUnFSTm357Y=
X-Received: by 2002:adf:a352:: with SMTP id d18mr4393837wrb.317.1639659322216;
 Thu, 16 Dec 2021 04:55:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210925203224.10419-1-sergio.paracuellos@gmail.com>
 <20210925203224.10419-6-sergio.paracuellos@gmail.com> <67687e579e633d42dc501cfb6746c1cb9f600112.camel@mengyan1223.wang>
In-Reply-To: <67687e579e633d42dc501cfb6746c1cb9f600112.camel@mengyan1223.wang>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 16 Dec 2021 13:55:06 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3R67D+0KLrTncr+SiHg79itRkxbG9caDo6YsHKzRwwkA@mail.gmail.com>
Message-ID: <CAK8P3a3R67D+0KLrTncr+SiHg79itRkxbG9caDo6YsHKzRwwkA@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] MIPS: implement architecture-specific 'pci_remap_iospace()'
To: Xi Ruoyao <xry111@mengyan1223.wang>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Rob Herring <robh@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Liviu Dudau <Liviu.Dudau@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, gregkh <gregkh@linuxfoundation.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, 
	linux-staging@lists.linux.dev, NeilBrown <neil@brown.name>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:2C4BL7lfzZNQnqBWbh/imACh32y81kYyKrbXSxiymiXteWX7SDv
 xT5Dr5OjvdIg2Ihdbo/cqGq+4xPHpOiPT0zx3ptDbkZBE/P7LGUeLs4juVABa06+A9D6FAr
 B0MI84Dnw0iWB0wfkF5wr/7yx3MU0csJJjjoWFLR+X5HAwgpVBZQPjfjTKH8RkgWEjAr8rE
 5Q4Utzhk5DPwCpzZjj9AA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oGCoyUp+WDo=:E8VkyxrKEVbeKQeVB+KTxi
 cweoCWRPbZrlEo8yiA/8UGeGfRM5A3ynLsm8IbyVodzqEAdrp/uQkJizfQumijzQHSqC5JHX1
 JPmpX28jDHCMXnXAhFTewoJtWHKrwZQqrYUL2xmcILkTHjRuQysCTxpJpylMk0dbryQ3wZ16H
 jXwi/FPwu3QU45v0HmXr18yYb3ySAJFFmBfIYAnyQu3cULEXq+X+8XjbdjOaWzjkw3pVSfBFl
 oSaXgP6gal0ey+G9/hFZ40+cs4p6zQJIISH3fxIihy8T6KNFel0+DPmrJypAZEEsQQs7Opvad
 TFOSgSMdh7ljHx6K/XrVWmrBCa6yvPIjy3RniXPaG0zXw7nA8VJFSy1MU88GCmwA8eZFiM44g
 kA13+pOqinAJxZmyzRA+za7BJKpDQOMHPH8Grbd5P7nNFSULnYL5SOMYnnjimxuNLvLx3olam
 pDxRbVsyfe4yzBARQC8UwUPw4FhNhJNkhS2t9QrumxhD5flzZYOsKifF+2lHXveJEXWkyPV9+
 fh9EUnjAy+yxNA9MFf6HwuAVtWxnTXix0yFUkZ69INgy6u+yw+i7fl2qy6alt3P0j5qrXhWiT
 /pnR7aIiS3w2bVb1QjKE9SM2L18Fmdej6tBgOmWX3u8WZLwO3LTFFlN4YRQaj6RghpLbwumDL
 cykp0bT0H2BnHaIuyYuww98ZlcBmuG1cgFhcu7Zvkt7jWuijHA0hUsILYs3+emzwIX7I=

On Thu, Dec 16, 2021 at 12:44 PM Xi Ruoyao <xry111@mengyan1223.wang> wrote:
>
> On Sat, 2021-09-25 at 22:32 +0200, Sergio Paracuellos wrote:
> > To make PCI IO work we need to properly virtually map IO cpu physical address
> > and set this virtual address as the address of the first PCI IO port which
> > is set using function 'set_io_port_base()'.
> >
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
>
> Hi,
>
> the change is causing a WARNING on loongson64g-4core-ls7a:
>
> [    0.105781] loongson-pci 1a000000.pci:       IO 0x0018020000..0x001803ffff ->
>  0x0000020000
> [    0.105792] loongson-pci 1a000000.pci:      MEM 0x0040000000..0x007fffffff ->
>  0x0040000000
> [    0.105801] ------------[ cut here ]------------
> [    0.105804] WARNING: CPU: 0 PID: 1 at arch/mips/pci/pci-generic.c:55 pci_remap_iospace+0x80/0x88
> [    0.105815] resource start address is not zero
>
> I'm not sure how to fix this one.

It looks like this machine has two I/O spaces, one for ISA at 0x18000000/0x00000
and one for PCI at 0x18020000/0x20000, but the implementation assumes there
is only one. If you want to use pci_remap_iospace() on this platform,
it needs to
be extended to allow more than one such space.

       Arnd
