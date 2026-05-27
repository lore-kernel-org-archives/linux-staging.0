Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5189390CB7
	for <linux-staging@lists.linux.dev>; Wed, 27 May 2026 07:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779866836; cv=none; b=VxZlNOfqyxhhivlEluFHrNrK6x6bvt3dW4O0lBUL84YZdL+Vp3iHtQwWeECRgh8L3bTDLC6qM+MLSR1flWmaXyh4tB4UWjWDhsR2rbu1IPIbdrgXw3wrGgdEo8Qh4N9kFHN0a2dqPpp6U7XOjA7fYa/Ft5DTSEnrtMT1NAFn374=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779866836; c=relaxed/simple;
	bh=FCWLmotGAUG7mivgvxcuXQftMysm4kmYO01ABN9aWvc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=thvGlWQEWq5IkFB8b558yuwcbZg+Sj7aYGzjZNGMe3WrLmU3S0C3dGyVAs3wcd67olEuo9fMBX/8cwXGXtEifqtOjMkCorkoCo7juObRVSTWGtaZV2Dc/366KqzRf50ciHX+0tDK3f5O3/UVwi3channnm/0oMkwSTCA+NzKTRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luaberry.com; spf=pass smtp.mailfrom=luaberry.com; dkim=pass (2048-bit key) header.d=luaberry.com header.i=@luaberry.com header.b=e4cvL9sJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=U2mTsvYH; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luaberry.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luaberry.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=luaberry.com header.i=@luaberry.com header.b="e4cvL9sJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="U2mTsvYH"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 14E3714000A4;
	Wed, 27 May 2026 03:27:14 -0400 (EDT)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-03.internal (MEProxy); Wed, 27 May 2026 03:27:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=luaberry.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1779866834;
	 x=1779953234; bh=PfGLV7Ws0brqxMCOyba0XJH0DOzortoBXIBcAy+QCAk=; b=
	e4cvL9sJzcdvdtsTBD91YzoR6jcX0wmApvhBE0CIiHADWR3N6cNJg3OMburQY92w
	gug7i1g/rvSa6+njDg9SaHWkMkssYIBi3DwQQoIwIvX69ZcaC5Lai0HfxQLc6zci
	LkXuhyMb4Pjf2Ai1thzJzgzobojP8QPhCc4to4wSk5rzhObS5kU87EktW4WXOatz
	zcL6ZY1GPkUwyxozpLnaQSi3Rl1rnKGuXBenUlsGvL0gW3f2jQ1W6JlB6qnf9UQT
	TTIZsmI+Emf7yWUz5bIffZf8s3HptxC86ug9CcL+61ZHLWlRuzI8o5cHB7UfDnkW
	Hh3z5f8KFZQIekSqgVI/xQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1779866834; x=
	1779953234; bh=PfGLV7Ws0brqxMCOyba0XJH0DOzortoBXIBcAy+QCAk=; b=U
	2mTsvYHwY32E2mLAjaPdySIAr0zagVR8NC9KVNmidbA8fY+ZGJj+koiIwhtT3ySL
	Ge9et59ts3x0pW0Ec/bw7AT9g63Jhp669nFoWb6kTuH5Od9tkMN0SXpYNqi7/6cA
	4o7zvk5eNxo+ob+wLbZ4AS8aAPChJFDlMHOQiUhpoKsgRNlFneKrOaqoAtxDN930
	5DAJJa0Mz5FflcJ7BRqAKbPisl22f5whmR7qhVRaFaE8dLpo0ONTlBR0lDyVxIyM
	OlZwXdhROt/+IhLf3DyEjUdA7xhKvjE6U+d1lcOOYnOEgVqM5Mw32HiZD5yIdpFO
	L12DRZNM0sK+WnW5KdbXw==
X-ME-Sender: <xms:0ZwWaitRIfoZ-gGqDrhIeQqdYgl91E7GNnzXpBpCEb8F9WKrN3sjlg>
    <xme:0ZwWaiQFT2hSYNXelLbW5epTvKFj_HlvbtAAZIboXjBRjMNtAoZRrXgKBO7k597rS
    Pwa_bC8P2L89GKEna1Qu_oAvDVZLZwKqIJivQFXtTCzYoOKYNJw4tTs>
