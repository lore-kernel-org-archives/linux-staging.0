Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C659476CDD;
	Wed, 19 Aug 2026 14:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787150715; cv=none; b=dezqAIzxCqdQXkG3ji0ySZCCc0ajGaPt6EekJD1TJgxzTZ/zBdd1NqmAxpvahbxnqSeAaukjGiPNEg1Kc/vQOko4oRIs1gxi+ENEeqOzfGChHnz7ogYsb9F7WyW+4m5TEoo3LTPb9kPNAwgoDya1XR5eVC/1B673RiXXQMdQYRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787150715; c=relaxed/simple;
	bh=LOcZ0Op1lzC5B7yfLjBdoT8AmPkOGajvV9MW3xBURtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lw6ftmFhPS5KyEECJiPGK24Ly6QUkN35+MZODf1KfP3WaWX8BxmVSjQ9emF9ZlMPtmifwn6OyczX93/ZwAae7byp7VB4k1OuIS8qtf6xpDYOtkeOLmIa8VNSCsFzhFwWXw3t7iEt59bpkcO10Dwv6SIqE/u6N6VJhd2GGHPDmXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kOKDY47W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kOKDY47W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CC791F000E9;
	Wed, 19 Aug 2026 14:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787150714;
	bh=yl3RWtoxEaupNfauA4R/wZ/FdnFTD5pPyyK9ClE2Ppg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kOKDY47WN/r2ojK36vAkiu5u95ZN5zC/QIhzQ4ToJFNmV66Kgei7e17ssZulpStwH
	 mrRQB482cUKsiy6orML1UFcPhG1Zjvlksh6cv9K50+3zjepS50Ibq6IJC/r/QgRMyZ
	 yHKRvkr68+0K5blJq9spvVMnR9cAitGdr8WlZuLc=
Date: Wed, 19 Aug 2026 16:45:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tianchu Chen <tianchu.chen@linux.dev>
Cc: hansg@kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix protected RX frame validation in
 decrypt path
Message-ID: <2026081946-trolling-handrail-ecac@gregkh>
References: <f718ce8ebdf9fced440fb47bc921026bd24ca879@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f718ce8ebdf9fced440fb47bc921026bd24ca879@linux.dev>

On Wed, Aug 19, 2026 at 02:22:47PM +0000, Tianchu Chen wrote:
> From: Tianchu Chen <flynnnchen@tencent.com>
> 
> The RX software decrypt path mishandles crafted protected frames from a
> malicious AP in two ways:
> 
> 1) decryptor() never checks that a protected frame is long enough to
> hold the 802.11 header plus the per-cipher trailer(IV, ICV/MIC).
> 
> Implementations like rtw_wep_decrypt() and rtw_aes_decrypt() all compute
> length = hdr.len - hdrlen - iv_len. and a shorter frame underflows the 
> unsigned subtraction, turning into OOB reads/writes.
> 
> Reject such frames in decryptor() before touching the IV.
> 
> 2) validate_80211w_mgmt() uses the skb before checking whether
> decryptor() returned NULL. On decrypt failure the skb has been freed
> before being used.
> 
> Bail out immediately when decryptor() fails.
> 
> Discovered by Atuin - Automated Vulnerability Discovery Engine.
> 
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tianchu Chen <flynnnchen@tencent.com>

No assisted-by: line?

And you have read this:
	https://lore.kernel.org/all/2026080354-skater-urgent-31b2@gregkh
right?

So did you test this on the real hardware?

thanks

greg k-h
