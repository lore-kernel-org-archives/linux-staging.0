Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A474A1D95B0
	for <linux-staging@lists.linux.dev>; Thu,  7 Nov 2024 08:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730968489; cv=none; b=myjoSM5AJvm+sYvbV8JXytvoaYXFRPETL6kE99hpnaAIDr+VGTLWYfqJPLdHjK1Sp+ZUQN5W54CCzslZZZ5qsaW4s9KYLWpxgLsO0mgLYhInSbzg5hyNgJ6CVk0/QjrKd25cN+qmAdZ2+qXPs49pilhKdAsS7gNRvnHaDrQ8C6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730968489; c=relaxed/simple;
	bh=L+yQHKRqzPSmgkgMSXYqYN/fPOFRtymft12RkMxq/wo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZFbQDDsNb1Pgx4ybeeWxqEUoA0dfwegY/coBFFXg40oXcCTTMGwvk0JE3rmx+yMb/3BgMnEy/oEsMgd7sh1MZ7cdZlj2C4jCCrxYm6u5w76zmnY1Hl4UZ5Nr/nfOeQ6pi7qtjH4TGlRhUJJJNLt54lx60dUTpbOtlfvTNjAe6Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jqtuYeHE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jqtuYeHE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE9DCC4CECC;
	Thu,  7 Nov 2024 08:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730968489;
	bh=L+yQHKRqzPSmgkgMSXYqYN/fPOFRtymft12RkMxq/wo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jqtuYeHEpXlurEI4rqIS3eKLQTiZmKfXiC5jik4byk66jlZI0cSo+w96WUZXLCMua
	 TrlpR3zY9chpMPvP1YfvKDm4mybW9VlLhsZd6oHB27FfN9+l1M93I/wlU0qxVA2BAg
	 U+zLO4lZb0tS/mDrRKuZi+omrVqb+NKFyUtQ6PD4=
Date: Thu, 7 Nov 2024 09:28:37 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Kees Bakker <kees@ijzerbout.nl>
Cc: Dave Penkler <dpenkler@gmail.com>,
	Linux Staging <linux-staging@lists.linux.dev>
Subject: Re: [PATCH V3] staging: gpib: avoid unintended sign extension
Message-ID: <2024110706-harmony-glowing-148b@gregkh>
References: <20241104193530.4AA8A18DD38@bout3.ijzerbout.nl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104193530.4AA8A18DD38@bout3.ijzerbout.nl>

On Thu, Oct 17, 2024 at 09:54:47PM +0200, Kees Bakker wrote:
> The code was basically like this (assuming size_t can be u64)
>     var_u64 |= var_u8 << 24
> var_u8 is first promoted to i32 and then the shift is done. Next, it is
> promoted to u64 by first signextending to 64 bits. This is very unlikely
> what was intended. So now it is first forced to u32.
>     var_u64 |= (u32)var_u8 << 24
> 
> This was detected by Coverity, CID 1600792.
> 
> Fixes: 4c41fe886a56 ("staging: gpib: Add Agilent/Keysight 82357x USB GPIB driver")
> Signed-off-by: Kees Bakker <kees@ijzerbout.nl>
> ---
>  V1 -> V2: Changed commit message, added Fixes: tag and a reference to the Coverity CID
>  V2 -> V3: add version in the subject (sorry Greg)

Doesn't apply cleanly anymore :(

Also, always cc: all of the relevent people that get_maintainer.pl says
to cc:.  Can you rebase this against my staging-testing branch and
resend?

thanks,

greg k-h
