Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565FF72
	for <linux-staging@lists.linux.dev>; Sun, 16 May 2021 17:20:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D44C561152;
	Sun, 16 May 2021 17:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1621185603;
	bh=5lOjwH2z46TugIK+WkNs76901KMjjXkpXmBfZ3tC7ZY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=jhkz0ARq/U38TIcbkU1HOLSF1wvoQdD+oBVdZm6RUQMc87U3D0KcXM6c2mpN+4jcR
	 Qvn3p44VZRODeqiRz6fLbfGba7tV+59dj+dmkeXdjRMAvJtBluncH2lFb1KqsCkWBL
	 0XDgRrX+4cXezb2uiqMIQ/AVcpptH0FwucT2YKOsYQc8K2fErwHjTl3c6RxdSNLshV
	 GTzhWepMSOY1t/ImaO/JvUFe5tbdIVgatR0IHWn2Rz2rdwHNcpJChjFzYNUD7hAS76
	 xyjtWSOt3/XirqepIbXr2TEBVP4jjT3vpeIlH/sKHNwazYOVNLY74U7w1Azyr7gZl1
	 xl3MQFVEXf1Sw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C926260A4E;
	Sun, 16 May 2021 17:20:03 +0000 (UTC)
Subject: Re: [GIT PULL] Staging/IIO driver fixes for 5.13-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <YKDfI+xY2SCpC4Ot@kroah.com>
References: <YKDfI+xY2SCpC4Ot@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YKDfI+xY2SCpC4Ot@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-5.13-rc2
X-PR-Tracked-Commit-Id: ba9c25d94dea1a57492a606a1f5dde70d2432583
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6942d81a8faa17d44d1286b63ccb7d920b29d065
Message-Id: <162118560381.27926.6986980324945803244.pr-tracker-bot@kernel.org>
Date: Sun, 16 May 2021 17:20:03 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, devel@linuxdriverproject.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The pull request you sent on Sun, 16 May 2021 11:00:19 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-5.13-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6942d81a8faa17d44d1286b63ccb7d920b29d065

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
