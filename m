Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8999E1578
	for <linux-staging@lists.linux.dev>; Tue, 15 Feb 2022 15:46:12 +0000 (UTC)
Date: Tue, 15 Feb 2022 16:46:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1644939970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qEoj4mtlQVRRs6/6d8GaUUFXpcwiomjAL9sone681ow=;
	b=X6gZDDvzy0Gw2Py/F4ZZoB+hsDF5zDkWf7v971/LigaPKniUQS9BxooEKi3qlcTq0f193Z
	CZxTojO+cQrmdhEA8CRFICdpq0BO75E3qthBj42SqEKI1hjUPiIrJ7lf9tz3kddCuESPP6
	rqH7Pn/mlXpAlnJZuWF/LMSj1oUdnJdtQbIsmb4p/KqFElPxNDP46Q/0fm46RciJzL32DY
	ylg8/zeKzuKvYkJuZ4zafaXtui/p2e+iZVE6T3DJnHn2CYnm9rKK2KMF2jZWLPFN0rEIUa
	v/3g8mtYoT2OEhbtl55rZD3PhB+XqzewGsHq0w1R3Ft90LWNorPKUpR7bxG7qw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1644939970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qEoj4mtlQVRRs6/6d8GaUUFXpcwiomjAL9sone681ow=;
	b=biMHfMQ835e1UpRnlTmHgGmqBm5gQcME2t7bLKWswSicWiCwflGxTeRUn8J1nxOLr0sS1U
	0FmWvII7n7PGbABw==
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
Message-ID: <YgvKwd525feJkBHV@linutronix.de>
References: <20220211181500.1856198-1-bigeasy@linutronix.de>
 <Ygu6UewoPbYC9yPa@google.com>
 <Ygu9xtrMxxq36FRH@linutronix.de>
 <YgvD1HpN2oyalDmj@google.com>
 <YgvH4ROUQVgusBdA@linutronix.de>
 <YgvJ1fCUYmaV0Mbx@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YgvJ1fCUYmaV0Mbx@google.com>

On 2022-02-15 15:42:13 [+0000], Lee Jones wrote:
> So there aren't any hard dependencies between the driver changes?

Correct. #2 - #7 depend on #1. The order of #2+ is not relevant.

Sebastian
