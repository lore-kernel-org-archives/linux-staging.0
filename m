Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7A470
	for <linux-staging@lists.linux.dev>; Fri, 14 May 2021 11:19:30 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id r26-20020a056830121ab02902a5ff1c9b81so26169099otp.11
        for <linux-staging@lists.linux.dev>; Fri, 14 May 2021 04:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YjgfjUX2VlTG4CiG2n/lTHEHRkptr4e0OLOANIP608s=;
        b=nzC03ppPbo+K138xTT5Kow2qAiZL7LbzOrfb0IN+LTsSrvpoz8hp8Bi8tg+p4xjdR0
         b21bMpAfQhyvEPkU9Q4JmBguRJvQHy6KGT91P1P3fKsIj7HjnbFpqERG0M3fDDed9gIt
         TTK4SrPp2T7/ItnZVr7mezppBQ7RAyNLwBBvb+Uq2QaKvJSLlftAr4e+RwY3PcI5Pb2/
         zldfzMuPPvFDNwWBt5pXIJiAKsujUvPLO7pAgHjDxt6cDBBDprboPWdxEyIkempz9Fgo
         tNNlbnN69sQXtthlUJzakuX/pwM0qKLFMhzYeXCY9MiejPyEqEkRN5JjlfjH0NWWjDk7
         nzig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YjgfjUX2VlTG4CiG2n/lTHEHRkptr4e0OLOANIP608s=;
        b=hmnc95BF+ilWoGsNz+QLm1llTTyLzqnWhPI5jqR0MR+3T1DPfVSH7L9frn0zq3ZPcA
         bRHh5CPAIKSMiJBjndwWdq3d23da8Sn2IAR4HCHL9U1PnNtzH5tA+6vLWMsM7aLrybnj
         jmanFHAUM7l3Eh6TVifBU1CCHDM1UVPXzZi+OgiXANhdz4DCGd3qF0YI1Ykt5ZDT9EyV
         HnyEVmZS7/Eq9YH0CG2L85MI7NcAKTf+JjXYALTNHs3aZlIy60mrbhFNYNcHdB5be+Ym
         QKTTU7yakKByO3T4tWaqtbs4NUTJhkQqd4vGuXEc/x36aNQIgECtHyxB0jbvJzbXMpvM
         7ncg==
X-Gm-Message-State: AOAM5311fbolxy319tTzkz07lWDus/PsrBY6ewOUnKqs9cRE2wgK3GQJ
	KtBT+IhUsGOY4SoPbPmqS+t2z114CIe77Gn5oxs=
X-Google-Smtp-Source: ABdhPJxZqT9WPVbGt2234S9Iu/njvLuxyojyILmFzUoONy9Dc6Z0JNvjG4M8ShyLK0wqh4Y6I6T3jDGTCBJARnEjKeA=
X-Received: by 2002:a9d:2ae8:: with SMTP id e95mr40372267otb.72.1620991169752;
 Fri, 14 May 2021 04:19:29 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210508070930.5290-1-sergio.paracuellos@gmail.com> <YJ5VHnZaLi4o31vL@vkoul-mobl.Dlink>
In-Reply-To: <YJ5VHnZaLi4o31vL@vkoul-mobl.Dlink>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 14 May 2021 13:19:18 +0200
Message-ID: <CAMhs-H8A1o3_TJGjPNUO3K_gf+kDkbj7mFy21LJfUEB0sEhvSg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 0/6] phy: ralink: mt7621-pci-phy: some improvements
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-phy@lists.infradead.org, 
	Rob Herring <robh+dt@kernel.org>, linux-staging@lists.linux.dev, 
	Greg KH <gregkh@linuxfoundation.org>, NeilBrown <neil@brown.name>, 
	Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, May 14, 2021 at 12:46 PM Vinod Koul <vkoul@kernel.org> wrote:
>
> On 08-05-21, 09:09, Sergio Paracuellos wrote:
> > Hi all,
> >
> > This series contains some improvements in the pci phy driver
> > for MT7621 SoCs.
> >
> > MT7621 SoC clock driver has already mainlined in
> > 'commit 48df7a26f470 ("clk: ralink: add clock driver for mt7621 SoC")'
> >
> > Because of this we can update schema documentation and device tree
> > to add related clock entries and avoid custom architecture code
> > in favour of using the clock kernel framework to retrieve clock
> > frequency needed to properly configure the PCIe related Phys.
> >
> > After this changes there is no problem to properly enable this
> > driver for COMPILE_TEST.
> >
> > Configuration has also modified from 'tristate' to 'bool' depending
> > on PCI_MT7621 which seems to have more sense.
>
> Applied 2-6, thanks

Thanks, Vinod.

Greg, can you take patch 1 through your tree?

Best regards,
    Sergio Paracuellos

>
> --
> ~Vinod
