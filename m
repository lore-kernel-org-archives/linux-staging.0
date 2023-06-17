Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5D8A945
	for <linux-staging@lists.linux.dev>; Sat, 17 Jun 2023 18:44:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 853A8C433CA;
	Sat, 17 Jun 2023 18:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687027466;
	bh=J+Vy7ZFSJz/ig0huCXrXW0M6zTM0PuIOR0XceY4cg9E=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=cibgO0vgBTTU/jTAhmJL0S/MJ5BCOBUesa+ryuqL8py40vZwlLPqmj4xmS4ZkO19/
	 lWOjRj+IWm1EGM4xJKIsgiTe4pRrXfrHxeIUQq2AcvTsWchgP45AJbn18irG6exOLQ
	 6jLgQ1hSlHq/ehoJafyPQHvEAMIJp5OqObOFPmkl7YjQkIJqslsJvV/dKa3hiO8Vw5
	 HGxUZ8qglQnMN1MG2f8aAXOOUut+FGICTc92+BvfCcWu5+Pgx/3Py7poA5GVugmRsu
	 8NQ+tNB32jY3zIKCfEVuwg5KZQBQvaH45pdv2io1lScIPnUSLwmooFqKIfTwT7nhmN
	 a+/q4nqrmhRRg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6F6FBE21EE5;
	Sat, 17 Jun 2023 18:44:26 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver fix for 6.4-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZI25KRBpKGcP0wSf@kroah.com>
References: <ZI25KRBpKGcP0wSf@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZI25KRBpKGcP0wSf@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.4-rc7
X-PR-Tracked-Commit-Id: b3dad076a058916c443c93074dc3ee80baaff4ea
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1b29d271614abd97cc39782daa9d6dd70e98609f
Message-Id: <168702746645.26928.8030797368623841467.pr-tracker-bot@kernel.org>
Date: Sat, 17 Jun 2023 18:44:26 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The pull request you sent on Sat, 17 Jun 2023 15:46:17 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.4-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1b29d271614abd97cc39782daa9d6dd70e98609f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
