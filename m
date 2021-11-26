Received: from ams.source.kernel.org (pac-ams-korg-source-1.fe.codeaurora.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A34072
	for <linux-staging@lists.linux.dev>; Fri, 26 Nov 2021 18:35:12 +0000 (UTC)
Received: from mail.kernel.org (unknown [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C2BFAB8285D;
	Fri, 26 Nov 2021 18:35:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 092EC60041;
	Fri, 26 Nov 2021 18:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637951709;
	bh=7driNm2WVc92ubSabALVsvKyR0qbyWJzS4X9tddEVRI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Sd+Ud/y8XILA0q5BnaT1Oxz9J2AJaJpUyOtemJjO2toIr1rR4h6WsxU8i+vZw5h8y
	 z97kOlzsTmGze4IN+FImoM24jJVtDcvPlEwRfAK+MrlLZLATABHI6OwFEJBoUUJ2pj
	 ONLhgYwC+PfXXJEbeEOG/arwbk45xAoSUO9Et7h7+70vEJnV3rAJ3a1C1kEgD9N/7r
	 2BoGaP8JbhVbBDHEb8pyK9fbiGokkFrt8Aez5RMHt7/G8B+vyT1Y/5Foz4CplwWh8c
	 4inNlmaDy4jJoAPfIKnmEne6Ca6z8ERJmBwJNfsYsZ81MZUsGcipTDxn6x+QfJXMS+
	 IKyFn8x/UWG2g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E779260A3E;
	Fri, 26 Nov 2021 18:35:07 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver fixes for 5.16-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <YaD6DdgslN17VWV8@kroah.com>
References: <YaD6DdgslN17VWV8@kroah.com>
X-PR-Tracked-List-Id: <linux-staging.lists.linux.dev>
X-PR-Tracked-Message-Id: <YaD6DdgslN17VWV8@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-5.16-rc3
X-PR-Tracked-Commit-Id: b535917c51acc97fb0761b1edec85f1f3d02bda4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 703374418e93006a4b42a9b607e8e438bdf6b087
Message-Id: <163795170788.22939.11490049493260235702.pr-tracker-bot@kernel.org>
Date: Fri, 26 Nov 2021 18:35:07 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 26 Nov 2021 16:15:25 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-5.16-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/703374418e93006a4b42a9b607e8e438bdf6b087

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
