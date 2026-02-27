Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7D03803EF;
	Fri, 27 Feb 2026 18:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772216956; cv=none; b=dk9qAH8SPCCfmxLTtjt4QAKRUVz/Qt8n8FKn0zErMohReyCCJUlK114tn72ZrkMl/QK4r8xtMFSIaX1ly2LyQnQvJO9JsbEMq2mX5+GEfmEZLLy4dN2Eryk18l4gpa3McveySj+YOV2geFZyLuk92P3ZqEIJ81prIX0tpIxrQRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772216956; c=relaxed/simple;
	bh=UDcdDtvGVM2+ziJ9gB6UdJr0vZj9CBy8RW0MYEhY38c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ukbsZnLogbcOpn7DvtnLhjfObZb3pw4QRIqBuLtMKFA2k6aNfYsUa7iEBdPo5rom2w+2Vex2Kbv4LJsO94j0ZYqaemW87iqK9P++0UbhCwZGI+FXwHJoY9Qvcnq4CaNE0KsckASJGFaUoRx13jF7d+9/M8pxAKGr7+VJnOMSw3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XEl2R8lt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XEl2R8lt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B24ACC116C6;
	Fri, 27 Feb 2026 18:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772216955;
	bh=UDcdDtvGVM2+ziJ9gB6UdJr0vZj9CBy8RW0MYEhY38c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XEl2R8ltoQk9TOZ54Q7PYWabl4GOuAEYMFmW4LArJz4EgNxERM//8EibonCvta7pI
	 OPweOkY830+zGFbx2kOKqlmOGCvipKy7baf0+CN5W356HSmeMBow93z560B8zPB9ft
	 YkKgzFRkskcmmyQi6owqwcmK4AnuM9X+pGaBYyQSZsL6TDlCQzElRqWeExdBX3+nTF
	 qoMbHGORXVwb4ZWMtH/qa9n0m/rwQfSJVs2E689I3Ny4vwMW1vjB/gBHLcoaJH0Tdt
	 b+i74pPwUwZIh1WUPztPinNuDp6LyWoSa/WpuQxYidMWvuE+KNNEBrjmzcppDho7Tl
	 g/TxnjJv2X7Cg==
Date: Fri, 27 Feb 2026 18:29:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Lucas Faria Mendes <lucas.fariamo08@gmail.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ovidiu.panait.oss@gmail.com,
	devicetree@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 2/3] dt-bindings: misc: xlnx,axi-fifo-mm-s: convert to
 json-schema
Message-ID: <20260227-statue-sliced-5e287015b0ce@spud>
References: <20260227-unboxed-customary-7ce6eda1858c@spud>
 <20260227181051.36207-1-lucas.fariamo08@gmail.com>
 <20260227181051.36207-3-lucas.fariamo08@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zrcZGmYn1pzvRmRx"
Content-Disposition: inline
In-Reply-To: <20260227181051.36207-3-lucas.fariamo08@gmail.com>


--zrcZGmYn1pzvRmRx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 03:10:44PM -0300, Lucas Faria Mendes wrote:
> ---

You've resent here far too quickly chief, without a commit message and
with half of my comments unimplemented or not responded to.

Please take the time to read through my earlier review and complete the
discussion there before sending a new version.

Additionally, please do not send new versions as a reply to an old one.

Cheers,
Conor.

