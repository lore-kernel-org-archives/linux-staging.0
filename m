Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F3523ABBF;
	Mon, 27 Apr 2026 03:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261825; cv=none; b=quwWceZx/JYCBOsJvoGhvnBkvHW3a8lbgzBiSYpq8fPrGFOKBj/dd4d9hFh8uE93lSa9wvlMQwq5weTXx1n8JjAEFDnHWkZ3NLp94ZcMXsnCCe4yRrw8kt6hbmZVLE4lQ2H/MadlpVTFNZ1nWeghtOs87p7E85HUVAqf7YMXWdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261825; c=relaxed/simple;
	bh=FFXWMEh/jcqgX6GCOhgyQQCioU4lxj0dHH01MvPRyhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VHqTqYypILbymBL1mbb9vCk9MAE07a7coEB8Yq9B4He/TlwEqcrG03AjBEipMSgcah91V6oopBkZ5WAMLO9kEx65KxV1E/IrM4BwqHrfl9oRhD1zIJNnjWywAAG+bJ5uKtHKu58lSrlQFUz/pDwmG7UwO6LBM5NRORmZdDa1fX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cW4Egoel; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cW4Egoel"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2B0AC2BCB5;
	Mon, 27 Apr 2026 03:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261825;
	bh=FFXWMEh/jcqgX6GCOhgyQQCioU4lxj0dHH01MvPRyhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cW4EgoelV6AQlAGDDMIc/H9EYiNL+/OFv08LEMzRmdE0S9z+kOzd9q92H1kpQ9xYQ
	 /ujhHJfQu/Ac08dF1sYL62zRRgL+XgiBVLkIunaWruLJLfUpXP4o5i/H3wm6w2LP07
	 xY7se3IqYFpnmW0AXaOxrVRuXIFoy4Lj9/nhvA3E=
Date: Sun, 26 Apr 2026 21:00:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Cc: error27@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] staging: octeon: replace pr_warn with dev_warn in
 fill path
Message-ID: <2026042621-syrup-ipad-1146@gregkh>
References: <20260405141111.87925-1-ayushmukkanwar@gmail.com>
 <20260405141111.87925-3-ayushmukkanwar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405141111.87925-3-ayushmukkanwar@gmail.com>

On Sun, Apr 05, 2026 at 07:41:09PM +0530, Ayush Mukkanwar wrote:
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

This is getting better, but you still have a static array here, now with
a random struct device pointer in it.  That array should just go away
entirely, and the info in that structure should be what is part of the
platform device local structure.  Or am I missing some reason that would
not work?

You are close, just take it to the next step and make everything
per-device, removing the array entirely.

thanks,

greg k-h
