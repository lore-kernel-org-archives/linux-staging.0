Received: from mx01.ayax.eu (mx01.ayax.eu [188.137.98.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394FA7F
	for <linux-staging@lists.linux.dev>; Tue,  2 Aug 2022 14:17:32 +0000 (UTC)
Received: from [192.168.192.146] (port=54948 helo=nx64de-df6d00)
	by mx01.ayax.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <gszymaszek@short.pl>)
	id 1oIsi2-0001xv-0t; Tue, 02 Aug 2022 16:17:22 +0200
Date: Tue, 2 Aug 2022 16:17:20 +0200
From: Grzegorz Szymaszek <gszymaszek@short.pl>
To: Greg KH <greg@kroah.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Grzegorz Szymaszek <gszymaszek@short.pl>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: The r8188eu kernel module does not depend on the
 rtlwifi/rtl8188eufw.bin firmware file
Message-ID: <Yukx8KEEOhKTJ7HQ@nx64de-df6d00>
Mail-Followup-To: Grzegorz Szymaszek <gszymaszek@short.pl>,
	Greg KH <greg@kroah.com>, Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <YukkBu3TNODO3or9@nx64de-df6d00>
 <YukvnVWuhUeOgRyZ@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Z/WwFWMLoRCa0UiB"
Content-Disposition: inline
In-Reply-To: <YukvnVWuhUeOgRyZ@kroah.com>


--Z/WwFWMLoRCa0UiB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 02, 2022 at 04:07:25PM +0200, Greg KH wrote:
> Looks like someone needs to add a line to the driver that looks like:
> 	MODULE_FIRMWARE("rtlwifi/rtl8188eufw.bin");
> [=E2=80=A6] Can you make a patch that does this?

Sure, I will prepare and send one later (hopefully today), assuming no
one objects in the meantime. Thanks for quick response.

--Z/WwFWMLoRCa0UiB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEZT55kPBhnB69hD4ZeE9lGUIcpz4FAmLpMfAACgkQeE9lGUIc
pz6oCQ/+OLg2hG7bKYoCH3KXW06YqD2gwtD00PtwOiWWeQ+wFxR68sNtdosW1d4u
Vt2Absqtt9gOx9eaWhqSk3IQRtr6pPIl8EcmQCV9rfb+UXlpYUCSmZvWV/J7dlmo
MAoFtVnhutapSCPrcH023tm3WBrW3o/f9ktr3zKIFfB5+1WiXEoR/ik+PgwNDScy
Y1pcT6wyhD+ngyKmjYB0RvrJGWR4dhQ2NdsNzwgNlPMVNclU8i/b8ko5/+ZyJ0tV
jtD24d44FtpxI3W2w9nSBuDLvB0O0fSzlxWjj6aLY2DY3Zmhsn4e+YgKgi+nrbwW
sTNYNExF3xAXrzMiEtTU1DiHMmdnRliJlGYUBZB7+yMbSWDS4D5Is8XDDrqFx/qR
PoghB/8/qpPqVxGU8SmPTtLxO+C4YDpIsKK/SploAtZ6d69/Q2T2zHZ5R+PnGlaR
k9miDHyNOtd5JP+Ohb9sRvNu1mLadAMAocin3UZrHCfpj32M0XFhH8eQGNqLTEVJ
mXjNxCdvu3Z4turMGqkPaBGWNm9m/6GLvQKrotBNZ2X2/a5uwfwwodlJJemBybRn
KAqPv8s0SyToP9eS+kzF28Lyr/jJolY6RqwqX7P76CAehVr0qfPNXRKVkv7RJl9A
PA3H2qcFdMsi/wrdVRUkTUGlVjZxdmB+XSNx9/RGndQlWx6NC58=
=DWUF
-----END PGP SIGNATURE-----

--Z/WwFWMLoRCa0UiB--
