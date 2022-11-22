Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB57D6FD1
	for <linux-staging@lists.linux.dev>; Tue, 22 Nov 2022 13:55:29 +0000 (UTC)
Received: by mail-oo1-f45.google.com with SMTP id v7-20020a4aa507000000b00496e843fdfeso2263182ook.7
        for <linux-staging@lists.linux.dev>; Tue, 22 Nov 2022 05:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2SBGeqgV8aQ4ClE1rxARDUjCn/QaGrg5bogBswoE+Gk=;
        b=SnJrJJJB+uAOWpogJlqoVY6znPbePuzs8v8E+Jasq1bg9moQq8Gbla8WPFPotFYdUs
         rdiNTyjJgUOpZ//qEmNSffWMfpXCemCqV4jqqOLcafNGMG3y7VzHk2z9V6YfIYYTp81D
         df5NkH3zm4zUw3PzBRdPGQ4f8CJIBaeUTQh9hasrwmNEXQM/Q4hIQ6dVrmQyovTykNlk
         RNdlw5G+f5UCJDWk4RkG0HUq6cWwz+Pat2UDROelcqWZxV0KlNgJCCVHtdzbVNto0nKe
         fES8l3XJEdiw4y/2lEdykL46NhCsN3MbN/y7RDB/FanhyNqBLX9zLaQeCHNrj9s0p+p2
         fKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2SBGeqgV8aQ4ClE1rxARDUjCn/QaGrg5bogBswoE+Gk=;
        b=bZMcfe5EQiCkvdWV3FJgcwyArBX/5J5xReRyPmAu5rRZ6Va31k8un/q9UFp6DeII8Q
         IoLwn/IJk73jIrQtFtbXamXbEQxBfuLVt3rkFLocotOlqBwmxVoMvisX8MUK8V78GUsF
         6XjaOek9iShstR1J8mFhZsEvRkecSm0Kq8WrXfk7Z0XGAGdrHhJKrVF+KqRBNPZVmpl8
         GYIFWt6D1DQSxLSRxWZPvjznWaIgMYjHr0sjJOmjEJGt2EKADwdonWwL7A7idrsTrAsX
         Vm9KiO/Yxx3X5BIS/aWrv08OXOpFxr8e5rO/+lLc3CGoN4Jsh6MGTUdBxwO+KPSqWeR6
         j+Cg==
X-Gm-Message-State: ANoB5pmm8Rs2hylAKXQ4M2ZKcR42tvLKMDe3o+EyyD/yNcZ//8pTc5QX
	TRt6TBop9AmE6T4wZHw2buTDNabE1bvfA3eSRek=
X-Google-Smtp-Source: AA0mqf7ykzweR9BqX2Z1bFr3kRAAU5C3xDVsZgtZl+Svh5PRx1RmM9Dz5FRt4dxqYY1KiJhP24NikZC0YwM35U5Onhk=
X-Received: by 2002:a4a:d1b2:0:b0:498:ce46:9fb1 with SMTP id
 z18-20020a4ad1b2000000b00498ce469fb1mr6131515oor.97.1669125328656; Tue, 22
 Nov 2022 05:55:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHk-=wjKJyzfJmOzBdEOqCFRc8Fh-rdGM4tvMXfW0WXbbHwV0w@mail.gmail.com>
 <20221122105054.4062213-1-geert@linux-m68k.org> <alpine.DEB.2.22.394.2211221154280.284524@ramsan.of.borg>
In-Reply-To: <alpine.DEB.2.22.394.2211221154280.284524@ramsan.of.borg>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 22 Nov 2022 08:55:17 -0500
Message-ID: <CADnq5_PvouSKugXxJXqkVeZf+kbP8+hhUKFgVALSO=MOW3jzvA@mail.gmail.com>
Subject: Re: Build regressions/improvements in v6.1-rc6
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-um@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 22, 2022 at 5:56 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> On Tue, 22 Nov 2022, Geert Uytterhoeven wrote:
> > JFYI, when comparing v6.1-rc6[1] to v6.1-rc5[3], the summaries are:
> >  - build errors: +6/-0
>
>    + /kisskb/src/arch/sh/include/asm/io.h: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]:  => 239:34
>
> sh4-gcc11/sh-allmodconfig (in cvm_oct_free_hw_memory())
>
>    + /kisskb/src/arch/um/include/asm/processor-generic.h: error: called object is not a function or function pointer:  => 94:18
>    + /kisskb/src/drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c: error: control reaches end of non-void function [-Werror=return-type]:  => 1934:1
>
> um-x86_64/um-all{mod,yes}config (in kfd_cpumask_to_apic_id())

Presumably cpu_data is not defined on um-x86_64?  Does it even make
sense to build drivers on um-x86_64?

Alex

>
>    + /kisskb/src/drivers/infiniband/hw/qib/qib_wc_x86_64.c: error: 'X86_VENDOR_AMD' undeclared (first use in this function):  => 149:37
>    + /kisskb/src/drivers/infiniband/hw/qib/qib_wc_x86_64.c: error: 'struct cpuinfo_um' has no member named 'x86_vendor':  => 149:22
>    + /kisskb/src/drivers/infiniband/hw/qib/qib_wc_x86_64.c: error: control reaches end of non-void function [-Werror=return-type]:  => 150:1
>
> um-x86_64/um-allyesconfig
>
> > [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/eb7081409f94a9a8608593d0fb63a1aa3d6f95d8/ (all 149 configs)
> > [3] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/094226ad94f471a9f19e8f8e7140a09c2625abaa/ (all 149 configs)
>
> Gr{oetje,eeting}s,
>
>                                                 Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                                             -- Linus Torvalds
