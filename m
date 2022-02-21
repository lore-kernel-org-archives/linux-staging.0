Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27032581
	for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 11:33:05 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1645443182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DDK33/3302m/AxEjlqU7JR5WuOZd5Q+b5EdJBto11HM=;
	b=4YWj9EREiqE/4z9lRjzJiDCe2ileZomSn6vZTDKEA8y5hupG1tPoR9ME40N7lwiDuHKnd6
	bcQu7W7k5DaojT3yK5NmzHCUrcF1n8VlVruftElI4NfwOO8ZQPS3UnAfpZb8xa/xHf/iqP
	i5I/K0uVgBgff9mnMZa0DYj/Kapi0TG3lgoiu+44QmimuDoQM3430lXOiok7/pUQia5GpH
	Ylj14nB7AMUylwdSAC/roiPE0FO9S6u7A7esTSu4jHDP9twbIL+yA6N2rmuvblNGmoKJTQ
	ZVXctRztuqb5og+i/uU7LPW3OfyMcFO7dLcu04vjiF2XKZMsKMpzgB5Ud+K9Fw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1645443182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DDK33/3302m/AxEjlqU7JR5WuOZd5Q+b5EdJBto11HM=;
	b=DzX8bC47wbA5MEoCl2FNLvxhuTBdRP0FKtqmoDsNab1UVrwMOS5/w3bVrPlaMJTRrjXqJy
	jWEr89tMGCNNl/DA==
To: Lee Jones <lee.jones@linaro.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>
Cc: greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org, "David S. Miller"
 <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de
 Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Johan
 Hovold <johan@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
 UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>, Woojung Huh
 <woojung.huh@microchip.com>
Subject: Re: [PATCH v4 0/7] Provide and use generic_handle_irq_safe() where
 appropriate.
In-Reply-To: <87a6ekleye.ffs@tglx>
References: <20220211181500.1856198-1-bigeasy@linutronix.de>
 <Ygu6UewoPbYC9yPa@google.com> <Ygu9xtrMxxq36FRH@linutronix.de>
 <YgvD1HpN2oyalDmj@google.com> <YgvH4ROUQVgusBdA@linutronix.de>
 <YgvJ1fCUYmaV0Mbx@google.com> <87a6ekleye.ffs@tglx>
Date: Mon, 21 Feb 2022 12:33:02 +0100
Message-ID: <875yp8laj5.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Lee & al!

On Mon, Feb 21 2022 at 10:57, Thomas Gleixner wrote:
> On Tue, Feb 15 2022 at 15:42, Lee Jones wrote:
>> What is your preference Thomas?
>
> I suggest doing it the following way:
>
>  1) I apply 1/7 on top of -rc5 and tag it

That's what I did now. The tag to pull from is:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-api-2022-02-21

>  2) Driver maintainers who want to merge via their trees pull that tag
>     apply the relevant driver changes
>
>  3) I collect the leftovers and merge them via irq/core

So everyone who wants to merge the relevant driver changes, please pull
and let me know which driver patch(es) you merged. I'll pick up the
leftovers after -rc6.

Thanks,

        tglx
