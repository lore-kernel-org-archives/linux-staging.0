Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B628636F42D;
	Mon, 27 Apr 2026 03:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261893; cv=none; b=SYc9r25sxQWbthS+d68fxjADTyYxZu/CE6eXzXi6kK1At1ooG1MqczZ4fkGUNyRLMXhXWRdWd6rp7UZYoT8HETGB6jVrgzE4ErbO5SXatOC5xD9F68V/eFrJ3FSoSXfIciwlOudEBncMPjfNGW7RgvvyqbdRQaO4dwoj3zlOxpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261893; c=relaxed/simple;
	bh=DQyKsCLV+cR6I2+sXXohf6RQGWpLIz26odMLcoQxkJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FVBljX2w2XogFhxvgFE6a3PAZw/IGmXbIxt2txWLV+4OWfEmJiZxBaQn7ZkdDVizJLWw2TXahnPPkr6KfeP+1Wzl8PBGRq3VU4R37CsSodBqrchodS8N3olUDrY/PimuhA7FgNCHEcniukmeKO+ro1PoFujBf4jinWNjWHpufVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=r+XA3Xe2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="r+XA3Xe2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CAE0C19425;
	Mon, 27 Apr 2026 03:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261893;
	bh=DQyKsCLV+cR6I2+sXXohf6RQGWpLIz26odMLcoQxkJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r+XA3Xe2V6QUQJwHWr9iLMRw51mV/KNPqEmkvSngpReLn4E/TuzgipUiDg5psnjSY
	 Uz9+RhfGVgff1SyeEjtmtDMUtgZzlAcr9Z0IeM0BWDGjuDr/teu0vyLzLqfcJsPBiZ
	 EBhp6jGKZnxOfA7iOYVlJ/ZGkm2bWavZW5XeFmIE=
Date: Sun, 26 Apr 2026 22:16:54 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yuma Ochi <ochiyuma.ochi@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3] staging: rtl8723bs: Remove boolean comparisons
Message-ID: <2026042634-backed-appease-89a7@gregkh>
References: <20260419161636.692366-1-ochiyuma.ochi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260419161636.692366-1-ochiyuma.ochi@gmail.com>

On Mon, Apr 20, 2026 at 12:16:36AM +0800, Yuma Ochi wrote:
> Remove unnecessary comparison to true/false in if statements
> to follow standard Linux kernel coding style.
> 
> Signed-off-by: Yuma Ochi <ochiyuma.ochi@gmail.com>
> ---
> v3: add missing changelog below --- (Greg KH bot)
> v2: remove unnecessary parentheses (Dan Carpenter)

This is huge, and conflicts with patches from others.

Can you break this up into smaller pieces please?

thanks,

greg k-h
