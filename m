Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5784447DD7C;
	Tue, 19 May 2026 09:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779184024; cv=none; b=LMVk+6m1Hsj3gxfZ4+03MwMVk7Gvv48pzVAItYdz1sC+x5R2EXn7U4J0Dp7qNHIpY3h7LWrMrl1ivrF3HYVoToPbiJqrsND7TLihah1f+4KGhVdrjgtqoQA4GrH9SXJEI6KD3oNVE+J9newTr4xITsz/XAu60X4k8knscFYbCUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779184024; c=relaxed/simple;
	bh=aOdP0uvNt2qI/Fiipjy4kfTPjyUxLsb2hLYHQ3xzj04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eaP9OO0rpDpQgwMPkdwFt11W4RcznbrNGFmpNaWJD1VwUy7q2J9F+O9scnDHSYMWsagLczIYhUldyNKR991GUzQ4zm5kOle2Xycw8pWZYbsvCxcWx4IfVZzlDGdnqiL6H+YtKojVvUV1jWUDDYKHcEEU91kFnE6aIboZX5aETV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TCnwTCTJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TCnwTCTJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85553C2BCF6;
	Tue, 19 May 2026 09:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1779184024;
	bh=aOdP0uvNt2qI/Fiipjy4kfTPjyUxLsb2hLYHQ3xzj04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TCnwTCTJy+cgpEyd7LpjveL90ucgnjGOMCnqbmbUraF9fhDUxb8P0QjvemSoXRvun
	 vtBMKmJQxjcuxvK59jxF2pNM2B60d9/RnfUqA91/0wlsL2j+oFjeWS7VeIwIjS6Z3S
	 jgfcOiTvfUBqvnfLMkU5Bf2vUNoUNDnZii3EDK5Y=
Date: Tue, 19 May 2026 11:46:16 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: lixinyu <xinyuili@126.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix coding style issues in
 rtl8723b_hal_init.c
Message-ID: <2026051952-crayfish-speed-6970@gregkh>
References: <20260519090114.828918-1-xinyuili@126.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519090114.828918-1-xinyuili@126.com>

On Tue, May 19, 2026 at 05:01:14PM +0800, lixinyu wrote:
> Fix checkpatch coding style issues:
> - Add spaces around binary operators (|, &, +, >>) per kernel style
> - Replace C++ style comments (//) with kernel style comments (/* */)
> 
> No functional change.
> 
> Assisted-by: Claude:claude-4-opus

Do not do ai-assisted fixes for drivers/staging/  They will be rejected
as that is not the goal of this codebase, sorry.

greg k-h
