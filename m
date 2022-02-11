Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7897A
	for <linux-staging@lists.linux.dev>; Fri, 11 Feb 2022 18:15:22 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1644603314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2Jch/i8uwHhLcWwzAXjXbpVM1d+fcbfplWSgVCHBbLA=;
	b=4D/q+XgJSZYSQlhj03Sz02vFzH0GlhuNwlthKN6riQhMDD5++CNjRWRcUMnZgTF6IBP3g+
	oVovZg1UiRbqNOfXL0Ug7sEEW4I3gnhSbXiXYVhaBj8SJYSe2JWU3L8TKTnBfBv8NavXia
	PyE9hT1yki7U6ColR/pFgse4NAZ/XUCOOMQ9vWvtJ3Wf6CwrwuYA8smeI/TJiIi1F/bnNA
	ICPcSYmM6pbexOSlIEOuzn25pRO4Bxmw6wAdc3bITdm6KueiS+ZXZavgXe1fqxcpMkZDPn
	q8/SFFbpIkYrb4pOWN4iyRS8zM59QXHJ0V6VD/B2dZShpq1NX8pyPrf8htxzpQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1644603314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2Jch/i8uwHhLcWwzAXjXbpVM1d+fcbfplWSgVCHBbLA=;
	b=KXgaU3Wb016ElAJR2Uy5MlhgU1MfzTrdx0FxVToYcGImm6/t7L7V1ELxpOGiJMCXbJpX1K
	HuuVJ5o6ZABaOlBA==
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
	Woojung Huh <woojung.huh@microchip.com>
Subject: [PATCH v4 0/7] Provide and use generic_handle_irq_safe() where appropriate.
Date: Fri, 11 Feb 2022 19:14:53 +0100
Message-Id: <20220211181500.1856198-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

handler/ interrupt controller entry). It is low level code and the
function expects that interrupts are disabled at entry point.

This isn't the case for invocations from tasklets, workqueues or the
primary interrupt handler on PREEMPT_RT. Once this gets noticed a
"local_irq_disable|safe()" is added. To avoid further confusion this
series adds generic_handle_irq_safe() which can be used from any context
and adds a few user.

v2=E2=80=A6v4:
  - Correct kernel doc for generic_handle_irq_safe() as per Wolfram Sang.
  - Use "misc" instead of "mfd" for the hi6421-spmi-pmic driver.

v2=E2=80=A6v1:
 https://lore.kernel.org/all/20220131123404.175438-1-bigeasy@linutronix.de/
 - Redo kernel-doc for generic_handle_irq_safe() in #1.
 - Use generic_handle_irq_safe() instead of generic_handle_irq() in the
   patch description where I accidently used the wrong one.
v1:
 https://lore.kernel.org/all/20220127113303.3012207-1-bigeasy@linutronix.de/


