Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DC028DB5
	for <linux-staging@lists.linux.dev>; Thu, 12 Oct 2023 16:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="OsNIazpG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=Y3vhvxIcoWBz8+4W1+pMn0rc7jF/ULpbocNtPW87JTA=;
	t=1697126696; x=1698336296; b=OsNIazpGM9thGZyQdm26mPEqIvfp+OzK+HRV8TbE1RpnO4R
	HRRuINEewCKtZwNJZRx5ZELKXWe8Slp9AT6/tlFnvwlbKaAiS9Ia7MmzxEgaveJm3lDNInapmzfRD
	s4oBS08duJpdCbhzEH1uLaKMXdNmdjvrbzHtd/gEupf18yh9PT6Pzfo0S66JUDB1xiUX3En49osgt
	Dr2lXUjFgbewqV7G8L5eHsT8lJ2j9eICZYPsBUQzfmAQADvE4Kw0Iv0WQ5KcuCZoDW+h4ILQxHorw
	wsAG96JFuaHtRl2JGxdGEzfA+UKiiL9a6ZfpynClNlJGCOKqNnz/SU6DtP3FSDYA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97-RC1)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qqxby-00000003SHc-0xxw;
	Thu, 12 Oct 2023 17:28:30 +0200
Message-ID: <b1c87f71abef5aba6b39893a417466bf9f65c2d5.camel@sipsolutions.net>
Subject: Re: [PATCH] [RFC] wireless: move obsolete drivers to staging
From: Johannes Berg <johannes@sipsolutions.net>
To: Arnd Bergmann <arnd@arndb.de>, Kalle Valo <kvalo@kernel.org>, Jakub
	Kicinski <kuba@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann
 <arnd@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Pavel Machek <pavel@ucw.cz>, "David S . Miller"
 <davem@davemloft.net>, Larry Finger <Larry.Finger@lwfinger.net>,
 linux-kernel@vger.kernel.org,  linux-wireless@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-staging@lists.linux.dev, Geoff
 Levand <geoff@infradead.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Date: Thu, 12 Oct 2023 17:28:28 +0200
In-Reply-To: <63e57ef8-c9f2-489a-8df8-51dcffd437c6@app.fastmail.com>
References: <20231010155444.858483-1-arnd@kernel.org>
	 <2023101051-unmasked-cleaver-79b3@gregkh> <87y1g94szz.fsf@kernel.org>
	 <2023101139-pyromania-game-2237@gregkh> <87r0m1fwg9.fsf@kernel.org>
	 <20231011080955.1beeb010@kernel.org> <87sf6g2hc8.fsf@kernel.org>
	 <63e57ef8-c9f2-489a-8df8-51dcffd437c6@app.fastmail.com>
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

On Thu, 2023-10-12 at 16:36 +0200, Arnd Bergmann wrote:
>=20
> ps3-gelic-wireless

Didn't Sony disable Linux on PS3 eventually? Though maybe someone still
has some devices with old software.

johannes
