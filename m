Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32256366550;
	Thu,  2 Apr 2026 11:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775130651; cv=none; b=uOS9e895YveYHXthpfx/wegQb4r/cIgRTxwFEqqu9hNuAy9BrrdeHdj4n5ay9kjw0cJVXx99vDRHiyH+VDwzoYVo17Sx2MsIvcR2K1FTrFIT/fjoyMro8iRt3AWJVEO/YkQ++r9mT2w3EqcvIpwWTavSflYb2YSXZsAmv/AJCOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775130651; c=relaxed/simple;
	bh=6HeMkxWhO1Rr9A+QrzzIMwlgXsChi5rjSaXeYR2D1FA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g+2+niMZ2KZgTHpZ5EFwlz3xP/cBUR05jz147+4Wpx0rKAoeKO8CHHUj/zxI/7fBSUPdaH3quzT485pTcohj80JQlCT3wSIObiCl+2tgAHrJFZ7y1ef23vAse0AMzZN9ZF2QctqytWP+Fl3sWyY9SG8rH6Ai80pReJKuKuzOg5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DMDLjYVI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DMDLjYVI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A1EC116C6;
	Thu,  2 Apr 2026 11:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775130650;
	bh=6HeMkxWhO1Rr9A+QrzzIMwlgXsChi5rjSaXeYR2D1FA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DMDLjYVIaL4/6aR1ByqYp1198C2fz9hRheKfFyR6ieghMw5Wd04Y17TUU1TQHD9O0
	 0PPOqolVWhZ5oykYLZvrZIkngYDKmxsAPr8dOWlssjIevyvjrIsZEgP6MKJZlJOP7j
	 VL1J6AinvhkSKyHNNHfCAhPusZGoQRDE7PIGAj4M=
Date: Thu, 2 Apr 2026 13:50:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] staging: octeon: replace pr_* with dev_* and
 netdev_*
Message-ID: <2026040207-shank-urethane-3014@gregkh>
References: <20260402114242.57411-1-ayushmukkanwar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402114242.57411-1-ayushmukkanwar@gmail.com>

On Thu, Apr 02, 2026 at 05:12:40PM +0530, Ayush Mukkanwar wrote:
> This series replaces pr_*() logging calls with dev_*() and netdev_*()
> in the octeon ethernet staging driver to include device context in
> log messages, as requested by Greg Kroah-Hartman.
> Changes since v2:
> - Use netdev_err() instead of dev_err() in ethernet-spi.c
> - Pass the netdev pointer directly to request_irq/free_irq
>   instead of dev->dev.parent
> - Move the device pointer to be the first argument in helper
>   functions

I don't see this happening, and I see other comments that I made were
not followed :(

Please, take some time, break this up into much smaller pieces, and
re-read my previous review comments and apply them everywhere.

thanks,

greg k-h
