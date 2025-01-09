Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AF5204F87
	for <linux-staging@lists.linux.dev>; Thu,  9 Jan 2025 21:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736457605; cv=none; b=tDpNSpv8vQ2SfSRjG2B13RbHDNAtOPfFeZoAI+gH+uArLDSDoGXUDuj/lC+xQsDJukcsJJkteXDuHApy0XRY2wuD8st5C2HWG3lNPzZw+xKdsFLe2Vs2q0Xk90dCVZKuIr4QMOlErx1B7JsTplm9uAyd7AuZf+TganfFN27v5JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736457605; c=relaxed/simple;
	bh=JGOZhhpbyCfDN/9Xrz2pkBHVoox1t8wClBJhJ4lp2us=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=EVamivVFelMiP2PFkQXpbBZt7jCryzYfHwN+Uy5dmbT6uHXoOLQ1/oDKKcxdEA8claPlrFhjT2xEjqQ6VT6ZKv5KuqY9dzH5VOPJ4ykkhkLh+jWuXVJSvtU/ZnUllCRMvJs5Gi7f7iAk+67wCGoXWLLpa8aRS5nvDyJ4aLM9TNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=EEFxhox4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=yho5vNAL; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="EEFxhox4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="yho5vNAL"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5E8B61140189;
	Thu,  9 Jan 2025 16:20:01 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Thu, 09 Jan 2025 16:20:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1736457601;
	 x=1736544001; bh=4rYywIFlX5tglOBosPGQKvmhJHc/91ohsG2X2oVWsZM=; b=
	EEFxhox4yyR6UouD7fzSctguFu4w5VKaRSMXfNVtKTepYQUz2I3kbFX6MIZ9qT3t
	b2cGeet9vDH5c6v/JxudVmWsSeI5Ner6IpSfAK5h0NhBbf/g4Xk2UvwmTDehMaT6
	1Lg3wFjkUuAbprIoRoqsCXfxqbH/hLQYS01zpxKRW3dl65yvF8alszlv+43zXAF7
	RwBgH/JR0YZqlHJS/J8XAa42HQFJw7OQrRgI/0Vzt3gdOsnTtlIlLPOOQpJkR3j9
	Erw2e3fkzWSlzCJaiI68dcOelWOGuvUTiZ9rMIsmV8mmXsaYG39xXYeFyMDBmbmY
	nJ2FhIGkBvOZrm1YuXEggw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736457601; x=
	1736544001; bh=4rYywIFlX5tglOBosPGQKvmhJHc/91ohsG2X2oVWsZM=; b=y
	ho5vNALDTd2a3UQZXnZAPRR5MlEHi7D8EuZ1uVq/hC7M+SwrqVgYnJRtMxOS+lXg
	ZAFugHEj7+q6FleuNIyDADtt6QXB+Ox+EgpjlULmHREKvDsjB3FAqA2Ikc3EZzzF
	ospyX8FyK2d3KKcBoD1HBqBlvAjVQwwqDQy99bkZD0cPG0vAI5156MQIIsg3WuPw
	wlCnGDEoy+etIBadikqvrpr1D77d2THlljHPjSZKPSuTCYesEG8vfaGBD8qkTLal
	WdRutKcSrU0g75blkOKt7oe4V53X4Idv6HFQROkV8IjM+Hj0OAcoJwllyg2dHdEv
	2juHaIM1eorZxqwzXcv5A==
