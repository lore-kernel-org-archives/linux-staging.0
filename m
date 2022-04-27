Received: from m228-13.mailgun.net (m228-13.mailgun.net [159.135.228.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D9A7F5
	for <linux-staging@lists.linux.dev>; Wed, 27 Apr 2022 12:18:59 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=codeagain.dev; q=dns/txt;
 s=smtp; t=1651061939; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Subject: Cc: To: To: From: From: Date:
 Sender: Sender; bh=lDHZNe0nT4irW3eTAgNGDWgdYeKIe/kVZL3tOBWwFRU=; b=i0Lu8tBOiFAEOhfOz+FIPH3d20HoDheJXWHDjKtTnwKjBtt87N5TrdfqHud+Ih7RVfnxlP1v
 6HuaQ6VGuRcME+joZ3/0tLI/cPp0qyw4yJ7inS/jegNu5Eq35kve6B/UC0T5NY+eavLV8Cqg
 bxrq9mGY0uwDDh88oMt6i5XilOwZ60UjWt3Gzp1F4wmaeR9YKDTrl6Hqfl/HJjXD4xWyCGXV
 yNr2xkKa5b7FhTTDECkRPiuPz7TeL7A99gSdeGS7oEVOwS5McmhcVpQlBUUkvZXOJc6R7avM
 6vjlFw32sizLISIiCtybRlXgIN6e5IEFDR4UeblhVReYd+MWQTtl/g==
X-Mailgun-Sending-Ip: 159.135.228.13
X-Mailgun-Sid: WyI4MTlhZCIsICJsaW51eC1zdGFnaW5nQGxpc3RzLmxpbnV4LmRldiIsICJiZTljNmQiXQ==
Received: from AN5Bruno (dynamic-user.170.84.57.140.mhnet.com.br
 [170.84.57.140]) by smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 626934b2e2ec060808280995 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Wed, 27 Apr 2022 12:18:58 GMT
Sender: codeagain@codeagain.dev
Date: Wed, 27 Apr 2022 09:18:51 -0300
From: Bruno Moreira-Guedes <codeagain@codeagain.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Bruno's Patch Watchbox <patch-reply@codeagain.dev>
Subject: Re: [PATCH v3 0/3] staging: vme: Cleanup driver tree old structures
Message-ID: <20220427121851.4e2rjbbabw5sh3lk@AN5Bruno>
References: <cover.1650321310.git.codeagain@codeagain.dev>
 <YmA4QIRfx2QPhEJi@kroah.com>
 <3e91b72a86294b542acf460657d0fd94adeb252e.camel@welchs.me.uk>
 <YmJNqMjXEc4KGrJ8@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ozx2ugy2xoiesmr2"
Content-Disposition: inline
In-Reply-To: <YmJNqMjXEc4KGrJ8@kroah.com>


--ozx2ugy2xoiesmr2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Apr 22, 2022 at 08:39:36AM +0200, Greg Kroah-Hartman wrote:
> On Thu, Apr 21, 2022 at 08:16:05PM +0100, Martyn Welch wrote:
> > On Wed, 2022-04-20 at 18:43 +0200, Greg Kroah-Hartman wrote:
> > > On Mon, Apr 18, 2022 at 08:29:49PM -0300, Bruno Moreira-Guedes wrote:
> > > > This patch series modify the vme_user driver's place in
> > > > menuconfig (1/3), fixes a missing `depends on` line in a Kconfig
> > > > file
> > > > (2/3), and rearrages the directory tree for the driver allowing a
> > > > more
> > > > straightforward comprehension of its contents (3/3).
> > > >=20
> > > > The 'vme_user/' driver is the only remaining vme-family driver in
> > > > the
> > > > 'staging/' tree, but its structure, entry in menuconfig and
> > > > building
> > > > routines are still attached to the 'vme/' subtree now outside
> > > > 'staging/'. The present patchset fixes it.
> > > >=20
> > > > Signed-off-by: Bruno Moreira-Guedes <codeagain@codeagain.dev>
> > >=20
> > > What about deleting the vme drivers entirely?
> >=20
> > I assume you're suggesting deleting the "vme_user" driver from the
> > staging directory?
>=20
> Yes, at the very least given that no one has tried to fix it up and get
> it out of staging in many years.

While I cannot comment anything on that regard, I imagine the v4 I sent
a couple of days ago will wait for that decision, right?

Should I prepare a patch removing them and also submit so when it's
decided you can just pick one patch or the other?

>=20
> > > Martyn, anyone still using these?
> > >=20
> >=20
> > I'm fairly sure that the actual VME drivers for the hardware bridges
> > (the bits not in staging) are still being used based on the
> > conversations I've had today. I'm just trying to find out whether the
> > vme_user bit is actively being used.
>=20
> If the non-staging vme drivers are still being used, that's great.  But
> if not, those too should be dropped.
>=20
> thanks,
>=20
> greg k-h

--ozx2ugy2xoiesmr2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQTUrsHCxGmQ5vyKRAZtd3tyEY2kgUCYmk0qwAKCRAZtd3tyEY2
kpwYAQCrlryNZKRr4pjYMNYiw16wCWeN/FdxcwJ91tpjk1knhQD/USmN0/PzLk72
ZMTB2vAScMsQQzm7elD4Ag3eBLrmqQU=
=RKaF
-----END PGP SIGNATURE-----

--ozx2ugy2xoiesmr2--
