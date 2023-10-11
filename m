Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF88479F2
	for <linux-staging@lists.linux.dev>; Wed, 11 Oct 2023 08:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dIvhcxJL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70EDDC433C7;
	Wed, 11 Oct 2023 08:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697013845;
	bh=dd+UyXR1Az0fXvBPCAsefm8xWqDo7U7mAoE7+i7ryUE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=dIvhcxJLLadwnP7CezapgQe2im9mEM3TP/AijgNT/ZsH9TFSKOcFzdqhAcy1jy8UI
	 iM5xhmQ3NyeKbQAbugNyzd7NWp7WC/V7j7dLKQKshgw9VQI/aWWxx+bCmUZF7A9C3u
	 /E3J1to57u2h9PetDUpbkFjbdoAGAuwfUHOhb/cqm0wWAHrw6wcJUu5uPrAJhHWYJl
	 PAA/4AtfQ3Kc27tZjvO8n7uXIj78NJhUA/6ARVjOajhYx5I+Sr9Kd9XYe8lxWhYsDf
	 pNUNi9gAFcWpCSoceUhogcF4HrR5hXvfPJFj9xlDHZR765EeQwURSGc7kTCkVjCrgi
	 MGsQibLj2IOMg==
From: Kalle Valo <kvalo@kernel.org>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,  "Arnd Bergmann"
 <arnd@kernel.org>,  "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
  linux-kernel@vger.kernel.org,  linux-staging@lists.linux.dev,
  linux-wireless@vger.kernel.org,  "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>,  "Pavel Machek" <pavel@ucw.cz>,  "Jakub
 Kicinski" <kuba@kernel.org>,  "David S . Miller" <davem@davemloft.net>,
  linux-arm-kernel@lists.infradead.org,  "Larry Finger"
 <Larry.Finger@lwfinger.net>
Subject: Re: [PATCH] [RFC] wireless: move obsolete drivers to staging
References: <20231010155444.858483-1-arnd@kernel.org>
	<2023101051-unmasked-cleaver-79b3@gregkh> <87y1g94szz.fsf@kernel.org>
	<d081871c-977c-43e9-afa3-a3c3e5880fea@app.fastmail.com>
Date: Wed, 11 Oct 2023 11:44:00 +0300
In-Reply-To: <d081871c-977c-43e9-afa3-a3c3e5880fea@app.fastmail.com> (Arnd
	Bergmann's message of "Wed, 11 Oct 2023 09:24:55 +0200")
Message-ID: <87r0m14khb.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"Arnd Bergmann" <arnd@arndb.de> writes:

> On Wed, Oct 11, 2023, at 07:40, Kalle Valo wrote:
>> Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
>>
>> We (the wireless folks) have been talking about dropping legacy drivers
>> on and off for several years now. The problem is that we don't know
>> which of them work and which not, for example IIRC someone reported
>> recently that wl3501 still works.
>>
>> Personally I would be extremly happy to remove all the ancient drivers
>> as that reduces the amount of code for us to maintain but is that the
>> right thing to do for the users? I don't have an answer to that,
>> comments very welcome.
>
> I had a look at what openwrt enables, to see if any of the drivers
> in my RFC patch are actually enabled, if anything supports legacy
> embedded devices with these it would be openwrt. The good news here
> is that openwrt intentionally leaves WEXT disabled, and none of them
> are still in use.

I don't think openwrt is a good metric in this case. These drivers are
for 20+ years old hardware, most likely running on really old x86
laptops. So the chances of them running openwrt on those laptops is low
and I would expect them to run more traditional distros like debian or
ubuntu. But of course this is just guessing.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
