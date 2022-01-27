Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5EC2CA9
	for <linux-staging@lists.linux.dev>; Thu, 27 Jan 2022 11:33:23 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1643283196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mdXbjf5exzj4qjWggjzoRlNPppEuZE9HQrfbD7rSuLU=;
	b=ElIzE27zcQfxOq6XUcg8wn23LhZPMwnYzeGt6etK8Qq7N/u2ZVZpmyYA6Zp+2tj3uVqpM3
	RZr4PNurQ1xLvJ75g3hwzBm7A4kE14AxtASJPLJqi2+ftEEMu5Er3OWQ2+/S4yx+FVdzMJ
	YgrlTt7zXNCXLggwXGd21PH4iMLF9ukD/pT5F1OrE4eaZRdPeSYhXowVrLL/4PmdmtHuMp
	SqEkAUyXQfhtHCL6cg7xdGAcYNifHlHiYeFc+5KcEFgYVFn3f5uEHzmHYy8hVKXr4OrcOw
	3EesK4sXPuIUSGa40pidB29wESqxM63JUWyp3PqcES4A1TVugkUz/7I3I9xJHg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1643283196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mdXbjf5exzj4qjWggjzoRlNPppEuZE9HQrfbD7rSuLU=;
	b=P0RhWZlFbDp7wN/7Qcwenaa+byqN1uy1RIOfwsdz0tEi+xHf/UecG7A0uC6xjqKu/xiN37
	p2pmZ2mJq6UZc1Cg==
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
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 4/7] mfd: hi6421-spmi-pmic: Use generic_handle_irq_safe().
Date: Thu, 27 Jan 2022 12:33:00 +0100
Message-Id: <20220127113303.3012207-5-bigeasy@linutronix.de>
In-Reply-To: <20220127113303.3012207-1-bigeasy@linutronix.de>
References: <20220127113303.3012207-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

generic_handle_irq() is invoked from a regular interrupt service
routing. This handler will become a forced-threaded handler on
PREEMPT_RT and will be invoked with enabled interrupts. The
generic_handle_irq() must be invoked with disabled interrupts in order
to avoid deadlocks.

Instead of manually disabling interrupts before invoking use
generic_handle_irq() which can be invoked with enabled and disabled
interrupts.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/misc/hi6421v600-irq.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/hi6421v600-irq.c b/drivers/misc/hi6421v600-irq.c
index 1c763796cf1fa..caa3de37698b0 100644
--- a/drivers/misc/hi6421v600-irq.c
+++ b/drivers/misc/hi6421v600-irq.c
@@ -117,8 +117,8 @@ static irqreturn_t hi6421v600_irq_handler(int irq, void=
 *__priv)
 			 * If both powerkey down and up IRQs are received,
 			 * handle them at the right order
 			 */
-			generic_handle_irq(priv->irqs[POWERKEY_DOWN]);
-			generic_handle_irq(priv->irqs[POWERKEY_UP]);
+			generic_handle_irq_safe(priv->irqs[POWERKEY_DOWN]);
+			generic_handle_irq_safe(priv->irqs[POWERKEY_UP]);
 			pending &=3D ~HISI_IRQ_POWERKEY_UP_DOWN;
 		}
=20
@@ -126,7 +126,7 @@ static irqreturn_t hi6421v600_irq_handler(int irq, void=
 *__priv)
 			continue;
=20
 		for_each_set_bit(offset, &pending, BITS_PER_BYTE) {
-			generic_handle_irq(priv->irqs[offset + i * BITS_PER_BYTE]);
+			generic_handle_irq_safe(priv->irqs[offset + i * BITS_PER_BYTE]);
 		}
 	}
=20
--=20
2.34.1

