Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2C9A473
	for <linux-staging@lists.linux.dev>; Fri, 18 Nov 2022 20:21:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF282C433C1;
	Fri, 18 Nov 2022 20:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668802859;
	bh=6iI6TvYDawwQ+2kytuwWuZn2a5xW2H0B1LFfTmKXJ2A=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=UwGRl7CXPTP0FPvwDnorxjWqLY9+PzwfCikhLflRCOZJnbkts8OcytEUukc6Gp+F5
	 S0/gsE0Djbip4swUHerFOK87y7T3U9lJknBUnneJ+dbssss5tm6pTE6Y/ZDNlFisQa
	 +XB/bLqRv6RiIhm6Tm3tdDVQl9CWUb2YL6d1BdyHBRu0cK435zwAKFjnZPlDmk6o8V
	 tLAxs1Fjr6u7Js16f8M1yPTVttFd+6P5MW7KWtLvATxg4kgpmtG2AGZLH2AM16R/PN
	 DTij+el3pN/GirmS2rxpuRpT1CmTzUreQhA/ExiGIlV7WNIdlNBD1vDtTR7ib/uhRP
	 5axAPzZxG2UDw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BE226C395F3;
	Fri, 18 Nov 2022 20:20:59 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver fix for 6.1-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <Y3fJ4o2sEO7Kef0y@kroah.com>
References: <Y3fJ4o2sEO7Kef0y@kroah.com>
X-PR-Tracked-List-Id: <linux-staging.lists.linux.dev>
X-PR-Tracked-Message-Id: <Y3fJ4o2sEO7Kef0y@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.1-rc6
X-PR-Tracked-Commit-Id: 937ec9f7d5f2625d60077bb7824fee35dc447c6e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 12fe29ee259f9a14fba4c593eff55b851ef264fe
Message-Id: <166880285977.9331.8704744718538007263.pr-tracker-bot@kernel.org>
Date: Fri, 18 Nov 2022 20:20:59 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 18 Nov 2022 19:07:30 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.1-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/12fe29ee259f9a14fba4c593eff55b851ef264fe

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
