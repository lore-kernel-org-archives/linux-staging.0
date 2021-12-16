Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990932C82
	for <linux-staging@lists.linux.dev>; Thu, 16 Dec 2021 14:32:19 +0000 (UTC)
Received: from mail-wr1-f46.google.com ([209.85.221.46]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MMnnm-1nGUaL2LKe-00In76 for <linux-staging@lists.linux.dev>; Thu, 16 Dec
 2021 15:32:17 +0100
Received: by mail-wr1-f46.google.com with SMTP id e5so11141170wrc.5
        for <linux-staging@lists.linux.dev>; Thu, 16 Dec 2021 06:32:17 -0800 (PST)
X-Gm-Message-State: AOAM531upKc5xmjQIvZzW2pKzvizI56l9mqW1q9RnwlP3sYv+TP85inD
	t6AhAmpExmr1C5uxV9QY33vydjGEYLV5uq2agvA=
X-Google-Smtp-Source: ABdhPJy61qKYJci/6ZudP0JAo6z6MtYVZYLHYbaNUv1gpF53y5LHQ6bGJAcJW+L6DvxIcrhI+8fFJtv1wFeCyVqHDfs=
X-Received: by 2002:a05:6000:1aca:: with SMTP id i10mr9483509wry.407.1639665137128;
 Thu, 16 Dec 2021 06:32:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210925203224.10419-1-sergio.paracuellos@gmail.com>
 <20210925203224.10419-6-sergio.paracuellos@gmail.com> <67687e579e633d42dc501cfb6746c1cb9f600112.camel@mengyan1223.wang>
 <6ee31420-ef67-471e-a924-a0158b4a9428@www.fastmail.com> <CAK8P3a2i6eW8JunE_6h6OTCa51eHfPahQQhaGHGWePX+r4ybww@mail.gmail.com>
 <bfdfb7b3-1322-573d-eddc-1d337c4616e6@flygoat.com> <CAK8P3a2iQhxckn0MfLyLpKmyKN_MwAJ0t2yh6DLsS0MvdreYNA@mail.gmail.com>
 <88d1835f-cee5-0fb2-f7de-7fc06e8e671d@flygoat.com>
In-Reply-To: <88d1835f-cee5-0fb2-f7de-7fc06e8e671d@flygoat.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 16 Dec 2021 15:32:01 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1nozEpQ_9Q+NhocWZDsrfLmDibrkmoX8ph63wYaFxvjg@mail.gmail.com>
Message-ID: <CAK8P3a1nozEpQ_9Q+NhocWZDsrfLmDibrkmoX8ph63wYaFxvjg@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] MIPS: implement architecture-specific 'pci_remap_iospace()'
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Xi Ruoyao <xry111@mengyan1223.wang>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Rob Herring <robh@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, 
	linux-staging@lists.linux.dev, NeilBrown <neil@brown.name>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Xqa+1Z+q3ZO48sq+BxtqlZRAC4SVwqpvH11JlRjIO+nP20k3/b4
 Si1VVJEwiTfVWXOuE4/uzNWRuresuUmojRqTyY1rtzqX42dGIVbEs5xTrzCiMdCD64i1J2a
 r9u3kzVteKYOC6GbilqDowv3ueMnCT8OF2H+YAWpc59JWAuxtgHk7IY3tGR13y0IB/0Wif3
 GI+HCBCVTF2crgOW8LdyA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:X/2IPcg1W5I=:RY+1eCetz0RS+RrXoVmRvh
 T85NSgfTqQCCJDRwydTQLFxZMxNtpXyRNJ6mCNH76N4GLxDcyVbfxhFPBsA3VsyV5u2cWDCI/
 vs+/lJ+vNeZs9jC9/nT9Ojkuh72YetL8d1Xshpar+wI/OQMWjU7vUWP2sADgGQEnVBA2VO3Ss
 MAU4B6wOI/n84qpek4reu0R3DSGrgcKP1g7O5yIJARGUYiZ+gaQuus4TIKZAW867UqCbJshcS
 LYxnPQiNz7XNJCe1e4F8axaAZSFWe6VgWU4+SXfgaY51YpFiOZ6z9r4JzK1n+ew8Q0L8xXPD3
 upbRSx35XclemDD/6MlrFGHcdHOf3YjB+8fBqKoYvphIktfNwPc9SprQsMVyc7wtqt9pAqHsq
 TdlKlhxZgGqbpX+xlgyxulZMYX064s+PhnQz0TEQR7CrW6EsLWUvN/Gdg3HbX2vapYZf3jcb7
 y8SlIj34YsiwSmVu3sc3KdZCh/Gkamcfs+X/pN++K2T9fc5Nhsk1t1j36hSZdJsg44x4BAxBB
 +5P2ygkIE8LJoxVVdU/NgfpsywjOt/LdJhKa+LRtSZG9nMCVLQtYa3mtnvxJvW9B7LpX9nNWr
 H2p8Ehq6YeYyHtXHVIlQGUpv1i2hDEPglsORAxizOUYdwoaF/tuDgBg66+a+vkOGO/aoiZC3i
 MJmGtLWLUaBvVg7yM7G52gyaIF3YZ89T3HAqEuwOnP+thwy+XShKhsZhrHc96FSn6JRbp4Whx
 fpISVKd8dFPcwweI2Um/5aezj9a2L8SLAsTUQqALTtQI0wkF77oKdZl/GxjJXRochJXwKDIF8
 CLHgKkaFyboVIiWaVwcgt0nSyZhntqDwno5/d6/j+E8lR1oG/I=

On Thu, Dec 16, 2021 at 3:27 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote=
:
> =E5=9C=A8 2021/12/16 14:18, Arnd Bergmann =E5=86=99=E9=81=93:
> >> It got refactored by this patch as TLB entries are expensive on MIPS,
> >> also the size of IO range doesn't always fits a page.
> > Are PIO accesses common enough that the TLB entry makes a difference?
> > I would imagine that on most systems with a PCI bus, there is not even
> > a single device that exposes an I/O resource, and even on those devices=
 that
> > do, the kernel drivers tend to pick MMIO whenever both are available.
>
> Actually that was claimed by the author of this patch :-)
> I can understand the point. As he is working on a ramips system utlizes
> 1004Kec,
> which has only 32 TLB entries, saving a entry can give considerable
> improvement.

Ok

> For Loongson as we have legacy i8042/i8259 which can only be accessed via
> PIO, the access is very common.

Ah, right. It makes a lot of sense that anything based on ISA PC peripheral=
s
would need it, regardless of the PCI support.

       Arnd
