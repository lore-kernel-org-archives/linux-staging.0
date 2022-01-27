Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399442CAA
	for <linux-staging@lists.linux.dev>; Thu, 27 Jan 2022 11:33:24 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1643283197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZnqBSA0fX+jQu5NWHLqll8brJ7sQU9NzIdODqyqj1bE=;
	b=Q+dMM7Q2U8ZnFsJmtKBKMyTFK/NwRUspp1jHd025ymaNdAH5HG9m0qiDDdFo+8SsD1OOSq
	XhdLxpNsvdbW3GHcLOPc9t7tE2/yeZ1SAyZyAkZL+bCN7Eq4cuaHr7Ns4HSm8F2SYw6BMV
	YyOss4QzJNl8H6ssjX9r65ps2LL8mLpE9DFH17Tk8InkYZ05Tp/Vsres/zQ6VXQN75xqSo
	+uBsTPjrrVLXC9cAVrMcId5bJ9xPB6pcor8DdgeKkLo8tnIds7qf5yp6MhfUA+VGr9td0R
	OuHLpeSt61TkUDdzwZiKsAf+o7YQ2uaCnLw78ftXIZrhfEpcRRi8vkfeGsz+jQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1643283197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZnqBSA0fX+jQu5NWHLqll8brJ7sQU9NzIdODqyqj1bE=;
	b=HfV/uD24kkWJpBncedkJYbJ9LHCd+gIicOaa3Ov9P9oJotKouxwL0LxvVjE4w8l7PdLzLT
	s7HbM7nauDjMhFDw==
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
Subject: [PATCH 7/7] staging: greybus: gpio: Use generic_handle_irq_safe().
Date: Thu, 27 Jan 2022 12:33:03 +0100
Message-Id: <20220127113303.3012207-8-bigeasy@linutronix.de>
In-Reply-To: <20220127113303.3012207-1-bigeasy@linutronix.de>
References: <20220127113303.3012207-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Instead of manually disabling interrupts before invoking use
generic_handle_irq() which can be invoked with enabled and disabled
interrupts.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/staging/greybus/gpio.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
index 7e6347fe93f99..8a7cf1d0e9688 100644
--- a/drivers/staging/greybus/gpio.c
+++ b/drivers/staging/greybus/gpio.c
@@ -391,10 +391,7 @@ static int gb_gpio_request_handler(struct gb_operation=
 *op)
 		return -EINVAL;
 	}
=20
-	local_irq_disable();
-	ret =3D generic_handle_irq(irq);
-	local_irq_enable();
-
+	ret =3D generic_handle_irq_safe(irq);
 	if (ret)
 		dev_err(dev, "failed to invoke irq handler\n");
=20
--=20
2.34.1

