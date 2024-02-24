Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6169BE566;
	Sat, 24 Feb 2024 03:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708744233; cv=none; b=j+1WSeaC8KtZixD94z/Uh99xhqKMBHu5tVG1TYi47BX3F4n2ux4rtZ3Wsa7JULW5tLMpIPykDavuJfANtda4s8JNt8SbnVQ4Is7jV3PwWosdKX7IxAF/JHsu2XZ/zCf+upTwjJhzs/tHQJjdSjC1c0CNQ/AVKxH0dCLsWKwezNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708744233; c=relaxed/simple;
	bh=6c50vqQy0N8sARqM/FYPf0zAfLsppI6dFzZNzb1Hc6I=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=h0LpjI5ePMSkAMp5RAzo+1U5eD4K6HfkJ7PKNBYSwWTG1d/AL0V6zykQ7Mw6RjYEX0FbYa9FO4m/gX/0J8JcIMkGPYBOylsA3ZXoAzENxni52z0rvQcTGPhRoJV55aFO2292vh/j7GcD6ME1AHWQh1VvBhzowOpnjP5Gl2b0uyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nVQlREAJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nVQlREAJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2239C433C7;
	Sat, 24 Feb 2024 03:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708744232;
	bh=6c50vqQy0N8sARqM/FYPf0zAfLsppI6dFzZNzb1Hc6I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nVQlREAJqbib59/S6XXB/JrTu58Q2qgdxaIPUkn7O8h0oUuwa7yDy08Qakfdprl0U
	 rFlQ85PNV4NdiOQfgxeWrZCQEmS7DYzcJnbQ3r1t5naNhbM4Mnd4g250lOiXg+cICk
	 osJ1AMQVX7wfSI8zjwQf88yRwrs1WOcArLDOW2VzDmzUxvESH4uhHDbuOio9PmI4LX
	 jmW2rlZv0cbOP1/pksDR8+imvw1FpAzsPLAiy+goKIEWUao0Xg9rab9hMCodsEbvIB
	 s2Pzjmv7W5UHl+9m36wO9ANy9qcxT2onmaKMU6tD/UUtjWI3JlZOXs5VUrp1QHndvU
	 ggBI+0m1Lm8Jw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B8572D990CB;
	Sat, 24 Feb 2024 03:10:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/3] net/staging: Don't bother filling in ethtool
 driver version
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <170874423274.898.17692880234682888016.git-patchwork-notify@kernel.org>
Date: Sat, 24 Feb 2024 03:10:32 +0000
References: <20240222090042.12609-1-john.g.garry@oracle.com>
In-Reply-To: <20240222090042.12609-1-john.g.garry@oracle.com>
To: John Garry <john.g.garry@oracle.com>
Cc: jiri@resnulli.us, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, gregkh@linuxfoundation.org,
 netdev@vger.kernel.org, linux-staging@lists.linux.dev, masahiroy@kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 22 Feb 2024 09:00:39 +0000 you wrote:
> The drivers included in this series set the ethtool driver version to the
> same as the default, UTS_RELEASE, so don't both doing this.
> 
> As noted by Masahiro in [0], with CONFIG_MODVERSIONS=y, some drivers could
> be built as modules against a different kernel tree with differing
> UTS_RELEASE. As such, these changes could lead to a change in behaviour.
> However, defaulting to the core kernel UTS_RELEASE would be expected
> behaviour.
> 
> [...]

Here is the summary with links:
  - [net-next,1/3] rocker: Don't bother filling in ethtool driver version
    https://git.kernel.org/netdev/net-next/c/23fe265fbfbc
  - [net-next,2/3] net: team: Don't bother filling in ethtool driver version
    https://git.kernel.org/netdev/net-next/c/0a4e1b453a8a
  - [3/3] staging: octeon: Don't bother filling in ethtool driver version
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


