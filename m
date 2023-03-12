Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE484C97
	for <linux-staging@lists.linux.dev>; Sun, 12 Mar 2023 16:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 993FAC433EF;
	Sun, 12 Mar 2023 16:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678638056;
	bh=ly5v95DrHgVXvigKRijO+MFiLUtRh64uwKPJzhYtHAU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=F+1uj3REIw1YX4VXi8+z5jLqzcAzc0aspkFlq2QQePHYEAZVcp/K20kLw54fkiuFu
	 /x64NWUjwMdqaDqkQlNdoXhJ8EtbrxjbdJ9qx1ZwSHamAmuLS8QlKVlkNlclTSzuT5
	 LL14tu5C1CUVp18JIyK+y5rtwyec4atHSPny01ye4oH01VFM9YQ6pHiWWaCBuIcJNB
	 1+tssqrFvMnVSTgKttQVP4bh3sacHXBiPFEziCG63VQMTEEGH76a6j6XxU8V4ct3HX
	 eU9IKdfmTvaONy2A31tvu16GeUSngmMUT7qCVML+5LNnI0BvsGJAeFE0oVl06So1KQ
	 xgmyZTZQKx9ng==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 88297C59A4C;
	Sun, 12 Mar 2023 16:20:56 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver fixes and removal for 6.3-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZA3mcVDC3sMrgTxE@kroah.com>
References: <ZA3mcVDC3sMrgTxE@kroah.com>
X-PR-Tracked-List-Id: <linux-staging.lists.linux.dev>
X-PR-Tracked-Message-Id: <ZA3mcVDC3sMrgTxE@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.3-rc2
X-PR-Tracked-Commit-Id: fdf6c2309f425509cddd002f278c650ad0b7e34b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 134231664868e163580cfe79e8c923560d7de302
Message-Id: <167863805655.16000.4918935907573538730.pr-tracker-bot@kernel.org>
Date: Sun, 12 Mar 2023 16:20:56 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The pull request you sent on Sun, 12 Mar 2023 15:49:21 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.3-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/134231664868e163580cfe79e8c923560d7de302

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
