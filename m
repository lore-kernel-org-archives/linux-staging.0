Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412FC2030C
	for <linux-staging@lists.linux.dev>; Thu, 12 Oct 2023 15:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="CW3HgCdC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=1AUZ4kSi2AEEEv3nuAS4HldMWbbuyLi811omII/FRFQ=;
	t=1697125299; x=1698334899; b=CW3HgCdCRCB2T/bnzZWexFgxM3Kh+k316Y1S/O7l5UKwd1w
	ZkWtl6C8Gw5A+v8M7WhfO6ikDhg/7FF2/dSiQVsgXwYU7HU0fnRoj+06CFe8O6dp83D8sCwoYtEO+
	2GHYrIBEMdmW7DJbiA9j9C4Saj4Pt433Hlw4t966+2qLukbRPCOEgU9PSR9kBm4w6rnJrvqcBwqFl
	lPut8y6OXXUQKzHuKp1koJZpZ5tyEzfXJNBCxj4NEmrAtX7/7ADbKGx4qKu2DrTCbHbMLem2KavCr
	SO2NHMDIs7QzzMA0ilbl33PMfoa8m/9Wq/9ltLfMzTAVXsHJmllGvFvdIV2fPRQg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97-RC1)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qqxoW-00000003T2i-3J0o;
	Thu, 12 Oct 2023 17:41:29 +0200
Message-ID: <d336126d58e12e8e67078c8142a524c667cc5639.camel@sipsolutions.net>
Subject: Re: [PATCH] [RFC] wireless: move obsolete drivers to staging
From: Johannes Berg <johannes@sipsolutions.net>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Kalle Valo <kvalo@kernel.org>, Jakub
 Kicinski <kuba@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@kernel.org>, Nicolas
 Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Pavel Machek <pavel@ucw.cz>, "David S . Miller" <davem@davemloft.net>,
 Larry Finger <Larry.Finger@lwfinger.net>, linux-kernel@vger.kernel.org, 
 linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-staging@lists.linux.dev, Geoff Levand <geoff@infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Date: Thu, 12 Oct 2023 17:41:27 +0200
In-Reply-To: <CAMuHMdX3F9rvD3Fzbc1dwm7Vm73VW1x5ETbxkk-jJm3Bpr5i+A@mail.gmail.com>
References: <20231010155444.858483-1-arnd@kernel.org>
	 <2023101051-unmasked-cleaver-79b3@gregkh> <87y1g94szz.fsf@kernel.org>
	 <2023101139-pyromania-game-2237@gregkh> <87r0m1fwg9.fsf@kernel.org>
	 <20231011080955.1beeb010@kernel.org> <87sf6g2hc8.fsf@kernel.org>
	 <63e57ef8-c9f2-489a-8df8-51dcffd437c6@app.fastmail.com>
	 <b1c87f71abef5aba6b39893a417466bf9f65c2d5.camel@sipsolutions.net>
	 <CAMuHMdX3F9rvD3Fzbc1dwm7Vm73VW1x5ETbxkk-jJm3Bpr5i+A@mail.gmail.com>
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

On Thu, 2023-10-12 at 17:39 +0200, Geert Uytterhoeven wrote:
> Hi Johannes,
>=20
> On Thu, Oct 12, 2023 at 5:28=E2=80=AFPM Johannes Berg <johannes@sipsoluti=
ons.net> wrote:
> > On Thu, 2023-10-12 at 16:36 +0200, Arnd Bergmann wrote:
> > >=20
> > > ps3-gelic-wireless
> >=20
> > Didn't Sony disable Linux on PS3 eventually? Though maybe someone still
> > has some devices with old software.
>=20
> If you didn't update the firmware, you could keep on using Linux.
>=20
> And people may have found a vulnerability in more recent firmware
> versions that allows them to run custom software.

Yeah, fair.

> I don't know, it's been +10 years ago I touched a PS3 ;-)

I never had one :-)

But seriously - is it worth to try to keep a wireless driver for it if
we don't even know anyone using a PS3 at all?

But maybe we'll find someone :-)

johannes
