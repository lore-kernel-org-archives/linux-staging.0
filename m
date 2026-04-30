Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083223D6CC3;
	Thu, 30 Apr 2026 07:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777534825; cv=none; b=EvkUfrwSne28eFKHmYcGhTYE2ROebT2FNQeTIIad0Kf2Y9ryl8+yBLu4YpQVWpbVPSQblR7GJ504dScuuL9PfEajOSsD9LIvCxe8cyaXqhP+QWJnnNSeu1TmhL3duVeqnd1fPBUOXqSDwttxDsEXS8wJwjM+rC9iw4T6kDwO2hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777534825; c=relaxed/simple;
	bh=JbH3L81KysEftyrwRDhCB0RqFyOb+vxC02USZZLMmB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GzFccLf+DRDDmSfpj+3vzb63omcU1HO3Fn1qko0/lXEpPUAahjtpwRgsHdrivrzL4bT/zyi3QADeTxCF4PTadz6/oOj4YGBq2jzEqjZepLTCHmfwSAKx3kJ42BDjM3xgaIfPoKnXlmKNNHVvDhyZCwLABYcUlLzTufkgY4jLxWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KMhSzsqY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KMhSzsqY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C372EC2BCC4;
	Thu, 30 Apr 2026 07:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777534824;
	bh=JbH3L81KysEftyrwRDhCB0RqFyOb+vxC02USZZLMmB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KMhSzsqYOShyJ1kbKcjSzSByIfxgYj6ULeLjCjz8fhkIYaFBJO07d/kvd6vqAgRsC
	 Ls2TnSruvUQWczb4xt7l52bGozs9cOBMtk+l6x+WO/Szon5GLLf9qLMxiJwEhW3CTT
	 YdExRalQBmxfEk9D9bLEm6L+3nK7jsrWfkeFB4Dc=
Date: Thu, 30 Apr 2026 09:39:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: kernelcoredev <sonionwhat@gmail.com>
Cc: vireshk@kernel.org, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: greybus: bootrom: replace dev_info with
 dev_dbg for firmware name
Message-ID: <2026043031-uncurious-credible-d476@gregkh>
References: <20260430002220.3665-1-sonionwhat@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430002220.3665-1-sonionwhat@gmail.com>

On Wed, Apr 29, 2026 at 08:22:20PM -0400, kernelcoredev wrote:
> The original dev_info call was intentionally temporary, with a FIXME
> comment noting it should be downgraded to dev_dbg once modules with
> valid VID/PID values were common. Project Ara was cancelled in 2016,
> so that time has long passed.
> 
> Remove the FIXME comment and downgrade to dev_dbg as originally intended.
> 
> Tested via code inspection only, as Project Ara hardware is no longer
> available.
> 
> Signed-off-by: Bentley Blacketer  <sonionwhat@gmail.com>

Does not match the "From:" line :(

