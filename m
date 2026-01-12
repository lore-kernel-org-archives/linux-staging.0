Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06A8350A30;
	Mon, 12 Jan 2026 10:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768215396; cv=none; b=F8YQAOgH39qjn9fZH1+jMhk6xR5nDhm9wMPL5fdH57Dh2nLzMdEsPeGdPXv968n7VPBYWss6gssHBWzsrETzB78dZ5c/gIsEFGeHWouIp93Doyq1bB1T6NcGdThrE7XkNuJOgJFTAMsxd/UnWi8Xq88KnGs/U07nbAlf8P8v7zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768215396; c=relaxed/simple;
	bh=lM2YKGKbgsiLY6BFNSDSx9xyAGB1d38bRBVd8TxkL+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i8yWhZEFoeeCoVcQ2ARifZ5w/ZQWG3BxWls0yhBuK8evlOmx3Pxswl4xwluqxsr5dvfBvY0uShC1EfsnNgycZTkTR2/rv3ePV8RpIXKmgtzCDYYHWHz1CpiN5ZCJPXLebxqtWS4q0Q05E8dpGqMOKePwXIoodA0gmT2aZ/KEk1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wSZBz5er; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wSZBz5er"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D277C19421;
	Mon, 12 Jan 2026 10:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768215395;
	bh=lM2YKGKbgsiLY6BFNSDSx9xyAGB1d38bRBVd8TxkL+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wSZBz5ervLa8Z38xrkYx/zQVPgNW/pgnlOZ8JmmjazAzlCfMpQbsbs7Qv1S/GlLAA
	 ZoRJapsyvgfBVJ8XWiduVcZ/a2/3CJ1SeYS5UbOTFbAqMrZVRECSQDSzryE3zvzR2r
	 LDkYaVhjUuNIrkqCpPWgQnnS58BRbkZf9OrcTMTU=
Date: Mon, 12 Jan 2026 11:56:33 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Nayana Mariyappa <nayana.mariyappa@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v4 0/4] staging: rtl8723bs: coding style fixes
Message-ID: <2026011253-opulently-shredder-f586@gregkh>
References: <20260112104654.45175-1-nayana.mariyappa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112104654.45175-1-nayana.mariyappa@gmail.com>

On Mon, Jan 12, 2026 at 10:46:50AM +0000, Nayana Mariyappa wrote:
> This is a series of 4 small coding style fixes for rtl8723bs. Each patch is
> self-contained and focuses on a single logical change, as requested.
> 
> Changes since v1:
> - Split the original patch into 4 separate patches.
> - Each patch now fixes one coding style issue.
> - The previous patch fixing the non-kernel-doc comment has been merged
>   into this v4 series; the separate patch is now retired.

But this is v4, what happened between 1-2, and 2-3, and then 3-4?

Also, please slow down, take some time, relax, and redo a v5 tomorrow.
There's no rush here.  Take the time to get this right.

thanks,

greg k-h