>  .../bindings/misc/xlnx,axi-fifo-mm-s.yaml     | 91 ++++++++++++++++++
>  drivers/staging/axis-fifo/axis-fifo.txt       | 96 -------------------
>  2 files changed, 91 insertions(+), 96 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/misc/xlnx,axi-fifo-=
mm-s.yaml
>  delete mode 100644 drivers/staging/axis-fifo/axis-fifo.txt
>=20
> diff --git a/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.ya=
ml b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
> new file mode 100644
> index 000000000000..967d681f3980
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/misc/xlnx,axi-fifo-mm-s.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Xilinx AXI-Stream FIFO IP core
> +
> +maintainers:
> +  - Jacob Feder <jacobsfeder@gmail.com>
> +
> +description: |
> +  The Xilinx AXI-Stream FIFO IP core has read and write AXI-Stream FIFOs,
> +  the contents of which can be accessed from the AXI4 memory-mapped inte=
rface.
> +  This is useful for transferring data from a processor into the FPGA fa=
bric.
> +
> +  See Xilinx PG080 document for IP details.
> +
> +  Currently supports only store-forward mode with a 32-bit AXI4-Lite
> +  interface.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - xlnx,axi-fifo-mm-s-4.1
> +      - xlnx,axi-fifo-mm-s-4.2
> +      - xlnx,axi-fifo-mm-s-4.3
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-names:
> +    items:
> +      - const: interrupt
> +
> +  xlnx,axi-str-rxd-tdata-width:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      AXI-Stream RX data width in bits. Only 32-bit is supported.
> +
> +  xlnx,axi-str-txd-tdata-width:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      AXI-Stream TX data width in bits. Only 32-bit is supported.
> +
> +  xlnx,rx-fifo-depth:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Depth of RX FIFO in words.
> +
> +  xlnx,tx-fifo-depth:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Depth of TX FIFO in words.
> +
> +  xlnx,use-rx-data:
> +    type: boolean
> +    description: RX FIFO is enabled.
> +
> +  xlnx,use-tx-data:
> +    type: boolean
> +    description: TX FIFO is enabled.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - xlnx,axi-str-rxd-tdata-width
> +  - xlnx,axi-str-txd-tdata-width
> +  - xlnx,rx-fifo-depth
> +  - xlnx,tx-fifo-depth
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dma-controller@43c00000 {
> +        compatible =3D "xlnx,axi-fifo-mm-s-4.1";
> +        reg =3D <0x43c00000 0x10000>;
> +        interrupt-names =3D "interrupt";
> +        interrupt-parent =3D <&intc>;
> +        interrupts =3D <0 29 4>;
> +        xlnx,axi-str-rxd-tdata-width =3D <32>;
> +        xlnx,axi-str-txd-tdata-width =3D <32>;
> +        xlnx,rx-fifo-depth =3D <512>;
> +        xlnx,tx-fifo-depth =3D <32768>;
> +        xlnx,use-tx-data;
> +    };
> diff --git a/drivers/staging/axis-fifo/axis-fifo.txt b/drivers/staging/ax=
is-fifo/axis-fifo.txt
> deleted file mode 100644
> index 413b81a53202..000000000000
> --- a/drivers/staging/axis-fifo/axis-fifo.txt
> +++ /dev/null
> @@ -1,96 +0,0 @@
> -Xilinx AXI-Stream FIFO v4.1 IP core
> -
> -This IP core has read and write AXI-Stream FIFOs, the contents of which =
can
> -be accessed from the AXI4 memory-mapped interface. This is useful for
> -transferring data from a processor into the FPGA fabric. The driver crea=
tes
> -a character device that can be read/written to with standard
> -open/read/write/close.
> -
> -See Xilinx PG080 document for IP details.
> -
> -Currently supports only store-forward mode with a 32-bit
> -AXI4-Lite interface. DOES NOT support:
> -	- cut-through mode
> -	- AXI4 (non-lite)
> -
> -Required properties:
> -- compatible: Should be one of:
> -    "xlnx,axi-fifo-mm-s-4.1"
> -    "xlnx,axi-fifo-mm-s-4.2"
> -    "xlnx,axi-fifo-mm-s-4.3"
> -- interrupt-names: Should be "interrupt"
> -- interrupt-parent: Should be <&intc>
> -- interrupts: Should contain interrupts lines.
> -- reg: Should contain registers location and length.
> -- xlnx,axi-str-rxd-protocol: Should be "XIL_AXI_STREAM_ETH_DATA"
> -- xlnx,axi-str-rxd-tdata-width: Should be <0x20>
> -- xlnx,axi-str-txc-protocol: Should be "XIL_AXI_STREAM_ETH_CTRL"
> -- xlnx,axi-str-txc-tdata-width: Should be <0x20>
> -- xlnx,axi-str-txd-protocol: Should be "XIL_AXI_STREAM_ETH_DATA"
> -- xlnx,axi-str-txd-tdata-width: Should be <0x20>
> -- xlnx,axis-tdest-width: AXI-Stream TDEST width (ignored by the driver)
> -- xlnx,axis-tid-width: AXI-Stream TID width (ignored by the driver)
> -- xlnx,axis-tuser-width: AXI-Stream TUSER width (ignored by the driver)
> -- xlnx,data-interface-type: Should be <0x0> (ignored by the driver)
> -- xlnx,has-axis-tdest: Should be <0x0> (this feature isn't supported)
> -- xlnx,has-axis-tid: Should be <0x0> (this feature isn't supported)
> -- xlnx,has-axis-tkeep: Should be <0x0> (this feature isn't supported)
> -- xlnx,has-axis-tstrb: Should be <0x0> (this feature isn't supported)
> -- xlnx,has-axis-tuser: Should be <0x0> (this feature isn't supported)
> -- xlnx,rx-fifo-depth: Depth of RX FIFO in words
> -- xlnx,rx-fifo-pe-threshold: RX programmable empty interrupt threshold
> -	(ignored by the driver)
> -- xlnx,rx-fifo-pf-threshold: RX programmable full interrupt threshold
> -	(ignored by the driver)
> -- xlnx,s-axi-id-width: Should be <0x4> (ignored by the driver)
> -- xlnx,s-axi4-data-width: Should be <0x20> (ignored by the driver)
> -- xlnx,select-xpm: Should be <0x0> (ignored by the driver)
> -- xlnx,tx-fifo-depth: Depth of TX FIFO in words
> -- xlnx,tx-fifo-pe-threshold: TX programmable empty interrupt threshold
> -	(ignored by the driver)
> -- xlnx,tx-fifo-pf-threshold: TX programmable full interrupt threshold
> -	(ignored by the driver)
> -- xlnx,use-rx-cut-through: Should be <0x0> (this feature isn't supported)
> -- xlnx,use-rx-data: <0x1> if RX FIFO is enabled, <0x0> otherwise
> -- xlnx,use-tx-ctrl: Should be <0x0> (this feature isn't supported)
> -- xlnx,use-tx-cut-through: Should be <0x0> (this feature isn't supported)
> -- xlnx,use-tx-data: <0x1> if TX FIFO is enabled, <0x0> otherwise
> -
> -Example:
> -
> -axi_fifo_mm_s_0: axi_fifo_mm_s@43c00000 {
> -	compatible =3D "xlnx,axi-fifo-mm-s-4.1";
> -	interrupt-names =3D "interrupt";
> -	interrupt-parent =3D <&intc>;
> -	interrupts =3D <0 29 4>;
> -	reg =3D <0x43c00000 0x10000>;
> -	xlnx,axi-str-rxd-protocol =3D "XIL_AXI_STREAM_ETH_DATA";
> -	xlnx,axi-str-rxd-tdata-width =3D <0x20>;
> -	xlnx,axi-str-txc-protocol =3D "XIL_AXI_STREAM_ETH_CTRL";
> -	xlnx,axi-str-txc-tdata-width =3D <0x20>;
> -	xlnx,axi-str-txd-protocol =3D "XIL_AXI_STREAM_ETH_DATA";
> -	xlnx,axi-str-txd-tdata-width =3D <0x20>;
> -	xlnx,axis-tdest-width =3D <0x4>;
> -	xlnx,axis-tid-width =3D <0x4>;
> -	xlnx,axis-tuser-width =3D <0x4>;
> -	xlnx,data-interface-type =3D <0x0>;
> -	xlnx,has-axis-tdest =3D <0x0>;
> -	xlnx,has-axis-tid =3D <0x0>;
> -	xlnx,has-axis-tkeep =3D <0x0>;
> -	xlnx,has-axis-tstrb =3D <0x0>;
> -	xlnx,has-axis-tuser =3D <0x0>;
> -	xlnx,rx-fifo-depth =3D <0x200>;
> -	xlnx,rx-fifo-pe-threshold =3D <0x2>;
> -	xlnx,rx-fifo-pf-threshold =3D <0x1fb>;
> -	xlnx,s-axi-id-width =3D <0x4>;
> -	xlnx,s-axi4-data-width =3D <0x20>;
> -	xlnx,select-xpm =3D <0x0>;
> -	xlnx,tx-fifo-depth =3D <0x8000>;
> -	xlnx,tx-fifo-pe-threshold =3D <0x200>;
> -	xlnx,tx-fifo-pf-threshold =3D <0x7ffb>;
> -	xlnx,use-rx-cut-through =3D <0x0>;
> -	xlnx,use-rx-data =3D <0x0>;
> -	xlnx,use-tx-ctrl =3D <0x0>;
> -	xlnx,use-tx-cut-through =3D <0x0>;
> -	xlnx,use-tx-data =3D <0x1>;
> -};
> --=20
> 2.53.0
>=20

--zrcZGmYn1pzvRmRx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaHidwAKCRB4tDGHoIJi
0lu0AQCd4YP61TldSUSJIWKW5IkrnaZw4mnQPi6MsZzN6Q+58wEA6/TMAQgVME6R
4qa+88tAN7yrXTmRGNCqHbmD0GSoFws=
=V7lp
-----END PGP SIGNATURE-----

--zrcZGmYn1pzvRmRx--
