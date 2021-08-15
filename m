Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281032FAD
	for <linux-staging@lists.linux.dev>; Sun, 15 Aug 2021 05:30:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id AB7CB61038;
	Sun, 15 Aug 2021 05:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629005429;
	bh=lqgZVhDD0rzu4lD+lPiRXpnVJ6yGAtXKU4Sdo3DPIZg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=TVaToB+YJJeI21Trij33uoO5pwRWtkC2S4YFegzBqpVCrRdy+S8y8J9s6o6Z0iu/n
	 1y5SQD/s5DA/Sk+GQIDd/9y4V50gtlJ7mSlWa5sylb2CnUEPjjSdI+FI0cAIkrMiL9
	 rUQAIo4m3h17KLSfntoqB78OkATbV2qzvOgLXPWy8OQXFG3AzhZ1P680tlwm7RI/Vj
	 fuGmTo66REdO/ImV8PkcOFRFYuOyV1i4EIxXDXLMeAeih2E6xxLKNhDMqq2Hus+GH5
	 tDRQvMy0dF9Ev0MmBQsKpmEHCtNOsFzZ5s0e3dMB9qk7MnBt2ywuQw9uKlrd7EPUrn
	 kILYn9fpsN0sw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id A60BE60A9C;
	Sun, 15 Aug 2021 05:30:29 +0000 (UTC)
Subject: Re: [GIT PULL] IIO driver fixes for 5.14-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <YRf0Zwu0SySEe2g9@kroah.com>
References: <YRf0Zwu0SySEe2g9@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YRf0Zwu0SySEe2g9@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-5.14-rc6
X-PR-Tracked-Commit-Id: a5056c0bc24f6c9982cfe6f4e3301f3c7d682191
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 56aee57345825a720dfcda6ea99e550c3141762f
Message-Id: <162900542967.9665.1544491948431138031.pr-tracker-bot@kernel.org>
Date: Sun, 15 Aug 2021 05:30:29 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The pull request you sent on Sat, 14 Aug 2021 18:50:47 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-5.14-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/56aee57345825a720dfcda6ea99e550c3141762f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
