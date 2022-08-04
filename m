Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E6E5387
	for <linux-staging@lists.linux.dev>; Thu,  4 Aug 2022 19:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62FA7C433B5;
	Thu,  4 Aug 2022 19:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659641237;
	bh=P0RDCNBh9PuMvcZxdwIXMeW5ilKhdsR2GtY9WiDSLF4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=csmnRdZ1BMjKJi4UHAiDB5k3HiJ41Ayc0IiJ1LLptxliURhNBmGh6y5+H/EiNfmKl
	 FSeonBFS7nXC2E2ChNJYrfoF9YFHsmfShyjeyE6HeFzJyLvP6Ffr5PXD9GZN01n7/Q
	 BSBQuQVO+RN2uL0DO7voj6mDZtKFviUgzn2kn+LzTImQpa92SJLgne1TDK8XKwk+vS
	 vieYv4ChnsrxW7IkupWhzm1QXqZMrKW6ylPv/Z7N1AbQjfB05Eo41w0DyBovXu6pzU
	 l0XtdxOAE7FJpRkudd50HrhsW0A0GdSOx2RA4VpjrHi3bEnYQThio2ECIIJ2YCg+m1
	 R6+RAq+JUwkRA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 54111C43140;
	Thu,  4 Aug 2022 19:27:17 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver changes for 6.0-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <YuvQdHf3ySPA78/1@kroah.com>
References: <YuvQdHf3ySPA78/1@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YuvQdHf3ySPA78/1@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.0-rc1
X-PR-Tracked-Commit-Id: 87f600af59e8cf6abb04bac15328bcb517e26485
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 723c188d5cd42a07344f997b0b7e1d83b4173c8d
Message-Id: <165964123734.8981.8407165927018219827.pr-tracker-bot@kernel.org>
Date: Thu, 04 Aug 2022 19:27:17 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The pull request you sent on Thu, 4 Aug 2022 15:58:12 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.0-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/723c188d5cd42a07344f997b0b7e1d83b4173c8d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
