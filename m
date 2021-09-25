Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950E43FC7
	for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 17:37:41 +0000 (UTC)
Received: from mail-wr1-f45.google.com ([209.85.221.45]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mrxjf-1nFMBV1Usn-00o2nb for <linux-staging@lists.linux.dev>; Sat, 25 Sep
 2021 19:32:28 +0200
Received: by mail-wr1-f45.google.com with SMTP id w29so37275666wra.8
        for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 10:32:28 -0700 (PDT)
X-Gm-Message-State: AOAM5305N2GOTLeuikHz7rlaPRDOTHWItnSts2OiZ8wuHVIRKJYWv94p
	or14SOPEKAHICUXichOozfXikclMLGxKAinfRiE=
X-Google-Smtp-Source: ABdhPJwATFoMtLfM82dbiwbfY0GKoVgPll7guJJPZ4SlMDyVpnybiZOiHpV2yuRbCNlpS7w6kjrpn7CdgtMxMmMrKi0=
X-Received: by 2002:adf:f481:: with SMTP id l1mr18158744wro.411.1632591147944;
 Sat, 25 Sep 2021 10:32:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210924211139.3477-1-sergio.paracuellos@gmail.com> <20210924211139.3477-6-sergio.paracuellos@gmail.com>
In-Reply-To: <20210924211139.3477-6-sergio.paracuellos@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 25 Sep 2021 19:32:12 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3SpuioCVBfQpHFGuNQoXG7g8w9VL+V8rYd8Q80Od89HA@mail.gmail.com>
Message-ID: <CAK8P3a3SpuioCVBfQpHFGuNQoXG7g8w9VL+V8rYd8Q80Od89HA@mail.gmail.com>
Subject: Re: [PATCH 5/6] MIPS: implement architecture dependent 'pci_remap_iospace()'
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Rob Herring <robh@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Liviu Dudau <Liviu.Dudau@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, gregkh <gregkh@linuxfoundation.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, 
	linux-staging@lists.linux.dev, neil@brown.name, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:vEbMx2ATTuXjKB1dAOJnXpPZNN48QoaYVidKQS82i3OSLhhn59+
 5FL7e8k69/QQd/VErAIAL/OZtwVIB3CpnNbXt3fajoACVvPbH0BAdudl6cfDo0CPO/h0Uq0
 7WxWp3l+0q16eLdmEMb4g6FZhOJ/8CGgjTn5SmcSwf0ZBH4zCPyEgH+lo2d+XnHfl478DUK
 acHQwZVRvyBKpDQTOQPhQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:AuFy5ajBSPk=:7kfM42oXOisnPe8prdLGVa
 oZyCMIgbri6a6VHxt7vOYDnatTBpw4B12T96vhPiBRrBNc79swjYZtip7Pyc35LhftF539PkA
 MVflHhOe6r+PjlWMUUrGXz8U059VaqzJNesdsI/VN3uv2+T5zXhNGBIIi9UEId32wS8MDuZE4
 +rsyANBPUzQikHut2Ea5EDS9K8EnCGBIwkwuLrP616xMR0YThY8hd1KCKfWeeuAR54mKfoi+s
 s9qi4KVIfoIbv4/FkoGdHnVPn3zPb+qQumiOPtoJ6zcCSqExdkbFNbEbIMxMxvP0s9oE6buC9
 AV3q/IOdikrE+L/fdMvWECwmbQfVE7vypeDsPic5lvQOj9qIawN4hCoVdlVXXV7/caCvuYUaa
 tcc13hAKMcgHl6HD8J66WNGtCOBRZfsPCScbI+Dw+chR7IVKeS2CyjeoVLC8TNciokNRpluGV
 q2G/winqRgD8nY0OOxR0BF5uXtwk+tnYfRhnKgLmx9Aktlf3xdEiZQCVocAS/gsrAR9YcH6BX
 LuZESXwmUfu3GmJdo+H3yFOL3/AOV6lx4YOb5X01m4+sfAiW33vWSLq704OdnRDFxipOxK6ee
 XHeDJlXmulLUPtvMCd44WG9e0KH1/LvNtFkYWYAg4DaOHWyYbgZpvmBhmLBQow7zM1+wbtTqZ
 fMUJbA9zrzHd4v+SoEFWNYeQiKFD9aKml7dQMY+5V5AabcpRcnLYGJ/rEXY+aYJZmviuaSdFG
 jhZI6PNDR4ixSdRw47Y64fC9WfT4F4dWadMaBt3TG0WNzUDhmS0dqMF5G9rlA1+Vh9N0sl9Zo
 aAoXTsT1YFsMZMlVOdb1OEg5eVR+kDvqJVBTpYoGx67G1zibnNOSiThfh0LA40bc3AbgLUIj5
 L3GwT5TfQRJyG9CZyvwg==

On Fri, Sep 24, 2021 at 11:11 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> To make PCI IO work we need to properly virtually map IO cpu physical address
> and set this virtual address as the address of the first PCI IO port which
> is set using function 'set_io_port_base()'.
>
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

> +int pci_remap_iospace(const struct resource *res, phys_addr_t phys_addr)
> +{
> +       size_t size = (res->end - res->start) + 1;
> +       unsigned long vaddr = (unsigned long)ioremap(phys_addr, size);
> +
> +       set_io_port_base(vaddr);
> +       return 0;
> +}

It might be good to check that res->start is zero here, otherwise
the io_port_base would be off. That could happen if you ever have more
than one bridge.

        Arnd
