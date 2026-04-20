Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5932345749;
	Mon, 20 Apr 2026 11:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776683777; cv=none; b=O3Eobf8KFEyqMSXNEl/D6EJ9uCdzOkGTpWgS9Bt/Cu286hGB2UZeZA2lMujnc+WVBGnyz13Zn31270oXi4p/QluHuvNx0KAwj5dW98KTN8lsgFIYM63B9ZRuQccUiHAMjPH5PbLobntuqDyNfkInpxDjB8iBu142n6Jr9HA1cz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776683777; c=relaxed/simple;
	bh=E3LCQG8HaN8tXHqYyryawmIyRQGzMvIjy3sviGum+9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JrVIe/2aKV1KzfXuUpYNYnEshoCQmM1XEqwV9LJxhLVmPLXHnMxeVX2M3Nzk+9imeK0xAg/9fuiuY4SJpzE9J5qc71T9wQ+ihazuf9Hd/4YEFtSgNgKTtvSXBpuQOBIxcdiDbYbS7whNqwzlvuPpNBUQ+MJPIRRgtijweyqS4QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RnZtKkde; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RnZtKkde"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63DE8C19425;
	Mon, 20 Apr 2026 11:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776683777;
	bh=E3LCQG8HaN8tXHqYyryawmIyRQGzMvIjy3sviGum+9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RnZtKkde+IXoHiqqdX6/cgZKbjGiMKGRxerrJvhNSsGxdDYfIEG6RPHuMYetJSHRb
	 W8uaiwYAqrE+WUwkvGC4RcGb4PQn3lx3FuM9joCA3MRsMlaLxTKpQKUEdGRUiUTEgE
	 RePj60pzWk1GttZXACRCtiOEDMD0NXKD0wKULeJDzoKinHs0EW68l6NPmzc5jJDB00
	 996ig5yBNJ9U0p0TTT0DeTL+AKUtmlieXoFkG3PRaEV+YWg0d5x93kW+7cdn2DO+b6
	 8xGb5mS8SfLBKnpoh5595gRaMvo+oHLxXZRAbvqrB9bVB5RvKzmMLzeqNe9gCZEPFn
	 G/keq3PM3MLQg==
Date: Mon, 20 Apr 2026 12:16:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/2] media: dt-bindings: Drop starfive,jh7110-camss
 from staging
Message-ID: <20260420-very-cartel-645595ffd1c7@spud>
References: <20260303-drop-starfive-camss-v3-0-8f44c07fb137@ideasonboard.com>
 <20260303-drop-starfive-camss-v3-2-8f44c07fb137@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="90PYsgMjf7E0SKBf"
Content-Disposition: inline
In-Reply-To: <20260303-drop-starfive-camss-v3-2-8f44c07fb137@ideasonboard.com>


--90PYsgMjf7E0SKBf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2026 at 02:54:07PM +0530, Jai Luthra wrote:
> The starfive-camss driver is no longer being worked upon for destaging,
> and will be dropped in a subsequent commit, so drop the DT bindings.
>=20
> Link: https://lore.kernel.org/all/ZQ0PR01MB13024A92926C415C187D2C18F29F2@=
ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn/
> Acked-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>

In removing the binding, you should have also sent patches for removing
the users of this:
arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dtb: /soc/isp@19=
840000: failed to match any schema with compatible: ['starfive,jh7110-camss=
']
arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dtb: /soc/isp@19840000: f=
ailed to match any schema with compatible: ['starfive,jh7110-camss']
arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dtb: /soc/isp@19840000: fail=
ed to match any schema with compatible: ['starfive,jh7110-camss']
arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite.dtb: /soc/is=
p@19840000: failed to match any schema with compatible: ['starfive,jh7110-c=
amss']
arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite-emmc.dtb: /s=
oc/isp@19840000: failed to match any schema with compatible: ['starfive,jh7=
110-camss']
arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-emmc.dtb: /soc/isp@1984000=
0: failed to match any schema with compatible: ['starfive,jh7110-camss']
arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dtb: /soc/i=
sp@19840000: failed to match any schema with compatible: ['starfive,jh7110-=
camss']
arch/riscv/boot/dts/starfive/jh7110-orangepi-rv.dtb: /soc/isp@19840000: fai=
led to match any schema with compatible: ['starfive,jh7110-camss']
arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dtb: /soc/i=
sp@19840000: failed to match any schema with compatible: ['starfive,jh7110-=
camss']
arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dtb: /soc/isp@1984000=
0: failed to match any schema with compatible: ['starfive,jh7110-camss']

--90PYsgMjf7E0SKBf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeYK+wAKCRB4tDGHoIJi
0hIvAP9hKQGG7rJLPjsNy7XSnHE/RaeILkoi5O+cdU4aXry7QgD7BGYtB37H7KRy
ZNbfoktS46J4D4KeEzTXG3pBYxbeAgA=
=wgfX
-----END PGP SIGNATURE-----

--90PYsgMjf7E0SKBf--
