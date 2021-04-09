Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B866D0E
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 19:00:25 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 5AE932400FD
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 20:51:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
	t=1617994274; bh=jcac3dLycPCTxXDqNeM1nNGQAERVfu4s2e8b7EbJOlg=;
	h=Date:From:To:cc:Subject:From;
	b=VTqS0LQDK4hLQaF8us3LpnhxrfhoZ1LdNiP1lBWNCJgLPe9ZV+iKg+Z/EYkioiAK8
	 BENdi7pc8IxqO/Ey/YDiBsRhUOIyWG366CQiwMWBtO+8w0W5ztQFmVtsO/fHgWTHht
	 Z633tt6mqdlPB5sm1dLzKsHDqGKQ3Ex08bN7lpfFOT70eXHZpHyPr5mFAPi159ulo3
	 vd3KiSceG8uCZXY2X63b8HWiGryzYcryp9FOXiOq15v/jt3Xpg+WxZEGCDnCVbwY3G
	 X6GhrYfy5JFQ4bW/f2eV92L4elZdr2XxaMDz0lJzs4kUt2pHSekCBLB7+lYspp0DzC
	 SERMCSxE7q/5Q==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4FH6fR5mHTz6tmB;
	Fri,  9 Apr 2021 20:51:10 +0200 (CEST)
Date: Fri, 9 Apr 2021 20:51:10 +0200 (CEST)
From: Marc Dietrich <marvin24@posteo.de>
X-X-Sender: lucile@mbp-von-lucile.fritz.box
To: =?ISO-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
cc: Tian Tao <tiantao6@hisilicon.com>, marvin24@gmx.de, p.zabel@pengutronix.de, 
    ac100@lists.launchpad.net, linux-tegra@vger.kernel.org, 
    linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: nvec: move to use request_irq by IRQF_NO_AUTOEN
 flag
In-Reply-To: <20210408043717.GD19244@qmqm.qmqm.pl>
Message-ID: <alpine.OSX.2.23.453.2104092036540.99358@mbp-von-lucile.fritz.box>
References: <1617777259-27463-1-git-send-email-tiantao6@hisilicon.com> <20210408043717.GD19244@qmqm.qmqm.pl>
User-Agent: Alpine 2.23 (OSX 453 2020-06-18)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="0-2012503075-1617994273=:99358"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--0-2012503075-1617994273=:99358
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT

Hi,

On Thu, 8 Apr 2021, Micha³ Miros³aw wrote:

> On Wed, Apr 07, 2021 at 02:34:19PM +0800, Tian Tao wrote:
>> disable_irq() after request_irq() still has a time gap in which
>> interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
>> disable IRQ auto-enable because of requesting.
>>
>> this patch is made base on "add IRQF_NO_AUTOEN for request_irq" which
>> is being merged: https://lore.kernel.org/patchwork/patch/1388765/

thanks for you patch, Tao, which look good to me.

> This assumes that the interrupt is not shared. This could be fixed
> by requesting the IRQ after init (and releasing before deinit).

Micha³, I understand your objections, and for the general case you are 
right. However, I think it would be good to keep the structure as close 
as possible to i2c-tegra [1], which does the same as Tao suggested. I'm 
also pretty sure that the interrupt is not shared on this (single) machine 
which this driver is made for.
So unless there are some strong arguments aginst it, I personally perfer 
his version.

Best wishes,

Marc Dietrich

[1] 
https://github.com/torvalds/linux/blob/17e7124aad766b3f158943acb51467f86220afe9/drivers/i2c/busses/i2c-tegra.c#L1740

--0-2012503075-1617994273=:99358--
