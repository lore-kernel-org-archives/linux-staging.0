Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420717E
	for <linux-staging@lists.linux.dev>; Fri, 11 Feb 2022 18:15:22 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1644603315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Cnx2U3ehecH1EXxHKkd2xHBgTX+RcdbAsjgFaXCm/o=;
	b=YZ2aHIHsD3RWbbdNTfg/nEFEtQHZr31lprXJboGVJI224gluh9gtvnKfHyGVWj60rEWUr/
	DAZumWiOCGMCrl0FIMaD0+Fl161Sx7vAUaQ2gaSAgMmefx8F/fgucRrqjmu/V1OKPhOlPE
	dJCurBSE+tULZwKRyy18s8Zg/iPOcSuNvS3orzlwdE+y8Z0hJLEMN3sX5XQt24bWRG2TWI
	mMR3stxnfg7xbFXYHKcpU6wsFGxLOR8rZEW1uUrXDt/I6CbPtGUR5J/j4qe8NyohcDOzXj
	gF7ST1PivBuZr68N4ubPOyz6h4VeLySJtoB549IFV5oPP2237lLBl2AfQUE1Aw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1644603315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Cnx2U3ehecH1EXxHKkd2xHBgTX+RcdbAsjgFaXCm/o=;
	b=PJrnP0HKK3oE2sDAfnkGEx4hPVdxi/YqKdzCfqnBTYMf81IAZlyROFp+ej2ZXqduNASxfV
	yajtfT0Zfq/+BGDA==
To: greybus-dev@lists.linaro.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Alex Elder <elder@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Lee Jones <lee.jones@linaro.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	UNGLinuxDriver@microchip.com,
	Wolfram Sang <wsa@kernel.org>,
	Woojung Huh <woojung.huh@microchip.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Michael Below <below@judiz.de>,
	Salvatore Bonaccorso <carnil@debian.org>,
	Oleksandr Natalenko <oleksandr@natalenko.name>
Subject: [PATCH v4 2/7] i2c: core: Use generic_handle_irq_safe() in i2c_handle_smbus_host_notify().
Date: Fri, 11 Feb 2022 19:14:55 +0100
Message-Id: <20220211181500.1856198-3-bigeasy@linutronix.de>
In-Reply-To: <20220211181500.1856198-1-bigeasy@linutronix.de>
References: <20220211181500.1856198-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The i2c-i801 driver invokes i2c_handle_smbus_host_notify() from his
interrupt service routine. On PREEMPT_RT i2c-i801's handler is forced
threaded with enabled interrupts which leads to a warning by
handle_irq_event_percpu() assuming that irq_default_primary_handler()
enabled interrupts.

i2c-i801's interrupt handler can't be made non-threaded because the
interrupt line is shared with other devices.

Use generic_handle_irq_safe() which can invoked with disabled and enabled
interrupts.

Reported-by: Michael Below <below@judiz.de>
Link: https://bugs.debian.org/1002537
Cc: Salvatore Bonaccorso <carnil@debian.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Reviewed-by: Oleksandr Natalenko <oleksandr@natalenko.name>
Acked-by: Wolfram Sang <wsa@kernel.org>
---
 drivers/i2c/i2c-core-base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 2c59dd748a49f..3f9e5303b6163 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1424,7 +1424,7 @@ int i2c_handle_smbus_host_notify(struct i2c_adapter *=
adap, unsigned short addr)
 	if (irq <=3D 0)
 		return -ENXIO;
=20
-	generic_handle_irq(irq);
+	generic_handle_irq_safe(irq);
=20
 	return 0;
 }
--=20
2.34.1

