Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE31C2D78E
	for <linux-staging@lists.linux.dev>; Thu, 26 Oct 2023 10:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="KIcOGNmZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=JE/wzep2Kl9fulvu7hozBAZLnaAXZolsk/A0oBuPFR0=;
	t=1698316495; x=1699526095; b=KIcOGNmZnV8r35k6pS4gkjb277YlW6FCqA7bJfjPPu7pfa2
	EcVwdZohF7wDQ0NQpUaPYS2me1neshbV6C+NAOvn0NEck1Zqz6XezYptTvbnkoJzKaZmLte61s58F
	46D+SOA8cQ0h2aCzr/nl+ngX6jCku99PtuOK3AMG6/ZsyMM4a5Okc3jMxzDCdaSOhwVSKAMu6+Fz7
	YzNMUl3fItQb3X6vLIj2Wb8R1tG8JdOy9g2nZCHQiOqIJ/3DzpV90kuY4K8LxMUiRo4fdrs9ETRm+
	P54Epz4YHfyMKtbO4IiemIlezUDhuRwRhKfclkYTPmwJ3u7z602rTGqnlISBLMNg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97-RC1)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qvx1A-00000003a91-3X6O;
	Thu, 26 Oct 2023 11:51:09 +0200
Message-ID: <14bd2e39338dd755f7bfde23a93563865580ee83.camel@sipsolutions.net>
Subject: Re: [PATCH 10/10] [RFC] wifi: remove ipw2100/ipw2200 drivers
From: Johannes Berg <johannes@sipsolutions.net>
To: Kalle Valo <kvalo@kernel.org>, Philipp Hortmann
	 <philipp.g.hortmann@gmail.com>
Cc: Witold Baryluk <witold.baryluk@gmail.com>, arnd@kernel.org, 
 Larry.Finger@lwfinger.net, alexandre.belloni@bootlin.com, arnd@arndb.de, 
 claudiu.beznea@tuxon.dev, davem@davemloft.net, geert@linux-m68k.org, 
 geoff@infradead.org, gregkh@linuxfoundation.org,
 gregory.greenman@intel.com,  ilw@linux.intel.com, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev,  linux-wireless@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,  nicolas.ferre@microchip.com, pavel@ucw.cz,
 quic_jjohnson@quicinc.com,  stas.yakovlev@gmail.com, stf_xl@wp.pl
Date: Thu, 26 Oct 2023 11:51:07 +0200
In-Reply-To: <87jzr9d883.fsf@kernel.org>
References: 
	<CAEGMnwo6RFqADPO5FRkRUNL=GfV6DY8UuwgsypEYOD3LTnXdJg@mail.gmail.com>
	 <c608f328-387e-431b-b3c2-4b8fa0c4f11f@gmail.com>
	 <87jzr9d883.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Thu, 2023-10-26 at 12:49 +0300, Kalle Valo wrote:
> Philipp Hortmann <philipp.g.hortmann@gmail.com> writes:
>=20
> > On 10/26/23 00:27, Witold Baryluk wrote:
> > > I might be interested in modernizing the driver, but I have no idea
> > > how much effort it would be (in terms of changed fraction of code).
> > > 20k LOC is neither small or big, and not obvious (a lot of it would
> > > be unchanged), if it is a week of work, or months of work.
> >=20
> > Hi Witold,
> >=20
> > I am trying to do this with rtl8192e.
> > One possibility is to take the following patch series as a starting poi=
nt:
> > https://yhbt.net/lore/all/1414604649-9105-1-git-send-email-tvboxspy@gma=
il.com/
> >=20
> > For me as a beginner and hobbyist this is a huge task. I am happy when
> > I can finish it until next summer.
>=20
> We also have some docs available:
>=20
> https://docs.kernel.org/driver-api/80211/
>=20
> And I also recommend looking at our hwsim driver as that gives a good
> idea how a simple mac80211 driver works:
>=20

FWIW, I don't think this can be ported to mac80211 - only cfg80211. It's
a fullMAC device.

johannes
