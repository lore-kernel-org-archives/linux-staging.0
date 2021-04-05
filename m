Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA65F259E
	for <linux-staging@lists.linux.dev>; Mon,  5 Apr 2021 08:33:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A1691B135;
	Mon,  5 Apr 2021 08:13:45 +0000 (UTC)
Message-ID: <6ae5042643d3d079e3b0bf3c8e07334dd4179d41.camel@suse.de>
Subject: Re: [PATCH] bcm2835-pcm: Allow up to 8 channels and 192kHz data rate
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Stefan Wahren <stefan.wahren@i2se.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.de>
Cc: linux-staging@lists.linux.dev, Dom Cobley <popcornmix@gmail.com>
Date: Mon, 05 Apr 2021 10:13:43 +0200
In-Reply-To: <1617373688-8715-1-git-send-email-stefan.wahren@i2se.com>
References: <1617373688-8715-1-git-send-email-stefan.wahren@i2se.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-luK8/GRMRrlbhUIuRPWH"
User-Agent: Evolution 3.38.4 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-luK8/GRMRrlbhUIuRPWH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2021-04-02 at 16:28 +0200, Stefan Wahren wrote:
> From: Dom Cobley <popcornmix@gmail.com>
>=20
> The firmware driver can support this, so allow it to be selected
> Increase the buffer sizes to handle the higher data rates.
>=20
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>

Thanks!
Nicolas



--=-luK8/GRMRrlbhUIuRPWH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAmBqxrgACgkQlfZmHno8
x/6XMAf9FYZDsU6yJk7SpnEN331sEdsrS+XebxRuEroLpA/ercJh3fh23vo/HLW4
XUyUvnwLoF6ZopjJP1XST99Ksx5Wa0dlcWDnAUadiNlQsMWOT1lZNebEaB/AQxBE
rZXcTwaAQLpLjIASW8zJk/cX6Dvp71bbcTB+6Ci+dcqgsuZ+SMbMHpluuE6DbIDF
/1sYprgxLLwuXtR189SX2gSC8/J913PWHfcvs+lPRAUGB82QWIw878kxvn0iPAVF
aQay98PN72Nj7HgeuOYEecKMQWCMiqipwgFgjAcOwjJNHtS7vaG+Ax6W8r4bIh80
q6toB8/r87PLkyPxOlhK3Dn6k1ZrzA==
=vRms
-----END PGP SIGNATURE-----

--=-luK8/GRMRrlbhUIuRPWH--

