Received: from flow-b8-smtp.messagingengine.com (flow-b8-smtp.messagingengine.com [202.12.124.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DED62FC00D
	for <linux-staging@lists.linux.dev>; Tue, 21 Apr 2026 15:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776784553; cv=none; b=RcOrO6y7cSctNhbUS/S+X1/6kVDZ3B+CIlMFfj4wBwXGVS5CuLdv/oAYL5mZI4FnnsiSODHSyJHbJnjgvHPMUTPjYp1yYCQ0S3TQ8Z5GfvyhIxHOrqVKxcK+XP/djPcRj6kAUjdL0jQQRONBMac0Qp7GT0Vs0B3F+W5xwfTIkd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776784553; c=relaxed/simple;
	bh=8mrN4bN+tTKP/b+cgiTjSuKjOVcjzz+sJwt4c1jEjN0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Am2Objsg3hkBdfNlQJFotC5mggSuMHTbupyCcvLsDripFBm053BpybL5Z6Ca1GeTpFQJt1hPnQTHKCA7FoL+LYHVquPfYOhP9+v8EDAFI1XBnT6Vpo+7xECPwy+dpkezDsXbobytWuRA7ZyhZ+k0RbEBZzBobTm0+dtgDHwABIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=matanco.space; spf=pass smtp.mailfrom=matanco.space; dkim=pass (2048-bit key) header.d=matanco.space header.i=@matanco.space header.b=uDOvp6EG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=rAOcWMzV; arc=none smtp.client-ip=202.12.124.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=matanco.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matanco.space
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=matanco.space header.i=@matanco.space header.b="uDOvp6EG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rAOcWMzV"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id 5037E1300FF2;
	Tue, 21 Apr 2026 11:15:50 -0400 (EDT)
Received: from phl-imap-04 ([10.202.2.82])
  by phl-compute-04.internal (MEProxy); Tue, 21 Apr 2026 11:15:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=matanco.space;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1776784550; x=1776788150; bh=5hRkprNE/Azhu7bRb97xzcB07WYgHkDI
	0fnntM4kSbA=; b=uDOvp6EGLJ2+X5QHBOyh7LIoMIbceAK4fnvJgIWQJJaJktEz
	I3OmGlpCjL4Xhkavwj9mpRyk/IfffQh9aZJSkumMfUN5NUZCu0XV+mKar5Nutido
	5DegxFQpH3y4UGabtjaWByZkBwOOwBDHRmDwR95d1IhKdC5Un2TyRudLcy9v1PcW
	LodmARImbKEmw8btu9dDy6WrqHkbQBKIXpI/V0SMXvdgI2WVs+jqfCj438OiUttX
	WOtrOElrnaqqf8ROriJztiq8N6LNL8rXJ23LPQ3opO1Xf7fM9zOKXKfXXjffMxHr
	/3UojxUN0+f8aQ3hfn4JdH8KExUJ4BDyirEJMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776784550; x=
	1776788150; bh=5hRkprNE/Azhu7bRb97xzcB07WYgHkDI0fnntM4kSbA=; b=r
	AOcWMzVfPxO5xCYtYt9bjr+EtqaLqfxfOD2aVkAXRXLLOzNReG8fok1G8IYCorI+
	Gpc69imjUaAyMLWhb+rJelGwkmClRsUiC0yRBDxVsKyLZxUQIGFvV8bLOI4YN0M9
	lMld5qdSX1PvGf8GJbU+w9EvnOuzEeLv7Eyeu9/OMF+0vHhfE5W1AqU+J/DnPhlA
	y8C8LhAi7BGe9cwdaqhEIZyvOYIVPXXAD5aIqsCgWaabrilUPhfqN+NifyiM+iaX
	ozgwPugewMwpKHA8qLnJBNaioIucG5AExhB6M4iQ5hdI9dvruY4bJy1qML+c9y8R
	Qu+wk1IeCfI9BxP8wbJMQ==
X-ME-Sender: <xms:pZTnaTrmjsasc46xMfHdtrWi2kpfJjCHCnfb_ORSKKUBpJzBbJLOUw>
    <xme:pZTnaYf2tlIpluRCdwY72ANrDy85rVMisW1RD67hH9kJhRejnNCp0MTrhpUVQ4PKk
    aONKm1z1j_newbJ-bOFy_8zmDkeOOXWVyOQ30set530v4TiREmaaQYI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeiudejfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertd
    ertdejnecuhfhrohhmpedfofgrthgrnhcuvehohhgvnhdfuceomhgrthgrnhesmhgrthgr
    nhgtohdrshhprggtvgeqnecuggftrfgrthhtvghrnhepgeelueelteffkedukeeujedvue
    ejffegteeggeehvedugfdvudduieelffeifefhnecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomhepmhgrthgrnhesmhgrthgrnhgtohdrshhprggtvg
    dpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepvghr
    rhhorhdvjeesghhmrghilhdrtghomhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugi
    hfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhsthgrghhinhhg
    sehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheptghhrhhishhtihgrnhdrgh
    hrohhmmhesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopehprghrthhhihgsrghn
    rdhvvggvrhgrshhoohhrrghnsehmihgtrhhotghhihhprdgtohhm
X-ME-Proxy: <xmx:pZTnaRvb-ZBBPWpfF7p47rUN7AciU_pXHZTM2l15q6GAxSGw3_brJw>
    <xmx:pZTnab-2wSF24qKjdXECUTSiOHUN5PC9LSVA0oVOO7eBCcSOjZuHkA>
    <xmx:pZTnaU0m1LjmVPUuiOsO8SG4_15gwLFzMGnDTtWGHk080MLBLcH_xA>
    <xmx:pZTnaYDWtWWxlpuQDO9007fbUwPF8l2vffdVEGV1Zb2lByaAltEGgw>
    <xmx:pZTnaS79bFK8LkNjjw7jjRbwVB3H1LzrEJYbrkEgZZA7FABuYb9hhfXb>
Feedback-ID: i07264b6d:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 927F8B6006E; Tue, 21 Apr 2026 11:15:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: Ak5BmpwIczT-
Date: Tue, 21 Apr 2026 18:15:29 +0300
From: "Matan Cohen" <matan@matanco.space>
To: "Dan Carpenter" <error27@gmail.com>
Cc: linux-staging@lists.linux.dev, parthiban.veerasooran@microchip.com,
 christian.gromm@microchip.com, gregkh@linuxfoundation.org
Message-Id: <eb5f1c7f-f363-49a0-9a3e-5bf8923ffca9@app.fastmail.com>
In-Reply-To: <aeY0vL0SEteMZUbz@stanley.mountain>
References: <20260420113503.62552-1-matan@matanco.space>
 <aeY0vL0SEteMZUbz@stanley.mountain>
Subject: Re: [PATCH] staging: most: video: replace BUG_ON with WARN_ON_ONCE and add
 recovery
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026, at 5:14 PM, Dan Carpenter wrote:                  =
                                                                        =
                                                                        =
                                                  =20
  > I always dread these kinds of patches...  The comment is useless.  W=
ay
  > too vague and kind of wrong also.  I want to see a much more thoroug=
h                                                                       =
                                                                        =
                                                    =20
  > explanation.
                                                                        =
                                                                        =
                                                                        =
                                                    =20
  Hi Dan and Greg's bot,                                                =
                                                                        =
                                                                        =
                                                                   =20
  =20
  First of All Thank you for the review and quick reply.=20
  This is my first time Contributing, I wanted to start with something w=
ell contained that I found using checkpatch.pl

My intention was twofold:                                               =
                                                                        =
                                                                        =
                        =20
                                                           =20
  1. Replace BUG_ON with WARN_ON_ONCE =E2=80=94 the kernel should not cr=
ash                                                                     =
                                                                        =
                                                            =20
     unconditionally here since the cleanup above already completed.
                                                                        =
                                                                        =
                                                                        =
                                                    =20
  2. Add a recovery path to drain any remaining devices and avoid a
     memory leak, in case something unexpectedly adds to video_devices, =
during the deregistration calls. =20
- I think that this was the original intention that lead the BUG_ON to b=
e there in the first place, but I am not entirely sure.                 =
                                                                        =
                                                                        =
                                    =20
                                                                        =
                                                                        =
                                                                        =
                  =20
                                                                        =
                                                                        =
                                                                        =
                                                    =20
  I'll resend as v2 with:                                               =
                                                                        =
                                                                        =
                                                    =20
    - The lock comments into a separate Patch                           =
                                                                        =
                                                                        =
                              =20
    - A Signed-off-by line (apologies for missing that, my bad)         =
                                                                        =
                                                                        =
                                                            =20
    - A more thorough commit message                                    =
                                                                        =
                                                                        =
                                                    =20
                                                                        =
                                                                        =
                                                                        =
                                                    =20
  Should I keep the recovery path with a better explanation, or drop it =
                                                                        =
                                                                        =
                                                    =20
  and use a bare WARN_ON_ONCE?                             =20
  waiting for your reply before spamming with random update, let me know=
 what you think?
                                                                        =
                                                                        =
                                                                        =
                                                    =20
  Regards,                                                 =20
  Matan Cohen
