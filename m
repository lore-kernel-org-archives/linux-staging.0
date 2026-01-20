Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE1132AAAD;
	Tue, 20 Jan 2026 15:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768924799; cv=none; b=MLS+ASe9Q15eHjQqBnAcue5Q92W2V88pbiYJvszBhyP6nkVAaQqzgaCISrncBgfhavxSwmnHqgAB8gzn+wNOtmcpdJQ60aA8k3hS6WLOkH5ni9gItwfZtCuS2enO52zuRNCsM9olAtkb41I+4gRfp2YDpPWbPNJqFJI7ul4NXFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768924799; c=relaxed/simple;
	bh=6NAXu8op9rNcSyjY4/1sKOiA/QOwZt41G9ttIbAs3u4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QH6fOzcItZhbcPbH53cJxc+rp48MuZuuNVF4ZAR/FrYMV9qMXfn4G8/+GenCyeamoZwC3YC5oLACYOtP3zBCqjwzXcegBE/b+MlRZyF+4esVe/9C4HeU/+iMUfT96ryvy4uMh9KjhMiPwWHX3+nV8jedvOcWg7RKcCP3L43uuOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MCrukQVB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MCrukQVB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2260EC16AAE;
	Tue, 20 Jan 2026 15:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768924798;
	bh=6NAXu8op9rNcSyjY4/1sKOiA/QOwZt41G9ttIbAs3u4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MCrukQVBNLEdEi1W58EkPOFzaTmFQF2f/u4MSDGkNXg4pjtuQ33wgsZtmEedFybQ0
	 K4iRHqOBOw29We3eQ6+USL17J2RSTE//TpsfxMt6+OaIStI880xJzsgJ1HH1pm/FEu
	 MbeIaCKP94YqhTcQ3/xigYJ7pAL96zCLe/+Hug2A=
Date: Tue, 20 Jan 2026 16:59:56 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Minu Jin <s9430939@naver.com>
Cc: andriy.shevchenko@linux.intel.com, abrahamadekunle50@gmail.com,
	dan.carpenter@linaro.org, milospuric856@gmail.com,
	zxcv2569763104@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: fix unchecked return value of
 skb_copy_bits
Message-ID: <2026012007-playing-gala-87cd@gregkh>
References: <20260120155035.2939512-1-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120155035.2939512-1-s9430939@naver.com>

On Wed, Jan 21, 2026 at 12:50:34AM +0900, Minu Jin wrote:
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
> Changes in v3:
> 	- Convert set_qos() from void to int to properly propagate error codes
> 	  (suggested by Greg KH, Dan Carpenter)
> 
> 	- Use an intermediate 'ret' variable in set_qos() for cleaner error
> 	  handling (suggested by Dan Carpenter)
> 
> 	- Remove 'extern' from function prototype in the header file
> 	  (suggested by Andy Shevchenko)
> 
> 	- Apply reverse xmas tree ordering for local variables.
> 	  (suggested by Andy Shevchenko)
> 
> 	- Remove unnecessary blank lines in declaration blocks
> 	  (suggested by Andy Shevchenko, Dan Carpenter)
> 
> 	- Revert 'len' variable type to uint in _rtw_pktfile_read()
> 	  (suggested by Dan Carpenter)
> 
> 
>  drivers/staging/rtl8723bs/core/rtw_xmit.c     | 42 +++++++++++++++----
>  .../staging/rtl8723bs/include/xmit_osdep.h    |  2 +-
>  drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 12 ++++--
>  3 files changed, 42 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> index 21690857fd62..f24f89ab65ad 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> @@ -596,23 +596,31 @@ u8 qos_acm(u8 acm_mask, u8 priority)
>  	return priority;
>  }
>  
> -static void set_qos(struct pkt_file *ppktfile, struct pkt_attrib *pattrib)
> +static int set_qos(struct pkt_file *ppktfile, struct pkt_attrib *pattrib)
>  {
>  	struct ethhdr etherhdr;
>  	struct iphdr ip_hdr;
>  	s32 UserPriority = 0;
> +	int ret;
>  
>  	_rtw_open_pktfile(ppktfile->pkt, ppktfile);
> -	_rtw_pktfile_read(ppktfile, (unsigned char *)&etherhdr, ETH_HLEN);
> +	ret = _rtw_pktfile_read(ppktfile, (unsigned char *)&etherhdr, ETH_HLEN);
> +	if (ret < 0)
> +		return ret;

How can ret ever be less than 0?

Shouldn't you be checking something else here?

Hint, read the function to see what it does...

thanks,

greg k-h
