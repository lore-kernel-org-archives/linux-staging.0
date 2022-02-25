Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DF528FB
	for <linux-staging@lists.linux.dev>; Fri, 25 Feb 2022 20:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F67CC340E8;
	Fri, 25 Feb 2022 20:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645820258;
	bh=vdWegqtTtaOl3U7leHU6jYtdKKHdYoyvBsyvLNe4eVQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=QRQCQGyqyMYuEXNBvfYxw3m0wpmZbNACjnmSYVlc9QHzfM5HPdKayWdzaBhAXJrJK
	 YxfbLZWJY6abfdTyB0hKu4EfP6xqJ0Zqcis38taNBy4PN8ZStF3mLag6XsG5OtM4jZ
	 hz6J6DHx7ecZ5ROibzXjtqlxHGpTjT9n6srxHrK88aNCbVn1jHPgloiFVLj1yaRo5F
	 pIHsAvWm89XOrJwRN76H9vg8JG46JaU+aT9M0JTvwqUXAV2t6EPlDe11ksrsIJU7KL
	 HaNZcJ0QuNFAD27W9x20Q8VuoZIL0dQpqkDUImajet9bwCn/2WIs26T80h/3oE2gGe
	 0sqzFoUrEyvtQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 03FA7EAC09B;
	Fri, 25 Feb 2022 20:17:38 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver fix for 5.17-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <YhjYPIRvDnV7XAzV@kroah.com>
References: <YhjYPIRvDnV7XAzV@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YhjYPIRvDnV7XAzV@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-5.17-rc6
X-PR-Tracked-Commit-Id: b6821b0d9b56386d2bf14806f90ec401468c799f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: eae9350eb40aa0b07c280ab3a504bdc65c2211f1
Message-Id: <164582025801.12222.16361077026884228274.pr-tracker-bot@kernel.org>
Date: Fri, 25 Feb 2022 20:17:38 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 25 Feb 2022 14:23:08 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-5.17-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/eae9350eb40aa0b07c280ab3a504bdc65c2211f1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
