Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D86528314A;
	Sun,  7 Dec 2025 03:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765076614; cv=none; b=GYomYa9UR9DUR2rsS9AjCItMa7LCrAbH9+jCpfidbnoF0V9zLqd3VjQTrAzRVfxFl1q+58G1BMzkZNQrJdKPuysA1fezZwUGfIELtB85GGB/41J9fVM7/Cw+Z0UXhQ2mNgnWxhIif8Xd6McHauOkZVS2Ceb+3U0HXPm122ht8Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765076614; c=relaxed/simple;
	bh=IqIPH31vFQOrLaD+apIGNjeVWSbzvRbiu0JZyeQ7kGM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=JE4MEY3NYUgSNA3MgZejGjbZ1yMnXOPU8rLi8fS3jAw16ztwMNZzKRecHNKcbptmcI+eEfmIHV9bu9kGypCepYQvQSf+HRK7R0MkBJgpph8T9J5jVop7UtlZLme2rj4TqBzYF0nMfq9CniWQJiXijbB8VMDVAJv9HBu8ym0pFpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qwnrfgiI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qwnrfgiI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F33F6C4CEF5;
	Sun,  7 Dec 2025 03:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765076614;
	bh=IqIPH31vFQOrLaD+apIGNjeVWSbzvRbiu0JZyeQ7kGM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=qwnrfgiIkxE868OBOuFR57zVCxHxVk/XCDIRl14/Y+hICcEZRTxywfbnVPSvQpHgY
	 0DGUxQRZNUDq1F7eVzZcgiYWb1/xsvVMUlIke2Dzz0UN7cKrFhgOIIa2wPJzwTrE4y
	 U3SCItGLApsNhPZZisWQz0VrXsVVhL32AF7U29DohzGLYs9nO4QUz1WZxQPvNxiBp3
	 ag59DnN0kEqnxxS0jSGroF96yN81bTBqW1aq6aW92AV5mYOnoHB+4HxIxasRSBlO/k
	 RwZ+3AXgzy68kTcuBbnbszTVEUbac6WZBJIWO3zizQoF7JWKuQ++jeKdBBwh8oO6k/
	 0MUVulGp3AN5A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F29E43808200;
	Sun,  7 Dec 2025 03:00:31 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver updates for 6.19-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <aTTPQvLHK-amzrEA@kroah.com>
References: <aTTPQvLHK-amzrEA@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aTTPQvLHK-amzrEA@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.19-rc1
X-PR-Tracked-Commit-Id: 502ddcc405b69fa92e0add6c1714d654504f6fd7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 37bb2e7217b01404e2abf9d90d8e5705a5603b52
Message-Id: <176507643066.2278937.9796383144894205364.pr-tracker-bot@kernel.org>
Date: Sun, 07 Dec 2025 03:00:30 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The pull request you sent on Sun, 7 Dec 2025 09:50:10 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.19-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/37bb2e7217b01404e2abf9d90d8e5705a5603b52

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
