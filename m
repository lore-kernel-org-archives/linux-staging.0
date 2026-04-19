Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDE240DFBD;
	Sun, 19 Apr 2026 15:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776614117; cv=none; b=mBUWNzYdxOkhUAVDvQbPblj/N8RgetYhWH2MAeI0pbYPhIbTqT7LgIOdQYRJfgE4/0cfZyR45dq3e6W2qr8g0E7oG3h0dK3hIaBnxvKIrysF4FEuNFNKW9xnKWD0nULMK0frfuEF2I8mDBr1SvOdsYxxVYfKqJBJ7lgxju4mNbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776614117; c=relaxed/simple;
	bh=wbudxrGi5gZhfY098mRt1SesVt5m5B7O4P7PVgcvgog=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ZAaxhnC5lGZGBI5ooRk8bx/Vw4QHstRD4ND4Z9fLoLpjUdlyNwYT1uBYZ63dS6om8EMqr/s3Ywuh1BkoxjW8xjJBXlEtOL/QW+ZN+XK1YxEvKx8QUVmBsNpi0GZqhUbyqBU8eYkwncZ+pbquUFE147AL3lVe13HGMLIj0Hv2fms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iyffjx1C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iyffjx1C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34A51C2BCAF;
	Sun, 19 Apr 2026 15:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776614117;
	bh=wbudxrGi5gZhfY098mRt1SesVt5m5B7O4P7PVgcvgog=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Iyffjx1CW/hEKDaf///+dkHxVHI9q7p5UVq6G2/8itkBtW53uEDf8B2kiNOJafK3l
	 tAF25erIkpdmZRLbzBYn+MxzGYrj3pX0irGPjgFBmU4CSI9ZSwB1xc2JsBZCreSgUE
	 CEmT4kSM+161QISy82zPQ/nFCd9Dl/aG3r0X+yYflKSgIBMxh6IWm8qvA1tfPO56JO
	 6N/0nqZyTITROwGi6jcn/LsYz14JN3A9uUOlumpRtv3xYgo0faC2emAbdi4Nh4oAbM
	 RGBhWX7dsl77JPQ3gAhZHmZc/Y+8/VSrcgUkP3XYo3nIDxt0s4HgLCm+AVKf6eiL7d
	 0Arwb+eP77Wdg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02DFC380CEF9;
	Sun, 19 Apr 2026 15:54:44 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver changes for 7.1-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <aeTe2obGAsnbnxM1@kroah.com>
References: <aeTe2obGAsnbnxM1@kroah.com>
X-PR-Tracked-List-Id: <linux-staging.lists.linux.dev>
X-PR-Tracked-Message-Id: <aeTe2obGAsnbnxM1@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-7.1-rc1
X-PR-Tracked-Commit-Id: bf9c95f3eeefb7fc4b4a6380cc23f1dca744e379
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bea8d77e45a8b77f2beca1affc9aa7ed28f39b17
Message-Id: <177661408250.808114.17277734570179952794.pr-tracker-bot@kernel.org>
Date: Sun, 19 Apr 2026 15:54:42 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The pull request you sent on Sun, 19 Apr 2026 15:55:38 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-7.1-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bea8d77e45a8b77f2beca1affc9aa7ed28f39b17

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
