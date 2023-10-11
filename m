Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC25199A0
	for <linux-staging@lists.linux.dev>; Wed, 11 Oct 2023 07:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AHixd93N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDCA8C433C8;
	Wed, 11 Oct 2023 07:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697009251;
	bh=03aSR9vRMyR6WZ4IDbMq/8rQA70nwzn1OKbYDhAxn34=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=AHixd93NgnbD0YCJeZq2fcEy2ebK/TS8VICXgDNmLSzi5dRPe8UA8+cWwHCtnMaHW
	 vMJBZjhZYK1KqZpV3P9DUn1ZnKUtuBokHyk1imkMlPPDwY655vi50wGWoiaHVFwluC
	 55PCrbs7BT+kk6x7LSnkN3PGlPA7pcGHi3qETw3TDTnlPo1ojFdlh30pInNNP5fPGq
	 6udcrSx+IGBvGZX7i6JiSFr02rTol2qEu4MLbcKvis8LH+H4oqwiKqyk+7z+/FG+5v
	 rJ3/twlRbCQNR4KwAzvAEYJLsV3gZczzKCPn/MM8yvlSy+rIb4BrGR4DnzmuGgzm20
	 vOpSrMbBTc3yw==
From: Kalle Valo <kvalo@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@kernel.org>,  Arnd Bergmann <arnd@arndb.de>,
  Nicolas Ferre <nicolas.ferre@microchip.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  Jakub Kicinski <kuba@kernel.org>,  Pavel
 Machek <pavel@ucw.cz>,  "David S. Miller" <davem@davemloft.net>,  Larry
 Finger <Larry.Finger@lwfinger.net>,  linux-kernel@vger.kernel.org,
  linux-wireless@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-staging@lists.linux.dev
Subject: Re: [PATCH] [RFC] wireless: move obsolete drivers to staging
References: <20231010155444.858483-1-arnd@kernel.org>
	<2023101051-unmasked-cleaver-79b3@gregkh> <87y1g94szz.fsf@kernel.org>
	<2023101139-pyromania-game-2237@gregkh>
Date: Wed, 11 Oct 2023 10:29:58 +0300
In-Reply-To: <2023101139-pyromania-game-2237@gregkh> (Greg Kroah-Hartman's
	message of "Wed, 11 Oct 2023 08:16:38 +0200")
Message-ID: <87r0m1fwg9.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:

> On Wed, Oct 11, 2023 at 08:40:00AM +0300, Kalle Valo wrote:
>
>> We (the wireless folks) have been talking about dropping legacy drivers
>> on and off for several years now. The problem is that we don't know
>> which of them work and which not, for example IIRC someone reported
>> recently that wl3501 still works.
>> 
>> Personally I would be extremly happy to remove all the ancient drivers
>> as that reduces the amount of code for us to maintain but is that the
>> right thing to do for the users? I don't have an answer to that,
>> comments very welcome.
>> 
>> I have been also wondering if I should add warnings like this to every
>> ancient driver to see if there are any users left:
>> 
>> "wl3501 wireless driver will be removed in 2024. If the driver still
>> works and you are using it send a report NOW to
>> linux-wireless@vger.kernel.org to avoid the removal."
>> 
>> But with the long release cycles the kernel and distros have I doubt
>> waiting for a year is enough, it should be more like three years.
>
> No matter what the time frame is, it's never going to line up with all
> distros, or catch everyone properly.

Yeah, that's true.

> I recommend, just delete all the ones you feel are not being used, in a
> patch that removes them one-by-one, so that it is trivial to revert if
> someone shows up and says "hey, my device stopped working!" a few years
> in the future.

I'm starting to lean towards this as well. We have talked about this for
so long now but no practical solution ever found so maybe just bite the
bullet finally. What do others think?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
