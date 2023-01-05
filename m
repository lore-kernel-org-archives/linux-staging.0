Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B12AEC5;
	Thu,  5 Jan 2023 10:11:58 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 745C94000D;
	Thu,  5 Jan 2023 10:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672913516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HcbHSpYObowCaPT4UZ67tf0/71I4pFvPVyqK6Lz3L44=;
	b=jXzx+L6tMjJ/USRyD6sSJATAagtFUQ4jkgSTOgGoJn4Gwcyvp4mF8bUmipoeszJb48ECR0
	pfK7EITgdG0LtJ+xY9uNyVKlJ6Pz5w1BK6x82rh5BSM7I4dhBROudBF6FEbt2VZ+nnkohR
	+1b4RgGssBKe9cfJAq33LDfZm6FKRS45r2s9/SKq+9aSKhpr9HnHZu6vYRgRAJCJ/5fR0d
	N7aJu9yYvUsLYHXHIo9FhEmlkCLgP5PjGMlwA+cJKBIfvUb2SMV3ItTV6vXXBp8l51zWEx
	QL5m4YB0sWbk1uIFDlePYihSEAp83TsknTSdEX9BgQwlFfbrMEgFn7GkAQggyA==
Date: Thu, 5 Jan 2023 11:11:49 +0100
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 4/4] riscv: dts: allwinner: d1: Add video engine node
Message-ID: <Y7aiZdjI8L5h1Ca3@aptenodytes>
References: <20221231164628.19688-1-samuel@sholland.org>
 <20221231164628.19688-5-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uvNAlR/ImeHHAZfH"
Content-Disposition: inline
In-Reply-To: <20221231164628.19688-5-samuel@sholland.org>


--uvNAlR/ImeHHAZfH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Samuel,

On Sat 31 Dec 22, 10:46, Samuel Holland wrote:
> D1 contains a video engine which is supported by the Cedrus driver.

Does it work "outside the box" without power domain management?
If not, it might be a bit confusing to add the node at this point.

Cheers,

Paul
=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>=20
>  arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/ris=
cv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> index dff363a3c934..4bd374279155 100644
> --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> @@ -34,6 +34,17 @@ soc {
>  		#address-cells =3D <1>;
>  		#size-cells =3D <1>;
> =20
> +		ve: video-codec@1c0e000 {
> +			compatible =3D "allwinner,sun20i-d1-video-engine";
> +			reg =3D <0x1c0e000 0x2000>;
> +			interrupts =3D <SOC_PERIPHERAL_IRQ(66) IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_VE>,
> +				 <&ccu CLK_VE>,
> +				 <&ccu CLK_MBUS_VE>;
> +			clock-names =3D "ahb", "mod", "ram";
> +			resets =3D <&ccu RST_BUS_VE>;
> +		};
> +
>  		pio: pinctrl@2000000 {
>  			compatible =3D "allwinner,sun20i-d1-pinctrl";
>  			reg =3D <0x2000000 0x800>;
> --=20
> 2.37.4
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--uvNAlR/ImeHHAZfH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmO2omUACgkQ3cLmz3+f
v9HoZQf/dl3gdDFnL9ptToBux9CndvEW3DuATq08dsu8Tuomejp5iBjKgLFwl1qW
B5pIbqJw3GD3OKjU0qHE5Y0bjYg9wWKVQf48VY5tAE5xnM+uae1Rijw64Rvj1ZM0
zjUCHo39JknTfE6kH8lXOkK1oxRfwqHs7oaAps/jZ2CPs/DBOPYhx/OhhvWqfui2
QvZHgD/PqhGuYS9a7+G4mczarvORKkG36ICiHmBh5JxLkpvG/5B+KEH6CE5wyAdt
E846talSC/BKaiMBngOwgQxLCHsVuROOBsxyfhVpgsWmQpyvDLmqLK+Ak0dgKby6
9PH3omA3Vc7/cGWT64Yd1JglMkiD8w==
=EMF0
-----END PGP SIGNATURE-----

--uvNAlR/ImeHHAZfH--
