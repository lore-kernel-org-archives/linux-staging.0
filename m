Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1121872
	for <linux-staging@lists.linux.dev>; Sun, 10 Jul 2022 16:54:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DB95DC341CB;
	Sun, 10 Jul 2022 16:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657472073;
	bh=RJe/F30zDTkTLJyR+NnWcBME6RAAeRXwMeQamdFA1sA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=DbLupJAw0EbQoES8OOX7gmWtkXDk+GPNrP8VPviYPq4yOmWDgZp7vg9CqB69myB+B
	 0rV3BPKZSHYx8/KKdF6HlYEL6rn4JvUudEoJPauysRE7rnl6LhjgoI+eqR95ubaRD6
	 YwulSd8from3Ws/CbgyrhFvOzTUzY+U2q/0t7gobN6VT4F6+Dk9fUG7+cZ9LwZEuvA
	 MwM9ifekfjWPX37VgRIVa2Jn4WYil9YHQFz7/mSfy0CyrEaeM7I5lGEcBy6eM4lXmw
	 d+ZU10FWf+p0l0/O8MNoNvY1u0a6A/GhFoLX30qLrRJA1MZUFuhlU5K+IM4JMdy9Uo
	 xS8O1mNH6ZqGA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C4BF3E45BDE;
	Sun, 10 Jul 2022 16:54:33 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver fix for 5.19-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <YsrujMflc51TazvD@kroah.com>
References: <YsrujMflc51TazvD@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YsrujMflc51TazvD@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-5.19-rc6
X-PR-Tracked-Commit-Id: ee6c6e7342471d468096a16bee9f89b5a6c1e39d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5867f3b88bb54016c42cdde510c184255488a12b
Message-Id: <165747207380.29896.8445048268539269693.pr-tracker-bot@kernel.org>
Date: Sun, 10 Jul 2022 16:54:33 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The pull request you sent on Sun, 10 Jul 2022 17:21:48 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-5.19-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5867f3b88bb54016c42cdde510c184255488a12b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
