Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E174D10964
	for <linux-staging@lists.linux.dev>; Mon, 30 Oct 2023 16:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IIWebl7J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4C1BC433C7;
	Mon, 30 Oct 2023 16:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698684960;
	bh=7+7vRhXHb5QjQwut8OzZIttdLSOWtUI77jnd6XpGSc4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=IIWebl7JgzJnu8OG5ttQkIo9V8/m9IvZLf/StWmZgBfxWD9jeT/YVvjLlXZfhgH5s
	 kcR75Po7P1yB1jcFGhWlpFs8RJPPacFX/rmewlstO3kP0siwx/qbB4jQOiFti4A1q9
	 mj5sFcZTYPJdkXJUR9RzanWW8/4aH1Fc89jjzSPAm5qL82K+88AKpP6KzuaKfvZF0p
	 LBDvpLeLTlGahSrdM2KKfAxUYXzDb7pveOMwWUA6aCOvlx/g0jv+JMIR1jXkjoiXF4
	 biqdLLSyukbxjK+7wnxw9qisV1bQJWTmHVyChAGrn3htbVw+xF9A9w2OD9yjg+4PBH
	 AtbosC34rrQWA==
From: Kalle Valo <kvalo@kernel.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: arnd@kernel.org,  Larry.Finger@lwfinger.net,
  alexandre.belloni@bootlin.com,  arnd@arndb.de,  claudiu.beznea@tuxon.dev,
  davem@davemloft.net,  geert@linux-m68k.org,  geoff@infradead.org,
  gregkh@linuxfoundation.org,  gregory.greenman@intel.com,
  johannes@sipsolutions.net,  kuba@kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-staging@lists.linux.dev,  linux-wireless@vger.kernel.org,
  linuxppc-dev@lists.ozlabs.org,  nicolas.ferre@microchip.com,
  pavel@ucw.cz,  quic_jjohnson@quicinc.com,  stf_xl@wp.pl
Subject: Re: [PATCH 00/10] Remove obsolete and orphaned wifi drivers
References: <20231023131953.2876682-1-arnd@kernel.org>
	<20231030071922.233080-1-glaubitz@physik.fu-berlin.de>
Date: Mon, 30 Oct 2023 18:55:53 +0200
In-Reply-To: <20231030071922.233080-1-glaubitz@physik.fu-berlin.de> (John Paul
	Adrian Glaubitz's message of "Mon, 30 Oct 2023 08:19:22 +0100")
Message-ID: <87cywwvyli.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de> writes:

> There is some non-x86 hardware like the Amiga that still uses
> PCMCIA-style networking cards on machines like the A600 and A1200. So,
> unless these drivers are actually causing problems, I would rather not
> see them go yet.

There is a cost maintaining these drivers so I would like to see more
information in the report, at least:

* exact driver and hardware used

* last kernel version tested

* kernel log messages from a successful case

Here's a good example:

https://lore.kernel.org/linux-wireless/20231024014302.0a0b79b0@mir/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
