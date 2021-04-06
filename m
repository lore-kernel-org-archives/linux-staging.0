Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D616D0E
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 15:57:18 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id d10so13526252ils.5
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 08:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FEHBLN0Zstx1GJN7oNvdBnFUfGg0YcWpGNgAuqNChPM=;
        b=ewEZauKlnvV70GX0on1+GRjS9gR/bGnmqPzBG+GSpy2uOxwLfOllm9KCl5/p7dFAZz
         nHE1PVAjQimYXKTfna3TXgFuubqMlL3UaczMGaC0r2bCDW0X7qg4nOxFzZQWrUtkB/YD
         BzgGmPkk1FdLZw8Lm4U/X/4ppblG8V4pG8bAO8hmaMKKJrxoLBEtm9W127DFBGtAU2UE
         t3oVu54JpKY9oq21Gcsu+T9VbuEM+KXkKbmTjDvs4o3q9lJnzsOVa9zbWtBpT67TMG3R
         2h/Iowp2LUCrtcdi5khnKDrSoXByGh5FqI6GimUrmfcfLjd+XhdyCMM4ZLElYNd3Vb9C
         CGIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FEHBLN0Zstx1GJN7oNvdBnFUfGg0YcWpGNgAuqNChPM=;
        b=fmJ20nE/qUy4QW/e5P3vvNo5bD2pH+xzfmlnLqt93IfHvPGMkAzOW4pRtyRhQ78o6V
         eMyzYezjiDj/qT3/USnxMuOY1ENC8eAXmuTOc5bUrlE5RbeTgikBoCyS4zP7IG8+2DNy
         6lVYZ/jahZlq/Gv5FZKeXPhCMgORPfO2axIoZkkUuf950m8wLo79kZj38AQ+TT0Z9tN9
         orcdludu10SvudKmNKoqQM+EbkBtgj5Zw8DBh7cEekdc7CYh+kF/U5iC+cfFIUMeTL6d
         0YmxqLh9+HUMfNspR6d40N5am7XC1VAs5uvYa0HvoJ5j0W9F89CF95o6x/X8HTpy/Y8q
         m9xQ==
X-Gm-Message-State: AOAM530/uf+DQ/hibi+KIlt8LmqcMDlfzlvLOdYFaBu4WG4qAIy2CE4T
	LTg8TUqZn9+juTMiZ+eWNs6MjbCVFz416GLMKGs=
X-Google-Smtp-Source: ABdhPJwcAo2Mlxz7UGgC2fTg8jHTyNrSATURmH+oza/tZhdRnPEtDe7seeMK4cOStjDtCgSO2NPZMkI6wNVpe9+DdWk=
X-Received: by 2002:a92:de0c:: with SMTP id x12mr2017100ilm.169.1617724637582;
 Tue, 06 Apr 2021 08:57:17 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210406141819.1025864-1-dqfext@gmail.com> <20210406141819.1025864-2-dqfext@gmail.com>
 <CAAOTY_8snSTcguhyB9PJBWydqNaWZL3V4zXiYULVp5n48fN24w@mail.gmail.com>
In-Reply-To: <CAAOTY_8snSTcguhyB9PJBWydqNaWZL3V4zXiYULVp5n48fN24w@mail.gmail.com>
From: DENG Qingfang <dqfext@gmail.com>
Date: Tue, 6 Apr 2021 23:57:14 +0800
Message-ID: <CALW65jbbQSFbgjsMkKCyFWnbkLOenM_+2q6K7BQG5bc4-R0CpA@mail.gmail.com>
Subject: Re: [RFC net-next 1/4] net: phy: add MediaTek PHY driver
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>, 
	Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Landen Chao <Landen.Chao@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Sean Wang <sean.wang@mediatek.com>, Vivien Didelot <vivien.didelot@gmail.com>, 
	Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, linux-staging@lists.linux.dev, 
	DTML <devicetree@vger.kernel.org>, netdev <netdev@vger.kernel.org>, 
	Weijie Gao <weijie.gao@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>, 
	=?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 6, 2021 at 11:47 PM Chun-Kuang Hu <chunkuang.hu@kernel.org> wro=
te:
>
> Hi, Qingfang:
>
> DENG Qingfang <dqfext@gmail.com> =E6=96=BC 2021=E5=B9=B44=E6=9C=886=E6=97=
=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8810:19=E5=AF=AB=E9=81=93=EF=BC=9A
> > --- a/drivers/net/phy/Kconfig
> > +++ b/drivers/net/phy/Kconfig
> > @@ -207,6 +207,11 @@ config MARVELL_88X2222_PHY
> >           Support for the Marvell 88X2222 Dual-port Multi-speed Etherne=
t
> >           Transceiver.
> >
> > +config MEDIATEK_PHY
>
> There are many Mediatek phy drivers in [1], so use a specific name.

So "MEDIATEK_MT7530_PHY" should be okay?

>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/drivers/phy/mediatek?h=3Dv5.12-rc6
>
> Regards,
> Chun-Kuang.
