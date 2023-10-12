Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A80C24A01
	for <linux-staging@lists.linux.dev>; Thu, 12 Oct 2023 11:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fyWT3MLE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29692C433C8;
	Thu, 12 Oct 2023 11:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697111229;
	bh=Os/rNYAUGPL9imcxx13LMUsomb2BE6SwhLERSQGYHhY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=fyWT3MLEW1gImBZOebPavwDqi8qE6hF1yUAbAy6IIPxDuxtOBsXzsEYb2jkWWXfgD
	 TZ/j4YZwEHDQIN3IaI8MRA6IF+gmYEUck2qy7B6+uUVKkU3iACYVdZrCJRkRwW9Ww4
	 yKGN65dkV5mHmyFWmOYoFo+L16YMw+hdk3RfcvWTbDjBzpx3JTzVX92IjXMLqtEj0i
	 +R1VOtRwueBgf2L4GcM6VVrsU9ca2DXyzxbbZdix49Aw9ZQpcTwxphQSiFWZ9Z6bou
	 eyMMmQ4aRjnJTRIEG7XQU4/HIA3zc4rb8uUawk143bDjCCviRZ4zdrwNFhNBeg/OYQ
	 38QyvtFWyTvXQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Arnd Bergmann
 <arnd@kernel.org>,  Arnd Bergmann <arnd@arndb.de>,  Nicolas Ferre
 <nicolas.ferre@microchip.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  Pavel Machek <pavel@ucw.cz>,  "David S.
 Miller" <davem@davemloft.net>,  Larry Finger <Larry.Finger@lwfinger.net>,
  linux-kernel@vger.kernel.org,  linux-wireless@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-staging@lists.linux.dev
Subject: Re: [PATCH] [RFC] wireless: move obsolete drivers to staging
References: <20231010155444.858483-1-arnd@kernel.org>
	<2023101051-unmasked-cleaver-79b3@gregkh> <87y1g94szz.fsf@kernel.org>
	<2023101139-pyromania-game-2237@gregkh> <87r0m1fwg9.fsf@kernel.org>
	<20231011080955.1beeb010@kernel.org>
Date: Thu, 12 Oct 2023 14:47:03 +0300
In-Reply-To: <20231011080955.1beeb010@kernel.org> (Jakub Kicinski's message of
	"Wed, 11 Oct 2023 08:09:55 -0700")
Message-ID: <87sf6g2hc8.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Jakub Kicinski <kuba@kernel.org> writes:

> On Wed, 11 Oct 2023 10:29:58 +0300 Kalle Valo wrote:
>> > No matter what the time frame is, it's never going to line up with all
>> > distros, or catch everyone properly.  
>> 
>> Yeah, that's true.
>> 
>> > I recommend, just delete all the ones you feel are not being used, in a
>> > patch that removes them one-by-one, so that it is trivial to revert if
>> > someone shows up and says "hey, my device stopped working!" a few years
>> > in the future.  
>> 
>> I'm starting to lean towards this as well. We have talked about this for
>> so long now but no practical solution ever found so maybe just bite the
>> bullet finally. What do others think?
>
> FWIW in Ethernet we do what Greg says. Delete it, if someone complains
> we revert back in. The revert did actually happen once, it was pretty
> painless (Greg even took it into stable tree, IIRC).

Thanks, good to know that you have had positive experiences with this
approach. As I didn't hear any concerns from anyone so I'm convinced we
should do this. I'm sure it will make my life a lot easier :)

Is anyone willing to submit patches? Use wireless-next as the baseline
for patches and one driver per commit, please. That way it's easy to
revert later, if needed (hopefully not).

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
