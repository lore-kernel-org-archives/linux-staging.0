Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94087A
	for <linux-staging@lists.linux.dev>; Fri, 20 May 2022 12:40:34 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id m1so6770719qkn.10
        for <linux-staging@lists.linux.dev>; Fri, 20 May 2022 05:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AW3WbgwLSP0WZKYPK3Y6DQ8WAhPkJkHKkMhSdaktb4M=;
        b=qpBfaJxhNrRpj8RGJNKOk+wfI6CrghE6bv3Vu3mnaoVxymDDWg7ElTmV4yumqAJB+7
         voX5zi8qFil7p9HkY2S34EpfX3KYPDKK4hKUx07Qpu8X9j3evWYRMATMhnSY1/w4ErKx
         pjiaJYJ4ye6gFnwyoYjEDRk9vrcYDQFUvORb8b25yUBx2rMpFO4bW+cmNKKhxPcE5z4K
         gRuyTqIKDBG9wOVczA+o8R7cjf+S5RWa1qX6hTy3kF3st6cR7hrWWjWL2/pVnIDDr80l
         zA8mnmp8zvt77+VvKE+N25A5+CqLt7TM4E2sRcTOmq4UbNXNa0yAogvoRPPH3XZqx/7B
         /NgA==
X-Gm-Message-State: AOAM5337EZCdtWtYUBfqKiH3mFzl7I2dmrXAYKIvDqMNYYU3piD1kG2c
	E3sUwXmTelkkJs7SKnhEkUBpRk6Luz9ZEA==
X-Google-Smtp-Source: ABdhPJzgmbjmtvwuoVIXOsGbtS+cRpotHl2IjprTnHLJhCLl7dtCMAZcqF672YCwmDrJRWN5d9mz2A==
X-Received: by 2002:a05:620a:cd7:b0:6a3:592f:f98a with SMTP id b23-20020a05620a0cd700b006a3592ff98amr499650qkj.349.1653050433384;
        Fri, 20 May 2022 05:40:33 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 12-20020a37040c000000b0069fc13ce1ddsm3065737qke.14.2022.05.20.05.40.32
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 05:40:32 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-2f863469afbso86492557b3.0
        for <linux-staging@lists.linux.dev>; Fri, 20 May 2022 05:40:32 -0700 (PDT)
X-Received: by 2002:a81:9b0c:0:b0:2f4:c522:7d3c with SMTP id
 s12-20020a819b0c000000b002f4c5227d3cmr9969695ywg.316.1653050431948; Fri, 20
 May 2022 05:40:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6285958d.+Z2aDZ4O1Y9eiazd%lkp@intel.com> <0530d502-1291-23f3-64ac-97bd38a26bd4@roeck-us.net>
In-Reply-To: <0530d502-1291-23f3-64ac-97bd38a26bd4@roeck-us.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 May 2022 14:40:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU3SYOwE5ftDwymQpVwWmpbC=1Ytyp0Y9GaeUS2i1cP+A@mail.gmail.com>
Message-ID: <CAMuHMdU3SYOwE5ftDwymQpVwWmpbC=1Ytyp0Y9GaeUS2i1cP+A@mail.gmail.com>
Subject: Re: [linux-next:master] BUILD REGRESSION 736ee37e2e8eed7fe48d0a37ee5a709514d478b3
To: Guenter Roeck <linux@roeck-us.net>
Cc: kernel test robot <lkp@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-staging@lists.linux.dev, 
	"open list:TI ETHERNET SWITCH DRIVER (CPSW)" <linux-omap@vger.kernel.org>, linux-nvme@lists.infradead.org, 
	linux-hwmon@vger.kernel.org, 
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>, KVM list <kvm@vger.kernel.org>, 
	DRI Development <dri-devel@lists.freedesktop.org>, 
	amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	linux-sparse@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi G=C3=BCnter

