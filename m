Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4620129CA
	for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 14:39:44 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id u6so37840737uaq.0
        for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 06:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=C13F53Ul17+mXI+uUugiKRJqSRTWjVzjmPnVtDTqsN8=;
        b=STx/W/XVHmBzB03JoQmK9kSkdKVC/WnO62qObpb6qsw6x3BCYC501HVIOM2yskO3cG
         rodduSZrOWdtHinekCzT+G7LcpUz0Z45Zty1Nx4qFeTBqYqutuYWuAZRgNhKbXwgsLOf
         RHv6cempRYNzWNN5Bg+4g0O7E2yjG2VjmlnGUO5Ruo5cJiQQYxbmmK4AcEOisw0ed449
         ivjnBKQyNdwvYkZIbp+qzEgX1SxUizNF5OfyKjg/ob1L4pqIjvXGJZPLC8VQPvVp0pZi
         SLV292qm+SP7rWTk5s3DqgPl+bhSBR0gkZP5/bSdWsE7e0YjfanieHKZK/kdqgjQXzNS
         43Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=C13F53Ul17+mXI+uUugiKRJqSRTWjVzjmPnVtDTqsN8=;
        b=iStQ8bmEeozbwWR+VPNOLy2G1IMFVKc57oHSAa6fUcaedvcasBvlyfTfgmqebvB2x4
         ST3guF51aVebdr2aT8mZNt1ZDj8dLtRd8ShnQB90WnaUbQ1dxEfREhx6wVpGVLbEVU4z
         gUaREMzjLoOj822zD7XuEcrH88e5uOuwmuTPeRlNrL39G0yEdMI92Sz0wZjOO2XTxRw4
         TfyXrulm6LXFNJSNKpskNC9zMoElHa/lgV2MrfE1LKWvd+bB+7pcUm2Xh34hhFzU4ltL
         IJGRhMvzCXuN8gTLsqqcIRFRMsjzRaZTYDyo6QW1l0P7R9FgBsEaK2/WXWC3GvArjk8f
         zw2g==
X-Gm-Message-State: AOAM531uWDbDebCVB/usjGsWXnisvtiF60k7wCvxbJDZc1CW6e05Flml
	LSzTSq4fffuLQuhIuKfhZyyEQRzO6gPv7mxdpn8=
X-Google-Smtp-Source: ABdhPJyOXy1MS4CD1H/Js1Fta0ecFNfHAlGOwP3wbdOAP+5CFNEKItOmAd6CZ6/WzLnGHd/UMGIf++fdDL3KStP6IJA=
X-Received: by 2002:a67:fdce:: with SMTP id l14mr1964994vsq.70.1643121583171;
 Tue, 25 Jan 2022 06:39:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220124124351.4604-1-arinc.unal@arinc9.com> <20220124124351.4604-5-arinc.unal@arinc9.com>
In-Reply-To: <20220124124351.4604-5-arinc.unal@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 25 Jan 2022 15:39:32 +0100
Message-ID: <CAMhs-H_y38Keeh9j5SZNs8gsz1+WX4fOSJgzaRJOx+rpoM8S0g@mail.gmail.com>
Subject: Re: [PATCH 4/4] staging: mt7621-dts: fix pinctrl properties for ethernet
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, NeilBrown <neil@brown.name>, 
	DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 24, 2022 at 1:45 PM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc=
9.com> wrote:
>
> Add pinctrl properties with rgmii1 & mdio pins under ethernet node which
> was wrongfully put under an external phy node.
> GMAC1 will start working with this fix.
>
> Link: https://lore.kernel.org/netdev/02ecce91-7aad-4392-c9d7-f45ca1b31e0b=
@arinc9.com/T/
>
> Move GB-PC2 specific phy_external node to its own device tree.
>
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> ---
>  drivers/staging/mt7621-dts/gbpc2.dts   | 16 +++++++++++-----
>  drivers/staging/mt7621-dts/mt7621.dtsi | 13 +++----------
>  2 files changed, 14 insertions(+), 15 deletions(-)

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

>
> diff --git a/drivers/staging/mt7621-dts/gbpc2.dts b/drivers/staging/mt762=
1-dts/gbpc2.dts
> index 6fe603c7711d..03d6bb6735ac 100644
> --- a/drivers/staging/mt7621-dts/gbpc2.dts
> +++ b/drivers/staging/mt7621-dts/gbpc2.dts
> @@ -13,10 +13,16 @@ &default_gpio {
>         function =3D "gpio";
>  };
>
> -&gmac1 {
> -       status =3D "ok";
> -};
> +&ethernet {
> +       gmac1: mac@1 {
> +               status =3D "ok";
> +               phy-handle =3D <&phy_external>;
> +       };
>
> -&phy_external {
> -       status =3D "ok";
> +       mdio-bus {
> +               phy_external: ethernet-phy@5 {
> +                       reg =3D <5>;
> +                       phy-mode =3D "rgmii-rxid";
> +               };
> +       };
>  };
> diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7=
621-dts/mt7621.dtsi
> index 489754f6ed77..38ab6447756a 100644
> --- a/drivers/staging/mt7621-dts/mt7621.dtsi
> +++ b/drivers/staging/mt7621-dts/mt7621.dtsi
> @@ -325,6 +325,9 @@ ethernet: ethernet@1e100000 {
>
>                 mediatek,ethsys =3D <&sysc>;
>
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&rgmii1_pins &rgmii2_pins &mdio_pins>;
> +
>                 gmac0: mac@0 {
>                         compatible =3D "mediatek,eth-mac";
>                         reg =3D <0>;
> @@ -342,22 +345,12 @@ gmac1: mac@1 {
>                         reg =3D <1>;
>                         status =3D "off";
>                         phy-mode =3D "rgmii-rxid";
> -                       phy-handle =3D <&phy_external>;
>                 };
>
>                 mdio-bus {
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>
> -                       phy_external: ethernet-phy@5 {
> -                               status =3D "off";
> -                               reg =3D <5>;
> -                               phy-mode =3D "rgmii-rxid";
> -
> -                               pinctrl-names =3D "default";
> -                               pinctrl-0 =3D <&rgmii2_pins>;
> -                       };
> -
>                         switch0: switch0@0 {
>                                 compatible =3D "mediatek,mt7621";
>                                 reg =3D <0>;
> --
> 2.25.1
>