X-ME-Sender: <xms:gD2AZzZW-ZouQCKYFDzwp6SRXR_0Zuojz0BGXZFtID5lM2LfPA4o1A>
    <xme:gD2AZyZVXJVo37tOg51YEHmC5KvdAghn26Lwh-mqBCLfbSdqqzi5vdt15PEU1Upz-
    FfJ1sr00FpeofDo1jY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegiedgudeggecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpeekvdeuhfeitdeuieejvedtieeijeefleevffef
    leekieetjeffvdekgfetuefhgfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegr
    rhhnuggsrdguvgdpnhgspghrtghpthhtohepuddvpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehnihgtohhlrghssehfjhgrshhlvgdrvghupdhrtghpthhtohepphhhihhl
    ihhpphdrghdrhhhorhhtmhgrnhhnsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhoug
    hrihhgohdrghhosggsihdrjeesghhmrghilhdrtghomhdprhgtphhtthhopehjuhhsthhi
    nhhsthhithhtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehjohhhrghnnhgvshdrsg
    gvrhhgsehinhhtvghlrdgtohhmpdhrtghpthhtohepmhgrshgrhhhirhhohieskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepuggrnhdrtggrrhhpvghnthgvrheslhhinhgrrhhord
    horhhgpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdho
    rhhgpdhrtghpthhtoheplhhinhhugidqshhtrghgihhngheslhhishhtshdrlhhinhhugi
    druggvvh
X-ME-Proxy: <xmx:gD2AZ1-9OPfa0UHafHVgrZfdeVmmHNWKMCbwBaMJa5PRGobzy_pKFg>
    <xmx:gD2AZ5pnw3dT5fzCl-8eZC6iqNNnyTt-_gPfWnBNwvHTUAG-7R9GaA>
    <xmx:gD2AZ-o8g9fu75XIjep5DMc7XjKQXq6shPoMwyJAqo1XJ3C-DM_zhA>
    <xmx:gD2AZ_THOUBP6pHfCIvhpMeyoDAGstApB6rzVNWlmz2xwBs4GOun1Q>
    <xmx:gT2AZ7S_YRtJRa-NLqbWfPCFZ0cFpu7nM_vZXKBDErCxGvmtnFxS6oRs>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 535FC2220073; Thu,  9 Jan 2025 16:20:00 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 09 Jan 2025 22:19:40 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: Yeking@red54.com, linux-staging@lists.linux.dev
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Philipp Hortmann" <philipp.g.hortmann@gmail.com>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 "Nicolas Schier" <nicolas@fjasle.eu>, "Hans de Goede" <hdegoede@redhat.com>,
 "Rodrigo Gobbi" <rodrigo.gobbi.7@gmail.com>,
 "Dan Carpenter" <dan.carpenter@linaro.org>,
 "Justin Stitt" <justinstitt@google.com>,
 "Johannes Berg" <johannes.berg@intel.com>, linux-kernel@vger.kernel.org
Message-Id: <aeadd5b3-c187-4800-ac1f-fe2b53bfb3f7@app.fastmail.com>
In-Reply-To: <tencent_E4A835D41FF1F35C7BDFCF4EA0136D548F06@qq.com>
References: <tencent_E4A835D41FF1F35C7BDFCF4EA0136D548F06@qq.com>
Subject: Re: [PATCH] staging: rtl8723bs: Remove ioctl interface
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025, at 14:20, Yeking@red54.com wrote:
> From: =E8=B0=A2=E8=87=B4=E9=82=A6 (XIE Zhibang) <Yeking@Red54.com>
>
> Wireless drivers should not use the ioctl interface, so remove this
> interface for the rtl8723bs driver. (found by code inspection)
>
> Fixes: 8bfb36766064 ("wireless: wext: remove ndo_do_ioctl fallback")
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Signed-off-by: =E8=B0=A2=E8=87=B4=E9=82=A6 (XIE Zhibang) <Yeking@Red54=
.com>
> ---
>  drivers/staging/rtl8723bs/Makefile            |    1 -
>  .../staging/rtl8723bs/include/osdep_intf.h    |    2 -
>  .../staging/rtl8723bs/os_dep/ioctl_linux.c    | 1286 -----------------
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c   |    1 -
>  4 files changed, 1290 deletions(-)
>  delete mode 100644 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c


Thanks for picking this up again. I had done a complete removal
of ndo_do_ioctl a while ago but hadn't gotten around to finishing
the upstreaming. For my older patches, see
https://lore.kernel.org/all/20231009141908.1767241-7-arnd@kernel.org/

Your version is very similar but seems to miss a couple of stale
data structure and function declarations. Can you make sure you
include all those?

       Arnd
