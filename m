Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D242B30C35F;
	Tue,  5 May 2026 20:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778013333; cv=none; b=bxVP7iFTBq/XL6vf2hApTouWJVv4OR3Juh6RHnUdD9LilZ2F0AByJO+lOXr6/1nUco9XgH5Ob6dZWNNwkGcnE8FYtr9VEpSadk6JUS3zurh9nIqM2bZJH2ifFD8fOv7eOPWnH7p2TIdDktRMNxsXwE+QANGhCqE0DHT4f7AZtrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778013333; c=relaxed/simple;
	bh=UXC9+hPU2ndmcK4oDF3blwKtby0Kh/UxqWZqMo0pXNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hg+VZBtKa/jVGqlvkVOk7jxIS5ggCfPe+m9ajjudZotEnZNCbAH4qZNU+0RfMEm/0v87GnzBO1GAdLc3zBDEXmgvJfJpiV9UmFjMBMd6TUSLpmThErsuE3Yw3yDtUDaqIqH/vLPjtZ8IrfEfhlyUzcB5IkX/RJOUElWj3LvoMys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id E87D01F8004F;
	Tue,  5 May 2026 20:35:27 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 68C00B4058E; Tue,  5 May 2026 20:35:26 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 2A1DAB4058A;
	Tue,  5 May 2026 20:35:25 +0000 (UTC)
Date: Tue, 5 May 2026 22:35:22 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] arm64: dts: allwinner: sun50i-h6: Add missing SRAM
 region for video engine
Message-ID: <afpUiupOgPhLksM8@shepard>
References: <20260505134812.408316-1-wens@kernel.org>
 <20260505134812.408316-6-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FpfFtflQBQQ4ZJAp"
Content-Disposition: inline
In-Reply-To: <20260505134812.408316-6-wens@kernel.org>


--FpfFtflQBQQ4ZJAp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

On Tue 05 May 26, 21:48, Chen-Yu Tsai wrote:
> The SRAM C region contains a partial alias to the VE SRAM already
> referenced by the video engine. To avoid access through this alias
> window, the region should also be claimed by the video engine.
>=20
> Add a reference to the SRAM C region to the video engine node.

It feels very weird to have a reference to the DE2 SRAM region in the
VE node. It seems unlikely that the same region would be used by both DE2 a=
nd
VE and I am pretty sure can have both running at the same time without
overstepping.

=46rom what I can see we have so far assumed that the SRAM C and SRAM C1
are two different physical SRAM areas, but this is most likely not the case.
My guess would be that SRAM C1 is actually a part of SRAM C and the DE2 is
using another part of it. The syscon block probably allows switching access
to these different parts of SRAM C.

Also the sram_c1 node implies it's 2 MiB, which sounds quite unlikely.

All the best,

Paul

>=20
> Fixes: b542570e5605 ("arm64: dts: allwinner: h6: Add Video Engine node")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/bo=
ot/dts/allwinner/sun50i-h6.dtsi
> index 72ce1a75647b..88c6e3e105c0 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> @@ -205,7 +205,7 @@ video-codec@1c0e000 {
>  			clock-names =3D "ahb", "mod", "ram";
>  			resets =3D <&ccu RST_BUS_VE>;
>  			interrupts =3D <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
> -			allwinner,sram =3D <&ve_sram 1>;
> +			allwinner,sram =3D <&ve_sram 1>, <&de2_sram 1>;
>  			iommus =3D <&iommu 3>;
>  		};
> =20
> --=20
> 2.47.3
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--FpfFtflQBQQ4ZJAp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmn6VIoACgkQhP3B6o/u
lQz8VBAAkfyeAYZhinUwpsJmf+oDlItFt7Lfusv+8SkH/qZnD6zCrAQk/Geol1rW
wZlYqRlWIV1tboLHrW+hgJmK43/FRZ8zoXdUVBTmn1qlfDX0VtLF2DvHC+uaufyF
4DTP/NfJmIdPOIltCC3FEYzt78hqUzYwwEnsyR+uZ0kPKS8dQyvBoS24LOwnF70g
huYXW9SWc+458Sjd+NVae7vJneQsx8xrtafjkfPP5Zx2PdYmMTsGPxuBNgLa2CiA
TvtW1mzJtP2egSTdCfzIJRVCdQ6w9/lYvQoFQfz7U+L+MwpB8U7g3yU7sbIEEBwz
1RzbbYTvHm68D95/Qb4wkxEPXPw/HTD5Hy3iHdw6JLz3VOXvvQapTbOQqADL7SqD
6HE8NxgGcLLVMO6P3Na0l+nu6AyuXnou5x99ukr1lQYNAVeUCcq4CpN6GV9/Tgq+
5ZcTzVFJqD2RJfdPbuljaRgWU5i7fUk1QX0QiNmW+m84Kg5e+wkzf/TB1E5JmypQ
w4d8oYb059s57puI8NZgwHnyhoLu3HB/NhjboHLcuwzcbgY6PMq68lqazv6qNY/p
bvQU0TQ/2HwBmCtQT7dIn1ShT5xfo0cu3qpl0bHH9iKBcnXCjdGGqmrNliwBIhta
5rW/eK5LQyKRXSSg3mKHjITNERBpiraMB65z3LMKUrE/UHivWxA=
=03GE
-----END PGP SIGNATURE-----

--FpfFtflQBQQ4ZJAp--
