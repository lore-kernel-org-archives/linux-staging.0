Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB51815B2
	for <linux-staging@lists.linux.dev>; Sat,  4 Nov 2023 02:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rhj4lHOZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5BF82C43391;
	Sat,  4 Nov 2023 02:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699063826;
	bh=Ds+SV2iGNavCSdCZwv1k3Ou8fZ2Dzxb9V25vnu0I6JU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=rhj4lHOZYit/ofkgRRAWKkco8KFNb7MYAFbO2vQVhMDQKFw030HGJAQVESWvviqKo
	 Zm4LFU+FAMAx8GkN9vQbA+Wp9KCWLpjqE1EOFCiMrWQ0W1sjBqkkowVSowE0P2g9b4
	 LEDlTgPLanAUZzSa5Idh1CCTlebacMXdsNf8w6t0iiw2fBAzFyGIXns7yRhxFq7haq
	 YkjD8DfV17baKSbMk4OBosFmiintxXZ84mL0ACumF8bXwp1B6w5sgeIHUSs5RiMRhA
	 i45GpLAoZPhxOdGOf9BpJVHYzkvhA6EVF24YEJ+6MHTUJRtBl6S6c5uLgOxYoNZ0my
	 gtJch5+5ek/Fw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 474C6C04DD9;
	Sat,  4 Nov 2023 02:10:26 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver updates for 6.7-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZUTiKqLbWEPTVZCf@kroah.com>
References: <ZUTiKqLbWEPTVZCf@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZUTiKqLbWEPTVZCf@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.7-rc1
X-PR-Tracked-Commit-Id: a4000df5300fdbe10d84e3b70e2d6a98686310a9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4c7a0c95adc3ed8cc5e4c2187521aea3e40ba1aa
Message-Id: <169906382628.26291.3454184896525324299.pr-tracker-bot@kernel.org>
Date: Sat, 04 Nov 2023 02:10:26 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 3 Nov 2023 13:06:02 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.7-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4c7a0c95adc3ed8cc5e4c2187521aea3e40ba1aa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
