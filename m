Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528911578
	for <linux-staging@lists.linux.dev>; Tue, 15 Feb 2022 14:50:57 +0000 (UTC)
Date: Tue, 15 Feb 2022 15:50:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1644936648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ipSRQfa6UIjEiEWlLrIVz6abv3g7iod4IaRrr/RJMrk=;
	b=xK6+Uw/pq6yA+MSuOsm5RMMpP6S6CSqFAOtgJlROqOhRqW0L5FYMVHEoFx9FEBD1g87c8J
	Hkj7CKLBNk3+jdRQ2jPf/qOVmYfroHz4LLGxsK78Evi+xc2XpFv3qLij1GbXyuhIhOTsvB
	YbQz0Utnu2orN8bufazagopdGHaKe7pOOszWq2x0W477Hw21j3Aqh8XX0zOreczWP00pmF
	xi5ZWdZrN9Mre9U+rNdXkLortKL+i0ng975WAmbXwi2oWxC5wmXj9pB/Y71XGzqVlaxLcJ
	1pL/A6wjNEJQ+G5SuhV5vAUJP1B2wELaiFqVfyYloZbsQ2wrjNVqUJfSwwCxbg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1644936648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ipSRQfa6UIjEiEWlLrIVz6abv3g7iod4IaRrr/RJMrk=;
	b=UC9OLWjhpk9QTLHPdXI5gsmcyGj7qN3h6zOIE4bZBBE0/Eq3PVOsrG/TU7/btaq2JtDWm9
	z5XntHoRJVFbJEAg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Lee Jones <lee.jones@linaro.org>
Cc: greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org, netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com,
	Wolfram Sang <wsa@kernel.org>,
	Woojung Huh <woojung.huh@microchip.com>
Subject: Re: [PATCH v4 0/7] Provide and use generic_handle_irq_safe() where
 appropriate.
Message-ID: <Ygu9xtrMxxq36FRH@linutronix.de>
References: <20220211181500.1856198-1-bigeasy@linutronix.de>
 <Ygu6UewoPbYC9yPa@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Ygu6UewoPbYC9yPa@google.com>

On 2022-02-15 14:36:01 [+0000], Lee Jones wrote:
> Do we really need to coordinate this series cross-subsystem?

I would suggest to merge it via irq subsystem but I leave the logistics
to tglx.

Sebastian
