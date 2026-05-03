Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA501382380;
	Sun,  3 May 2026 09:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777801733; cv=none; b=dCBhVCSG6rRUd3oDYO64yJp7xJ8acTDHYy56bbM1q3QXQaP2PSZrhE4tN6PAnfW9bHemXO95h5tzU8Z6aDCTrTG+CYofaf9260HsoX5nnx8jwAGxH298U76qBLKEqoi35FV4KUs6RmdyRtVEqYFgXsad0vuFQFk5lx/PkJjYP9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777801733; c=relaxed/simple;
	bh=34tKLD96VHttWbdo0EydoBfvcQ15QtCky8+Hc6/aNKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rMKDnye3RQFKz4HbMWTw29/UExxKFusjRePtW5NVbJwjnBuEbQSY4Y7N/8r9YzSjMLfmNJnAF4xhLWEZAAc2TwLQpLC/FFal0oZ8M3qW7GczVTc/EngYO60D8s35OSYJ05ytQIKJyR5E7lekwssCQs22hhsvE4mvT7xMTIFm0CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jZ2UYhZR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jZ2UYhZR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F30E6C2BCB4;
	Sun,  3 May 2026 09:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777801733;
	bh=34tKLD96VHttWbdo0EydoBfvcQ15QtCky8+Hc6/aNKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jZ2UYhZR+ymCbA86kzGzLGrbJGw4rmxhwpoOh+UXALFxACJssDwjyVuy3+LAnBkzJ
	 RSNVUzkHKhsXogD0TbWwO3obM1ZFPoSFbQ/DaRJJA8tw7lOl8Zmz7MSNsBDJh7g8mm
	 0ZFgpj3JYlgxhbE6Y5vcsN4OQH1cSmna+mjszkjM=
Date: Sun, 3 May 2026 11:48:12 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ajanth Badiger <badigerajanth1301@gmail.com>
Cc: dpenkler@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: gpib: gpio: use sizeof(*ptr) in kzalloc
Message-ID: <2026050352-alike-scribing-ef3c@gregkh>
References: <20260503093558.68105-1-badigerajanth1301@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260503093558.68105-1-badigerajanth1301@gmail.com>

On Sun, May 03, 2026 at 03:05:58PM +0530, Ajanth Badiger wrote:
> Replace sizeof(struct bb_priv) with sizeof(*board->private_data)
> to follow kernel coding style and improve maintainability.
> 
> checkpatch.pl also reports that LINVAL macro should be enclosed
> in parentheses. However, LINVAL intentionally expands to a
> comma-separated list of arguments matching the LINFMT format
> string used in dbg_printk() calls.
> 
> Wrapping it in parentheses would change semantics due to the
> comma operator, causing only the last expression to be passed.
> 
> Therefore, no change is made to LINVAL.
> 
> Signed-off-by: Ajanth Badiger <badigerajanth1301@gmail.com>
> ---
>  drivers/staging/gpib/gpio/gpib_bitbang.c | 2 +-

This file is not in the tree, what version did you make this against?
Please always use linux-next for development work.

thanks,

greg k-h
