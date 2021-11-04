Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA602C8B
	for <linux-staging@lists.linux.dev>; Thu,  4 Nov 2021 17:09:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id DEFDD61186;
	Thu,  4 Nov 2021 17:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636045790;
	bh=OayHXHRKJghWJMs2vm1+vHXo+agWa0gtrv8JzE7QO3Q=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Cb4Z2ipr23rV/A24kr5EIP+dYrkpWOdxoU0/MgtsGk+lhGxewSJv9/Jlozg2mI3zX
	 shQllsf0jIY4IV06jVwV/aeWQo82rsf0bdHfyRao4SrwAKEkcdlHdIQKiOJHNmoKVZ
	 SWze283JKNivkYvk2BbhKwLgvPa1DaJgcX558qdPr9nHj1UzH8H5I9h1QZh8otWBEe
	 UGzeUlsAUPhNHTSrWC7qEbiWZ9KwPefW+aY1KhlzVvrJlWifXaeClZXfphrCmEIxgS
	 vG7A/H9YhPPaPWlj/AX/Tst2dumV6Lm4uiW1pnLfZl/wKkx5Xvgiq5Z17E4NLzlu7I
	 NFVWaHd7lrW4g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D8111609B8;
	Thu,  4 Nov 2021 17:09:50 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver changes for 5.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <YYPauAJfmnePbPF5@kroah.com>
References: <YYPauAJfmnePbPF5@kroah.com>
X-PR-Tracked-List-Id: <linux-staging.lists.linux.dev>
X-PR-Tracked-Message-Id: <YYPauAJfmnePbPF5@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-5.16-rc1
X-PR-Tracked-Commit-Id: 10508ae08ed8ce8794785194ad7309f1437d43fd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5cd4dc44b8a0f656100e3b6916cf73b1623299eb
Message-Id: <163604579087.24234.18256208119761136389.pr-tracker-bot@kernel.org>
Date: Thu, 04 Nov 2021 17:09:50 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The pull request you sent on Thu, 4 Nov 2021 14:06:00 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-5.16-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5cd4dc44b8a0f656100e3b6916cf73b1623299eb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
