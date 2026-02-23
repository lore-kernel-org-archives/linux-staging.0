Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D855C1EFFA1;
	Mon, 23 Feb 2026 15:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771859470; cv=none; b=Db/nIGihGXjUEWI4LDvA4z6b/1Vv52YFVW+LM9FzE0+umcDUcaTwI736Wi+Uh++7lhH1vWMgDQZELqclSHcI3/yVtmNaXDMa/5RxZwQK4IMsXtF5MLXRSxeNFjyuXueVbFFSTNpU2429a2TM4gyCXqxfvZqEwmie0Wr8eIfeqgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771859470; c=relaxed/simple;
	bh=AnnVm+IXeXtIaJpK2HnYJv/KBnKCCy6UIHMKvKJmh8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QXvfx5MprykFWtGDpgQWupynCJdZ7rZ3q7C1FVD4egDam/G5iEEAibyKxIBggEPssfunPe6FeuHBcT6xPtReAK4fNh3l6NM1Ze81b8pZ1MPo8gH2mvvbMuZ3wSY4FmlDr9I1gO0Tdel5zqF0yMuUUDMzt9Z8z72s4LJYbnztzv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2eumKHe4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2eumKHe4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08046C116C6;
	Mon, 23 Feb 2026 15:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771859470;
	bh=AnnVm+IXeXtIaJpK2HnYJv/KBnKCCy6UIHMKvKJmh8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2eumKHe4/TBA/xSk7WG6DR2DIaNbrfjVv1oVj2sIZIe/KNajQI4WZR0EY4UDGAyrb
	 6+IeTursuLm/vMi5utU3MAquRhHVeOEIvh/Rnnlqi+SZkTIMYKAs9eHSOJKUtLHiXf
	 0xnEerhdTb1JkTvS5DWOUrKFnnob/G19cl3aWs98=
Date: Mon, 23 Feb 2026 16:10:50 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Cc: linux-staging@lists.linux.dev, johan@kernel.org, elder@kernel.org,
	linux-kernel@vger.kernel.org, ethantidmore06@gmail.com
Subject: Re: [PATCH v2] staging: rtl8723bs: Fix typo in comment
Message-ID: <2026022312-patience-dollhouse-8bf9@gregkh>
References: <20260219063332.10393-2-giorgitchankvetadze1997@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219063332.10393-2-giorgitchankvetadze1997@gmail.com>

On Thu, Feb 19, 2026 at 10:33:33AM +0400, Giorgi Tchankvetadze wrote:
> Change "inclued" to "included"
> 
> Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
> ---
> v2: fix spaces between colons
> 
>  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> index a47d0d3fa2b7..038157442348 100644
> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> @@ -2264,7 +2264,7 @@ static int rtw_add_beacon(struct adapter *adapter, const u8 *head, size_t head_l
>  
>  	len = head_len + tail_len - 24;
>  
> -	/* check wps ie if inclued */
> +	/* check wps ie if included */
>  	rtw_get_wps_ie(pbuf + _FIXED_IE_LENGTH_, len - _FIXED_IE_LENGTH_, NULL, &wps_ielen);
>  
>  	/* pbss_network->ies will not include p2p_ie, wfd ie */
> -- 
> 2.52.0
> 
> 

You sent 4 different patches that did different things, yet had the same
subject line, making it impossible for me to determine which is which
(this is a v2 to what?)  Please resend these as a series, with unique
subject lines.

thanks,

greg k-h
