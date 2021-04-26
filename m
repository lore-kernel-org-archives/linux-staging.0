Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7D572
	for <linux-staging@lists.linux.dev>; Mon, 26 Apr 2021 18:36:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1811561164;
	Mon, 26 Apr 2021 18:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619462182;
	bh=ki5j7sco3Y6AttseIRABEAACjwi7L7h5KCAYWCudRsM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=k+nL8NlpiqvICyVbHa7sP/7qYaL0LMy1XZx/WyIGpTb6zQm/arMbFgKzgbB8CBhOI
	 Gy8NhS1+uXn5dVVZB94DZmk45V8I+U5x2hbGQE8nk94Q5yKQHWNS8pkDntCNdQEGTk
	 08fDlITRQMAxjGDAfW+DkbYxlHKVE0N5V0SwMRS+UMXs71lAXQkUjaMwNa3d5jhbKB
	 MX5ONPtsrR7DcZfQcq65YLzYi1l8QRnL/IYEoTCcr1AT7OmMh1YL8KJqa0k3XZR2Sx
	 Y6hYqxZ9CSUcmZRDoiK3sPAfjpbqC2USRP7tTcgh8n2GQ7BQK+xN02Oh7bc50JvTDD
	 ZmA8cRAg11TWA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 10B85609B0;
	Mon, 26 Apr 2021 18:36:22 +0000 (UTC)
Subject: Re: [GIT PULL] Staging/IIO driver updates for 5.13-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <YIa2ErYuJyCfSkS+@kroah.com>
References: <YIa2ErYuJyCfSkS+@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YIa2ErYuJyCfSkS+@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-5.13-rc1
X-PR-Tracked-Commit-Id: c295d3007ff63064181befa734d9705dfc10b396
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8900d92fd666d936a7bfb4c567ac26736a414fb4
Message-Id: <161946218206.19244.13705418886944400379.pr-tracker-bot@kernel.org>
Date: Mon, 26 Apr 2021 18:36:22 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, devel@linuxdriverproject.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The pull request you sent on Mon, 26 Apr 2021 14:46:10 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-5.13-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8900d92fd666d936a7bfb4c567ac26736a414fb4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
