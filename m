Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5D0378812;
	Mon,  4 May 2026 14:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777906588; cv=none; b=Ma05I2F9DMWmlVX8blrdt+S8WfnaGzwFwU+HlKN8wT3IhqtNYN9Ca0CrblVhl6WnSGyuZFcnUG4TGkaTQpuAfB7cpSH2C+WAatrJMYqH4x1X+MQ8X63PisBemImy4tewx4JAzIK/A76F8MSxp60WxYg5NFMjKRBKDtWWoBJ7Z+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777906588; c=relaxed/simple;
	bh=Z77KrgFOO4+pNFr6e/bYqMBfKko2jtGFoe/GTrXwigQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PNqjtZ2rhMFrrrxfoZS27dAntoZHHaQNntNkdmomLmwqZe3ZxSorQo95+TFLJvQe9efrPXvo2jyEaHbGKdGUGooKsHfeQXabNoXLJApNvQhgVctyCs1M5PGWMOv4tNgO3pTAzfauI7zTJ5pmW+V1P3q/7fUL4O1n+/gzr7Q+C1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=i56B9zVE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="i56B9zVE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7095C2BCF6;
	Mon,  4 May 2026 14:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777906588;
	bh=Z77KrgFOO4+pNFr6e/bYqMBfKko2jtGFoe/GTrXwigQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i56B9zVEZzMup/8wpw3zgUgsfdBWx2kkszvMK+i/E2IEUFUTWS4HlWctAd39MoC99
	 7qLfs9N5JcHz+7E5V01z/qtPqnShLDoNGVvxF2x8A4bw42qXMG5MA24rMApcNn4v7m
	 oV+kjJoHSMHi2mv2NSna12ED7L+BH1hmlkH2rwuM=
Date: Mon, 4 May 2026 16:21:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Cc: error27@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/4] staging: octeon: replace pr_warn with dev_warn in
 fill path
Message-ID: <2026050441-vessel-goldmine-2bb6@gregkh>
References: <20260427151556.91153-1-ayushmukkanwar@gmail.com>
 <20260427151556.91153-3-ayushmukkanwar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427151556.91153-3-ayushmukkanwar@gmail.com>

On Mon, Apr 27, 2026 at 08:45:53PM +0530, Ayush Mukkanwar wrote:
> Replace pr_warn() with dev_warn() in cvm_oct_fill_hw_memory() to
> include device information in log messages.
> 
> To make the device pointer accessible from the workqueue callback,
> introduce struct octeon_ethernet_platform to hold both a struct
> device pointer and the delayed_work. This replaces the static global
> cvm_oct_rx_refill_work. The struct is allocated with devm_kzalloc()
> in probe() and stored via platform_set_drvdata(). The worker
> retrieves it using container_of().
> 
> Add a struct device pointer to oct_rx_group and thread it through
> cvm_oct_rx_initialize() to support the NAPI poll refill path.

Why isn't this the platform device?  And why isn't this data just part
of the platform device's data anyway?  Why is it a separate "thing"?

thanks,

greg k-h
