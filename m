Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59256D0E
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 15:37:54 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id c3so5343430ils.2
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 08:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kbb3/w5YJGsBeXToKy9zRKXFO7bV5Vr6+2zCWM3GMJs=;
        b=PX9wRzFR3GLxYS+v7WJWcQ8w6OA7XNBTFoiOUuDUWcScUAV1KX84PKIhp1MbImARj7
         zfDeUZS/HuyypOgx2s7g8xK+mZiK7QvljysRj8KrtAEqwzl+4q3KnN/sPnzx7utgVxAl
         jHa9z+z3tV7CBTnEwTXN7UQfBShvTFIlms9BxIs6YZZQUVYqHp/YauRctCOH94KI8Byv
         HZbF58xrNEp1QK9sQbUqKZTGxsz5QSUlE31cnd57TfRo+ep4RRsM+6Pl3fy28G5GztVU
         ysc3tAldc1zDgy6wn7bd+LAT3JZM3asHq4gcSdAKF2RzWOQrywSQ2ghQi27IxS3avXbx
         rqug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kbb3/w5YJGsBeXToKy9zRKXFO7bV5Vr6+2zCWM3GMJs=;
        b=nUg6geWPw0lf39amg80segCvy5k9L6QdoV2FgmUT8NhnLpFi3W9cWjC5uAodh4elBT
         p5SYSE5mD1WuDu2B5SyCKaUVR1KwkLHEkxT0VBzjGiZQqXPcfR9XEHmnC6gm2mEY1LTF
         P8SFfVXQrLXhCQmxrDBugVpR+8n1oKBp8mgJ9tHooVBWb9Ulht5j8KBstHq+/ptnaooh
         nlCQ4szZrmJuC1AxHN43Qk7Ve1P4XOOufw8RiK6aQolYkP4IcdLNRDJ2tO3+NCeLp0kj
         KZZsUsA9h5m3VwMA753QhrLdQjowQ5gkGzFnPc6wWk7V/ktWDOTyLGyJKHMxD6yVTz82
         RHsA==
X-Gm-Message-State: AOAM533BI3+wXDBFg6s2rEIAMZ+juNBasFSX1wo374cJStRII0dZwrDc
	XwZ2CtBGnO2ohOYTiB6um752kw9nzaLGxtkutQo=
X-Google-Smtp-Source: ABdhPJx0Q0y2VRt3hOxfDO1mtz1BBR0nzU1O4AzOcEj955FhecKBLwpJD1/qIY06hhsRlAjlNDN8j2jSd8GUczZS4mA=
X-Received: by 2002:a92:de0c:: with SMTP id x12mr1946080ilm.169.1617723474053;
 Tue, 06 Apr 2021 08:37:54 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210406141819.1025864-1-dqfext@gmail.com> <20210406141819.1025864-2-dqfext@gmail.com>
 <YGx8c5Jt2D7fB0cO@lunn.ch>
In-Reply-To: <YGx8c5Jt2D7fB0cO@lunn.ch>
From: DENG Qingfang <dqfext@gmail.com>
Date: Tue, 6 Apr 2021 23:37:51 +0800
Message-ID: <CALW65jYGpTs+30k7vxfLpQaK1sqHf4r7zosSOxp4W5U+Eh-Wvg@mail.gmail.com>
Subject: Re: [RFC net-next 1/4] net: phy: add MediaTek PHY driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	Landen Chao <Landen.Chao@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>, 
	Vivien Didelot <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-kernel@vger.kernel.org, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, linux-staging@lists.linux.dev, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, netdev <netdev@vger.kernel.org>, 
	Weijie Gao <weijie.gao@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>, 
	=?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 6, 2021 at 11:21 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Tue, Apr 06, 2021 at 10:18:16PM +0800, DENG Qingfang wrote:
> > Add support for MediaTek PHYs found in MT7530 and MT7531 switches.
>
> Do you know if this PHY is available standalone?

Not that I know of.

>
> > +static int mt7531_phy_config_init(struct phy_device *phydev)
> > +{
> > +     mtk_phy_config_init(phydev);
> > +
> > +     /* PHY link down power saving enable */
> > +     phy_set_bits(phydev, 0x17, BIT(4));
> > +     phy_clear_bits_mmd(phydev, MDIO_MMD_VEND1, 0xc6, 0x300);
> > +
> > +     /* Set TX Pair delay selection */
> > +     phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x13, 0x404);
> > +     phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x14, 0x404);
>
> This gets me worried about RGMII delays. We have had bad backwards
> compatibility problems with PHY drivers which get RGMII delays wrong.
>
> Since this is an internal PHY, i suggest you add a test to the
> beginning of mt7531_phy_config_init():
>
>         if (phydev->interface != PHY_INTERFACE_MODE_INTERNAL)
>                 return -EINVAL;

Okay. Will add it to v2.

>
> We can then solve RGMII problems when somebody actually needs RGMII.
>
>    Andrew
