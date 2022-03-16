Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959EA290E
	for <linux-staging@lists.linux.dev>; Wed, 16 Mar 2022 06:48:41 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id jx8so1208901qvb.2
        for <linux-staging@lists.linux.dev>; Tue, 15 Mar 2022 23:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Wv4xOcohgxB2rcpOadFZd1tb06qySnmM9ccCl9Yyqj4=;
        b=nYe5TEmYh6niKxfONifnKGvIcSQmOtaJ8Z4VCnu2YMF7avZMly8S9Ps/A5lKZfLKl9
         hGld75lrU1HFwdrRlyjxz2zP31IjDw9DC0IjN4k7fiUWDm5DxbTN8sB7U/xbTEoeJGMG
         Ig1kCTIhGsgzAFDPi+q20fMzggc5s81o8zxPN+D1fSJSPj4hV/nXB3dKMIdS9myG7jQE
         o3hFf2C56vXtzFDRaYkD2C7HXH4pYoCLpNBLWKPErt061ejNIf5BdhL37yDkiO/OvRaU
         qVA661KzN6V+LHrsGVK4MrQPgMAg+uBLNdyETJnTeYd4AeNt4qO4OAq1U7FK/3ukVWKk
         56rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Wv4xOcohgxB2rcpOadFZd1tb06qySnmM9ccCl9Yyqj4=;
        b=e4/XbD/O0tYVnhoNxni6SVYUuPV6oRwibcfmwSluCrtSWRTB9h47jGExT6EDVtv6ZY
         sRzWqOzuQXDTDEqYYJ+PKRQOU2sGjs/qVzV+b0z8UdvBrjGOcnl5nZtSIw0DuC/3Z4Ei
         kaiHsyH8nSvZ6KsHu+JHQbGMTz71D/Dma2/GySf3LNZwI13MIfdGa1629+5aW+IV/oL/
         y5LZTvjdXk6hMK2zRu+3u9B4ztrsKAAgrF5r/TssFSwkaUiBvteT28jBowtseG+mRQfD
         v81yKBSzQ+8MA8mBEtkCQPomfJHq6lKjKjqrAPsMxb9Xu69gM1PMMTIhYfziQJaQgVRS
         8Dlw==
X-Gm-Message-State: AOAM530eZ6QiUNwAaBdppmAcNTzbfd3liWhdQeqVFClWaGBtgyreYLxb
	zqRLt/pJr5C9Z3bL+IZDo95cDTfrIpe4Pl75Jj8=
X-Google-Smtp-Source: ABdhPJypIDVtIyhHXcLq0gpsbUGLh0QGS3aZkhQ+YGRXFTWVv3K2b8PNbmEyPrSfZucfIhxMEwopbRaH0uk6cw7scq0=
X-Received: by 2002:a0c:e781:0:b0:42c:4e4f:a6db with SMTP id
 x1-20020a0ce781000000b0042c4e4fa6dbmr23382485qvn.107.1647413320521; Tue, 15
 Mar 2022 23:48:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220315160149.3617-1-arinc.unal@arinc9.com> <20220315173204.GA14220@alpha.franken.de>
In-Reply-To: <20220315173204.GA14220@alpha.franken.de>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Wed, 16 Mar 2022 07:48:29 +0100
Message-ID: <CAMhs-H-+TF5HEzWsCsou2Wa9cSzgSVhHW6aHiXa=8mEe+rTbxQ@mail.gmail.com>
Subject: Re: [PATCH v2] mips: dts: ralink: add MT7621 SoC
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, 
	Greg KH <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, 
	NeilBrown <neil@brown.name>, DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, 
	Mark Lee <Mark-MC.Lee@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, erkin.bozoglu@xeront.com, 
	linux-staging@lists.linux.dev, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:MIPS" <linux-mips@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 15, 2022 at 6:32 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Tue, Mar 15, 2022 at 07:01:50PM +0300, Ar=C4=B1n=C3=A7 =C3=9CNAL wrote=
:
> > The MT7621 system-on-a-chip includes an 880 MHz MIPS1004Kc dual-core CP=
U,
> > a 5-port 10/100/1000 switch/PHY and one RGMII.
> >
> > Add the devicetrees for GB-PC1 and GB-PC2 devices which use MT7621 SoC.
> >
> > Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> > Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> > v2: fix a tiny grammar mistake, add Sergio's acked-by.
> >
> > This patch does changes on top of commit dcd520af4eac ("staging:
> > mt7621-dts: fix cpuintc and fixedregulator dtc warnings, fix xhci") whi=
ch
> > is currently applied on gregkh/staging.git staging-next branch.
> >
> > ---
> >  MAINTAINERS                                           |  7 +++++++
> >  arch/mips/boot/dts/ralink/Makefile                    |  4 ++++
> >  .../mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts     |  0
> >  .../mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts     |  0
> >  .../mips/boot/dts/ralink}/mt7621.dtsi                 |  0
> >  arch/mips/ralink/Kconfig                              |  5 +++++
> >  drivers/staging/Kconfig                               |  2 --
> >  drivers/staging/Makefile                              |  1 -
> >  drivers/staging/mt7621-dts/Kconfig                    | 11 -----------
> >  drivers/staging/mt7621-dts/Makefile                   |  5 -----
> >  drivers/staging/mt7621-dts/TODO                       |  5 -----
> >  11 files changed, 16 insertions(+), 24 deletions(-)
> >  rename drivers/staging/mt7621-dts/gbpc1.dts =3D> arch/mips/boot/dts/ra=
link/mt7621-gnubee-gb-pc1.dts (100%)
> >  rename drivers/staging/mt7621-dts/gbpc2.dts =3D> arch/mips/boot/dts/ra=
link/mt7621-gnubee-gb-pc2.dts (100%)
> >  rename {drivers/staging/mt7621-dts =3D> arch/mips/boot/dts/ralink}/mt7=
621.dtsi (100%)
> >  delete mode 100644 drivers/staging/mt7621-dts/Kconfig
> >  delete mode 100644 drivers/staging/mt7621-dts/Makefile
> >  delete mode 100644 drivers/staging/mt7621-dts/TODO
>
> Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Thanks, Thomas!!

Best regards,
    Sergio Paracuellos
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessaril=
y a
> good idea.                                                [ RFC1925, 2.3 =
]
