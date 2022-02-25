Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0AA3667
	for <linux-staging@lists.linux.dev>; Fri, 25 Feb 2022 22:26:55 +0000 (UTC)
Date: Fri, 25 Feb 2022 23:26:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1645828008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TM69ukIcc+sQinY2YKTwfd9oNIY8JhhXQnOxkl9m0Q0=;
	b=apYRTZGkUwhJQy3iK89Ex8zi2TeQOYZaPphwXG6+B63KrUIE4UwUFOLSXKQGEF3dy50lO8
	hUX4KM7ty/jq+p1Zz1dkGlTg3PRIqnwmWC8ZVGtBZSmQy89fNfbGEnHbWs62aR6XyklSa9
	G78mAT+qCNqrJcCY/khaaSDj2Ua4dJwAFRvziyVAx/C+P8Wyk6GD64iRkYMGrb5v6UphCv
	+JBOZbxm6a8/H/Y5LJoCJQrlE2xadnlPEE2ciaduYFIR2yosk348vdCA48vs3p5me5PExC
	Piwl9BDIwBizU8+d3jvHWCxDE1YvQVdp9Ugde7bjNCYeCs11W4MvvIRh/MnRYg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1645828008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TM69ukIcc+sQinY2YKTwfd9oNIY8JhhXQnOxkl9m0Q0=;
	b=mHdIRy9t2j/YWSKES/TqV4YAvKAkxwqSgmtH0o0I0fco2UbTTdoVmaqGrvK14FfDWL8XUd
	SD+7/A6T+35pVYAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Wolfram Sang <wsa@kernel.org>
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
	Woojung Huh <woojung.huh@microchip.com>,
	Michael Below <below@judiz.de>,
	Salvatore Bonaccorso <carnil@debian.org>,
	Oleksandr Natalenko <oleksandr@natalenko.name>
Subject: Re: [PATCH v4 2/7] i2c: core: Use generic_handle_irq_safe() in
 i2c_handle_smbus_host_notify().
Message-ID: <YhlXplZCkflfkg1W@linutronix.de>
References: <20220211181500.1856198-1-bigeasy@linutronix.de>
 <20220211181500.1856198-3-bigeasy@linutronix.de>
 <YhY03EojmT3eaIcR@ninjato>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YhY03EojmT3eaIcR@ninjato>

On 2022-02-23 14:21:32 [+0100], Wolfram Sang wrote:
> Is this 5.17 material? Or is 5.18 fine, too?

5.18 is fine. I intend to push into the RT-stable trees and this can't
be backported without 1/7 and it does not affect !RT so I wouldn't
bother.

Sebastian
