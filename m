Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B1D199C8
	for <linux-staging@lists.linux.dev>; Wed, 11 Oct 2023 07:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="g4CB4snj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1273EC433C7;
	Wed, 11 Oct 2023 07:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697010063;
	bh=xojuYyZEzekfqidOZQDtyBJacPApzgvzcHgdq6gxwVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g4CB4snjUny5nkzFFDsZr9tvsGDLPtVL+G1uPbUcJ0XVe9PoN5Nk9q0YWeByoIQys
	 Bg+Z3hWYKvDbyvfcPt79U1JR+2B6h0m10LqEeHL4fOoOsbWeu7A8VRuLqVfL+90Pa/
	 gqrtVFAjy/tBRUkg2Bk9h1Ez3mzSekZULbHpDvGs=
Date: Wed, 11 Oct 2023 09:41:00 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kalle Valo <kvalo@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-wireless@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Pavel Machek <pavel@ucw.cz>, Jakub Kicinski <kuba@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	linux-arm-kernel@lists.infradead.org,
	Larry Finger <Larry.Finger@lwfinger.net>
Subject: Re: [PATCH] [RFC] wireless: move obsolete drivers to staging
Message-ID: <2023101115-wackiness-gracious-00a2@gregkh>
References: <20231010155444.858483-1-arnd@kernel.org>
 <2023101051-unmasked-cleaver-79b3@gregkh>
 <87y1g94szz.fsf@kernel.org>
 <d081871c-977c-43e9-afa3-a3c3e5880fea@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d081871c-977c-43e9-afa3-a3c3e5880fea@app.fastmail.com>

On Wed, Oct 11, 2023 at 09:24:55AM +0200, Arnd Bergmann wrote:
> Debian on the other just enables every driver, so there
> is no good way to know what they actually use.

Yeah, as you point out, we can't go by distro kernel configs as they
obviously error on the side of "build everything!".  But your openwrt
info is good, thanks for that, that's a huge hint that no one uses those
drivers anymore.

greg k-h
