Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C41FD536;
	Thu,  5 Jan 2023 16:22:04 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id tz12so91226625ejc.9;
        Thu, 05 Jan 2023 08:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FU9BexSvyi2rD+vcAVXhDiB0sHcYopPemd1xbDcQCCM=;
        b=ZzmV1s9fsOiFn3LejpZMBW4u+pf0+ZsDVki4sSrDBfhDl+80zywTBkT2FEzzYYPBi8
         JmEKj/3Qtjl+IaRZADQxPPtnnv2nKTIrrFX2o2FHjpaitSARP8JPauqYKgrkHW1UvnDo
         c4f/TcKWlNL8MZgrKbZIB6+uzR7o51Romu8B8t0kqV685+x5Mh6USO9dHK+mR+2yHTS4
         SdXlYi99kkgubU0p0EGJppw545xOeurgrgnbHVfnJNVnrp/RMu67JcDiQF+Fy3dOHG+t
         Z1aQSAVwxxQiIVCyKOJiFkr6Xb6WAWvptnENqrE0UMtxZt/wJoSGIWImm4TGLjKgLw97
         fyFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FU9BexSvyi2rD+vcAVXhDiB0sHcYopPemd1xbDcQCCM=;
        b=z/DYeBNVQN4uyDATrae8Mj0QElUXtSSDWqYHzggzVfQAV7qnDsTnhuL9LGOk/SorbO
         Zol8FHQfAZIg44FJreVYXpewDqNt3XLTBDVdbH8S7wIT2U+XZpQdZ/hq5M0lcrQcCH8w
         BB7ujGaaFOB2ypzelrR+Ch/WXztoSoTSAoSe5cOu9ZsubaHAIFVbUXZYr/nLEBpUtFXU
         a/XkSqwTh/cz17OGKmQoWos5VzVdtMqr2vjlxerVVbKfDkaZhqephz/kCm67W9E3/oI+
         qi8LD+rywLS7/Xo9TljN3zz2t1b7JROCTKqC9LMUzfAxQoZLqcEfJjj2xA/G6ClIJ66j
         pxHQ==
X-Gm-Message-State: AFqh2kqXuA82oqubOOck/+i+pqIYtfEEDQSoyoXuwVegkQdrm/AHYFso
	6cOQWfSL01Z+ofEpZtRKiqQ=
X-Google-Smtp-Source: AMrXdXsD2peymLRAR8nXx7rxyHoJqIkfQ1+TstQthZ56mRCZ9BQTT+slxB9DzT9NnHO//D+Rg/RyuA==
X-Received: by 2002:a17:906:b108:b0:843:a9fe:f115 with SMTP id u8-20020a170906b10800b00843a9fef115mr46900892ejy.32.1672935722636;
        Thu, 05 Jan 2023 08:22:02 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id r18-20020a170906549200b007c0b28b85c5sm16503224ejo.138.2023.01.05.08.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 08:22:01 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Maxime Ripard <mripard@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 4/4] riscv: dts: allwinner: d1: Add video engine node
Date: Thu, 05 Jan 2023 17:21:58 +0100
Message-ID: <4767366.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <3b6ec431-70ac-cf68-6f46-9dc0affb1e68@sholland.org>
References:
 <20221231164628.19688-1-samuel@sholland.org> <Y7aiZdjI8L5h1Ca3@aptenodytes>
 <3b6ec431-70ac-cf68-6f46-9dc0affb1e68@sholland.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 05. januar 2023 ob 15:38:36 CET je Samuel Holland napisal=
(a):
> Hi Paul,
>=20
> On 1/5/23 04:11, Paul Kocialkowski wrote:
> > On Sat 31 Dec 22, 10:46, Samuel Holland wrote:
> >> D1 contains a video engine which is supported by the Cedrus driver.
> >=20
> > Does it work "outside the box" without power domain management?
> > If not, it might be a bit confusing to add the node at this point.
>=20
> Yes, it does. All of the power domains are enabled by default. However,
> if the PPU series is merged first, I will respin this to include the
> power-domains property from the beginning.

I would rather see that merged before and having complete node right away.

I've been away, but I'll merge everything that's ready for sunxi tree until=
=20
end of the weekend.

Best regards,
Jernej

>=20
> Regards,
> Samuel
>=20
> >> Signed-off-by: Samuel Holland <samuel@sholland.org>
> >> ---
> >>=20
> >>  arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 11 +++++++++++
> >>  1 file changed, 11 insertions(+)
> >>=20
> >> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> >> b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi index
> >> dff363a3c934..4bd374279155 100644
> >> --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> >> +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> >> @@ -34,6 +34,17 @@ soc {
> >>=20
> >>  		#address-cells =3D <1>;
> >>  		#size-cells =3D <1>;
> >>=20
> >> +		ve: video-codec@1c0e000 {
> >> +			compatible =3D "allwinner,sun20i-d1-video-
engine";
> >> +			reg =3D <0x1c0e000 0x2000>;
> >> +			interrupts =3D <SOC_PERIPHERAL_IRQ(66)=20
IRQ_TYPE_LEVEL_HIGH>;
> >> +			clocks =3D <&ccu CLK_BUS_VE>,
> >> +				 <&ccu CLK_VE>,
> >> +				 <&ccu CLK_MBUS_VE>;
> >> +			clock-names =3D "ahb", "mod", "ram";
> >> +			resets =3D <&ccu RST_BUS_VE>;
> >> +		};
> >> +
> >>=20
> >>  		pio: pinctrl@2000000 {
> >>  	=09
> >>  			compatible =3D "allwinner,sun20i-d1-pinctrl";
> >>  			reg =3D <0x2000000 0x800>;




