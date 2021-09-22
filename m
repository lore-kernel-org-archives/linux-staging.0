Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08333FCB
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 18:07:50 +0000 (UTC)
Received: from mail-wr1-f54.google.com ([209.85.221.54]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mq2rM-1nF2aE1Uws-00n9mk for <linux-staging@lists.linux.dev>; Wed, 22 Sep
 2021 20:07:48 +0200
Received: by mail-wr1-f54.google.com with SMTP id u18so9495827wrg.5
        for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 11:07:48 -0700 (PDT)
X-Gm-Message-State: AOAM531zWv1n2l0ObJ9ctbJ3w34rSBro5bR7jPfm7FSpKFHDE6cAS/MZ
	fOIIN0FS0LtPYrhw8r4hwtLQpUYqJHorcTr2ymQ=
X-Google-Smtp-Source: ABdhPJxefGoFSv5mbWEbjSxVO7l7TV7dRfGNx9j+Tk9BFQvOVsDSTR9Sbgfrbt8kzfTLzbvI3ZJIrLmP2e+7OX9g2CQ=
X-Received: by 2002:a5d:4b50:: with SMTP id w16mr351144wrs.71.1632334067884;
 Wed, 22 Sep 2021 11:07:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210922042041.16326-1-sergio.paracuellos@gmail.com>
 <CAK8P3a2WPOYS7ra_epyZ_bBBpPK8+AgEynK0pKOUZ6ajubcHew@mail.gmail.com> <CAMhs-H8EyBmahhLsx+a0aoy+znY=PCm4BT97UBg4xcAy3x2oXg@mail.gmail.com>
In-Reply-To: <CAMhs-H8EyBmahhLsx+a0aoy+znY=PCm4BT97UBg4xcAy3x2oXg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 22 Sep 2021 20:07:31 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0fQZvpNCKF7OUy_krC_YPyigtd5Ak_AMXXpx84HKMswA@mail.gmail.com>
Message-ID: <CAK8P3a0fQZvpNCKF7OUy_krC_YPyigtd5Ak_AMXXpx84HKMswA@mail.gmail.com>
Subject: Re: [PATCH v3] PCI: of: Avoid pci_remap_iospace() when PCI_IOBASE not defined
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-pci <linux-pci@vger.kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-staging@lists.linux.dev, 
	gregkh <gregkh@linuxfoundation.org>, Liviu Dudau <Liviu.Dudau@arm.com>, 
	Rob Herring <robh@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Y069/beaVg4X7z5pmI26ObmGFDQ9zDeLavKRe48fVNRXtz8NX9B
 kyb5g2ZJcAiGT9t6nV8djzB73vdQw7UmTMn0OTRjgnI9FcJrF3PfS/HuRQ6DuRzgul6Ykpw
 QWS6RgAzSdwqFh7tQ+jA45tJEcd73uKMucMMZ1+1N181hqb3pExCSyUlyaTu+gsGxY+fANm
 PXVBVPqrktq40fwxRQ/5A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NzCh8GrJTpQ=:o/pnWkKclsTj1feO5JlbC1
 mml9QjVX4N9Pi9aEVL47qc6PsV/GphIn/ZHGL2wZ1ZQo26WbFfQt86s13Wo2VPJBzHxCqzyAM
 nV++RrHMhCAPPBYqrrwk6gOwMY+bfiHEtIb27qjlLKYHjaGYKvKeUqQ53XT1xhznFaB0weLQM
 LIL8a+vf65LlKKumW1jr4IlPmZHlbL4Yb8vk6t+Cu8GkQpRc6+rtNBiMvJwNAitm3Rzj4dQNS
 PukR+1xfFolUQDRN6pY1PBMewavLzeMRQ7qZvtAPYbo/qSVX3FsetUuPa/12NvehUpaliPfWm
 QwAG4i8G1lqygZqIt7jVvbOi3IPsyv0gPe5EACGSjfdq3xK25G0vxb0TjB//HED9MCYrlVR1+
 pgR+QdZJwwjmqNQ9HgTvc9NvaG+7WLa/9BCtjlnX+4+/iFDx5Rob5TXX+lLT5Eqq1FbPVNfop
 Ogl3EOToWgvM5YzJE8X3UG5bHqx17SgeANmyEMlC40uVwAbGxmRQD2VsO0PHk/9xWwOl+6MZU
 pz1N997Sk4AkVpUY2f0GYM0v3G5iT4ydJbcmEzTeIDnschSWfkn/1ATURU6zTAI8enSDr0km7
 TDKonPFSfS9sul3J0GSNK3z9TYkU2vHLuqfjrTe/QJ1AIIM8cH88ENeD27Qwa3hK/3iEqg3mw
 wuCQM9kXmTsxf43Uw541ynvNSXssX4NLwwOCDqGzNRa77VlFMpFk2/nU2fzDOhhnQEQrwWcd6
 Sqta5QwLWI68yjWqiLdWIXojjCAaQZXCvlSDtqL8BU+y//ezPQhy+FqRH4lZXXO+wrM+xjI1m
 MagKl9MtQiDhqlxmMPYdw4st3xNvARpHg8YAKPnQnM5K+XIx/IjIklAP+L/oybG9+kU4tGeRo
 bunYL96G4YDgmYinZbrA==

On Wed, Sep 22, 2021 at 7:42 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
> On Wed, Sep 22, 2021 at 5:47 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > I'm not completely sure where your platform fits in here, it sounds like you
> > address them using a machine specific physical address as the base in
> > inb() plus the port number as an offset, is that correct?
>
> I guess none of the above options? I will try to explain this as per
> my understanding.
>
> [+cc Thomas Bogendoerfer as mips maintainer and with better knowledge
> of mips platforms than me]
>
> On MIPS I/O ports are memory mapped, so we access them using normal
> load/store instructions.
> Mips 'plat_mem_setup()' function does a 'set_io_port_base(KSEG1)'.
> There, variable 'mips_io_port_base'
> is set then using this address which is a virtual address to which all
> ports are being mapped.
> KSEG1 addresses are uncached and are not translated by the MMU. This
> KSEG1 range is directly mapped in physical space starting with address
> 0x0.
> Because of this reason, defining PCI_IOBASE as KSEG1 won't work since,
> at the end 'pci_parse_request_of_pci_ranges' tries to remap to a fixed
> virtual address (PCI_IOBASE). This can't work for KSEG1 addresses.
> What happens if I try to do that is that I get bad addresses at pci
> enumeration for IO resources. Mips ralink mt7621 SoC (which is the one
> I am using and trying to mainline the driver from staging) have I/O at
> address 0x1e160000. So instead of getting this address for pcie IO
> BARS I get a range from 0x0000 to 0xffff since 'pci_adress_to_pio' in
> that case got that range 0x0-0xffff which is wrong. To have this
> working this way we would need to put PCI_IOBASE somewhere into KSEG2
> which will result in creating TLB entries for IO addresses, which most
> of the time isn't needed on MIPS because of access via KSEG1. Instead
> of that, what happens when I avoid defining PCI_IOBASE and set
> IO_SPACE_LIMIT  (See [0] and [1] commits already added to staging tree
> which was part of this patch series for context of what works with
> this patch together) all works properly. There have also been some
> patches accepted in the past which avoid this
> 'pci_parse_request_of_pci_ranges' call since it is not working for
> most pci legacy drivers of arch/mips for ralinks platform [2].
>
> So I am not sure what should be the correct approach to properly make
> this work (this one works for me and I cannot see others better) but I
> will be happy to try whatever you propose for me to do.

Ok, thank you for the detailed explanation.

I suppose you can use the generic infrastructure in asm-generic/io.h
if you "#define PCI_IOBASE mips_io_port_base". In this case, you
should have an architecture specific implementation of
pci_remap_iospace() that assigns mips_io_port_base.
pci_remap_iospace() was originally meant as an architecture
specific helper, but it moved into generic code after all architectures
had the same requirements. If MIPS has different requirements,
then it should not be shared.

I don't yet understand how you deal with having multiple PCIe
host bridge devices if they have distinct I/O port ranges.
Without remapping to dynamic virtual addresses, does
that mean that every MMIO register between the first and
last PCIe bridge also shows up in /dev/ioport? Or do you
only support port I/O on the first PCIe host bridge?

Note that you could also decide to completely sidestep the
problem by just defining port I/O to be unavailable on MIPS
when probing a generic host bridge driver. Most likely this
is never going to be used anyway, and it will be rather hard
to test if you don't already have the need ;-)

         Arnd
