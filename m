Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D572310E9
	for <linux-staging@lists.linux.dev>; Thu, 26 May 2022 08:32:44 +0000 (UTC)
Received: from mail-yw1-f169.google.com ([209.85.128.169]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MtO06-1nYtXg2IZS-00utu0 for <linux-staging@lists.linux.dev>; Thu, 26 May
 2022 10:32:42 +0200
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-300beab2b76so7708207b3.13
        for <linux-staging@lists.linux.dev>; Thu, 26 May 2022 01:32:42 -0700 (PDT)
X-Gm-Message-State: AOAM532egax3SRYY2tYzXCIxhFG52J8mwEjrzux/qhFME12T6eTjkpVS
	hfeyePm/yhjDfAK7t/0MnWFFF9/+r+LJDrnMwqo=
X-Google-Smtp-Source: ABdhPJzd1Td84PUKl1aMompoBi/CI7Ij8UKcDh3J33F17cieCWlpkBhuvBB90C07npKSjm4gZ1dqj3OUo1L9/csGNzA=
X-Received: by 2002:a81:488c:0:b0:302:549f:ffbc with SMTP id
 v134-20020a81488c000000b00302549fffbcmr1085051ywa.495.1653553961173; Thu, 26
 May 2022 01:32:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <628ea118.wJYf60YnZco0hs9o%lkp@intel.com>
In-Reply-To: <628ea118.wJYf60YnZco0hs9o%lkp@intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 26 May 2022 10:32:24 +0200
X-Gmail-Original-Message-ID: <CAK8P3a10aGYNr=nKZVzv+1n_DRibSCCkoCLuTDtmhZskBMWfyw@mail.gmail.com>
Message-ID: <CAK8P3a10aGYNr=nKZVzv+1n_DRibSCCkoCLuTDtmhZskBMWfyw@mail.gmail.com>
Subject: Re: [linux-next:master] BUILD REGRESSION 8cb8311e95e3bb58bd84d6350365f14a718faa6d
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE" <virtualization@lists.linux-foundation.org>, 
	Networking <netdev@vger.kernel.org>, linux-staging@lists.linux.dev, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-rdma <linux-rdma@vger.kernel.org>, 
	linux-pci <linux-pci@vger.kernel.org>, linux-parport@lists.infradead.org, 
	linux-omap <linux-omap@vger.kernel.org>, 
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, kvm list <kvm@vger.kernel.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, bpf <bpf@vger.kernel.org>, 
	amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	ALSA Development Mailing List <alsa-devel@alsa-project.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:2XlLYpyZAZuBEtRe9sPQ4Sjg/JvBZkTnNZSZUwNFav4m/Z6AgYM
 BhJgjeWDxbc73001gf/lywvG1SHNeN7MOe5I5qa6NEERUYwNx3WdAJYZ6T3fTFti6dfiEhX
 9oK/mZvfOwuYgZ2H4JiGoHtXR9UlmAndAVsimJiUEl6jZ0LqR17nIdRDiwLh+hWQnwbhiyD
 Mte4iESA64fsLfTP6qf3A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:E38Dz1hDcaQ=:XQux25QpijVF1ATcDE9hCt
 eUXVH57/5SfeA58awJbzYTnTHWMdMHrfI6IBbY0W4iNmz8Qi8qprRRWMEYPXX2lij9RjDS6MH
 8uRNXkrc/8uemNIf1B8YHuCuQtCuEIq6LFlp29s+yH7lII5/yBY3PSdeDur4xhzrQARBgkC9g
 iiiNkPygQI9xCRiKtds0WeDxv+JZx5CRtkI2tk6hVFYQjYDF/HZBpYVZo3BIdsFs9Nzg/1xjn
 wjQ/asz/9d0NtGTTnNFZgVhSXqtE0TF7QWbw+O6sugiaXB2tXZAEQ2UzFBupBM3YSOudpHG5s
 yTGn3PpNzz9RSkwhFDi0s6Q9eEfaHBqyx4sT13nbuGAYOXTdVIkWPOSTxAOiHlbEs0Nv3jFfq
 VPfXBx9U32UqTHt0bMn2UrGYQ/IhmXXWXFcxQGJeA1d9qzliUc4Ii5j2+rcAWlpfPxMrEJRNz
 04l3nAhNaGqcvsFZ7H1F7TfwnmvRAsrS5LYX9k1r4fWjmTgI20uLXBvSq7UAsoGzNEGxrhtPo
 CSNAsDdiRB8Bp0eUVCDLSUOE1EGELjorwaCe254m9aPTChTlqNCwzKI+MBVRDlnOUCEgqmUkx
 n8WIyMASWrvbJIm7DkUTws3lClRXY89eX4PkVEN78meC5r6gm7jwaOpBCUZcWrQ1JwYtZNKml
 A9pcoQoCCCuSZpojFn+HlXEJNhUr97fbIa+E0/CkyiyH9KD67PdxJjcLSWz3FAZ/ECERGDksG
 TK2xDG3eJABbQNPX5k3VBlT1Sv52RcBRLoJP5djba1djAJAp9A0lHHqOcvHQT1bIwdZVIFAX0
 j62a5NAzQLLRazT8wARUHmXMv3zIMF5v/RanStEDCfezvgvWUIeT39+bQS5fLmwT7Xit6+Nxy
 ohZoi4CazMTAX/p2q1ao477yJkX5tbqmOWWQQgW2M=

On Wed, May 25, 2022 at 11:35 PM kernel test robot <lkp@intel.com> wrote:
> .__mulsi3.o.cmd: No such file or directory
> Makefile:686: arch/h8300/Makefile: No such file or directory
> Makefile:765: arch/h8300/Makefile: No such file or directory
> arch/Kconfig:10: can't open file "arch/h8300/Kconfig"

Please stop building h8300  after the asm-generic tree is merged, the
architecture is getting removed.

        Arnd