X-ME-Proxy-Cause: dmFkZTF1B4r9JBgrTHKMYG7llI+o5qEZ49NoDpiQhWOZKG5tLxz68CmNKYLaL510OjQh6r
    gTc01El4LeYC6iJ6TcqZOkYWI1MX4tUlYFIxPKO0mkmcGCx9pqNNMFQV9E23IjqxWGKNOm
    dvKP0vaRVs4wclSPh5KO/oOf9zwTA6WW2oiSDKOZANYiZSLmceMtFPUtlMAIpRWmAK9c3t
    T5EHmP261zTo4xUFNfGDjB3bUxGqS9sQPAmApbqJsJc75J/qJg84ByogyA0OJDx5wTl7Af
    MQrxMX4v/yFRDX51xgbCbIOYklmsHWzt0T4Gik7vgjj8jFkcJB2IYkdkOWW0tkxeV1chTt
    FC8bsTET+eTbYAOWNzZkIrRXkvEfDptiU+7wX2VD84GaLFjBKMDdZnRt+LPyOwFbagz/Oj
    2msWiJ/lXdyFGB6JCK+1cyh7T0fytcQMoeNCvlB10Zmjl7fdzMJfv7+tc+zIdnLp9CsZlW
    lT4ono4AiE+wVX08sC8bOKrSHPX3DCO0UpYxmZ3mknUMmy6+2v+aHSiDzAlK9Ae+yaC2WE
    WB9YOqIS/bmIxehwjSbtvNIpvyJX2a+kwfTrBoGgvbLo4LXNtEIpwa+L0c9lYZK0GvINk4
    EFPhDUeAUcGxCNlKK1e6/Qm15MevSpUi0rKhw0WYqFq7IMg2pO7m5QiJ9a6w
X-ME-Proxy: <xmx:0ZwWaiYZRMpjvc9UaiPo7HppoE8bJj6TEPEO1bydzsgV_svcpuFaCw>
    <xmx:0ZwWajpfF9PMHFblYOtrbPlBQZKmQCkfH9BPkboS7h0WZYz2zGC2IQ>
    <xmx:0ZwWamTrR-3TBXTtp37Gr0vM8QrVaagseEiws9mQHzQ_UJ-n6WIlow>
    <xmx:0ZwWanrkL1RrY8TsUz-i6zB3sD6Yh9SVFqaeO5Nj7xsx8bPZv5vEoA>
    <xmx:0pwWar0vuyA1pieOPpSGYrydbYIM50iDhzJCV7s7x6c7SPO5kIippKls>
Feedback-ID: i372e487a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B6D55C40071; Wed, 27 May 2026 03:27:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AjrM_5o9WqUJ
Date: Wed, 27 May 2026 16:26:53 +0900
From: "Jeongin Yeo" <jeongin.yeo@luaberry.com>
To: "Andy Shevchenko" <andy.shevchenko@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org,
 "Greg KH" <gregkh@linuxfoundation.org>, sakari.ailus@linux.intel.com,
 andy@kernel.org, matt@mattwardle.net, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Message-Id: <2b89e702-da24-4890-b0af-111dce7a7134@app.fastmail.com>
In-Reply-To: 
 <CAHp75Ve5Kntx5+mpr2hZCcFWda7GDUgME_G6c=1kRJJsYGt7eA@mail.gmail.com>
References: <20260526200222.330280-1-jeongin.yeo@luaberry.com>
 <CAHp75Ve5Kntx5+mpr2hZCcFWda7GDUgME_G6c=1kRJJsYGt7eA@mail.gmail.com>
Subject: Re: [PATCH v2] media: atomisp: remove function name from dev_dbg calls
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, May 27, 2026, at 2:26 PM, Andy Shevchenko wrote:
> __LINE__ is also provided.

You're right, __LINE__ is also redundant in dev_dbg().
I will send v3 shortly that removes both the function name and the line number.

Thanks for the review.

-- 
Best regards,
Jeongin Yeo
