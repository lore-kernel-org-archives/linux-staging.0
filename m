Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB362C9D
	for <linux-staging@lists.linux.dev>; Mon, 31 Jan 2022 10:47:38 +0000 (UTC)
Date: Mon, 31 Jan 2022 11:47:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1643626051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IvT+96WC4xlc86N7eSlAFMmOlclUSR1CkGpGq2QgIX8=;
	b=KZMyEJRre/OttTzp9HkeBp+HSKli3uTN429Y3mRSBq/r1Mpxrd1Ltk29IKGetZ97dQ0I2j
	Ga6uTRd1q1TzAkUfqqU5SpZ5bMaBwFDStAYV/5QXO1WDzMGVq36JOqnfHHvv9RC6RXKK5I
	ZRmJKVhJrSR/OWPcmrLv2OLnTKwexMDSzxhF3mXSTUr8V9Wmd2vDYkAkZBCsyfPwBldb6U
	/kvmF5kGEZdEqh1YWN8yMzfYI5LYYlfHwgHYNPZ8YnVNB3QewJ00Yj7kgfgVEkfXalxS9t
	tQ6pwHXaeSPRG4AnB85Kx9l8O2eTGhhPLzBpx3nf8TIssmpitr7feb+kQkvnkw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1643626051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IvT+96WC4xlc86N7eSlAFMmOlclUSR1CkGpGq2QgIX8=;
	b=cVrD8VA+0PMCB+FD65Xrt8Wz4qGuljy8hfkRLVd7SpOP0A49Uyb3uF79h/L8DsKn3i3/TB
	ONpvSGGPh4iijGBQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Wolfram Sang <wsa@kernel.org>, greybus-dev@lists.linaro.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>,
	Lee Jones <lee.jones@linaro.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com,
	Woojung Huh <woojung.huh@microchip.com>
Subject: Re: [PATCH 1/7] genirq: Provide generic_handle_irq_safe().
Message-ID: <Yfe+QRJh8OIPSuD1@linutronix.de>
References: <20220127113303.3012207-1-bigeasy@linutronix.de>
 <20220127113303.3012207-2-bigeasy@linutronix.de>
 <YfLQYa5aKJKs7ZUe@shikoro>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YfLQYa5aKJKs7ZUe@shikoro>

On 2022-01-27 18:03:29 [+0100], Wolfram Sang wrote:
> Hi Sebastian,
Hi Wolfram,

> > +/**
> > + * generic_handle_irq_safe - Invoke the handler for a particular irq
> 
> This is the same desc as for generic_handle_irq(). I suggest to add
> something like "from any context" to have some distinction.

There is something later but let me reword that.

> > + * This function must be called either from an IRQ context with irq regs
> > + * initialized or with care from any context.
> 
> I think "with care" is not obvious enough. Can you describe it a little?

Yeah, will do.

> Thanks for this work,
> 
>    Wolfram

Sebastian
