Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A923C061
	for <linux-staging@lists.linux.dev>; Wed, 18 Oct 2023 16:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="eWNED2WA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MEbXOTB7"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 206AA5C01A0;
	Wed, 18 Oct 2023 12:05:26 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 18 Oct 2023 12:05:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1697645126; x=1697731526; bh=z6
	3sUaFiPJx8x8hQuW48hDSHTo+vjWa2wUbwxAV1Kkc=; b=eWNED2WAGEPEdZc2a1
	Xb0pgjGoOWeuTpJIbej4F0e7HyPNaOrVCE8Ll+N3mO7CHGriyqPdCP98BaNd2aon
	E6J6qWX/COGYqqr4dr4EQBaTp1V3fbwWQTyvOTJjenxmOVFOa9uWdGiAyFXASB5M
	Qna7gjMO3/voztf0Vp7y8HwV8Xnb4f+OVkm3W6FLNH7QkuuZyeerc46VHSz/wH4N
	ACXmH5Rt806BKXsOcNjRW9MGhJCwjzHtHmbyMAh8/Liu9nEFaSHNS44X/ppSTfLP
	ITJvsA5YQd3TZIj1+M9qGeAY487LV+9y4CHNjFxcNFG+qThcdfIqLf5Q8TLIGeQy
	/wpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1697645126; x=1697731526; bh=z63sUaFiPJx8x
	8hQuW48hDSHTo+vjWa2wUbwxAV1Kkc=; b=MEbXOTB7m4ZJCU4mLVXauS9kxRLhP
	aLW8kckPt8xBEmVQ0BZynuwtA9M+mHNJE3auM4A2thBDTLFApPGBrdlOPJl7r9J5
	CxZYBJXEQy/uEmWZh+i//OJ87affFTDvNBYN93Tp++8QqYTiXR3kxoTQ5j9a0kl8
	I3Z4+Iz8iVyiHmpySezxjdW/hO1yK0vRKNlW3NMjuGghGdIV8n4ZzZvDQx89ujYl
	oMbKqKJY5TW4Vd+7fKsb+A8B3Okc3VIdfS1YnZ1DyJFdfsp98kmCkgAntfIgYsOH
	KTYGjYtOt2Be6g36DXRWiQsU3qeR3LJ7zKO8sXyUj8hB0eExjsCW0702w==
X-ME-Sender: <xms:RAIwZTiCBFOrbwQWAEhuCKuZXQaPWfUgl8h625zZSJN6gUX0FXM1BQ>
    <xme:RAIwZQDef0nDiotJi-70BiZSl_GPGyegjR_sc3jZzokVaxzKArRw5ldgrx_m8UF8c
    sot729YTTz_ito-heU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrjeeggdelgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:RAIwZTHeRcyvL4H54X9qmx3CBfjEKJr4HdpX2ftBUjJSwxemdrlj8Q>
    <xmx:RAIwZQQNb1fPW5BH7ilV-1MX0J9jHusF2SAlia1CVQXvV3OqLcH63A>
    <xmx:RAIwZQzn7bMTIASpLfLEfpuK9syToxRGYJRPjaIR6HhXMtwl24ZlkQ>
    <xmx:RgIwZbrX4PlxbGIybgU6JeFOJSxPwEuGm1HIiCmPWa5Qju8RLpi7tQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 30C8DB6008D; Wed, 18 Oct 2023 12:05:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1019-ged83ad8595-fm-20231002.001-ged83ad85
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <97e45bae-2489-4f04-b324-8359cfa15f4a@app.fastmail.com>
In-Reply-To: <08e266b5-cc6f-4428-bb50-11122a174e94@gmail.com>
References: <20231010155444.858483-1-arnd@kernel.org>
 <e93e4008-65c5-4f1d-812a-64b48f0513a2@gmail.com>
 <c8f43e1b-aed1-4b45-ba7c-d896ff66dfa7@app.fastmail.com>
 <08e266b5-cc6f-4428-bb50-11122a174e94@gmail.com>
Date: Wed, 18 Oct 2023 18:05:03 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Philipp Hortmann" <philipp.g.hortmann@gmail.com>,
 "Arnd Bergmann" <arnd@kernel.org>, "Kalle Valo" <kvalo@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 "Jakub Kicinski" <kuba@kernel.org>, "Pavel Machek" <pavel@ucw.cz>,
 "David S . Miller" <davem@davemloft.net>,
 "Larry Finger" <Larry.Finger@lwfinger.net>, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH] [RFC] wireless: move obsolete drivers to staging
Content-Type: text/plain

On Sun, Oct 15, 2023, at 20:42, Philipp Hortmann wrote:
> On 10/13/23 17:36, Arnd Bergmann wrote:
>> At the moment, I'd suggest focusing on the drivers that still use wext 
>> (git grep -w iw_handler_def drivers), if we can show that rtl8192e, 
>> rtl8712 or ks7010 have been broken for a while, removing those would 
>> help with removing wext altogether.
>
>
> Hi,
>
> __rtl8192e__
> this hardware is available on ebay 13 times.
> ping statistics:
> 1191 packets transmitted, 1191 received, 0% packet loss, time 1192169ms
> rtt min/avg/max/mdev = 0.633/2.184/74.792/3.157 ms
> maximum download 12,5 MByte/s
>
> __rtl8712__
> stick packard bell AW-NU120
> ping statistics:
> 678 packets transmitted, 652 received, 3.83481% packet loss, time 678287ms
> rtt min/avg/max/mdev = 0.943/4.835/231.435/17.900 ms
> maximum download 12,5 MByte/s
>
> I would like to remove the private functions as the "wireless tools" 
> package is deprecated. The following functions are available:
> kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$ iwpriv wlan0
> wlan0     Available private ioctls :
>            read32           (8BE0) : set   1 int   & get   0
>            write32          (8BE1) : set   1 int   & get   0
>            driver_ext       (8BE2) : set   0       & get   0
>            mp_ioctl         (8BE3) : set   0       & get   0
>            apinfo           (8BE4) : set   1 int   & get   0
>            setpid           (8BE5) : set   1 int   & get   0
>            wps_start        (8BE6) : set   1 int   & get   0
>            chplan           (8BE7) : set   1 int   & get   0
>
> What do you think about this?

Larry is the maintainer for rtl8712, so he'd be the one to answer
this. Out of the four drivers that are left using wext after
my current draft removal series, only ks7010 and rtl8712
use the private handlers, so in theory we could remove
the CONFIG_WEXT_PRIV first, but I'm not sure that makes
any difference if the plan is to convert all wext drivers
to cfg80211 anyway.

     Arnd
