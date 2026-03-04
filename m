Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B952835957;
	Wed,  4 Mar 2026 14:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772634178; cv=none; b=p/QsLNQSN2Txefwqah+PcyavegJmcWrvkjEpQSrcdKu9H1B2mZZLr5ROYi8p07MzMKmIbA0sC5gRu7S23QpP2+eSGMq7j6w15WK8iysfXpuNV/pzCc38clxXVbUokGc2E1fOu9bNoUWKHLUWzDYwQItA6i6lS6SQJ/wqBhY0iSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772634178; c=relaxed/simple;
	bh=062hePw29zWwwauxfQEeqKQOzqwtn/nqm4F4fwtRqWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tU3e+IeptLCmR9aVVmHh2QsrXEzH4nNFvUpH8kU9GAhRvHRKNgg1N/2phM3fEiuRg0gL6zP2gPhLx/jpMHKtN7/qidw5T85OmUqekFq6QqmzFb4ZF68ApzttUgcBJcg/zPRTQwCLQxcB5uWElOR8tNp7Ghzncf3dUslL00Hl9/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rVqGFqhz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rVqGFqhz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 808DAC19423;
	Wed,  4 Mar 2026 14:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772634178;
	bh=062hePw29zWwwauxfQEeqKQOzqwtn/nqm4F4fwtRqWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rVqGFqhzypI4wMzzlnG29/QiWzr9weEeWh5+6bTDrLR3lqEtNActaCr9HFB5e6uMf
	 EaNBQRW/7iPTPKCDtahh620D6Y3mFPr7kcKxNsAfQlvZ2n6mPkS1cjts+Y6veu3xa+
	 lemfLysxAYFW1FgHabPB5vBktgefeXfmjcH4uAykEmFZAjVQ/UQZVkpi5YpU3VP6Et
	 gPgJB7SkvgofBadtPLKm0ovV2kjSXrnpqaORWOLykwHGbQSSCxQU+bOCJ7cMATZuVM
	 8XH+geF70m1D/pU9sk/s86ZsYeFeTIGAM2C/Tl1J/8korAIYCrvWzxqwEAeWiF4RJz
	 cuPCGdMr6fYcw==
Date: Wed, 4 Mar 2026 14:22:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Alexandru Hossu <hossu.alexandru@gmail.com>, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] dt-bindings: misc: xlnx,axi-fifo-mm-s: fix
 interrupt-parent property
Message-ID: <20260304-premises-brunch-26faa087389a@spud>
References: <e6f8db4d-2a5a-4424-b44d-6416ee0c5ca0@kernel.org>
 <20260304131610.37503-1-hossu.alexandru@gmail.com>
 <2026030429-kick-anemic-f48f@gregkh>
 <6C6F8C62-19C5-48D8-9F80-47153B44DC6A@kernel.org>
 <9d57af5e-ac23-4679-9719-6505dd851a2e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Qod8k0j7dQ8bWRCw"
Content-Disposition: inline
In-Reply-To: <9d57af5e-ac23-4679-9719-6505dd851a2e@kernel.org>


--Qod8k0j7dQ8bWRCw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 04, 2026 at 03:08:46PM +0100, Krzysztof Kozlowski wrote:
> On 04/03/2026 14:29, Conor Dooley wrote:
> >=20
> >=20
> > On 4 March 2026 13:22:48 GMT, Greg KH <gregkh@linuxfoundation.org> wrot=
e:
> >> On Wed, Mar 04, 2026 at 02:16:10PM +0100, Alexandru Hossu wrote:
> >>> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> >>
> >> For obvious reasons, we can't take patches without any changelog text,
> >> nor would you want us to.
> >=20
> > This is also a second person working on this conversation.
>=20
> I see, so that's a patch for something which does not exist yet (not
> merged).

This is the usual "two people working independently", except
Alexandru's "v2" is actually not a v2 but rather a patch on top of his
own v1. Ditto with his v3. It's not a patch on top of the other guy.

>=20
> > I left commentary on the other version of it.
> > I am fairly confident that converting this binding is almost useless wi=
thout evaluating whether this should become a dma engine.
> > I'm almost certain my employer has something very similar, based on nam=
ing and use case, and I saw no reason why it could not be a dma engine.
> > Any as-is conversation of this should, IMO, come with an evaluation of =
why this is the correct way to model it.
> > I don't think it's suitable for any sort of "internship" program that s=
ees binding conversations as low hanging fruit.

Whoops, my bad on the long lines, sent it from my phone..

> Do you suspect another round of some GSoC or LFX mentorship?

Yeah, that is my suspicion. Lucas (the other submitter) also displayed
lack of familiarity with the process, but that may just be happenstance.
Plenty of binding conversions I am sure are suitable for some sort of

"internship", but probably not ones in staging, since they probably need
to come with an evaluation of whether things are currently correct and
maybe with driver changes that really require having the hardware.

This is probably one of the few cases where what's in staging is a bad
candidate to work on, and things outside of staging that have a fixed
ABI are much easier to convert.

If this is some sort of "internship", probably the guidance on what to
do should not include binding conversions without oversight from the
mentor.

--Qod8k0j7dQ8bWRCw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaahAEwAKCRB4tDGHoIJi
0nN4APsHTLgsJ+WM95qfeQkv8jUQ9GaZUMqZFhuRIvIc67GQZAEA0yH+ay+Zuadp
N1iPsKKe4eLsgyEGQMyCwo9BQbmoJAo=
=4FiI
-----END PGP SIGNATURE-----

--Qod8k0j7dQ8bWRCw--
