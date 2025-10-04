Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA202472B1;
	Sat,  4 Oct 2025 23:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759621304; cv=none; b=D1ZkkCYfDzK4XmZiH8qeHEgrsKQFigPotIcksKLI0Xhk0LdKSsWxKI76T9pi49l5AMQVLPj7Go4t1NNvkSh2Xx8JXkltVJEg+KpTbrbkTg5+QmTLc6JvunFLYw9ceVFuHRd3HcdLDLoRpTJ1d3szPQfQ0zwg+LqiYvGbyVY/Us0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759621304; c=relaxed/simple;
	bh=AslO7f3g61R/R/cWIZ22fBpPjqZXgxvYKzxMeKhpstw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=qKJ2eNKUpE6TtddvxN7b6g1b00E2ne+AU0iRQk20kYOBnenNQberM4pco4+PDoxSYJwIOuQEFZM6/2nfr7nIaPtaFBEaMRmCvZUb53QtbgYHY1KxvaSw48Q/9R7xzlUq+2JxKafWRTF6ax5RoriDMQvYy+Ha1Tz4nhkpzH7ySck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HRPyZgZc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HRPyZgZc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF627C4CEF1;
	Sat,  4 Oct 2025 23:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759621304;
	bh=AslO7f3g61R/R/cWIZ22fBpPjqZXgxvYKzxMeKhpstw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=HRPyZgZcuWTh4zD7a5qYU3FKkFqMzexDQbZ4jeEOPg0sCXd6GEQffRgQ6t/Mj0OOe
	 iMQnKMBt4PifxZ2bf9K1MAs7iwhI1Kbq1DUzLlVZj77uTBLUNgT7B9psaExguyn9p5
	 2Ua6N5SL83UAoiI3DDyNEuoxFDp23lo9gkw/a5ceLZNxLUn30gBOd1PKY2LURZRMlx
	 06jtfLv+A9NGbQ+idxURe77F/VLRGtgskd+YbCQPnTQEwVGJQImNqo4qZrzgwPzr1R
	 HtoM44DQmEPV36DEaA0r8g1Bl2URt93IkxlX0JLtjep5cD8rmmxC4QilUHOO4+7MJT
	 w1SsrJOxJNk8Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADC1F39D0C1A;
	Sat,  4 Oct 2025 23:41:36 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver updates for 6.18-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <aOEpP3nLOrQAKh6C@kroah.com>
References: <aOEpP3nLOrQAKh6C@kroah.com>
X-PR-Tracked-List-Id: <linux-staging.lists.linux.dev>
X-PR-Tracked-Message-Id: <aOEpP3nLOrQAKh6C@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.18-rc1
X-PR-Tracked-Commit-Id: b76029bdd71054b17f62740fe9617d6b2ea601c3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 59697e061f6aec86d5738cd4752e16520f1d60dc
Message-Id: <175962129545.472872.10479861593516558497.pr-tracker-bot@kernel.org>
Date: Sat, 04 Oct 2025 23:41:35 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The pull request you sent on Sat, 4 Oct 2025 16:03:43 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.18-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/59697e061f6aec86d5738cd4752e16520f1d60dc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
