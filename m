Received: from m228-13.mailgun.net (m228-13.mailgun.net [159.135.228.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FCF3D66
	for <linux-staging@lists.linux.dev>; Mon, 18 Apr 2022 23:39:39 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=codeagain.dev; q=dns/txt;
 s=smtp; t=1650325179; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Subject: To: To: From: From: Date:
 Sender: Sender; bh=fksJxHBbasPH0E1HIDrtxhBCh0tAufSksTmpcRK4Loo=; b=CcXdnfJ/i2loFRKqFE3cu9ey86MUX69y8rJOk9+yFs6RmDr1074Vp9iabrDd1cj7z6UiVhfp
 zskdloRTsOauN+tHcpfeaXMnF0c2nktM7Ks2L+ep2qwQnxLuxXl1LJAl8tE0Goe4x8c5jHSY
 akDS8F3cyEzIIe6H/0Pe83PwvBjtALdWC800yxl21YUzRby3pA0T/CEgBIc+iw1Irz4t2+lw
 D3/2fM9MSAXRI00lnERXmwuj347L/a2a75HhZ1mgJWbTJrjvsAIW7N1Lf/07EZmIKJHTFtgp
 WZUJMvuuLhiERU25wnFtc69haRt0fJJUAok2gFQNHiZc3DU5gC/AqA==
X-Mailgun-Sending-Ip: 159.135.228.13
X-Mailgun-Sid: WyI4MTlhZCIsICJsaW51eC1zdGFnaW5nQGxpc3RzLmxpbnV4LmRldiIsICJiZTljNmQiXQ==
Received: from AN5Bruno (186-250-90-1.mhnet.com.br [186.250.90.1]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 625df6bb225c469082e88b19 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Mon, 18 Apr 2022 23:39:39 GMT
Sender: codeagain@codeagain.dev
Date: Mon, 18 Apr 2022 20:39:29 -0300
From: Bruno Moreira-Guedes <codeagain@codeagain.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Bruno's Patch Watchbox <patch-reply@codeagain.dev>
Subject: Re: [PATCH v2 2/3] staging: vme: Add VME_BUS dependency to Kconfig
Message-ID: <20220418233929.zz32dil4u6hbwtqv@AN5Bruno>
References: <cover.1650321310.git.codeagain@codeagain.dev>
 <00de5644d7c2f8c8878eccf86b761e0602732080.1650321310.git.codeagain@codeagain.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="asozunj7lfs2jxfg"
Content-Disposition: inline
In-Reply-To: <00de5644d7c2f8c8878eccf86b761e0602732080.1650321310.git.codeagain@codeagain.dev>


--asozunj7lfs2jxfg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Please, disregard the following message as there's a typo in the prefix.

On Mon, Apr 18, 2022 at 08:31:09PM -0300, Bruno Moreira-Guedes wrote:
> The KConfig file for VME_USER ('drivers/staging/vme/devices/Kconfig')
> sourced at "drivers/vme/boards/KConfig" misses a `depends on` line for
> VME_BUS, which is unnoticeable for menuconfig users who aren't be able
> to select it through this interface without setting the CONFIG_VME_BUS
> option because it's nested on VME_BUS menu entry.
=2E..
>  	  VME windows in a manner at least semi-compatible with the interface
> --=20
> 2.35.3
>=20

It's already sent a new copy with the proper version number. Nothing's
changed except for the message ID and the v2 typo.

--asozunj7lfs2jxfg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQTUrsHCxGmQ5vyKRAZtd3tyEY2kgUCYl32sQAKCRAZtd3tyEY2
kiJSAP0WSPiSATXPmE8k1yuJdqmHmM4YrWW22tlqO0FAJedghQD+KLK9QB4+YbN3
tRPhg1KTwKnyxRsi5+O+2Q4GN/DyOQQ=
=QUOj
-----END PGP SIGNATURE-----

--asozunj7lfs2jxfg--
