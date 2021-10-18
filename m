Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37D82C88
	for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 15:29:28 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id h4so5250924uaw.1
        for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 08:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F8nftG0CQDXE68eB3PMCsHk5kdbLHseesS72jVZx18E=;
        b=ZxC3+nmaKBFq8crmZwiJ5Qk8ELmZYa0QpOg0Fcg3hJXdZzJx4t7jBK5URnU9SrZ2tB
         Ml30Q0H1Pr2or1Vi1ivfTGtLRT39ibXeWtCD8o8Cc00rJZGtvfxYW4VVAaut1Ny6i4BB
         VZLKjsYAMgJSFRFND+q+YWnJut/O7+k1rSosJplO2ArYIf1wt0XIbkn/4mJJdi760pEa
         tJ+bFBJ34cbo06IwkJhdrIrZDCGbUhX6cOkra4bN4GRRDLGBck537s7hP9xw820H3Q4F
         hff3Cgvz1Tnu6rEGQyRexyzHxR8MThgOREI1YrEbUA9u2L836k8fAzlHjpLmI3qhCzVE
         x0AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F8nftG0CQDXE68eB3PMCsHk5kdbLHseesS72jVZx18E=;
        b=Hnv0P+yIbUASSkOSHBOReJ9sUjXw7pd266LQW7h+6bGTtWVM5GNzefLhhpKF5PPuvb
         Eg+pUwJTs1Zm8eAu+f0AC1PLSFpCaYjO6GyrIkoNz3EuX8FobL1O9voM9HRViy9zGe/b
         alKOb03A/CujL3odtRtI07NwvBWWG9pZXSqyWU0ozMtDavOdQWVHYCiM6LNdTTyXWPGe
         pkw+04qb7QscV1cghpPMLlIYnGji5MoIv9lXZgJH8OXawYFjnHcs8Jjv4xeNkycoqrV7
         vPnLdsK0AmoSOkJOxgg2dXo0vCuW4tIvbgkbyLr5LrbJNtwy8lFWh1InyQ5kQLKa65GX
         B2KQ==
X-Gm-Message-State: AOAM530OxfZxcA1FiVCUFpnNk/RHAxXhBE2MLC+KOeBqcPRdOFEIGpKg
	4bOtGyZJOwf2Cxr/4awhth+X9JsiyhaSy6dPkjfcfonI
X-Google-Smtp-Source: ABdhPJyR+ZQ1NlNfnMbw9kwpbradvNyX7RlzuVEeE8k6Cu4UNyMB3uzVWO761fNsu69fv5Rg89J01hWssivjFxNrM64=
X-Received: by 2002:a05:6102:3ec3:: with SMTP id n3mr27883241vsv.48.1634570967638;
 Mon, 18 Oct 2021 08:29:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211017070656.12654-1-sergio.paracuellos@gmail.com>
In-Reply-To: <20211017070656.12654-1-sergio.paracuellos@gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 18 Oct 2021 17:29:16 +0200
Message-ID: <CAMhs-H_BKw8e6hObS3Tx-iO44xbyZh2Q+=jVtxykJ=6hx1Rheg@mail.gmail.com>
Subject: Re: [PATCH 1/2] staging: mt7621-dts: get rid of nodes with no in-tree driver
To: linux-staging@lists.linux.dev
Cc: Greg KH <gregkh@linuxfoundation.org>, NeilBrown <neil@brown.name>
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

On Sun, Oct 17, 2021 at 9:06 AM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> Nodes for 'i2s' and 'nand' have no driver present inside the linux tree.
> The normal approach for a dts file to be mainlined is start with those stuff
> which is already mainlined and get rid of the other stuff. If needed it will
> be properly added afterwards together with the suitable device driver. Hence,
> remove both nodes from the device tree include file.
>
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  drivers/staging/mt7621-dts/mt7621.dtsi | 36 --------------------------
>  1 file changed, 36 deletions(-)

I noticed PATCH 2/2 of this series was added but not this one which is
the first one in the series. Since I did not see any mail or something
complaining about it... is it possible you missed it?

Thanks,
     Sergio Paracuellos
>
> diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
> index 72b99d8b4647..fd4ab4006ed8 100644
> --- a/drivers/staging/mt7621-dts/mt7621.dtsi
> +++ b/drivers/staging/mt7621-dts/mt7621.dtsi
> @@ -102,28 +102,6 @@ i2c: i2c@900 {
>                         pinctrl-0 = <&i2c_pins>;
>                 };
>
> -               i2s: i2s@a00 {
> -                       compatible = "mediatek,mt7621-i2s";
> -                       reg = <0xa00 0x100>;
> -
> -                       clocks = <&sysc MT7621_CLK_I2S>;
> -                       clock-names = "i2s";
> -                       resets = <&sysc MT7621_RST_I2S>;
> -                       reset-names = "i2s";
> -
> -                       interrupt-parent = <&gic>;
> -                       interrupts = <GIC_SHARED 16 IRQ_TYPE_LEVEL_HIGH>;
> -
> -                       txdma-req = <2>;
> -                       rxdma-req = <3>;
> -
> -                       dmas = <&gdma 4>,
> -                               <&gdma 6>;
> -                       dma-names = "tx", "rx";
> -
> -                       status = "disabled";
> -               };
> -
>                 memc: syscon@5000 {
>                         compatible = "mediatek,mt7621-memc", "syscon";
>                         reg = <0x5000 0x1000>;
> @@ -355,20 +333,6 @@ cdmm: cdmm@1fbf8000 {
>                 reg = <0x1fbf8000 0x8000>;
>         };
>
> -       nand: nand@1e003000 {
> -               status = "disabled";
> -
> -               compatible = "mediatek,mt7621-nand";
> -               bank-width = <2>;
> -               reg = <0x1e003000 0x800
> -                       0x1e003800 0x800>;
> -               #address-cells = <1>;
> -               #size-cells = <1>;
> -
> -               clocks = <&sysc MT7621_CLK_NAND>;
> -               clock-names = "nand";
> -       };
> -
>         ethernet: ethernet@1e100000 {
>                 compatible = "mediatek,mt7621-eth";
>                 reg = <0x1e100000 0x10000>;
> --
> 2.33.0
>
