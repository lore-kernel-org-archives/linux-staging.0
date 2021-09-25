Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6559029CA
	for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 17:38:13 +0000 (UTC)
Received: from mail-wr1-f47.google.com ([209.85.221.47]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MDhpZ-1mb5hs4AL9-00Aouc for <linux-staging@lists.linux.dev>; Sat, 25 Sep
 2021 19:33:00 +0200
Received: by mail-wr1-f47.google.com with SMTP id u18so37436378wrg.5
        for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 10:32:59 -0700 (PDT)
X-Gm-Message-State: AOAM533NQgQkXw/APCm36+JLDcAx+Mrcz5kL+0mhErejsNpFfZMkG+sH
	ISz9nYiMWo8WDyhEhmDsViAIFTUgGHfVXlt2S+s=
X-Google-Smtp-Source: ABdhPJy3Bi6jZ9YJhd1Jir95pwQbKf3lgFpAtVfbTLeqV60We3le1OMF5o2WY/XSSxdey4NUYwb7U4KsUjdjgMVoko4=
X-Received: by 2002:a1c:4c14:: with SMTP id z20mr7902480wmf.82.1632591179581;
 Sat, 25 Sep 2021 10:32:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210924211139.3477-1-sergio.paracuellos@gmail.com> <20210924211139.3477-4-sergio.paracuellos@gmail.com>
In-Reply-To: <20210924211139.3477-4-sergio.paracuellos@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 25 Sep 2021 19:32:43 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3O+tVZDFDHGtUwm0sDkCHJY3DU13S+KGgMCHyZO1E9Fw@mail.gmail.com>
Message-ID: <CAK8P3a3O+tVZDFDHGtUwm0sDkCHJY3DU13S+KGgMCHyZO1E9Fw@mail.gmail.com>
Subject: Re: [PATCH 3/6] MIPS: ralink: set PCI_IOBASE to 'mips_io_port_base'
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Rob Herring <robh@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Liviu Dudau <Liviu.Dudau@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, gregkh <gregkh@linuxfoundation.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, 
	linux-staging@lists.linux.dev, neil@brown.name, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:4n5oXJi0zY+XHnV2lx66xsZbylPvwOxDJiDqPE4OiB0uwtLzshj
 v40PDs5QmMQ5P2M6/UIY/FrdxYaYwt1GSJnGODXHDyIXERBrgJbX2T6JA6EVbzFzgwi+PRd
 fKQdShhzil/acDfa7YexKQmhtaGaXzOoiXpvhzFnVwH0a7KKbcodM2SHz2RzZil1BQTKP01
 6nAhFB//3EdCiHl2QLpUw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:GAD9SkvQm3g=:A+wzuSMUHIsBVSknZYQncP
 fP3BVurD6ExxHLHib6b7wpTV0R9TS6BnevIPFATkMHMM7Hnz68oav3BlT2jmsqIjk2eaf9bhm
 zkIMJtbDrQP9+IATLYsIRwF7GLaufaw4o+dw5+JbMR7HL9/cs4lPajjSGcKw+Fvua8OxRHUgN
 D3aQQl6BQlky70ZScQMUqOL7w0aWx8V9VLphKYaI1iAnhXOLUHmapQ9THUP8dRmHt7u+hQZi+
 GCC/+3AS1faD4SzNRYUT+txN5L8n1DFhO2U+sAi26juWouLWR+WIiYUmCpjKcz1EVhQJ3NUs2
 NsyynEOQ/Yv/qkKHGqIU41Ev87Lety3f/gKLcNtk4u7qp8VAu0Y3twrcMaFLpC2qO0HNRYdF7
 7OK7Z5DQb6PgxGRK010EctbULPVvaeNO4lPCD/bNIVbqErZwUbKtdgNmx8/qrh3IcTvqyDCRR
 QRB9EjyRvwlj5W6hfoyBHQMyZXQei5Hy6+Q/UUf44yynH1xFPLsDV4u24V/PxDpYZ8w7GiXrp
 Jahx7rYlKl1/yIMEBcPPF1Bp8Nr1eRmoaraNPaJ+RsPtY/wDdWF8EvGLwKuBSHMinC0ZyWEJt
 XFS4LXyY16Vx6mA2Jdc5lte/2tmEZ0uyvWkJ4Fs3qCNZx0yeYSA4bFRoAHedUilA97jAkfhZR
 4x6N6I4ZWfA8bm33mnSAk4HUSUNnmyuNU/IiVJT4irbZRbVzvgNMLwWCXVuWwEI9f/VXLoKKf
 2QkK4BK9BD1WZ2EcOjBauMVavGWwlLfX4DZ9MWCNXvGPETNI6NLMp7hoR3QjJyCipAIE4tjwT
 XZXKuSytYIkO1ka2Sr6pFN+RQZtmbSqak/xnvVPueVvnr/Isq5HhzqneD4H8zBaA8qiJVvL/J
 iJs8WKwTLkmrBPo1mDVQ==

On Fri, Sep 24, 2021 at 11:11 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> By default MIPS architecture use function 'set_io_port_base()' to set the
> virtual address of the first IO port. This function at the end sets variable
> 'mips_io_port_base' with the desired address. To align things and allow
> to change first IO port location address for PCI, set PCI_IOBASE definition
> as 'mips_io_port_base'. Also, we only need a size of 64 KB.
>
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  arch/mips/include/asm/mach-ralink/spaces.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/mips/include/asm/mach-ralink/spaces.h b/arch/mips/include/asm/mach-ralink/spaces.h
> index 87d085c9ad61..05d14c21c417 100644
> --- a/arch/mips/include/asm/mach-ralink/spaces.h
> +++ b/arch/mips/include/asm/mach-ralink/spaces.h
> @@ -2,8 +2,8 @@
>  #ifndef __ASM_MACH_RALINK_SPACES_H_
>  #define __ASM_MACH_RALINK_SPACES_H_
>
> -#define PCI_IOBASE     _AC(0xa0000000, UL)
> -#define PCI_IOSIZE     SZ_16M
> +#define PCI_IOBASE     mips_io_port_base
> +#define PCI_IOSIZE     SZ_64K
>  #define IO_SPACE_LIMIT (PCI_IOSIZE - 1)

Acked-by: Arnd Bergmann <arnd@arndb.de>
