Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7AC15E8A
	for <linux-staging@lists.linux.dev>; Mon, 23 Oct 2023 14:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qD+ozjaj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF551C433C8;
	Mon, 23 Oct 2023 14:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698072091;
	bh=N4If+wgwsD8dFTdUHEouchVNBSUFE+9hWZEa6Th40ts=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=qD+ozjajwsL/rFVAaZsugmIyEH3vwd5drmhXUIXfjLh1gKwHJWIN1dobJ88kx4Egh
	 RHA4m/cy5OiAXs+dPr2hUVPCKRKLzCsK4ipHu/V3SBzjatw9ibogQb9E3+cQVZZSnW
	 bhogHTKie9F8J4xFYhhGmRkymJ2uqsEoy6vRAmBgpTjNE6DooXvbMnRHTmt80js1v6
	 fUJE2AEkblMuFSj6kajAKMdP8frLSty/xG8TbjwDC7PenDxpsGKxWxCWhf0BxcJUWQ
	 N2wZvRaECSlzwYO5tL4q7HJCK+XVhR8pNAV7KKU/ZGN5RO8kx5lGbXFRPOluU7RHcB
	 A9gJHTEZj/aqA==
From: Kalle Valo <kvalo@kernel.org>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Arnd Bergmann" <arnd@kernel.org>,  "David S . Miller"
 <davem@davemloft.net>,  "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>,  "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>,  "Geert Uytterhoeven" <geert@linux-m68k.org>,
  "Geoff Levand" <geoff@infradead.org>,  "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>,  "Jakub Kicinski" <kuba@kernel.org>,  "Jeff
 Johnson" <quic_jjohnson@quicinc.com>,  "Johannes Berg"
 <johannes@sipsolutions.net>,  "Larry Finger" <Larry.Finger@lwfinger.net>,
  "Nicolas Ferre" <nicolas.ferre@microchip.com>,  "Pavel Machek"
 <pavel@ucw.cz>,  "Stanislaw Gruszka" <stf_xl@wp.pl>,  "Gregory Greenman"
 <gregory.greenman@intel.com>,  linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-staging@lists.linux.dev,
  linux-wireless@vger.kernel.org
Subject: Re: [PATCH 00/10] Remove obsolete and orphaned wifi drivers
References: <20231023131953.2876682-1-arnd@kernel.org>
	<87v8axzc46.fsf@kernel.org>
	<50eafe40-9c50-48e2-8d48-6a113c8fd87d@app.fastmail.com>
Date: Mon, 23 Oct 2023 17:41:24 +0300
In-Reply-To: <50eafe40-9c50-48e2-8d48-6a113c8fd87d@app.fastmail.com> (Arnd
	Bergmann's message of "Mon, 23 Oct 2023 16:10:16 +0200")
Message-ID: <87edhlz9ij.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"Arnd Bergmann" <arnd@arndb.de> writes:

> On Mon, Oct 23, 2023, at 15:45, Kalle Valo wrote:
>> Arnd Bergmann <arnd@kernel.org> writes:
>>
>>> From: Arnd Bergmann <arnd@arndb.de>
>>>
>>> As discussed previously, a lot of the older wifi drivers are likely
>>> entirely unused, Though we can't know for sure.
>>>
>>> As suggested by both Greg and Jakub, let's remove the ones that look
>>> are most likely to have no users left and also get in the way of the
>>> wext cleanup. If anyone is still using any of these, we can revert the
>>> driver removal individually.
>>>
>>> I would suggest merging these for net-next after 6.7-rc1 is out
>>
>> Why net-next? I want to take these to wireless-next to avoid any
>> conflicts with other wireless patches.
>
> My mistake, I actually rebased them on top of wireless-next before
> sending out the patches, I just forgot update the text I had
> already written a week earlier.

Ah, good that we are on the same page then :)

>> We could take these to wireless-next after we submit the last new
>> features (-next) pull request to v6.7, so most likely already next week.
>> So if anyone has any problems with these speak up now.
>
> Sounds good to me, thanks!

Thanks for the patches! I applied them to our pending branch for some
build testing, there were few conflicts I guess due to recent cleanup
patches but obviously easy to fix :)

https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git/log/?h=pending

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
