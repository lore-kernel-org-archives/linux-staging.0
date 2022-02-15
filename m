Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A271578
	for <linux-staging@lists.linux.dev>; Tue, 15 Feb 2022 15:33:56 +0000 (UTC)
Date: Tue, 15 Feb 2022 16:33:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1644939235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fo3G255rStH8Du8K9gC/4Oh74dENohOh6rR9zxNrm7k=;
	b=XUlLU3y8E7KMImLqhqzV4hl9D+jJ9rjIrS+mUfV5bV0v5J2CRECN+P3KG/vjZD7sSoaYsk
	GY5LSWdSZjpGWh76k4nF1Onmv9A6XCGLbQL0QYJVeDRjTonCcIOUPninA0ulfxFM/hVNSg
	ENch2bFq2JnUN5XMpsY2wU+SQMfqJhD+a7PLZB/+cnLDxhXwsnZY1ioGfrcoq5hoJoFmnU
	MRS9p+efKSnsj73i2n2cTObxd3+PNgnL3f5SJe/USqyKkjbGLL/E12Rupg15tkLrPoWeVa
	gtf8ingSKcqdI3Evhjdj6dR6MeZKGsoyWRe11dtBSMAouuG+26XXfOS6Nvn2+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1644939235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fo3G255rStH8Du8K9gC/4Oh74dENohOh6rR9zxNrm7k=;
	b=UIMOEVLl4BOgnwWtzIvKmG/pUXYmNgTYSRB16jg5vzp7F8ph7KiVCrzNBEaPZ7fz/HkQpN
	ai9g52CGNZvW22CA==
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
Message-ID: <YgvH4ROUQVgusBdA@linutronix.de>
References: <20220211181500.1856198-1-bigeasy@linutronix.de>
 <Ygu6UewoPbYC9yPa@google.com>
 <Ygu9xtrMxxq36FRH@linutronix.de>
 <YgvD1HpN2oyalDmj@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YgvD1HpN2oyalDmj@google.com>

On 2022-02-15 15:16:36 [+0000], Lee Jones wrote:
> On Tue, 15 Feb 2022, Sebastian Andrzej Siewior wrote:
> 
> > On 2022-02-15 14:36:01 [+0000], Lee Jones wrote:
> > > Do we really need to coordinate this series cross-subsystem?
> > 
> > I would suggest to merge it via irq subsystem but I leave the logistics
> > to tglx.
> 
> Could you answer by other questions too please?

I don't think that I can answer them. I said I leave the logistics to
tglx.

This can go via one merge via irq. This can also go differently i.e.
feature branch on top of 5.17-rc1 (with 1/7) which is merge into each
subsystem and then the "feature" on top.

Either way it remains bisect-able since each driver is changed
individually. There is no need to merge them in one go but since it is
that small it probably makes sense. But I don't do the logistics here.

Sebastian
