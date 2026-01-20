Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3544F43CED9;
	Tue, 20 Jan 2026 14:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768917801; cv=none; b=ePt7z8LwR3OBN1dPD99VrzZSOCL/sHZFo0PnGvGY3tRA1SycXY4A7xJsERxWs5Sw3SIlmj3CyFeMk7ZqTkmAN475iOod+9yajbPDaV0j79JpnSZuOLG6p9OT6jI/ov1QZ9dxe/a/eiKDkieoauw3jiqYNEw7/jdLReNYJPqiCKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768917801; c=relaxed/simple;
	bh=uNjcS0Z41Er0lhDt+x6/3joc7rWZ54aWK6VVJFDR5bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pVz6j4hbS65HL9+SY3IMRBAiO/vWKIDHLMij1+0aN7ueHSGJKgUK8gXPXHBgxrj2+97s9f/CWTXjanllxc3eUelD2ZsGADc1ks1thHEtvV+fnHwhhviLmB9SenjOOIYER1d9M4mw/iUct3CuERTw7zrsQmgOcSiYo7ty+P4ZaAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=i1ySph5n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="i1ySph5n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 608C8C16AAE;
	Tue, 20 Jan 2026 14:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768917800;
	bh=uNjcS0Z41Er0lhDt+x6/3joc7rWZ54aWK6VVJFDR5bg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i1ySph5nejTnWLF/VXvwW6FxcCGQ42yttqEz7ahEqwyFK/LOmbs1ePtE/Ra8lRgra
	 tsqw3K88gnOJ2LEhXOlFk6tMCB8ko2ryobLztIwIcpiala6yDTVIOXxEtw879/eShM
	 Tj2WNtwKBHQvyxBtK9fDxVX8MMLenoLbZC565B8s=
Date: Tue, 20 Jan 2026 15:03:17 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Minu Jin <s9430939@naver.com>
Cc: andriy.shevchenko@linux.intel.com, abrahamadekunle50@gmail.com,
	dan.carpenter@linaro.org, milospuric856@gmail.com,
	zxcv2569763104@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix unchecked return value of
 skb_copy_bits
Message-ID: <2026012050-reverb-recess-753a@gregkh>
References: <20260120132241.2119454-1-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120132241.2119454-1-s9430939@naver.com>

On Tue, Jan 20, 2026 at 10:22:41PM +0900, Minu Jin wrote:
> The function _rtw_pktfile_read() incorrectly updated the file pointer
> even when skb_copy_bits() failed.
> 
> This patch fixes the issue by:
> 
>     1. Propagating the negative error code from skb_copy_bits() if it fails,
>        preventing internal pointer updates.
> 
>     2. Updating all callers to check the return value and handle errors
>        appropriately.
> 
> Signed-off-by: Minu Jin <s9430939@naver.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_xmit.c     | 25 +++++++++++++++----
>  .../staging/rtl8723bs/include/xmit_osdep.h    |  2 +-
>  drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 12 ++++++---
>  3 files changed, 29 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> index 21690857fd62..135bc5432be6 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> @@ -603,11 +603,13 @@ static void set_qos(struct pkt_file *ppktfile, struct pkt_attrib *pattrib)
>  	s32 UserPriority = 0;
>  
>  	_rtw_open_pktfile(ppktfile->pkt, ppktfile);
> -	_rtw_pktfile_read(ppktfile, (unsigned char *)&etherhdr, ETH_HLEN);
> +	if (_rtw_pktfile_read(ppktfile, (unsigned char *)&etherhdr, ETH_HLEN) < 0)
> +		return;

No error being returned?  Why not?

thanks,

greg k-h
