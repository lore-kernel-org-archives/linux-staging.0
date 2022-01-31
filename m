Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CA92C9D
	for <linux-staging@lists.linux.dev>; Mon, 31 Jan 2022 11:16:12 +0000 (UTC)
Date: Mon, 31 Jan 2022 12:16:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1643627771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ll9KYARRuBZxRo09tM644QKrs5m7bsyeSqNKNu1Ai5c=;
	b=QJK53clJumtX9s0dxa4QZmUp1wdIpcTFOVfNRju6Mii59Nhxumj5PbxnCD4YIG6qIWTVVG
	9L7zxyNwgikDsUUyIwuFK79UyAeB34C+zuMtZVMYKBmjkuR9krx0gpQDlQPK4+LdR/hKIO
	glESyBcvyQY/QjgcDDId0hHYsvzPtwUcRjmBx6KqGp8v/FiZfC/U1uDAy8SOrpX4zhIQlZ
	7cbm/5T0Ho6nnUB/CjuX0+tMSEIVp+RcWNWYTuPWnyoNOgoq9jUcEt0XYk+6vRxVBq2GUG
	lYIpoR7WuPpkoKOyFN212omM6hjlz6bith9xh+KRpvxYnyQJZncfYA0ZyoDiaA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1643627771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ll9KYARRuBZxRo09tM644QKrs5m7bsyeSqNKNu1Ai5c=;
	b=3nJZTRll2KKofcUlVbQaYLwLfUrkueiuloW8jj5eVHwVhU6NIL3VsqQeF07eMJyqEHZJnY
	e4MwZh8L7xEN4GCQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc: greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org, netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>,
	Lee Jones <lee.jones@linaro.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com,
	Wolfram Sang <wsa@kernel.org>,
	Woojung Huh <woojung.huh@microchip.com>
Subject: Re: [PATCH 4/7] mfd: hi6421-spmi-pmic: Use generic_handle_irq_safe().
Message-ID: <YffE+XxLpFKw+7HS@linutronix.de>
References: <20220127113303.3012207-1-bigeasy@linutronix.de>
 <20220127113303.3012207-5-bigeasy@linutronix.de>
 <44b42c37-67a4-1d20-e2ff-563d4f9bfae2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <44b42c37-67a4-1d20-e2ff-563d4f9bfae2@gmail.com>

On 2022-01-28 13:23:08 [+0300], Sergei Shtylyov wrote:
> On 1/27/22 2:33 PM, Sebastian Andrzej Siewior wrote:
> 
> > generic_handle_irq() is invoked from a regular interrupt service
> > routing. This handler will become a forced-threaded handler on
> 
>    s/routing/routine/?

Yes, thank you.

Sebastian