On Thu, May 19, 2022 at 8:48 AM Guenter Roeck <linux@roeck-us.net> wrote:
> On 5/18/22 17:55, kernel test robot wrote:
> > tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux=
-next.git master
> > branch HEAD: 736ee37e2e8eed7fe48d0a37ee5a709514d478b3  Add linux-next s=
pecific files for 20220518
> >
> > Error/Warning reports:
> >
> > https://lore.kernel.org/linux-mm/202204291924.vTGZmerI-lkp@intel.com
> > https://lore.kernel.org/linux-mm/202205041248.WgCwPcEV-lkp@intel.com
> > https://lore.kernel.org/linux-mm/202205122113.uLKzd3SZ-lkp@intel.com
> > https://lore.kernel.org/linux-mm/202205172344.3GFeaum1-lkp@intel.com
> > https://lore.kernel.org/linux-mm/202205190527.o9wVEvHI-lkp@intel.com
> >
> > Error/Warning: (recently discovered and may have been fixed)
> >
> [ .. ]
> > drivers/hwmon/nct6775-platform.c:199:9: sparse:    unsigned char
> > drivers/hwmon/nct6775-platform.c:199:9: sparse:    void
>
> This is getting tiresome. Every driver using outb() on m68k will
> experience that "problem". As far as I can see, it is caused by
>
> #define out_8(addr,b) (void)((*(__force volatile u8 *) (unsigned long)(ad=
dr)) =3D (b))
>
> in arch/m68k/include/asm/raw_io.h. I have no idea what the
> "(void)" is for,

The "(void)" makes sure there is no return value.
Which matters if the result of a function returning void is propagated
to another function returning void.

> but removing it "fixes" the problem.

This introduces new problems (m68k all{mod,yes}config):

    In file included from arch/m68k/include/asm/io_mm.h:25,
                     from arch/m68k/include/asm/io.h:8,
                     from include/linux/io.h:13,
                     from include/linux/of_address.h:7,
                     from drivers/gpu/drm/msm/adreno/adreno_gpu.c:13:
    drivers/gpu/drm/msm/adreno/a6xx_gmu.h: In function =E2=80=98gmu_write_r=
scc=E2=80=99:
    arch/m68k/include/asm/raw_io.h:34:80: error: =E2=80=98return=E2=80=99 w=
ith a
value, in function returning void [-Werror=3Dreturn-type]
       34 | #define out_le32(addr,l) ((*(__force volatile __le32 *)
(unsigned long)(addr)) =3D cpu_to_le32(l))
          |
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
    arch/m68k/include/asm/io_mm.h:397:26: note: in expansion of macro =E2=
=80=98out_le32=E2=80=99
      397 | #define writel(val,addr) out_le32((addr),(val))
          |                          ^~~~~~~~
    drivers/gpu/drm/msm/msm_drv.h:468:32: note: in expansion of macro =E2=
=80=98writel=E2=80=99
      468 | #define msm_writel(data, addr) writel((data), (addr))
          |                                ^~~~~~
    /drivers/gpu/drm/msm/adreno/a6xx_gmu.h:141:9: note: in expansion
of macro =E2=80=98msm_writel=E2=80=99
      141 |  return msm_writel(value, gmu->rscc + (offset << 2));
          |         ^~~~~~~~~~
    In file included from drivers/gpu/drm/msm/adreno/a6xx_gpu.h:11,
                     from drivers/gpu/drm/msm/adreno/adreno_gpu.c:20:
    drivers/gpu/drm/msm/adreno/a6xx_gmu.h:139:20: note: declared here
      139 | static inline void gmu_write_rscc(struct a6xx_gmu *gmu,
u32 offset, u32 value)
          |                    ^~~~~~~~~~~~~~

These can be fixed using e.g. (there are more in the Adreno driver):

     static inline void gmu_write(struct a6xx_gmu *gmu, u32 offset, u32 val=
ue)
     {
    -       return msm_writel(value, gmu->mmio + (offset << 2));
    +       msm_writel(value, gmu->mmio + (offset << 2));
     }

> Either case, this is not a problem with the nct6775 driver,
> nor is it a new problem.

Indeed.

For the sparse people:

The full error is:

        drivers/net/appletalk/cops.c:382:17: error: incompatible types
in conditional expression (different base types):
        drivers/net/appletalk/cops.c:382:17:    unsigned char
        drivers/net/appletalk/cops.c:382:17:    void

Basically, sparse doesn't like "a ? b : c", if the return types of
b and c don't match, even if the resulting value is not used.

E.g. outb() on m68k:

    #define outb(val, port) (((port) < 1024 && ISA_TYPE =3D=3D
ISA_TYPE_ENEC) ? isa_rom_outb((val), (port)) : isa_outb((val),
(port)))

where isa_rom_outb() leads to rom_out_8() returning u8, while
isa_outb() leads to the out_8() that includes the cast to void.

So the best solution seems to be to add more "(void)" casts, to e.g.
rom_out_8() and friends?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
