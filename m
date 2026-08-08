Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1F330DD2F;
	Sat,  8 Aug 2026 23:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786232775; cv=none; b=n8kFeJjE0N2y2mfY7/Y1k8A37qgbbgYf6vq5IQrV4n/YLyl9l9Tua7P1rsQ+bftL5hiTnVMvmhA/xZHvJxAqk4OqIVEPvQV64UI/8M00TWtGsXxDQSYmgPdkblZfsFn8QwaOMfOiZzI1T9/4SEGa/EBKF7I9rPoL5MRZioJNBbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786232775; c=relaxed/simple;
	bh=PICYdB1kWiICLW4YRx/JuxHEon6b8tPYng0m6zidWoQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=oOPATtmlDmIl8ByY03wlUKKnDL5saKhnOKF2PlLaFgMModzWvahvpusgLp1XDKXFh5xhbjV00DBC202zfKyHu7URDePe0e+85X9SClXROKx3zaakYuHtqEDrYZKTFzQPYq8VpZIY3cCTjvfkLTdDVO2x4jWvdDz0LEzV+09oaSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GMbya/um; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GMbya/um"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10F1E1F00A3A;
	Sat,  8 Aug 2026 23:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786232774;
	bh=UF1W29KDfoxmlTVTZma4iorsSySGTH6BFCjkyZOsOWQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=GMbya/um0ZW8pRkIDT8j2K5MlZzJz6zXfGoP5UrmQJFgfGGrwu23own9W8nCAKJAt
	 1J0Le5KphgX35JlT4ELeYkwZkKAB+dbBf8NGzmY8qdJc+qOpajvSgqJOE90dQAz+q/
	 lj0qWSm+ZfTD+QxD0n+MR9MMKjlpfVtm8WgJel4cIcmumhmmFvwCmF3cPslk/SLbFp
	 +DALF2HOU8pnXVPD6WDDWT7oH9xzajdQqFmcjCJi6KNfAh626cLlTzwCvIsfd35aRH
	 M+Q+xUVkcWhofU9C8qJ5gVrrngpUaLPBLMUFQtiGaBMv++10CETJzmlrtRH5JGEdEA
	 QF5EZIZqcOsaQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19AD2380CFFB;
	Sat,  8 Aug 2026 23:45:33 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver fixes for 7.2-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <andL7yDYZhWQIn9z@kroah.com>
References: <andL7yDYZhWQIn9z@kroah.com>
X-PR-Tracked-List-Id: <linux-staging.lists.linux.dev>
X-PR-Tracked-Message-Id: <andL7yDYZhWQIn9z@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-7.2-rc7
X-PR-Tracked-Commit-Id: 6829665d050983907b560173e49dcc6c11cb2730
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e663f6deac9d113d158eb0ba7433659fe4d95ade
Message-Id: <178623273174.2786584.7656942561392652378.pr-tracker-bot@kernel.org>
Date: Sat, 08 Aug 2026 23:45:31 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The pull request you sent on Sat, 8 Aug 2026 17:31:59 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-7.2-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e663f6deac9d113d158eb0ba7433659fe4d95ade

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
