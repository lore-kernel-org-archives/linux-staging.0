Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795809577;
	b=xNlO+f3egcwZt1YBhNVDmNzGXCZS2AK1U3VfSECzFCaura/FwUETfl5fJzQMNfLv29sQ
	 ApHmTyBQ4xzep8G1gnfpg1m4mfFfRy8QjXc748Ig7eFxhYHZ97wEi1f4lk2ClzHw42Iyh
	 k4OCylHRdcVweYf2b8a0WW6C0PlBZuKc2e275PmAu1zxf5m01EgkKGngufdTxs1T0p49s
	 hlbQUWdxDAj+PnUH+Z/EnkK/iNnnZehdeH4WwLlcOTm5rv3M6RZv1CPiEI1oA/zEz9K4p
	 nmRCTIbpjtEio3AHm3ceWI2oAx9XUS0SVXDsl8sNtxi7TSwyiPUAXslqBN0civ1dO7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795809577;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=C7ikg3Lku22zEAGR1iEQ0I9EOASgn9RlFUkbamsA7jc=;
	b=vZ9zuDiUZKN/juOn4NybQ3pKCqorNEvykQyYgzGFGL3MIdc1akKuNO9KHtO8Fq2/zXaL
	 PWvF0nLiRDeO9oMT9rTgO38SjWKgFIAAb6f9mcJ8Sor20hMOVhHR8NN8AjUT3HvBwnJ97
	 T6E/d+bN/sZJQCNOOt6rauI/pBsI4M0EhJUrS9Fj63w6emiSF/KE/WXPoDupshbFxwgd2
	 ERXaJ9oOSUNGEf2aRCefG5uyrWPOqYVI4FVWUH8kZv2GSbk2sDRUB2f9EdhgDCfWAU+fs
	 Pu8bzxic5OmYqT3C6MrMmYA3vOkURvwLYrLncj5UD0x1BciuML0qjvL8iQ6BwbQKYog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X1dYIwsL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A59606A31F;
	Fri, 27 Nov 2026 19:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X1dYIwsL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00A0D1F00897;
	Fri, 27 Nov 2026 19:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795809577;
	bh=C7ikg3Lku22zEAGR1iEQ0I9EOASgn9RlFUkbamsA7jc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=X1dYIwsLgMKn3syJpOHB+diFVpApmCNg38U7oIWqpYJgnDn3+e5zEUHldJyyyBz0j
	 8EqK9Gi7qIO9vjBHyGp8CTPO2qjco0FJnOx3IeOBdtkpHfVpFy6FMZYlzsEvqpiwCW
	 0hkch0i2xyLzYaJbCj30BXA8ABm4VqGn8HydPierL2hY+xva1Iyt6XFzwlofzcWeZ6
	 i5nftRYlonKVVOxQOlY/3rPT3OL2lXeOaLG6Jixbn22GjZF3FIcLZT9PjPqPClUfi+
	 A+c6aKJVo4T6NgADVOjw7IOPN3INL1+jRAabQfMa9ZlsrO04PhBdB31U9fkg7XCv/2
	 9soqQpsfsb2zg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB852392705F;
	Fri, 27 Nov 2026 19:59:36 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver removal for 7.4-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <awmLIGoX6sME2IJQ@kroah.com>
References: <awmLIGoX6sME2IJQ@kroah.com>
X-PR-Tracked-List-Id: <linux-staging.lists.linux.dev>
X-PR-Tracked-Message-Id: <awmLIGoX6sME2IJQ@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-7.4-rc5
X-PR-Tracked-Commit-Id: 24934cb6b8cd925b7c86ad818929c272a360ec53
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6cce17ffe54a9fdcadbadfd59c00de7ac2cba25d
Message-Id: <179580957542.1663999.16832647797906212303.pr-tracker-bot@kernel.org>
Date: Fri, 27 Nov 2026 19:59:35 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list

The pull request you sent on Fri, 27 Nov 2026 14:52:32 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-7.4-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6cce17ffe54a9fdcadbadfd59c00de7ac2cba25d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
