Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D2735B65D;
	Thu, 18 Jun 2026 10:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781779107; cv=none; b=CZeqXJMvQoBimgDPGzwvL5NHp0s0Kx+7ielqViRPxoTU8bR9P9KD3ZdUZug2y2Q8efuEs+j+zKqF5HT13Oy56G8YnDoWPRQXoLsLBcDSgfARI1gZHZTkHFJoAQ4Ovh/yfGy/5D0xX3XSWed2h3M0op8/RBGlr/YtJn53VDIl35s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781779107; c=relaxed/simple;
	bh=k3+0B24URNZPNrFz5LAvaEgr9DszKqyGLnjAS2IOCBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZ8O1huZ5DpRMa8yMXbvgOeUqxJHaio/u8tuFzwvsC+qcgaVcfkk8ij+W3aIxzzVEZLIblFp4WVm2gO6TFRuA17IAlslbEpAstmmCdEBen+Tm/Bx/fhzjkM0DVbb2rbE60L7TSQc4N2jlkAPKuVNKN7kHKzv0dGvYw3pqYBPFDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Q72aPptZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Q72aPptZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36AF41F000E9;
	Thu, 18 Jun 2026 10:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781779106;
	bh=VEjmjyL/oIeyh2t7kFX+5dNi+Eil6BG5JMv9rdQYIFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q72aPptZBEbgr6N41H6GJaSWzk3I6/OPUKmESjODd2XNMPQSIZz7AezRW3oiU8LOy
	 7zHMtpBXcjRrJSlR1XX/BphfYCOvFUSPCtcRMcypgMs0LtuzMFhnNV/pxBCEtx28b/
	 hrd0HycgPAHj5FvYmiap+BO1ZynqtJSbdNZ9KD+I=
Date: Thu, 18 Jun 2026 12:38:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alfie Varghese <alfievarghese22@gmail.com>
Cc: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: vibrator: return device_create() errors
Message-ID: <2026061803-reiterate-slate-bdff@gregkh>
References: <20260528135111.2791-1-alfievarghese22@gmail.com>
 <20260618040132.436-1-alfievarghese22@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618040132.436-1-alfievarghese22@gmail.com>

On Thu, Jun 18, 2026 at 04:01:32AM +0000, Alfie Varghese wrote:
> Gentle ping on this patch from May 28.

What patch?  I have no context here, sorry.

> Apologies for the accidental duplicate send; a second copy went out
> shortly after this one by mistake. This thread is the canonical one to
> review.

If you sent two different ones, always properly version them so we know
which one should be reviewed.

And its the merge window right now, nothing can happen until after -rc1
is out, thanks,

greg k-h
