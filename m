Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB4717BA2;
	Wed, 22 Apr 2026 06:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776839275; cv=none; b=YjDqZzWAAtm84KoOQgtscQa2Nuv+cAk6zfZjPPDz2BU3UtZxOZ5LTDIsJxmQ5l71wipD0bacIekjs2yS+7BrLkw1W5Q79+5VAIgnbJPl5V26bsStjzauyy9bxZkDWOgTAG6qOqKAcemY7WG/9SUqMn/iwUPZ5k7yuoI4SN41p0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776839275; c=relaxed/simple;
	bh=btQpwcctXOw45kaW4AgEBXgZJe8l27uai38deakavJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RidutJXrVCOpHzn7l7vGegWVcibgo5ZNKVgaaWjt1s2rFipRkUuBhjePfNB1C24yRL2V59/GgBH7OsFtjnW5L/iX9ptSLS5F7payMU3YovmsQaKvKdHDDF3dBubIhyR90MGTShQhgAxa0Jg5MBHGhN3oPIg/P+cHwvQucYcqobk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kT1Neng9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kT1Neng9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4503C19425;
	Wed, 22 Apr 2026 06:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776839275;
	bh=btQpwcctXOw45kaW4AgEBXgZJe8l27uai38deakavJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kT1Neng9Cb49f2hPGLURC7FA4cwmJDe/smqPDFwCJny5lLiLLxl6yM+blXDQCxSam
	 8HPChUr8XfoVD3HUOhIwN+Y2V1IasVWD49c6VlmBsRN6o0pb+ch2+nUc1bmVaNLSgf
	 ke59xsjtL5y7w8SF+hI+Y0xSgl9mqcFmzaDB9fYA=
Date: Wed, 22 Apr 2026 08:27:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sajja Easwar Sai <eshwarsajja20@gmail.com>
Cc: sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
	tian.shu.qiu@intel.com, mchehab@kernel.org, yong.zhi@intel.com,
	tfiga@chromium.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	iryuken@duck.com
Subject: Re: [PATCH] staging: media: ipu3: fix out-of-bounds access in
 imgu_map_node()
Message-ID: <2026042201-appear-unsubtly-1d76@gregkh>
References: <20260422061951.352746-1-eshwarsajja20@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422061951.352746-1-eshwarsajja20@gmail.com>

On Wed, Apr 22, 2026 at 11:49:51AM +0530, Sajja Easwar Sai wrote:
> imgu_map_node() walks imgu_node_map[] looking for a CSS queue ID. When
> no match is found the loop exits with i == IMGU_NODE_NUM, which is one
> past the end of every array that is indexed by node id.  The value is
> returned without any bounds check, so callers that use it immediately
> as an array subscript produce out-of-bounds reads.
> 
> The most critical caller is the threaded IRQ handler
> imgu_isr_threaded(), where b->queue comes directly from firmware; a
> malformed or buggy firmware return could therefore trigger a kernel
> oops.
> 
> Harden the code in three steps:
>  1. Add a WARN_ON() inside imgu_map_node() so the 'not-found' sentinel
>     is made explicit and any future regression surfaces immediately.

And then you just rebooted the machine, causing all data to be lost when
panic-on-warn is enabled :(

If this condition can be hit, then great, handle it properly and
recover, please do not crash machines.  WARN_ON() should not be used for
anything that a user can ever cause to have happen.

thanks,

greg k-h
