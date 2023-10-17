Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D05727EC3
	for <linux-staging@lists.linux.dev>; Tue, 17 Oct 2023 07:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="bsmZjlMS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FyWYgxbJ"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 181BA3200AA5;
	Tue, 17 Oct 2023 03:45:00 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 17 Oct 2023 03:45:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1697528699; x=1697615099; bh=DF
	BeCzjQflpg69NWHcq4wfPjEuoiGbDRh/Ql8FSePAM=; b=bsmZjlMSnCfjul68CW
	J5OXTUQN0yVKRhtgmzFwgVuNYbb00fCD6HN3yFwX/GuTgNOjp4bU4IcAQ/4iARgZ
	0AvsBLiOroNGlkiVI+pFr4Sqy5qztHArP9xbuVAIzdmyCDmRPC2TduNeq4bVcUWi
	aeIv3e4yF6ZBnHgH2UlX6IQw0cytZ3kdsq94trUKvbU8YRyUWd+gtZTH4VpPBBAD
	y6V6DDinhad1pI0NzeJe59YAMvQxffsTUyw8TAwiMNBSTmHWO9+xf9HYSADz39Fu
	jvwwoaxJ3RqC031r/OPj/HgVoOTOIXGcYEXeIbkXXllQyJ6Pf6P6+rjhxdJSAr7r
	/sAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1697528699; x=1697615099; bh=DFBeCzjQflpg6
	9NWHcq4wfPjEuoiGbDRh/Ql8FSePAM=; b=FyWYgxbJ8lCVseKAGjkUINPR9xmnG
	SmtOCcBxMWZG/cOMEAAjyiJTVEpKcE14ALF2y3qCqGKEwRTNWD2lm1LjJXBHdyRh
	v7Q5ECBBYKjRpGPLExEW1tGRun1HSvBq9WBKn30LKkxhoDHMm1ircKRGE6B0i8jE
	lytmlAeFbl7jekmI3b8cudxYwwrfES2Mfdqa5SFjBChTxDahNjFEBiwEShCCcmBl
	gS52cV9tuHsMe/J83L91YeNIGxkSBARpMe/uJtTL/UzKXQvoCkPG7CZvPUkoW2OW
	94BsBpiDyTYwS1XkQN9FVn97lxGSYsAZLJ0SGcjR+p/1gDLUUuwUvVJgA==
X-ME-Sender: <xms:ezsuZSt7LcHK7_sdtlPiimUeGCVKaWc9cATvSpjcaYiu4esESfeKJQ>
    <xme:ezsuZXcvoDpXQdytXdBnj63KbBPbmxi4WNe-R4jPU8EIr2G-6MXN8RT4E3mH4smhB
    L4970ysvwj2RtfuBvs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrjedugdduvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:ezsuZdx37cuBAVPUKKF03khlwpaXFAKuumCppwVOLRCNZQphDU4z9w>
    <xmx:ezsuZdMcf7mqrohM80iMu06zvYsV_5o3sDDTdyUla2T5P-Yhq3apKg>
    <xmx:ezsuZS-czPe_HdyaJ1NXqdx4Pmcr97mo2AuOOMBaxfznrqKalFZDQQ>
    <xmx:ezsuZZllfzjQdL0MbYKP0kUq9k6vWUYPs3nZ7sVnu7BY04m51cgd2A>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 478EAB60089; Tue, 17 Oct 2023 03:44:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1019-ged83ad8595-fm-20231002.001-ged83ad85
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <6d362e80-9837-4dab-99a5-51b8eb241b5b@app.fastmail.com>
In-Reply-To: <2023101752-canteen-uniformly-acc1@gregkh>
References: <20231014211051.GA29518@matrix-ESPRIMO-P710>
 <3d1355bc-d359-4ff6-aee1-fbc84437efec@leemhuis.info>
 <2023101752-canteen-uniformly-acc1@gregkh>
Date: Tue, 17 Oct 2023 09:44:38 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Thorsten Leemhuis" <linux@leemhuis.info>
Cc: "Philipp Hortmann" <philipp.g.hortmann@gmail.com>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Kalle Valo" <kvalo@kernel.org>, "Larry Finger" <Larry.Finger@lwfinger.net>,
 linux-next <linux-next@vger.kernel.org>
Subject: Re: [PATCH v2] staging: rtl8192u: Remove broken driver
Content-Type: text/plain

On Tue, Oct 17, 2023, at 09:20, Greg Kroah-Hartman wrote:
> On Tue, Oct 17, 2023 at 07:33:49AM +0200, Thorsten Leemhuis wrote:
>> On 14.10.23 23:10, Philipp Hortmann wrote:
next-next-all/builder-live.log.gz
>> 
>> Made me wonder if this patch left something behind; a quick grep showed
>> something suspicious in drivers/staging/Makefile:
>> """
>> obj-$(CONFIG_RTL8192U)		+= rtl8192u/
>> """
>
> If you did 'make oldconfig' the option should have been removed and then
> this line wouldn't have triggered, right?  Odd, but I'll go drop this
> entry as well.

It looks like "make clean" enters both the obj-y and obj-n directories,
unlike 'make vmlinux' or 'make modules', which only care about
obj-m and obj-y.

      Arnd
