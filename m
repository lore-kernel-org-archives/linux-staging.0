Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43B72D9EFF;
	Wed,  1 Apr 2026 14:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775054151; cv=none; b=lv8SOqWCMhD1HgYCwDzpyP/9AuTqMthranTkV8p0YZDQAsCzI3yTy6LUyi+FUEp0zRpVUBTdyi908xtkKRKw5NkpHL6FuWYIMvDG2pVSmovkm1PkqiLPOokWcmRkhvwbdm6WwGs8pto5l+dMM67BIagrpwn6ELPH3AWPs6SgbMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775054151; c=relaxed/simple;
	bh=m9MQv/+xHVnv9KxDvHolpXGTatHUTDpM3/XUeo/oduY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qyYQ6mOA0N5kHtn1KM/PcLrzd28WwFc9/GK+5Cq+pZqT6BZc8YAhhFIwexPXeLH45bNfa7fwPiWcoIpZkHsE7sk0GM5e7h104OD9enwt7N48+MhW+OVuuY14gKCagQ6tEaZ/05PSeYQT30GwDJiTSLoxX4+gh3K088sSA9TLrD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m4qc+wXn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m4qc+wXn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57B2AC4CEF7;
	Wed,  1 Apr 2026 14:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775054150;
	bh=m9MQv/+xHVnv9KxDvHolpXGTatHUTDpM3/XUeo/oduY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m4qc+wXn3h7fwNgToxtrjwTYV6j0qV6r7y08NT4QcVgt/m6wtl7N/56Gfxtv78CT2
	 6JyQKJQ6EI/heIh8zVlUSdXqxPcYa5ZtZ6Kl6vtBmHiJPM6WGjZxeh+7aUPP2wp+p3
	 4cG5v4MvTGDpdUgVIGR9TO68OIAIeaJv25otjr/5rZpCvuGzfdJPS3Z2pPN83URZ3i
	 /SFVdstzWay9bkh4W3JTToHewqwnQQenCfvXsG5wlEbZK7ynq5ZSDGt9JJJu3kSQCX
	 JZg6aOowE0EN5ctBBkNGqD8+K8YKJQk430CGmJOe0EHVkJHzXlPej7D51rl8X0ZB2Z
	 zio/Fl1wFkqnw==
Date: Wed, 1 Apr 2026 10:35:49 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Greg KH <gregkh@linuxfoundation.org>, omer.e.idrissi@gmail.com, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/5] rtw_sdio_if1_init cleanup and small logic tweak
Message-ID: <20260401-icy-fine-flamingo-d406ee@lemur>
References: <B2394A3C-25FD-4CEA-8557-3E68F1F60357@linux.dev>
 <2026040119-smasher-oozy-8d41@gregkh>
 <5252F4DA-4FB2-4217-B13E-4B6AF912220B@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5252F4DA-4FB2-4217-B13E-4B6AF912220B@linux.dev>

On Wed, Apr 01, 2026 at 11:46:59AM +0200, Luka Gejak wrote:
> You're right, I used a tool to help format the response because 
> English is not my native language and I wanted the review to be clear.
> I see now that it made the response look like a bot report and I 
> apologize for that. I'll stick to writing reviews manually going 
> forward. However the technical issues I pointed out (like the inverted
> _SUCCESS/_FAIL logic in the staging headers and the uninitialized 
> pnetdev pointer) are real regressions I found while auditing the code 
> on my local tree. I'll make sure future feedback is direct and clearly
> identified if I use any tooling.

If you want to try something out, there is a new feature in b4 that allows
integrating agent reviews in your response in a format that would be better
received by kernel developers:

https://b4.docs.kernel.org/en/latest/reviewer/getting-started.html

HOWEVER, it does not remove the need to verify what the agent wrote -- LLMs
are *routinely* wrong.

Review and include only those comments that you have verified and are sure
about -- never anything that "looks valid," because you are likely to just
waste everyone's time. If you aren't absolutely sure that the agent's findings
are correct, do not include them, no matter the temptation.

Best regards,
-- 
KR
