Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE10D26A0B9;
	Sat, 14 Mar 2026 17:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773508992; cv=none; b=UJG1soDqEuDpkWkrkD4JyVSdmhj8ZewNWqJaG8UWE+WT0y2x86oDYxdDNXE4q50gEksxRNXdmbHDTt1pNMKCKS/GIhjTGOH+kIfkoi3dcagWXK8UeoNM7dhBsxgGfzfBumKFE3oZTXRuCU95M12HuOGQRe/Eo6oYgO5want9m9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773508992; c=relaxed/simple;
	bh=dT9mO4t+L9mL/tAfepFo9ICe2MEF4aEF/gQpwpee08E=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=L+9+C4EmrM1kMJMLrmu5uRSlEB2xs1mgaRBo2EPH30CVodLjqLd+a4mmlxuvGuQT2LQAaIEWTdZtK5ZtkLzB9b/PsvcJU5znJJ/zMlrx5Moxn+rPXaXVwIi/5risTnTf6K6hL312GeqquSQTgjqUAuBaBmpxYn/lZoL6Fo22V8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hrvYtEB3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hrvYtEB3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99A80C116C6;
	Sat, 14 Mar 2026 17:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773508992;
	bh=dT9mO4t+L9mL/tAfepFo9ICe2MEF4aEF/gQpwpee08E=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=hrvYtEB3U62FEjmnhNjrtXHwzomw42O4EmDTTMwBNVW191HvA19eW3D0swGGyqu6n
	 JSEG0RhFpBaKeecOekJdV/cS3Jh0yOG9e1XQ0fj8Q+aVtHypV0rqWcl3CePoPJ+b9o
	 nwbUG0SYtbz0IAfWCDSUpthst9Xn2OvNDeH4ofI+lwyEMxjJdhHMpxj2ynt2+Nkc5L
	 QDymJMKFsQJ6xzqffS7Tf65nK84oNXgCMUny97+mtc+KJJ+uypdNeh+qFmQQAQeYPA
	 EhDBO5kyjgbMJbJaExVmcgY1E/EFcWK43/R9IWumVmCfTSkqRE00Ce/elPbdk4prdk
	 F3AfmBwzQPKgw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 031BE3808200;
	Sat, 14 Mar 2026 17:23:08 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver fixes for 7.0-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <abVLUU5XP6XPck2a@kroah.com>
References: <abVLUU5XP6XPck2a@kroah.com>
X-PR-Tracked-List-Id: <linux-staging.lists.linux.dev>
X-PR-Tracked-Message-Id: <abVLUU5XP6XPck2a@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-7.0-rc4
X-PR-Tracked-Commit-Id: a75281626fc8fa6dc6c9cc314ee423e8bc45203b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4dad25aa60daced1d3bfbdd531c901620e8fb88f
Message-Id: <177350898647.1738937.6968511244495481510.pr-tracker-bot@kernel.org>
Date: Sat, 14 Mar 2026 17:23:06 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The pull request you sent on Sat, 14 Mar 2026 12:49:37 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-7.0-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4dad25aa60daced1d3bfbdd531c901620e8fb88f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
