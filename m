Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A1B20EA
	for <linux-staging@lists.linux.dev>; Fri, 16 Dec 2022 16:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A293C433F0;
	Fri, 16 Dec 2022 16:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671206419;
	bh=IQQv4b61wWwH7FPOrFTJ+BEEpYvJhL/dStpDWPLYSeY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=L92uQR6NEfcqwdjGPuvZwBspyKvxgPal00paXGfAkj1oglvWbWuvBM0a/yVnS1QBi
	 zGgq6Mk6CymTYL80N+C5xwcED0kz4xj415KQkDHkFxzwfLKUffQ/7QZw2Qf7lOoOok
	 xEeDmHLfzwxdpdbNCVQHDdYy5+g8VJCYgACzVLMARhATJcxSw5Q6z08G+kgUPQen1r
	 7ulXuIMyXLavgQPWAmOt80iCoUq+LhgROIioavaQranMLqLA6sbGWVcgmjOPMKeEur
	 EqVqDNwHiZXHbRxaGNJGwYjV3JYAOI6okcbFAdpbrFAN2sPASmRLqqAiptq48WtXGz
	 6bUd08VdTmS6w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EC17FC00445;
	Fri, 16 Dec 2022 16:00:18 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver changes for 6.2-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <Y5wv3SDxQMwtuKvx@kroah.com>
References: <Y5wv3SDxQMwtuKvx@kroah.com>
X-PR-Tracked-List-Id: <linux-staging.lists.linux.dev>
X-PR-Tracked-Message-Id: <Y5wv3SDxQMwtuKvx@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.2-rc1
X-PR-Tracked-Commit-Id: 37aa6b98237082a4bf882b4d986329b94ebd447d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b83a7080d30032cf70832bc2bb04cc342e203b88
Message-Id: <167120641896.30725.12946476742763105184.pr-tracker-bot@kernel.org>
Date: Fri, 16 Dec 2022 16:00:18 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 16 Dec 2022 09:44:13 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.2-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b83a7080d30032cf70832bc2bb04cc342e203b88

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
