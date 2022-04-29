Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C4F1365
	for <linux-staging@lists.linux.dev>; Fri, 29 Apr 2022 14:46:04 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id hf18so5938171qtb.0
        for <linux-staging@lists.linux.dev>; Fri, 29 Apr 2022 07:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=9gYARbcsROoRQuSPoSpdSfdzjCUBFI/hupA+J6RCICM=;
        b=MPIYQZwB0Uh/nZRz3paU+fYelB3PvD9iOyiFKynpzfDgpHL2BlgVCuZYT8qQnGHUyy
         qhc7Z/odasMpp5DlUG3P/9+W1Mn0t7pvFFqcXOcLPcFp9T1WhUWgO2qxUw0apTR3C62j
         m2hHEDL4JnVNDAlcPUKx5TovyU60q7sUlhGM6quVBjRgXDQxi3a6iTd2q3jjL0xVWuxb
         j0cczeIKTJJGIvchVfn879alN1Lv8NzMNI1sV+I/23AH/dnhIzI8UIjiSUAuAYTeIFfi
         QcgkZ8e0rsLiA7itATS1IDrQaO47fvOLTwINVwWxaIAvHhPt5GKqQtV2KdzC+BQEqQf2
         s5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=9gYARbcsROoRQuSPoSpdSfdzjCUBFI/hupA+J6RCICM=;
        b=20DZ7iYobMAf+us3+Xsppw1oqMZeT7GzaGvmcPwc5LLxKzuonfYgtTQAGhMI7GN49D
         YmsPqtQFRE5YZY7nVWfxeV8F5R02oLPazqLoze1QsELNWGpyO7XiQJ//Ma/Xm4XlHbgk
         jtGCWY0vPxpE4eJP+jQ0VmdiIR1jlZ8Tm1E5tCC8OfQ06gFxAqm8b2hocqf1LHDgkXIq
         cml91P76Qh1N/hCWkkSbomEORtH0NFtGexHiCg8U6WSMxsm/U/1/IJQo4xifH+xU9WJV
         VZQwLdLfvMR3xvGI0Kb85MZeb5SutcxAPzVNcevNseeyKHvIy00gJUo3aFMBpBpXoXEZ
         +L2A==
X-Gm-Message-State: AOAM5319gabmspZ6nQnMAl0Ea8PTtdNls5tGBslA/2SLE1iCHj6NPk6I
	Q1aeUwsGQ165LVTNGVQUcT2tRA==
X-Google-Smtp-Source: ABdhPJyQlCnjwbzppNjeoRa4lp/DB/LMiYCu/zkxnyLyc/FgC/Ihsp/mns5E09890GNRLtvRLppcCA==
X-Received: by 2002:a05:622a:1714:b0:2f3:5758:c789 with SMTP id h20-20020a05622a171400b002f35758c789mr26722108qtk.299.1651243563653;
        Fri, 29 Apr 2022 07:46:03 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id i14-20020ac85e4e000000b002f364a81d79sm1900279qtx.4.2022.04.29.07.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 07:46:03 -0700 (PDT)
Message-ID: <198ce3981ad15844627581f9519cab67ed2a81c1.camel@ndufresne.ca>
Subject: Re: [PATCH 0/3] Enable JPEG Encoder on RK3566/RK3568
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Geis
 <pgwipeout@gmail.com>, Michael Riesch <michael.riesch@wolfvision.net>,
 Liang Chen <cl@rock-chips.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Date: Fri, 29 Apr 2022 10:46:01 -0400
In-Reply-To: <20220427224438.335327-1-frattaroli.nicolas@gmail.com>
References: <20220427224438.335327-1-frattaroli.nicolas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0 (3.44.0-1.fc36) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Le jeudi 28 avril 2022 =C3=A0 00:44 +0200, Nicolas Frattaroli a =C3=A9crit=
=C2=A0:
> Hello,
>=20
> the following series adds support for and enables the hardware JPEG
> encoder on the RK3566 and RK3568 line of SoCs by Rockchip.
>=20
> The JPEG encoder is its own little Hantro instance with seemingly just
> the encode functionality.

I'm a little suspicious about this statement. I believe the Hantro combo is
identical to RK3399 and that you are confusing with Rockchip JPEG encoder h=
ere.
Here's the source of my suspicion:

https://github.com/JeffyCN/rockchip_mirrors/blob/mpp/osal/mpp_soc.cpp#L637

As this get burnt into DT, we really need to get this right. Perhaps we nee=
d to
run the reference software to verify ? Ping me if you need help with that.

>=20
> The first patch modifies the bindings with a new compatible, and adds
> the ability to just have a vepu interrupt without a vdpu interrupt.
>=20
> The second patch makes the actual driver changes to support this variant.
>=20
> The third and final patch makes the necessary device tree changes for
> the rk356x device tree file to add both the node for the encoder and
> its MMU.
>=20
> The series has been tested on a PINE64 Quartz64 Model A with an RK3566
> SoC using GStreamer.
>=20
> Regards,
> Nicolas Frattaroli
>=20
> Nicolas Frattaroli (3):
>   dt-bindings: media: rockchip-vpu: Add RK3568 JPEG compatible
>   media: hantro: Add support for RK356x JPEG encoder
>   arm64: dts: rockchip: Add JPEG encoder node to rk356x
>=20
>  .../bindings/media/rockchip-vpu.yaml          |  2 +
>  arch/arm64/boot/dts/rockchip/rk356x.dtsi      | 21 +++++++
>  drivers/staging/media/hantro/hantro_drv.c     |  1 +
>  drivers/staging/media/hantro/hantro_hw.h      |  1 +
>  .../staging/media/hantro/rockchip_vpu_hw.c    | 62 +++++++++++++++++++
>  5 files changed, 87 insertions(+)
>=20

