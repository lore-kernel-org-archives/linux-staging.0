Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E523CF690;
	Tue, 25 Aug 2026 19:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787687462; cv=none; b=pjt8I7wa3F8CUunKogpkvFAObVExxKbeLXpVGUotLd36HGGfPHOmkex8uZbAcpb3YWYRRLyFTyGCKJJusEEHKUtsKmuwRjQsDPkR5nSucPM86Jjm6DkT8MtgfQgoGuY/vObS99AVqOmz3SN7ROBX1/HdZ647JBDbShXEu2hSQhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787687462; c=relaxed/simple;
	bh=okE3vKSKX0Uqr3oBScPBgsc0L8J0d9XVeJFU3zBGhkc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=r1acPjQVc76Y4fEVm7mXObVIutVUgKJuVPO3cECF7uX9Hzijn9csd22Xr+G87sL7cFWbkWTkf7zG7cSDSTMmTkSNDmSK+oOy5nxjuj4qT9YlTI3VLvn4mvtDS7PnN2y3onkfIEcaE/goK4DvO8ORbU4B5Esd1kqNUg/wJ8p0eIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dZvITEh4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dZvITEh4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 110801F01558;
	Tue, 25 Aug 2026 19:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787687458;
	bh=PbN7mFnUcO9WRMr5AX8wgIw7W6iziVEwaHm8nitSNtM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=dZvITEh4IVa/TA0tWOzHuu7JeRdMzo3KZYpM/APWmja1Vacimv53Cg1Gn1YnNaH0L
	 rybkiTKhoYn25Wif2PhAlb5TvCx43c0vL+11rtlKGCDxLAx3FQ6nUs8jFDmrKk9+MC
	 GAvs6gjmJsgUP9BNbO3qUmiwVosABBLNCCi69JhZIPwyS0sru/alOEGHq7VdjHO9pz
	 S5tMiLeDPltvn/YTPikZRQmJCUtNtev18k9tasb5rhmyDm40TtWB3C8GWw8/Na0Cp9
	 ugMOXHoYzPDE+hhE/fvkuRBDAU5bUAzqFaJn+EMg0ubBiOzIJYbwR3PyvKfFzgJEIQ
	 ZBuf8MfgrFW2w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19A6539253CD;
	Tue, 25 Aug 2026 19:50:06 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver update for 7.3-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <ao2kTjU_gnL3zR20@kroah.com>
References: <ao2kTjU_gnL3zR20@kroah.com>
X-PR-Tracked-List-Id: <linux-staging.lists.linux.dev>
X-PR-Tracked-Message-Id: <ao2kTjU_gnL3zR20@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-7.3-rc1
X-PR-Tracked-Commit-Id: c6eb4dc5964fdf4086b73b7f0f5dc0d595fb5cf3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 29b0977977d7b77b192e434d1a94628cf006f795
Message-Id: <178768740497.4034242.14862378360282891743.pr-tracker-bot@kernel.org>
Date: Tue, 25 Aug 2026 19:50:04 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The pull request you sent on Tue, 25 Aug 2026 16:18:54 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-7.3-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/29b0977977d7b77b192e434d1a94628cf006f795

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
