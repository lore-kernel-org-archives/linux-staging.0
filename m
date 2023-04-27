Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18878C2CB
	for <linux-staging@lists.linux.dev>; Thu, 27 Apr 2023 19:20:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4974C4339B;
	Thu, 27 Apr 2023 19:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682623206;
	bh=sS4bUyfgg8PGDGHCj1u7YHlEQYWpHacmL+PeSq65mvw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=URUzk60G6uDx3evCVXLK1A8jyxpi946MWQPgYm66vwFBAyCdu0VprSeab5RgQs8yE
	 ujXKIUZt6Cs9hMj83v3GrY0nYmQGyVfX9to1l2H8pGFhGV+Llpht1UuLIFAEPxWrHs
	 /ayadE0NuOrj5zZ7Dk6ocJnjLp8n+neYRdc7JMekRmBg6A5GgzhhF8tdUXQI83kAkw
	 yXYnIb44vq57yU6ApNYDEPUoYt0iYZZsAkXUPcwDwQmOFCEZMIvb3miUrgjl5mzGhs
	 Sjd0tXXwS1p17pNswbch09JrCdwJqBXhuwZiBzH7YApoqHcm/xAE0g5VZHr1zNMUUS
	 tTp4pt/bfb5IQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A1A55E5FFC8;
	Thu, 27 Apr 2023 19:20:06 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver updates for 6.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZEqEqsEJZZEQSzLl@kroah.com>
References: <ZEqEqsEJZZEQSzLl@kroah.com>
X-PR-Tracked-List-Id: <linux-staging.lists.linux.dev>
X-PR-Tracked-Message-Id: <ZEqEqsEJZZEQSzLl@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.4-rc1
X-PR-Tracked-Commit-Id: 3fac2397f562eb669ddc2f45867a253f3fc26184
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 97b2ff294381d05e59294a931c4db55276470cb5
Message-Id: <168262320665.21394.7244420994513669206.pr-tracker-bot@kernel.org>
Date: Thu, 27 Apr 2023 19:20:06 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The pull request you sent on Thu, 27 Apr 2023 16:20:26 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/97b2ff294381d05e59294a931c4db55276470cb5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
