Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CABD2877FA;
	Thu, 15 Jan 2026 11:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768476640; cv=none; b=KCI9caVPn0zj469wZKuumaGMFY0Fjw4lGPWqcCWbHjeKtqT3p57e7/P37j1J+FUHFX0uz0W9vP4DqNvIJnXawXNj4ECDg87DP2JbXpPj+YQ1y9MghY1/Aa2RFV3TtyPwPwXjG5+XZwW3898br86xbeuRDmSnb6utG/trq6r/EPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768476640; c=relaxed/simple;
	bh=z2tOQMR/FYKSP0Lua63j5QYxclOMp+Z+KlWaf7Ccdno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iab1vERyPaZ9iYdTiiMzmta8AFKfQfgu2Fmrai4i8/MkqhT2GjSM2p3SwQjuNU5+n3YS4ZvTtg4qXBFB6KCVhFKbLNxLx64b33reTNLNIWez2C1NnKj3wJjVDyGi3HMeqgjEYllXQsELM/Hkjo6S9DYK/w+Y7ITFZhYM/cQZTu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=u2q3o8AI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="u2q3o8AI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5A50C116D0;
	Thu, 15 Jan 2026 11:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768476640;
	bh=z2tOQMR/FYKSP0Lua63j5QYxclOMp+Z+KlWaf7Ccdno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u2q3o8AIw7ZPaVS002FjpHySY1yC+r7PjUiJJMrnr62Tj18Ivx1MfeCSu7kpQeDkN
	 tcUQGwInDj5MYW6mh4tlG4akIYw8Tzvr2DMsfi6hB+qgTpcdOhhJnuFvnZwG5PV3O9
	 V01iYTzfElDAyQMXpxVEWUsZUoHOQNVqPUBoqXgg=
Date: Thu, 15 Jan 2026 12:30:37 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Minu Jin <s9430939@naver.com>
Cc: ovidiu.panait.oss@gmail.com, gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	lkp@intel.com
Subject: Re: [PATCH v2 1/2] staging: axis-fifo: introduce helper functions
 for register access
Message-ID: <2026011525-deviate-blurb-2514@gregkh>
References: <20260115022509.3038062-1-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115022509.3038062-1-s9430939@naver.com>

On Thu, Jan 15, 2026 at 11:25:08AM +0900, Minu Jin wrote:
> This patch introduces axis_fifo_read_reg(), axis_fifo_write_reg()
> to wrap raw ioread32, iowrite32 calls. Using these helper functions
> improves code readability and provides a cleaner abstraction for
> hardware register access.
> 
> All existing single register I/O calls updated to use these
> new helpers. This refactoring also ensures a consistent access
> pattern and makes future maintenance easier.
> 
> Signed-off-by: Minu Jin <s9430939@naver.com>
> ---
> v2: No changes.

This should have been v3, right?

So next one is v4?

thanks,

greg k-h
