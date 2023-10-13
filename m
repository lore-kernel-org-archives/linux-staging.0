Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C714B224D5
	for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 18:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="LGUFqBJR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=+YCPIF7bIuvSFdfYLoHL+t68NvW/EnMItKeS5kyuoaw=;
	t=1697220194; x=1698429794; b=LGUFqBJRDSQz5DffLHzZTeJ4jMlwtWA6p2fMYUeVM8uLdUt
	k5eJsA8NjxUV4MyJ0OsiIUikw0WDuuXZ6BoqV0LQh75b4ba+k5eQx2OJGWbE1wC1p7aenM8UtIiNN
	74Wts7eojwfum47p9BKoTuEmZ4x5MR/SbuiqW+EdkqWmo1z6BFZcHon2D+J8l5N0elJSXEhoOiQma
	+v5ktwHxVzVNnDF7TT7SwLIkheVC2OdVQx0721olZtKaTizugG7JiRJOK/xqQxGhvM6gISuXo5isZ
	fmDU6YuRfBjhgq5BDpbLqG+zpVk4wFCgJwxqYLF85QJ1kSh44tahbnG9Ps3x/txQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97-RC1)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qrMUs-00000004lf0-44Ty;
	Fri, 13 Oct 2023 20:02:51 +0200
Message-ID: <789449f63ff6175ff46951507c03753f4430aa85.camel@sipsolutions.net>
Subject: Re: [PATCH] [RFC] wireless: move obsolete drivers to staging
From: Johannes Berg <johannes@sipsolutions.net>
To: Arnd Bergmann <arnd@arndb.de>, Geoff Levand <geoff@infradead.org>, Geert
	Uytterhoeven <geert@linux-m68k.org>
Cc: Kalle Valo <kvalo@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann
 <arnd@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Pavel Machek <pavel@ucw.cz>, "David S . Miller"
 <davem@davemloft.net>,  Larry Finger <Larry.Finger@lwfinger.net>,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Date: Fri, 13 Oct 2023 20:02:49 +0200
In-Reply-To: <2fb4f151-9146-4cce-a3e6-ca80a95cf590@app.fastmail.com>
References: <20231010155444.858483-1-arnd@kernel.org>
	 <2023101051-unmasked-cleaver-79b3@gregkh> <87y1g94szz.fsf@kernel.org>
	 <2023101139-pyromania-game-2237@gregkh> <87r0m1fwg9.fsf@kernel.org>
	 <20231011080955.1beeb010@kernel.org> <87sf6g2hc8.fsf@kernel.org>
	 <63e57ef8-c9f2-489a-8df8-51dcffd437c6@app.fastmail.com>
	 <b1c87f71abef5aba6b39893a417466bf9f65c2d5.camel@sipsolutions.net>
	 <CAMuHMdX3F9rvD3Fzbc1dwm7Vm73VW1x5ETbxkk-jJm3Bpr5i+A@mail.gmail.com>
	 <d336126d58e12e8e67078c8142a524c667cc5639.camel@sipsolutions.net>
	 <39719eae-f166-4059-a70d-c6b74ecd46e2@infradead.org>
	 <2fb4f151-9146-4cce-a3e6-ca80a95cf590@app.fastmail.com>
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

On Fri, 2023-10-13 at 17:44 +0200, Arnd Bergmann wrote:
> On Thu, Oct 12, 2023, at 18:36, Geoff Levand wrote:
> > On 10/12/23 17:41, Johannes Berg wrote:
> > > But seriously - is it worth to try to keep a wireless driver for it i=
f
> > > we don't even know anyone using a PS3 at all?
> >=20
> > There is still a considerable user base for the PS3, so we
> > must keep the ps3-gelic-wireless driver.
>=20
> Do you know if anyone has tried changing this driver over to the
> cfg80211 interface from the wireless extensions?

I looked at that yesterday, and sadly I _think_ it's not even possible,
there are some corner cases in it like "no WPA2" that don't seem to be
fully covered in cfg80211/nl80211, at least not with the APIs today and
with current versions of wpa_supplicant.

It might still be doable because things like
WPA_DRIVER_CAPA_KEY_MGMT_WPA2_PSK don't really seem to be used much in
wpa_supplicant, but we'd have to carefully test that I guess.

Also, it depends on the PS3 firmware version whether or not that's
supported.

Then again, arguably wifi without WPA2 is pretty much useless these
days?

johannes
