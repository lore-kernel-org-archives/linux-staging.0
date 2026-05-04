Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4E03DF011;
	Mon,  4 May 2026 14:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777906573; cv=none; b=cx2plBXnM1nDj4ejoEIrHCLwtQo3GZPCFHP8M59YXbdK17JpE+vgO5AgOSMsMd5sKCdnj4FpN8RVC+X/kMEWO4gxFtNsVO1TadSZCtXhnNBU2YLTiKYEULfVJ88o8SDv8zJe3RWU/JozivTyxVSDuPVcmHT+tYIbZTcwcIANL7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777906573; c=relaxed/simple;
	bh=6Ran1wl6jjk1U4QW+1lEUi34u91hdseej9fzZ7JFpEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=livX+KGsnJbzqh84vFvZeUSbVg8qSwiaCnMh4fiQT8Mn67Q6kLLua3G+tkUxpdlRl2YrNoHNIZ2IxkqgnCi8aX/tFT0qV+pBa1hYnPRA1OG4cBOnnrIWcC5mHTciiu58nS9/zxa8gaEH8cHRDj2ZdbMTggZuTdD5mi+VPo8Ly3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XW2rsONK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XW2rsONK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45BCFC2BCC4;
	Mon,  4 May 2026 14:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777906572;
	bh=6Ran1wl6jjk1U4QW+1lEUi34u91hdseej9fzZ7JFpEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XW2rsONKDQ8O4ObwagF0c1yaVmOV9AkyGY/WDqWbphlr3E6XysSuTHuMz+tn5rLhq
	 IOEh9gbIYrGBZubDUpteOHeG6+5M5/OEuhqYoWjQy8qb7CWTi3IOcrX59cpl4xEwDM
	 K1jeFWnEJHeVR36dG+SDJbl9mwp+SyPO7xsQsRq8=
Date: Mon, 4 May 2026 16:12:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Feng Ning <feng@innora.ai>
Cc: linux-staging@lists.linux.dev, Luka Gejak <luka.gejak@linux.dev>,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v6] staging: rtl8723bs: fix heap buffer overflow in
 cfg80211_rtw_add_key()
Message-ID: <2026050417-monkhood-backless-4c3e@gregkh>
References: <20260413113224.5201-1-feng@innora.ai>
 <2026042626-tabloid-suitor-33c5@gregkh>
 <20260427111738.33069-1-feng@innora.ai>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427111738.33069-1-feng@innora.ai>

On Mon, Apr 27, 2026 at 11:17:45AM +0000, Feng Ning wrote:
> The cfg80211 framework allows userspace to specify a key sequence
> counter (NL80211_KEY_SEQ) of up to 16 bytes via NL80211_CMD_NEW_KEY
> netlink messages, but ieee_param.crypt.seq is a fixed 8-byte buffer.
> When cfg80211_rtw_add_key() copies the sequence counter via memcpy()
> without checking seq_len, a heap buffer overflow of up to 8 bytes
> occurs, overwriting bytes following seq within the same ieee_param
> structure (key_len and the trailing key[] flexible array).
> 
> Cap the copy length at the buffer size using min_t().
> 
> Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Feng Ning <feng@innora.ai>
> ---

What about these review comments:
	https://sashiko.dev/#/patchset/20260427111738.33069-1-feng@innora.ai

Are they incorrect?

And was this tested on real hardware?

thanks,

greg k-h
