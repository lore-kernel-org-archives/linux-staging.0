Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F3A3207
	for <linux-staging@lists.linux.dev>; Sat, 21 Jan 2023 19:23:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5AE23C433A0;
	Sat, 21 Jan 2023 19:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674329018;
	bh=875/ZYrtYEjx3zhPRYUvX0my+LWCFXELKIgzPaC2jdE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=H3doU7mmg9TfIIXD+DWc6V2hUYLHKuRiipGMAFRZdML+8tUvZ5x0vYoJuf7u1u6l+
	 GthgoTi9ECpWSYapeJHGAVpCcGdO0et04aeX3jvjgkS+pDfLlEiuh60Z+reygLBf8S
	 /cMqGOHUWPOtMnn6OZvxiv+E+gdcD5jOVeGocj8WZOq7CxiWc+VyL9q4nt2Dol6DfE
	 nL43uyjTup9dXm9W8qbJ7U750c3h4bEEPsi6KUUZ7oMmUmUykiNrSZeSKetlzuy88U
	 qGR45dkQja24xyxGfaIoAfb7wBIBhj5bLQSnWnG2UhpapaTcN5dvbmW5NJI7tKEN1L
	 c4j0D5FPZPDBw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 43A38C39564;
	Sat, 21 Jan 2023 19:23:38 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver fix for 6.2-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <Y8wE3Tu3muhrYchq@kroah.com>
References: <Y8wE3Tu3muhrYchq@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Y8wE3Tu3muhrYchq@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.2-rc5
X-PR-Tracked-Commit-Id: 7d83299351fe7c812c529f5e39fe63b5312e4233
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bb86d65775cc3835152c08882384c2534b56f1d3
Message-Id: <167432901827.17568.17566802839838116779.pr-tracker-bot@kernel.org>
Date: Sat, 21 Jan 2023 19:23:38 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The pull request you sent on Sat, 21 Jan 2023 16:29:33 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.2-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bb86d65775cc3835152c08882384c2534b56f1d3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
