Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B17405C49;
	Fri, 12 Jun 2026 17:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781285810; cv=none; b=PkH37G3HwbxlGGXadY4wxfkGMqd/J76V7sPkrbbQXbsIjpRMrIaEIe58FC4I8KsEI3QJ+lY/XFqYqz35uYSNZHnFZXNYUk/Wqxtmp0EJFhwvK3J3PITg4Y4DjKXCpp2KLmic03qsswQ/QuW0nszLwovv7Ty2gUTggkthG2UYB7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781285810; c=relaxed/simple;
	bh=BrgtXfkxQLSNZt77gRsyqr0LXeZ/R0Y2nwyBLyr/p2E=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=uqVcqtU2ndg+YHqGL2/FvrPK6PMqZDrp/FrfEWi9cdMvlGBa8YE3RIPp0DWdVygvuPe/v2KS3+82sVlqQO3NateROHT8NfdgMqVeajgagW9cC54lK4soxjjHJ5LVbDJqMURsQmCV23bUurpRPiq/anFkHephcW6LDrSyR6DBQ6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iGlB/C+y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iGlB/C+y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B0561F000E9;
	Fri, 12 Jun 2026 17:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781285809;
	bh=MWI8xID9Aihjk8Y/1Kb1qR2KdRTrfa14QhGts5r4NRQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=iGlB/C+yyD+QYQ+dAcREFKc7q2VOQEz1Y1O+J4Kwgf9axEM4pDvSwG0Cl3LY+rs3x
	 4YTp5+Nl40Dxvv09HaFsII6xz2gUI/5nz2X9bkJOn9qxddYI4wsK8YWgZxNhozYiY3
	 RyEOqMZ0GcRAH2+E91wyCYoxr3YWpcg8SnzdYv+INFGverC+V4xvr2Fpz0VsfS6hNL
	 Pk/oC/nPhdRX6DvCQpp4Y0bpjVVwOYBp/NNy6Gf4cpvjKPi9b86TnhvlnmLyCPheQI
	 Z660JKLsRVV91CQCjWxUl2j+9/vDHRvcVEKozhXFd61SMwvZQR+zmRUAf+HpZlh4lq
	 h4tEpZBkRjxwQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 197CF39D1D32;
	Fri, 12 Jun 2026 17:36:47 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver fixes for 7.1-final
From: pr-tracker-bot@kernel.org
In-Reply-To: <aivgBoLrgsWEiytO@kroah.com>
References: <aivgBoLrgsWEiytO@kroah.com>
X-PR-Tracked-List-Id: <linux-staging.lists.linux.dev>
X-PR-Tracked-Message-Id: <aivgBoLrgsWEiytO@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-7.1-final
X-PR-Tracked-Commit-Id: 88e994c57a79f62d5338231d8d37ee8dd98baffe
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c133f0433ad78ef51b5b4d3d26ed1940236d71a2
Message-Id: <178128580571.765808.9130742470996208836.pr-tracker-bot@kernel.org>
Date: Fri, 12 Jun 2026 17:36:45 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 12 Jun 2026 12:31:34 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-7.1-final

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c133f0433ad78ef51b5b4d3d26ed1940236d71a2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
