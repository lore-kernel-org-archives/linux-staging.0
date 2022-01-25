Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115892C82
	for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 14:12:50 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id y4so37629235uad.1
        for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 06:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Ipeih8oMrMRV9tKMmEoSWv4QvWT3greSwtClPVMn8+s=;
        b=pEPZuMqNR17i4KmscOVZDUEoNB+TaiRjtPN8AiceLRDqwiMkntz040wziVYDS5Q1/Y
         SsOA3xYc9+8AxjIwHfxuiwU5GACLrphvah2eQapSUctdqkhgAK2S3tCLUY1msLQB5mop
         fKW0AwxbIC8nNexJMiejjVOUOslLkMv8nGWBjv2Pp1Mk7V99+JMqCOvO6y4dttE/6dM6
         fxft7eDwqWMfQH0Vg0kKKfj8Cdta3neGi3URPK74SAn2vpkwaXRZNj60/DFu8TTrNqKA
         vlNz+YuV0sTlkjbKXaGkNfYACzXNcLItIqtZq71HaJd4JzXQznLHDcQr8edkq7qf82Qo
         sXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ipeih8oMrMRV9tKMmEoSWv4QvWT3greSwtClPVMn8+s=;
        b=g4kg3I8eFJMQ5uixrlZttO9cQo+TlbzEgCRykTCyhdkeV9t9yg2W6ltSKkeXqOLqzv
         McuqloPAoN9CZjRq3V/b9iMxCI2NGxaVKDLX8Cgsjywtm5KMZLatiSC2wo9+K8599Eo6
         tNMh8JCNffgWl8G7xBS2KOUPRRC7Zf2h7J/8vfrTBddqu/dkAJJw0dvMIEgFmNYIz30s
         iv4DpVZ2A2Lk8LZiV5dvktSjlVocZbJ+Liof9Gzy8+MI9YMTeOIvZU6K5t+OWrOH68hP
         ZQSAk3mOt8qvVFeuhoacnvfPwdfpE/6ntf2UH86aaTS/y0wzZeHZcFKuLCbIauyQZQCi
         HxGA==
X-Gm-Message-State: AOAM533Gl8KGMsEpBDuIYoWrHydNByNKU0k2QaFq8L+zdIywp8hPpg+3
	yq/vLDwr1wjn7U9PQb7sHb3wciekqfJnk1jkmFw=
X-Google-Smtp-Source: ABdhPJxXc0TfWNt12vcz7nn1kr4Z2apTMi4ICn9gjzIjARBI41AKNXNz7JEJEbAHrCVjTSus9OCOLmAILq9Bd1Qpdoo=
X-Received: by 2002:a05:6102:3f12:: with SMTP id k18mr7340811vsv.76.1643119968977;
 Tue, 25 Jan 2022 06:12:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220124124351.4604-1-arinc.unal@arinc9.com> <20220124124351.4604-3-arinc.unal@arinc9.com>
In-Reply-To: <20220124124351.4604-3-arinc.unal@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 25 Jan 2022 15:12:37 +0100
Message-ID: <CAMhs-H9VJLW9Qs29L9Qi2xgLUNTCC2ysKK88A=CoMd1jEGmSdA@mail.gmail.com>
Subject: Re: [PATCH 2/4] staging: mt7621-dts: fix switch0@0 warnings
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, NeilBrown <neil@brown.name>, 
	DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 24, 2022 at 1:45 PM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc=
9.com> wrote:
>
> Remove reg property from ports node to fix this warning:
>
> Warning (unit_address_vs_reg): /ethernet@1e100000/mdio-bus/switch0@0/port=
s: node has a reg or ranges property, but no unit name
>
> Another warning surfaces afterwards. Remove #address-cells and #size-cell=
s
> from switch0@0 node to fix this warning:
>
> Warning (avoid_unnecessary_addr_size): /ethernet@1e100000/mdio-bus/switch=
0@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg"=
 property
>
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> ---
>  drivers/staging/mt7621-dts/mt7621.dtsi | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7=
621-dts/mt7621.dtsi
> index d120e5872165..35f19d6ae4bd 100644
> --- a/drivers/staging/mt7621-dts/mt7621.dtsi
> +++ b/drivers/staging/mt7621-dts/mt7621.dtsi
> @@ -360,8 +360,6 @@ phy_external: ethernet-phy@5 {
>
>                         switch0: switch0@0 {
>                                 compatible =3D "mediatek,mt7621";
> -                               #address-cells =3D <1>;
> -                               #size-cells =3D <0>;
>                                 reg =3D <0>;
>                                 mediatek,mcm;
>                                 resets =3D <&rstctrl 2>;
> @@ -374,7 +372,6 @@ switch0: switch0@0 {
>                                 ports {
>                                         #address-cells =3D <1>;
>                                         #size-cells =3D <0>;
> -                                       reg =3D <0>;
>
>                                         port@0 {
>                                                 status =3D "off";
> --
> 2.25.1
>
>

Looks good to me:

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos
