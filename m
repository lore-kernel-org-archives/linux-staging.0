Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BF435CB9F;
	Tue, 27 Jan 2026 14:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769525093; cv=none; b=KbZyRpQVurXP52Tv6t8csqskU9pza1ITpD3i+EFdJgi7NmMoRRF2gugBJ6yTH47pD2T9ivu3U2iLR3sPTowyW9Zz8eMeTa49rOZk3NbQ+Nc0N+rF8NQaSIFD4BweM4SRTl+A7uLjhZB/nZLvdzfpwAcI8Ry7RxlgQ8mk5gTuTRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769525093; c=relaxed/simple;
	bh=mU3Qj4jOSIeZcB9Ipc3qrIOJ9CqKPwvcvNIs4+4m/L4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D22nLxm9SKRFoOJTjiMjOhPO33NwOiYdbpAG3yX/47BODCxAKZsAOBzEzz8tsMns7IrhzNEOkpIf0Pu4lvP0FYck0jQoqYhr6C/byZFnxP0rqmueHQdQNu28w7qx8YdsyATl2qv4BegZvCIaqBb9sdmCYlKdEJti+FaYkBfTMpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xT9kihzY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xT9kihzY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1B99C116C6;
	Tue, 27 Jan 2026 14:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769525092;
	bh=mU3Qj4jOSIeZcB9Ipc3qrIOJ9CqKPwvcvNIs4+4m/L4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xT9kihzYdoBcQaIHS82elMtFsjkzXq5tZ6fdYymPdRYPxOyrsYhg6m598Z8EpdYEj
	 rCu0MGXXLIVVzl0/BTlEXtnAPx/fYZC/PfIz3a3DSGBtCqCxYlFrL9T1A2ySl/feoq
	 MvqpNN49gLjLfHMusI1y837v+aRK6naOteHjMTa8=
Date: Tue, 27 Jan 2026 15:44:49 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Minu Jin <s9430939@naver.com>
Cc: dan.carpenter@linaro.org, andy@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: Remove wrapper functions in
 osdep_service
Message-ID: <2026012715-cottage-unsterile-00c2@gregkh>
References: <20260124154145.541997-1-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260124154145.541997-1-s9430939@naver.com>

On Sun, Jan 25, 2026 at 12:41:45AM +0900, Minu Jin wrote:
> Remove unnecessary wrapper functions _rtw_malloc, _rtw_zmalloc,
> _rtw_skb_alloc, and _rtw_skb_copy from osdep_service.c.

Please do these one at a time, as doing this all at once is impossible
to review and verify.

> These wrappers were using 'in_interrupt()' to determine allocation flags,
> which is unreliable and discouraged.
> 
> Callers have been updated to use standard kernel functions directly:
>     - _rtw_malloc() -> kmalloc()
>     - _rtw_zmalloc() -> kzalloc()
>     - _rtw_skb_alloc() -> __dev_alloc_skb()
>     - _rtw_skb_copy() -> skb_copy()
> 
> All call sites have been manually reviewed and converted to kzalloc, kmalloc.
> The GFP flags were chosen based on the calling context:
>     - GFP_ATOMIC is used for atomic contexts. (irq handler, holding
>       spinlock)
>     - GFP_KERNEL is used for initialization, configuration, and command paths.

How did you validate the calling contexts?

thanks,

greg k-h
