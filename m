Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1511B288
	for <linux-staging@lists.linux.dev>; Mon, 23 Oct 2023 14:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qQjhSgSZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 256C7C433C7;
	Mon, 23 Oct 2023 14:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698071767;
	bh=PgA9yYa6/1qxru0Rwr8SOL4n9Sf+KY4AdlDhFZNeRMo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=qQjhSgSZxVDSNrUricToBpOO3r3/9HPO9ePt28aLe38EMuSbiPvh0DhTtdiZt8DKb
	 zccwbQRXYv7h1SjVPXd+UphUB4VILi6IE0ef/Jkpf14TinQSLXWHSeg1KNGKZlGKdO
	 qUPTnR5EwpEQOYod9oelcttVvxy2u8hinktsyJNfh6eVdJ8aPD5hfQisqosvKojUQG
	 s89phH1sbMPTAH5f61vmorwhTOeop64y9KNMHJEaAYKBLRVJ2+mAsiMTUv4cjo5tZH
	 MD1WPybZUAYpoiJZgnv8d32NDcnx73frJGkJDJswEYZjFVVWqdMGI8b1ndc4MtJw14
	 Op5z3rREu0YVA==
From: Kalle Valo <kvalo@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,  "David S . Miller"
 <davem@davemloft.net>,  Alexandre Belloni <alexandre.belloni@bootlin.com>,
  Claudiu Beznea <claudiu.beznea@tuxon.dev>,  Geert Uytterhoeven
 <geert@linux-m68k.org>,  Geoff Levand <geoff@infradead.org>,  Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,  Jakub Kicinski
 <kuba@kernel.org>,  Jeff Johnson <quic_jjohnson@quicinc.com>,  Johannes
 Berg <johannes@sipsolutions.net>,  Larry Finger
 <Larry.Finger@lwfinger.net>,  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Pavel Machek <pavel@ucw.cz>,  Stanislaw Gruszka <stf_xl@wp.pl>,  Gregory
 Greenman <gregory.greenman@intel.com>,  linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-staging@lists.linux.dev,
  linux-wireless@vger.kernel.org
Subject: Re: [PATCH 04/10] wifi: remove obsolete hostap driver
References: <20231023131953.2876682-1-arnd@kernel.org>
	<20231023131953.2876682-5-arnd@kernel.org>
Date: Mon, 23 Oct 2023 17:36:00 +0300
In-Reply-To: <20231023131953.2876682-5-arnd@kernel.org> (Arnd Bergmann's
	message of "Mon, 23 Oct 2023 15:19:46 +0200")
Message-ID: <87msw9z9rj.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> HostAP is an ISA/PCMCIA style 802.11b driver supporting only
> wireless extensions, and some custom ioctls (already removed).
> Some devices include a legacy PCI bridge but no DMA.
>
> The driver was marked obsolete in 2016 and is highly unlikely
> to still have any users.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

This patch didn't make it to the list, I guess it was too big. But it's
available from the pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git/commit/?h=pending&id=39ed2ce3bdc43bc9dbed65608d98828f21b9f33d

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
