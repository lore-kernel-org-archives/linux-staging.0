Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628CE71
	for <linux-staging@lists.linux.dev>; Sat,  8 May 2021 06:40:53 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id v22so5973416oic.2
        for <linux-staging@lists.linux.dev>; Fri, 07 May 2021 23:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xX1is4SChHjrs4j+7h4A1M2iT4Pn7Fk4B4vamTtYWNg=;
        b=Imz8wSLlAusRO73bwSesFa8LgAzl8kdck2RliwjGaTk0RPj7pTEoOUYeIcdnkzZwOA
         SjBg9mby8dpHeUC0piMKcKEPha8K3oJ0UWysG7TjOaJFGohLsWmjv6awScr48i60MUxV
         JwAd8n1Von368QV3ApB+8ocb+i7cMHe1d1dxrzs/0RJqNYa2b/oz7S0p9uT6+tJnm57K
         ACmd3ZG1A+9Wdk3dt1pRH1imrojRAm2upBFOMsO/0vCPxRW3nHacS6YP8+AkiBPKCdum
         bGTtAufpQekTCpTS4t1DPYBl8vlfau4YHt+4+GF+Xf6AKOLqkwwNLrosSSRz/4LYlpaG
         jbuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xX1is4SChHjrs4j+7h4A1M2iT4Pn7Fk4B4vamTtYWNg=;
        b=gQS4SpZNHbHqT4+JddpxqFau+3WlewiQ+yVyKG3R1vsYQUjjbP7eDmAWlvnMf5Iflb
         MzbCTAdQW5f33f3oWZ2Q6i4bTgR021LfBDlAfGvBQmrQw2xxZy/FV5uk70MX8p+q0Juw
         6rWZGSXPAC29bvmA9E7zCzwBVdn6NgtuWHNYIu+DTCiBZFypNfiQH4aLWRXlt619nd4O
         v0LLsMyaYNIR+0fHFok+/gMjhyxHd0V9c1MYF3QMjmVkqqRKrLIOk/EVr/D3xXsj8cdD
         Rc+QOrKX+S6/O0B2hmkFaLCYYznDIHa4SYbaU2yCenYnvmNilm3qyipiNdV0kqTxGPP+
         Zd1w==
X-Gm-Message-State: AOAM531kcgtT8UKdnsK0OIS/Yt2mIvOb4oNob/CGrE3R88YQaQr8O39D
	N5yB2rH9JeGSgMZKtIcyXbBZ+DsdSmWhxOjQ8vI=
X-Google-Smtp-Source: ABdhPJwAyGss2cNFyssIhfj5RZk/SL9XXRRmz0u6ykjl2Fblq8Iiz/GgYCUu65PFCmus8x9Wk7PHoX5r1mvRSIO7EwA=
X-Received: by 2002:aca:2813:: with SMTP id 19mr18254142oix.23.1620456052653;
 Fri, 07 May 2021 23:40:52 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210506111531.21978-1-sergio.paracuellos@gmail.com>
 <20210506111531.21978-3-sergio.paracuellos@gmail.com> <20210507221200.GA2984128@robh.at.kernel.org>
In-Reply-To: <20210507221200.GA2984128@robh.at.kernel.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Sat, 8 May 2021 08:40:41 +0200
Message-ID: <CAMhs-H8MF+EpcutEN=maCNMReFXaTXejfScMK8N9cKz3oaM15w@mail.gmail.com>
Subject: Re: [PATCH 2/5] dt-bindings: phy: mediatek,mt7621-pci-phy: add clock entries
To: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org, 
	Kishon Vijay Abraham I <kishon@ti.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-staging@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>, 
	NeilBrown <neil@brown.name>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Sat, May 8, 2021 at 12:12 AM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, May 06, 2021 at 01:15:28PM +0200, Sergio Paracuellos wrote:
> > MT7621 SoC clock driver has already mainlined in
> > 'commit 48df7a26f470 ("clk: ralink: add clock driver for mt7621 SoC")'
> > Hence update schema with the add of the entries related to
> > clock.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> >  .../bindings/phy/mediatek,mt7621-pci-phy.yaml        | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/phy/mediatek,mt7621-pci-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,mt7621-pci-phy.yaml
> > index 0ccaded3f245..d8614ef8995c 100644
> > --- a/Documentation/devicetree/bindings/phy/mediatek,mt7621-pci-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/mediatek,mt7621-pci-phy.yaml
> > @@ -16,6 +16,14 @@ properties:
> >    reg:
> >      maxItems: 1
> >
> > +  clocks:
> > +    maxItems: 1
> > +    description:
> > +      PHY reference clock. Must contain an entry in clock-names.
> > +
> > +  clock-names:
> > +    const: sys_clk
>
> You don't really need -names when there is only 1.

Ok, I will drop this property then and
>
> > +
> >    "#phy-cells":
> >      const: 1
> >      description: selects if the phy is dual-ported
> > @@ -23,6 +31,8 @@ properties:
> >  required:
> >    - compatible
> >    - reg
> > +  - clocks
> > +  - clock-names
>
> Technically, you can't add new properties and make them required as that
> breaks the ABI. If that's okay here, explain it in the commit message.

So until now no clock driver existed and things were not properly
being done in driver code directly accessing registers to get the
clock frequency to properly configure the phy. Since the new clock
driver enters into the scene, make this mandatory force to update both
driver and dtb, which is something pretty normal when upgrading the
kind of devices using this SoC. So I think it should be finde to make
this a requirement.

>
> >    - "#phy-cells"
> >
> >  additionalProperties: false
> > @@ -32,5 +42,7 @@ examples:
> >      pcie0_phy: pcie-phy@1e149000 {
> >        compatible = "mediatek,mt7621-pci-phy";
> >        reg = <0x1e149000 0x0700>;
> > +      clocks = <&sysc 0>;
> > +      clock-names = "sys_clk";
> >        #phy-cells = <1>;
> >      };
> > --
> > 2.25.1
> >

Best regards,
    Sergio Paracuellos
