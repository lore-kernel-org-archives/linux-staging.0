Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4DF23E33D;
	Mon, 23 Feb 2026 13:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771854954; cv=none; b=e04uaX2/+NQ1IvUkOafOWlZrLrqB5YweFLMiwyxHD3hqpOJiPYWUxj24Ds17D+X2ltuxkPXTIofcFdCyddHp/qEUXgzWN/pBRtDeCMCX7BUMTLwkbwBYuGa0p1WH9fpKjf3iPeslbNQAjpt+WTjY1IGQuc39tulQjCQGQundZP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771854954; c=relaxed/simple;
	bh=rL18bNlCN6a/l5Y/PU02WlKz8m108cfmBtuMGbYWOKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ejmXHgQsRA31HSMjXBX61+fY+Ci1s8CK/3FOFOyPHeRcCnIvtlVCG6Ze0MJ/o/VLpFYbjDahX2ckfwuSQA4REFgIFuK/o4c4uFiQb8s72sLFwhKE1Tr+hVvmuiECISQDuVKZFSzFNeaaA9edODhA+DO4SjVMpt9CZil8eoc1e9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nBZEgYrq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nBZEgYrq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15DFCC116C6;
	Mon, 23 Feb 2026 13:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771854953;
	bh=rL18bNlCN6a/l5Y/PU02WlKz8m108cfmBtuMGbYWOKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nBZEgYrqrEqzRxYOJ9a/kvlleNgCGFEdnfdbU96TGSfrB1NgUk3NjmlaWvz04nmOx
	 rN1OAFE/6PHx6rqGfzGs7Dd7eWzCexhVqapUpbzp4g+tzcQmnAQLq6gunEXhLT120+
	 0roA7ZanJSABgts5QvyMkEkkCBXIFaplcn/xUG3s=
Date: Mon, 23 Feb 2026 14:55:34 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Bruno Martins <ehanoc@protonmail.com>
Cc: elder@kernel.org, johan@kernel.org, hvaibhav.linux@gmail.com,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: remove unused apb_ctrl_fw_flashing()
 and apb_ctrl_standby_boot()
Message-ID: <2026022326-devalue-tricolor-26e3@gregkh>
References: <20260207151026.118681-1-ehanoc@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260207151026.118681-1-ehanoc@protonmail.com>

On Sat, Feb 07, 2026 at 03:10:30PM +0000, Bruno Martins wrote:
> These functions were left behind when commit 921dbe52b40b ("greybus:
> arche-platform: Add support for SPI bus sharing for Mihi") removed
> their only callers in 2016.
> 
> Signed-off-by: Bruno Martins <ehanoc@protonmail.com>
> ---
>  drivers/staging/greybus/arche-apb-ctrl.c | 10 ----------
>  drivers/staging/greybus/arche_platform.h |  2 --
>  2 files changed, 12 deletions(-)

Does not apply to 7.0-rc1 :(
