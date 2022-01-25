Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D712C82
	for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 14:09:07 +0000 (UTC)
Received: by mail-ua1-f53.google.com with SMTP id r15so37603644uao.3
        for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 06:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=myq5zT7OqcXTvGR/fqEQP9qzaLpmCQaFActxZXeM0Pc=;
        b=evGjZOJgd97SQhMpDlmC89SHkMa+0C4Ilv4E7QIFnhHwChPPydGQN9AtEE8Ac2J3aI
         Kt6rEv78j6UUhAe8Wu3RhSRhyKEXZx4r9rVfKJMC/CHpAElsuHiBz3G6fQuieS0yXI5T
         4ZGPWbO4RELUQb919mYdJ2MM0MmOdfK5j6E1orbp4MXg2GbwuFQar+SYyMRo1zgnoZmO
         9NQoelJ5ShwLUWnN3vPY2fuP9BodVO+drrrFdnckc+2OUmbcVmypYvcRfgC9T6JT7QmK
         SWD9E+5P31xqmzTScYYUfMi7+LoJFW1+JZqnvZ59j/HYQLMWqxq2uhakP0sOvUbRNCkW
         JdVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=myq5zT7OqcXTvGR/fqEQP9qzaLpmCQaFActxZXeM0Pc=;
        b=kO4Zinta+6V66MpfgLZhoeAf2EeKYIYwengRp6b9ooDYmLpe0SLpAHBmen2/Eq9Gg0
         gIyJ7VfOGIaNWqAl1eB1sY5W7z+VV2VjeAVtWlVEBmvOTYlsA3xwA5TkiI3yVC985Ez2
         +Gpk8SPUuK6Ht1oo3CgGiwiM4T2CaVbBfltJtyIf1X4u04sZoUMOwBJOi/rSogMTQhHh
         u8HtCK6eGW8ie8LRJxaeAm9QS6Geu/FDHr5I+O4/3sPjacy2JPYh39IBm+fyDnkS4sBR
         QTsCqRjwHN0NajB0wjixuf/ShIYvmdGGY8YYhkoDrme0U8Ukg1p5XE0jvYHIRvy1tAW+
         K/wQ==
X-Gm-Message-State: AOAM533q96WaI2sJVQiQLUoj7JQnJj0IejwtXxYCWq3pRwGYuVX16aza
	giqjcDuUM4iO5g+JnyEnvmNQMWSA5nqV5P6rdyo=
X-Google-Smtp-Source: ABdhPJzYsWIIPMAratk1kK9Mwk8YRkNXCJyjPnc6JU7y2ypTFG8n5B6He9W7H8vDfP2mjrLLPuCQvmQMC00W3WalA3Y=
X-Received: by 2002:a67:ca03:: with SMTP id z3mr3459024vsk.1.1643119746035;
 Tue, 25 Jan 2022 06:09:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220124124351.4604-1-arinc.unal@arinc9.com> <20220124124351.4604-2-arinc.unal@arinc9.com>
In-Reply-To: <20220124124351.4604-2-arinc.unal@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 25 Jan 2022 15:08:55 +0100
Message-ID: <CAMhs-H8hMERY76SRcQtCRvUq2x6Z-d7GE6NLKPj=j0X=6e2m+w@mail.gmail.com>
Subject: Re: [PATCH 1/4] staging: mt7621-dts: fix formatting
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, NeilBrown <neil@brown.name>, 
	DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arinc,

On Mon, Jan 24, 2022 at 1:45 PM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc=
9.com> wrote:
>
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>

We need a body for the commit also and not only a short description
for the commit.

> ---
>  drivers/staging/mt7621-dts/mt7621.dtsi | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7=
621-dts/mt7621.dtsi
> index 644a65d1a6a1..d120e5872165 100644
> --- a/drivers/staging/mt7621-dts/mt7621.dtsi
> +++ b/drivers/staging/mt7621-dts/mt7621.dtsi
> @@ -44,9 +44,9 @@ mmc_fixed_3v3: fixedregulator@0 {
>                 regulator-max-microvolt =3D <3300000>;
>                 enable-active-high;
>                 regulator-always-on;
> -         };
> +       };
>
> -         mmc_fixed_1v8_io: fixedregulator@1 {
> +       mmc_fixed_1v8_io: fixedregulator@1 {
>                 compatible =3D "regulator-fixed";
>                 regulator-name =3D "mmc_io";
>                 regulator-min-microvolt =3D <1800000>;
> @@ -325,17 +325,18 @@ ethernet: ethernet@1e100000 {
>
>                 mediatek,ethsys =3D <&sysc>;
>
> -
>                 gmac0: mac@0 {
>                         compatible =3D "mediatek,eth-mac";
>                         reg =3D <0>;
>                         phy-mode =3D "rgmii";
> +
>                         fixed-link {
>                                 speed =3D <1000>;
>                                 full-duplex;
>                                 pause;
>                         };
>                 };
> +
>                 gmac1: mac@1 {
>                         compatible =3D "mediatek,eth-mac";
>                         reg =3D <1>;
> @@ -343,6 +344,7 @@ gmac1: mac@1 {
>                         phy-mode =3D "rgmii-rxid";
>                         phy-handle =3D <&phy_external>;
>                 };
> +
>                 mdio-bus {
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
> @@ -373,36 +375,43 @@ ports {
>                                         #address-cells =3D <1>;
>                                         #size-cells =3D <0>;
>                                         reg =3D <0>;
> +
>                                         port@0 {
>                                                 status =3D "off";
>                                                 reg =3D <0>;
>                                                 label =3D "lan0";
>                                         };
> +
>                                         port@1 {
>                                                 status =3D "off";
>                                                 reg =3D <1>;
>                                                 label =3D "lan1";
>                                         };
> +
>                                         port@2 {
>                                                 status =3D "off";
>                                                 reg =3D <2>;
>                                                 label =3D "lan2";
>                                         };
> +
>                                         port@3 {
>                                                 status =3D "off";
>                                                 reg =3D <3>;
>                                                 label =3D "lan3";
>                                         };
> +
>                                         port@4 {
>                                                 status =3D "off";
>                                                 reg =3D <4>;
>                                                 label =3D "lan4";
>                                         };
> +
>                                         port@6 {
>                                                 reg =3D <6>;
>                                                 label =3D "cpu";
>                                                 ethernet =3D <&gmac0>;
>                                                 phy-mode =3D "trgmii";
> +
>                                                 fixed-link {
>                                                         speed =3D <1000>;
>                                                         full-duplex;
> --
> 2.25.1
>
>

Other than that, this looks good. So feel free to add my:

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

when submitting a new version of this series.

Best regards,
    Sergio Paracuellos
