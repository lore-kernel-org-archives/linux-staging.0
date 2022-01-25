Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7023D29CA
	for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 14:37:26 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id p1so37598436uap.9
        for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 06:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2kEPz0sF1ift1gbdex9+qQ41r0wYoGdTtOJURSgpf4k=;
        b=Xu+rG/ng+mBHTAXhrRebkPx3BNSMGmaCi1ijB3JZRDELRnNxgFdOf/M7Kf6FoJFHpJ
         zF9+cmXIRmIIt1pUGAU2nc4YB9YAviFczBUSIpuPNBqgeLhMe9t9V6kH5pUE93Tx0BQF
         IMlIFeaxNvpLN9do5xGIeDHo7PH9PO4FYNKTgzW+HLndxMGG7Xx95azX/7M64YoXoSpn
         gJTV8fsjRFBonBZ/RmdbS844cEicj89AtxqWE+oXc2liPArF/L1BdLqyeA+f0ONVGVTO
         bLSVsSM049VXGCELQrebwRex0XeVOnRgffa3IZ/ZyyPWshQ5MyYPrDXk+Hq5v5PN9Nqz
         XOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2kEPz0sF1ift1gbdex9+qQ41r0wYoGdTtOJURSgpf4k=;
        b=IwZgFJNh3hQvoz4PxIpZvFWffMurmKwxWRAe/V1f9udQegBKuROmQU4EO5zuL5JK6Z
         PhTnKe8q+qyE98YWL/LGZ+iy5Ab2VpCZml4q5vAreR56U8ctC6LTp2LUfBWCDRAZAxjq
         g5zrsHEhHGNA0NtlMg49JAYcznUTF1YBgfS4Xwu+QQKdRGjwhJdO/Dy3Ogf57hrPEihi
         jlJp38quen8ihtkS/7wTll/kil4Yxw/tgkOU97bpPVTtjT7wxiljipiBhoRgrHiUvwim
         v7K8OaeVAr/AbI+v/UxEqMzykercqOGVxfbQENeOerl2hgw6mPYLHvyfwVmf/7fj1ahO
         VHpA==
X-Gm-Message-State: AOAM531w7MoGOyy4QOqqv+Vk3GR1+Re64H45isanrLYPdJXOEqkhW7vf
	sU5rCH1e85T92SRqb2ATdE43Y6n0kpw5fUNdqxg=
X-Google-Smtp-Source: ABdhPJxems8AmMpWv2GpK1lo004qSb+0S3wrNb0FuZfBWi6aPklnkj+sa2kbS7vEbmF/oONgqlnn+G2XXrP5gIWhlws=
X-Received: by 2002:ab0:270b:: with SMTP id s11mr7404517uao.98.1643121445359;
 Tue, 25 Jan 2022 06:37:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220124124351.4604-1-arinc.unal@arinc9.com> <20220124124351.4604-4-arinc.unal@arinc9.com>
In-Reply-To: <20220124124351.4604-4-arinc.unal@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 25 Jan 2022 15:37:14 +0100
Message-ID: <CAMhs-H-CEYM6AvsiVfF7SQy0VviCyBS=AW_hXz2+Sqd6fjBfOw@mail.gmail.com>
Subject: Re: [PATCH 3/4] staging: mt7621-dts: use trgmii on gmac0 and enable
 flow control on port@6
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, NeilBrown <neil@brown.name>, 
	DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 24, 2022 at 1:45 PM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc=
9.com> wrote:
>
> Change phy-mode of gmac0 to trgmii to match the other side, port@6.
>
> Flow control needs to be enabled on both sides to work.
> It is already enabled on gmac0, enable it on port@6 too.
>
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> ---
>  drivers/staging/mt7621-dts/mt7621.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos
>
> diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7=
621-dts/mt7621.dtsi
> index 35f19d6ae4bd..489754f6ed77 100644
> --- a/drivers/staging/mt7621-dts/mt7621.dtsi
> +++ b/drivers/staging/mt7621-dts/mt7621.dtsi
> @@ -328,7 +328,7 @@ ethernet: ethernet@1e100000 {
>                 gmac0: mac@0 {
>                         compatible =3D "mediatek,eth-mac";
>                         reg =3D <0>;
> -                       phy-mode =3D "rgmii";
> +                       phy-mode =3D "trgmii";
>
>                         fixed-link {
>                                 speed =3D <1000>;
> @@ -412,6 +412,7 @@ port@6 {
>                                                 fixed-link {
>                                                         speed =3D <1000>;
>                                                         full-duplex;
> +                                                       pause;
>                                                 };
>                                         };
>                                 };
> --
> 2.25.1
>
