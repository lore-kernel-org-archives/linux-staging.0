Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE0072
	for <linux-staging@lists.linux.dev>; Wed,  1 Sep 2021 16:52:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6E61060E98;
	Wed,  1 Sep 2021 16:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630515123;
	bh=T+4sluKSoKgjkdQ7wWIDcExSljgArqcFTueJwqyFE8w=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=T0hs+5NA6U6T3hV2OJ/97tCoub+BrVQl7E3PFiZbAllP/Hy2krGyDYTT8WMIlMCcm
	 N/WJCd+DiCqT4Nsdy7GW0L0DGd1+huncV3WqQ2/qVFd80CvyI1Dyk4KkvGleC4gKNT
	 5VJ6s/qq085uw3LF8CmaxRni415wL1K1rwZMV4Rqloc1lv8KHyzy9/Poz9L/xoZ7aE
	 Ba2lYnPSu1K5qgYQXZfIlNblM8e5GecuGhZIUAz6hegKz2NFFoZXbkebfudQj5tyXV
	 jpliSrMnZwfRZusoWbJXxukPYNlBI6AKt+l6TVuoB0DDNkdvVJtXMiubWSXoxAeHqc
	 YFnGda3KErZCQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5E744600AB;
	Wed,  1 Sep 2021 16:52:03 +0000 (UTC)
Subject: Re: [GIT PULL] Staging / IIO driver changes for 5.15-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <YS+LXqoDGk0CqU1Q@kroah.com>
References: <YS+LXqoDGk0CqU1Q@kroah.com>
X-PR-Tracked-List-Id: <linux-staging.lists.linux.dev>
X-PR-Tracked-Message-Id: <YS+LXqoDGk0CqU1Q@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-5.15-rc1
X-PR-Tracked-Commit-Id: 4adb389e08c95fdf91995271932c59250ff0d561
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ebf435d3b51b22340ef047aad0c2936ec4833ab2
Message-Id: <163051512332.18728.3117437173081787944.pr-tracker-bot@kernel.org>
Date: Wed, 01 Sep 2021 16:52:03 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The pull request you sent on Wed, 1 Sep 2021 16:17:02 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-5.15-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ebf435d3b51b22340ef047aad0c2936ec4833ab2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
