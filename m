Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FDA1FDA
	for <linux-staging@lists.linux.dev>; Sun, 30 Jul 2023 19:43:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0ECE2C433C8;
	Sun, 30 Jul 2023 19:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690746202;
	bh=TILF9ej47mqRp4rGw2g6VV1kTHmlhHa+sMf2UgGEFOk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Pw8OrE4ycgE4srerTVJF4Fgps2pBO7pQ4OOEsdyjU91p7+tWpUZwXyM57gHvadtXd
	 wAhBEtzTq7uXfiYZJ96jD1zH6z3g2x8+vP8Gc8PTqy+SfOq3Y/ah3StX43v6K59GBr
	 sg9HysSjkgye9QSrdxOsooKXxf4r+ot9122J5TiH8AhrxbGkhbMHDq4a5Q+R7LvMoR
	 ep2U7QUf7h2Dr63XVCYz2LZppVJ+iqzInBQ9LLP3hINk4vVDM3v54o9k79Vg8xf/B7
	 KhtmGcnwwBRqhwcliRHwBb6oDQkdrUKtfaIxLyVZ4qAnJuQkZy/4VIYiQgZ6MMUspU
	 jFZNobkI5A0aw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F0D05C43169;
	Sun, 30 Jul 2023 19:43:21 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver fixes for 6.5-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZMZEZev25nzJoNaM@kroah.com>
References: <ZMZEZev25nzJoNaM@kroah.com>
X-PR-Tracked-List-Id: <linux-staging.lists.linux.dev>
X-PR-Tracked-Message-Id: <ZMZEZev25nzJoNaM@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.5-rc4
X-PR-Tracked-Commit-Id: 5f1c7031e044cb2fba82836d55cc235e2ad619dc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3d6b77a8d4b4603c243ab2ee0f04f74f122d576a
Message-Id: <169074620197.25913.5628028497946296547.pr-tracker-bot@kernel.org>
Date: Sun, 30 Jul 2023 19:43:21 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The pull request you sent on Sun, 30 Jul 2023 13:07:17 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.5-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3d6b77a8d4b4603c243ab2ee0f04f74f122d576a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
