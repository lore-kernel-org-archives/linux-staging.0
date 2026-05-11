Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9FA33F5BA;
	Mon, 11 May 2026 16:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778516325; cv=none; b=ixakSLKZCKBi08VzRbW1kLkEf7J9ctEs6xkaRr5SkJG4vNjzyT7P6B9XPvlgm8WhmFLkAAslMmks43X1kPKGKTt76C+6BqUwNdN/YNgfRWMLYRx2dSLdxreHNOsGkIr9tOsIy8qUc0AYYRjVyUu3GtvtBH0naCez/Y0BUrVHavs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778516325; c=relaxed/simple;
	bh=k4lJJrUTUHcwl0bF97Q2A6/DUefG/qcFjWHTtaPP050=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AhcYrqkGZdaOOndECKsS52Jo9n2Jv2xB6epOe1fH512whieJP8kYX+18odSj8DbXpNYo51qN+/A97zxKsvOsoGyIN0JRDC95u8/dTFqpLXyRnoegvqSK3lqlCrkdvPyZP8hKb+I/xzzT59iWqxC6RW75dWQHOr+GMWurQhQ1m9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qmVKsfIT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qmVKsfIT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AB7EC2BCB0;
	Mon, 11 May 2026 16:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778516325;
	bh=k4lJJrUTUHcwl0bF97Q2A6/DUefG/qcFjWHTtaPP050=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qmVKsfITSG1PvvHIjIhP5AKqUoSQh2upnGxwNnHDWjewDie3LU1WZeGQ0k4Chh4TD
	 E4r+gBJw8hj4UeZa/pMlX5w+53i1z1jSMlryrGCN+HO0bdn8kauKXBWfMbR/Pr5HtM
	 85bAHl9Y47hprLp0zUeAQHFrsynGJIXLyyVAFlEwGLZko29/X8laWcRJ+N1zh41GxI
	 uFwSmfjrb93NCEW/aQijHx7UJ1VKBpg0QehNsdAkjgFjXcUKELf2jcu57t8ZlCSmXj
	 jM2RpRwmI9SicsNHoCyHGqB+P9vCKTMpDBx7CeGwK6Gd/cNbEUSWJenVLlC8wpxkZ6
	 9P2YKfK3R0mPQ==
Date: Mon, 11 May 2026 17:18:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Pramod Maurya <pramod.nexgen@gmail.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, jacobsfeder@gmail.com,
	devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: misc: Add binding for Xilinx AXI-Stream
 FIFO
Message-ID: <20260511-countless-babied-4177a86549ed@spud>
References: <20260510084458.73685-1-pramod.nexgen@gmail.com>
 <2026051050-marathon-fragrant-edbf@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fwrY/w/smGpCkISn"
Content-Disposition: inline
In-Reply-To: <2026051050-marathon-fragrant-edbf@gregkh>


--fwrY/w/smGpCkISn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 10, 2026 at 06:07:01PM +0200, Greg KH wrote:
> On Sun, May 10, 2026 at 04:44:57AM -0400, Pramod Maurya wrote:
> > Add a YAML schema for the Xilinx AXI-Stream FIFO IP core (PG080).
> > The binding documents the three supported compatible strings and all
> > vendor-specific properties that the axis-fifo driver reads from the
> > device tree.
> >=20
> > This resolves the following checkpatch.pl warnings in
> > drivers/staging/axis-fifo/axis-fifo.c:
> >   WARNING: DT compatible string "xlnx,axi-fifo-mm-s-4.1" appears un-doc=
umented
> >   WARNING: DT compatible string "xlnx,axi-fifo-mm-s-4.2" appears un-doc=
umented
> >   WARNING: DT compatible string "xlnx,axi-fifo-mm-s-4.3" appears un-doc=
umented
> >=20
> > Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
> > ---
> > Changes in v2:
> > - Delete drivers/staging/axis-fifo/axis-fifo.txt as part of the
> >   conversion (was missing from v1)
> > - Add all Vivado-generated properties to the schema so that real
> >   hardware DT nodes pass validation with additionalProperties: false
> > - Update example to match a realistic Vivado-generated DT node
> >   including all properties
> >=20
> >  .../bindings/misc/xlnx,axi-fifo-mm-s.yaml     | 265 ++++++++++++++++++
> >  MAINTAINERS                                   |   6 +
> >  drivers/staging/axis-fifo/axis-fifo.txt       |  96 -------
> >  3 files changed, 271 insertions(+), 96 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/misc/xlnx,axi-fif=
o-mm-s.yaml
>=20
> No, staging drivers need to be self-contained.  When/if the axis-fifo
> driver moves out of drivers/staging/ this can happen, but not until
> then.
>=20
> You can convert this to yaml in-place if you want, AND you can test that
> the conversion is correct.  Do you have this hardware to test this with?

Copy-pasting from v1...
| Someone else submitted this conversion (which it is, despite you not
| removing the old file), and the commentary I provided for that patch
| applies here too:
| https://lore.kernel.org/all/20260227-unboxed-customary-7ce6eda1858c@spud/

I suspect that this could be a dma-engine and any patch doing a
conversion needs to justify why it is not.
pw-bot: changes-requested

--fwrY/w/smGpCkISn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagIBYQAKCRB4tDGHoIJi
0sGUAP9oOwdhOIuGN6Jt/OAlzuMkYVCgQ+Swewo9n186/wzbeQD/QC7NSPCJVGm1
K0HBqtCMARvs0FAzJmhbjW0OCcIDlAQ=
=eY+A
-----END PGP SIGNATURE-----

--fwrY/w/smGpCkISn--
