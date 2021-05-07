Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466D12FBE
	for <linux-staging@lists.linux.dev>; Fri,  7 May 2021 11:42:37 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 3F6CB1208;
	Fri,  7 May 2021 07:42:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 07 May 2021 07:42:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm3; bh=xa9EytTXNe4F6STBf7lkFojE64R
	cVq2HCG6uGGnc5k0=; b=HvMdDQGJ1cbQohev3+Gmj53jAN69lnusQ+a7rxvCffh
	jDji3Ck6ycoWmHeIAl9gSqtZHNLJ/1gpPyyupukPly6e3whbUqUSaBkCpws9TEn0
	mSNDtmKQ4szumCifMHdkNgvr+LmbRhsOmJ+JCkCZq+96dC8b0bsfRyW3sosBhxLW
	oC57VNd7GX1gU9IcNm6hFpmMnnCnkd0DthFF/zYT8diMnnqLFMmH0C7DdoGOKC1+
	PZ6wztiGAKEUTgEpQg0Ud/+lC7rySFDaBQbNIuibVMQblReaXlfyK46v9YeALWyh
	GQN+CWO3RBu6dqW1QzIf7md7kd0ROk3/lR4Mc8/icxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=xa9Eyt
	TXNe4F6STBf7lkFojE64RcVq2HCG6uGGnc5k0=; b=nVL6XKldZY2nXtQ2J07TTt
	P4BwcMzTKwVXfhlhFmFAI1iLBEpWCiQX3PRKzirCXdQPhRxLVd9/PVVoRFNmdM7m
	vLUnXmIBKz6udN9kpszuwxQ1xM+3EeHt1UfGzoc6Ic32ZY/PZ0aCxGsYPh8G6woN
	0AgGnpSOQwKSMiF8ar0RgO21VlMzsDe1WqFnnfO9mwEPSnYjIGZZyJUEpYZVojM2
	dWztO532bByiHo66agU/KfY5yReB2gxIMCgHViAWbTfKiQaphD1M2/+aMUQJbGpR
	vZ+uEZ65vPSyN967ciN/5DzlacMAZ6gaxKsCTnkcBQRzfCJ8sk5lyYTuq4lRf5dA
	==
X-ME-Sender: <xms:qyeVYKyonZRfdFo9mrUjJ7E2GOZUAsAL1pFuAjOpUgA8wFs-CI5g9w>
    <xme:qyeVYGR1MduCOXTOLJBLXzPeoc1eBp_Clh9rTF3Pbew9STnE0FMqnTtMx4I2LIT0m
    CWNiB1qgg5JtA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegvddggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:qyeVYMUrF6u8rV7p6GG1hnHHALBWtY5TIitFHmdFcborAzw3SzIGFA>
    <xmx:qyeVYAgNsB697XokRY39kID0Jm2DO1Jt-5qEktRcM9UJRRakAT9tCg>
    <xmx:qyeVYMCATmzux2CdCYrt4rexrHCxvVUtkfO0YuWlshVAWqApjv1Qxw>
    <xmx:qyeVYF6xSEK_gnnACm_S5h_9vYpObLCgyDsmH9NqyDWJ-0pm51-stg>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
	by mail.messagingengine.com (Postfix) with ESMTPA;
	Fri,  7 May 2021 07:42:35 -0400 (EDT)
Date: Fri, 7 May 2021 13:42:32 +0200
From: Greg KH <greg@kroah.com>
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: Bouncing messages from linux-staging@lists.linux.dev
Message-ID: <YJUnqO8Dje/gZPEd@kroah.com>
References: <1620376201-3408-mlmmj-4f932172@lists.linux.dev>
 <20210507090826.GA2106@agape.jhs>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210507090826.GA2106@agape.jhs>

On Fri, May 07, 2021 at 11:08:27AM +0200, Fabio Aiuto wrote:
> Hi all,
> 
> On Fri, May 07, 2021 at 08:30:01AM +0000, linux-staging+owner@lists.linux.dev wrote:
> > Greetings!
> > 
> > This is the mlmmj program managing the <linux-staging@lists.linux.dev>
> > mailing list.
> > 
> > Some messages to you could not be delivered. If you're seeing this
> > message it means things are back to normal, and it's merely for your
> > information.
> > 
> > Here is the list of the bounced messages:
> > - 2608
> > 
> > 
> 
> what I'm supposed to do now if I'd want to retrieve the bounced message?

What do you mean by "retrieve"?
