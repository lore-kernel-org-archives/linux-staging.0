Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F3333ADBE;
	Wed, 21 Jan 2026 05:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768971926; cv=none; b=WSqlItMBI3wGMAMHGq4NHUtkD+Btjli4wUpuh47N9Fbm3xAWsewLjTYFYVyPE2e1H18PLyWAO1Wp6zGJsP3XeqV3PMgF94hGYjklz04x6+oT9KBZltV/QfKk3YR/poGAKBsmFCXXhQbnWLrCmyOLIFE2S2LN6QSSJti/1tL0+H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768971926; c=relaxed/simple;
	bh=hEV/TaG0CwBakyEOFD9ERC0OQoMEblWKRZhWxj5hkvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LPOWDhkw2n+cOk4Ye1X2vB6QyBP7AwxIi3F0cRq7/exe/bMAKPPT2KCOYkt6ku30GQXZcY3QAu6EaL+OUGlSgiz5TrG+iGC0wgzo+i4g716AOivWPqb/tYYFGad69ftmeBrkYFKzPahc/+iTOOdDoCTUWm+dS8LVFvQ71HUSOIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wRR7BXkg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wRR7BXkg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DFF8C116D0;
	Wed, 21 Jan 2026 05:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768971925;
	bh=hEV/TaG0CwBakyEOFD9ERC0OQoMEblWKRZhWxj5hkvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wRR7BXkgc68iEmqrbe8VfzuPtYBJCBomorgAxw9yLR3ZuMu1lqZX643LBHKcazSSA
	 zFiIMdWREaBz0GBGpKBj5zETbBh2bQjgAQBG7g218OEXW/HwPle5dkpsbvbUloeV9j
	 1GZSxUwfp11EGsbJCBQMgmIvy09AVohUbc2EWXvk=
Date: Wed, 21 Jan 2026 06:05:22 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Minu Jin <s9430939@naver.com>
Cc: andriy.shevchenko@linux.intel.com, abrahamadekunle50@gmail.com,
	milospuric856@gmail.com, zxcv2569763104@gmail.com,
	dan.carpenter@linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: rtl8723bs: fix unchecked return value of
 skb_copy_bits
Message-ID: <2026012102-thinness-neurotic-6e1b@gregkh>
References: <20260121023312.2264431-1-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121023312.2264431-1-s9430939@naver.com>

On Wed, Jan 21, 2026 at 11:33:12AM +0900, Minu Jin wrote:
> The function _rtw_pktfile_read() incorrectly updated the file pointer
> even when skb_copy_bits() failed.
> 
> This patch fixes the issue by:
> 
>     1. Propagating the negative error code from skb_copy_bits() if
>        it fails, preventing internal pointer updates.
> 
>     2. Updating all callers (including set_qos) to check the return value
>        and handle errors appropriately.
> 
> Signed-off-by: Minu Jin <s9430939@naver.com>
> ---
> Changes in v4:
>     - Modify _rtw_pktfile_read() to return -EINVAL if the remaining data
>       is less than the requested length (suggested by Greg KH).

You do a lot more than just that in that function change.

This needs to be a patch series, each only doing one logical thing.
Please break it up into multiple changes, because as-is, this is hard to
review and verify it is correct.

Also, have you tested this on real hardware?

> -uint _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen)
> +int _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, unsigned int rlen)
>  {
> -	uint	len = 0;
> +	int ret;
>  
> -	len =  rtw_remainder_len(pfile);
> -	len = (rlen > len) ? len : rlen;
> +	if (rtw_remainder_len(pfile) < rlen)
> +		return -EINVAL;

Why change the logic here?  Are you sure it is correct?  Why not
document that in the changelog?

thanks,

greg k-h
