Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4AE1FD9
	for <linux-staging@lists.linux.dev>; Mon, 23 Oct 2023 13:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gOiJyFf5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEAA1C433C8;
	Mon, 23 Oct 2023 13:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698068720;
	bh=n95Zh41JGelr3O3p08QGkpOeR0lKk99ScJmZPITwFqg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=gOiJyFf58KDoI1EC+uvC5TLms/dSNPrL8X/ENM0gtmJt8gSaRROYUg8eoYeYA8MmI
	 cgHFl/ELTh3IVs2GHzBmW9CAy0eIjLZr3qgVOFqA9Cripw3UMpcZTeZODLYhC75OrI
	 YJewTnFvm5/SF3SkC9pl3Mcz3sCSy6eO4Q2gJP2eb7sdHNP3F6x0zEAgp/ooPf3eyr
	 b3AoITkafQvIhj4iN7rQutmE1lo1YjZJG1t8l9rZGvnXv1PWwGHgNYCzM1nwspVaiV
	 6RHuPi/t7XVs9Sem5+IEBnIg28qFeR2VGsqdU+1bKNQ/Pn5mGgLd1Rnr1DlDg4zxJe
	 VR6udzdAzs38w==
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
Subject: Re: [PATCH 00/10] Remove obsolete and orphaned wifi drivers
References: <20231023131953.2876682-1-arnd@kernel.org>
Date: Mon, 23 Oct 2023 16:45:13 +0300
In-Reply-To: <20231023131953.2876682-1-arnd@kernel.org> (Arnd Bergmann's
	message of "Mon, 23 Oct 2023 15:19:42 +0200")
Message-ID: <87v8axzc46.fsf@kernel.org>
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
> As discussed previously, a lot of the older wifi drivers are likely
> entirely unused, Though we can't know for sure.
>
> As suggested by both Greg and Jakub, let's remove the ones that look
> are most likely to have no users left and also get in the way of the
> wext cleanup. If anyone is still using any of these, we can revert the
> driver removal individually.
>
> I would suggest merging these for net-next after 6.7-rc1 is out

Why net-next? I want to take these to wireless-next to avoid any
conflicts with other wireless patches.

We could take these to wireless-next after we submit the last new
features (-next) pull request to v6.7, so most likely already next week.
So if anyone has any problems with these speak up now.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
