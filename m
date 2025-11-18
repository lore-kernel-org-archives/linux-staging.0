Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E106536A022
	for <linux-staging@lists.linux.dev>; Tue, 18 Nov 2025 16:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763481888; cv=none; b=cqzw2x+Hwq4bLHB/7Kp7KDt5fe+WCfGue/m1sEE6m+KlTnKK5drN6K5lLflNr6d2X6iLfyn373sYhcCgolDyBcx2mDGJOcWN0YYfSfFMpR/DMVm1vwlTqL4asYFg75aCcJEI8HN5Iqjnlu/xZ6wUrLAAS8UWZAadsvIuiQGLt0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763481888; c=relaxed/simple;
	bh=9gQ9SEgdVfZrxs2j6npxc5eJd5sG7Qxk9CD7h2dDyCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eghYBEm83HHlv7d3zIhGD1d8dUtCCVH4UFurOwbgLKTKzII1+3W1dJvwmQcuxFc/oiAvxmMuZNBhP0EOr2qKmt74n6Kv8+o+Thdaao17nRkAldZldltbuOolU9zeGZCoU+gINk9SB+AMDX8LhpHhoDbR7/hhGKzI/cwNpsmvCdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U/LGjl4l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U/LGjl4l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DF4CC19424;
	Tue, 18 Nov 2025 16:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763481886;
	bh=9gQ9SEgdVfZrxs2j6npxc5eJd5sG7Qxk9CD7h2dDyCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U/LGjl4luHFUcMbTm3S9j3hWedu+CTVbTDuoeu+bUXwBiwgBNz74WqL9RYKiMGJNY
	 58fUsrEzVC9IBW7F80F3j53NyGOp3GCMnGUhsMk2mqgN0+mgzIkL0n7iGijM5bo60M
	 swgM8w6BXG8LRUVvA2tuT9djqxUSd81VciFHP2g8vEahY1BkhliEi4b17eg4DmlvAt
	 a3YfLqQRxis9pr9Ek1ma0gJK+JZygDs2mR+ccgDIVu816ZCavPsFcG8HwxDQmBwXdD
	 92rQAFQqdYWIQ00qqzxUkuDVTM61aptw8Ksa9KTmGJBGZWg7IkyXbIWVLVbVLHUdlV
	 rTTCGLbZO9gOQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vLOCD-000000003CZ-1Ppa;
	Tue, 18 Nov 2025 17:04:45 +0100
Date: Tue, 18 Nov 2025 17:04:45 +0100
From: Johan Hovold <johan@kernel.org>
To: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Cc: gregkh@linuxfoundation.org, elder@kernel.org,
	linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org
Subject: Re: [PATCH 13/13] staging: greybus: usb: remove obsolete FIXME about
 bridged-PHY support
Message-ID: <aRyZHWVl2jEFgrD1@hovoldconsulting.com>
References: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
 <20251117181818.118139-14-ayaanmirzabaig85@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117181818.118139-14-ayaanmirzabaig85@gmail.com>

On Mon, Nov 17, 2025 at 11:48:18PM +0530, Ayaan Mirza Baig wrote:
> The USB bridged-PHY protocol has never been supported by the upstream
> USB core and cannot function. Remove the obsolete FIXME and 
> keep the protocol disabled with a straightforward explanatory comment.

Drop this one as well. The comment is not obsolete.

Johan
