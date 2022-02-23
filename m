Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B586DC6A
	for <linux-staging@lists.linux.dev>; Wed, 23 Feb 2022 13:20:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2C0CC340E7;
	Wed, 23 Feb 2022 13:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645622400;
	bh=MSJK1BEqKKYInaWa3b/tKN1ugZMfyiLU3Jor6cCG1eE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=puKXpBE/+qDQ5y1U4AZhEORv9mkmOyk+FjC86QFPxjLNkjZ+ydM2JBCn21ti4Xbsa
	 e0JzZh/u7rrdqIA13C0AoHRc2Rsor+8wjZBH3jTY/FxDEq1Z7vpsS2b4E5mbblwmar
	 607EfHrvVizvDuc6CkIaNOn3SpECFJfBOjaUCRaTC5iAuIOVYH5e5BbSnZWs5GibG9
	 sW9ZJRaE3ze7IQfki8sUtTVtXkQQI/Xw9POIZYZs6TAwzwHCdAInOXw9VAdbfU2K7M
	 r38pzasDV3772XV6qHdiSqUunYSF/XsZiZ3U7YI/3oZDQzdquQr8xnqGD/9E4KHIVB
	 olxaxNnbr2LHQ==
Date: Wed, 23 Feb 2022 14:19:50 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Lee Jones <lee.jones@linaro.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org, netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>, UNGLinuxDriver@microchip.com,
	Woojung Huh <woojung.huh@microchip.com>
Subject: Re: [PATCH v4 0/7] Provide and use generic_handle_irq_safe() where
 appropriate.
Message-ID: <YhY0dvfG4zPQPdDO@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Lee Jones <lee.jones@linaro.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org, netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>, UNGLinuxDriver@microchip.com,
	Woojung Huh <woojung.huh@microchip.com>
References: <20220211181500.1856198-1-bigeasy@linutronix.de>
 <Ygu6UewoPbYC9yPa@google.com>
 <Ygu9xtrMxxq36FRH@linutronix.de>
 <YgvD1HpN2oyalDmj@google.com>
 <YgvH4ROUQVgusBdA@linutronix.de>
 <YgvJ1fCUYmaV0Mbx@google.com>
 <87a6ekleye.ffs@tglx>
 <875yp8laj5.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TFkR+QzbpIqqErnE"
Content-Disposition: inline
In-Reply-To: <875yp8laj5.ffs@tglx>


--TFkR+QzbpIqqErnE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> That's what I did now. The tag to pull from is:
>=20
>    git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-api-2022=
-02-21

Thanks! Pulled into i2c/for-mergewindow.


--TFkR+QzbpIqqErnE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIWNHMACgkQFA3kzBSg
KbZBnhAAgFP2dyHNKJQ55Z0qKUHukcnqO0fWX2JlLPm5WNcqwRKV2vwajWZRxfaJ
Q4cEc7k68V0NefrS6HlgCNupsqRWsO1f7DkX4SlYWJNlfDAViinfIY90ZxLEm8Zg
jWGAgDdEHSDO4xVQdq0sqSZMH+2IZaN2eBEJxiulQFUq5ZClUBk4imfWWRGg1bx/
aDOIfFjqfGZo3E5uhNBKUyotAXh3gRlCGCaNfOBQw8yrqqSniPOhJeLq1M+tBba4
jpfyhe0iiWKcNcoFAI+T97GYbzjWSHy9saXS+KRPX8jdWrIPAHPWhgX80e93eXDF
6ajK2UBVjDihJ+esOGZtJju2sVsiQH5AANUzk3xMh5WQNTwyRGbKD70rylb3AW7I
KrKGhYaN+hrCucJPtAP5taI76x6oQFSceFGnFpo78GgP1xe7kIJqZlz+CNqRRlIL
Ut94054JVrFZuM3xBr454tSC58g4eFIJbm4RrGN6ARX8GKB5eczFkQvMA5a9eZ5M
TD/xqo/VPH1IpMuzMBE8J6RDRdS8MzS0dPHDdkrp0IHxs7SmdaALbbHOqGcA/Drq
gGXnffip3xRBUzDOdYpzjofT8SJFmdASLOg6RzMZS518hNUPEnHgG/+GY5NNHnjU
G6sPeE6fCYi0L5IgamQ5t2BXXhwVVzNKZsw6Yb6H0/igrTOxoz8=
=R7fF
-----END PGP SIGNATURE-----

--TFkR+QzbpIqqErnE--
