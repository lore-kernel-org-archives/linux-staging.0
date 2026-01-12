Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627B4321422;
	Mon, 12 Jan 2026 10:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768215555; cv=none; b=mW5m25jV0UZhG9slGrT5ttEN0MIIXAOhcmWI6ubHCtxgvDWeCD26SGV5C3B763/3nuqAr0Zd0g/DRlp3YXTg0G5OqchjECt0B7Mxn5JAizwAVBapTOHXmu2xQxkMKf+w+CCvb0PvWZ0dTR8dWkJt7vIIT0LSHWqRzb0f61qH9+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768215555; c=relaxed/simple;
	bh=8v1glWPJUWl4Cy/JDAWuPCIITAbNtIHBJdLQiowv6Js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q964kEb8Jk7aYaasLH93bM4Zsv2tHR02uoXxKRcQBD2lO7n9W8m5AaHK+fATV1QqsydkwIMdaA63qQq4ITwIbi6XU9IFtkA7GxOUS3JJTH9UQt5XynPdrLSqXOJ5i7fqOIJGj1THYHZmt/cPSnDvAeF7DTO86LAsM3ucw5EVMdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FCq0wfSs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FCq0wfSs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D24C9C16AAE;
	Mon, 12 Jan 2026 10:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768215555;
	bh=8v1glWPJUWl4Cy/JDAWuPCIITAbNtIHBJdLQiowv6Js=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FCq0wfSsrcBv/X+g+tV9NwknTpdMPCDCqHQkpnBvHnW1c7K/OpAHlNoF23OT55HGH
	 jmdieXnLfd0+PrmqQ+UkPnCPg1vyCSMimb5VgzhsLDgAH3ahIDZwzf5FCk9uxGIG9l
	 2D+fN2LF0WaOQXyjsBZbJTO6GeuJDMCJg2hnt8l0=
Date: Mon, 12 Jan 2026 11:59:12 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Vo Thanh Cong <thanhcongvo079@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	anac.amplar@gmail.com
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary else after break
Message-ID: <2026011246-agreement-sanitizer-6b18@gregkh>
References: <20260111180635.198615-1-thanhcongvo079@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260111180635.198615-1-thanhcongvo079@gmail.com>

On Mon, Jan 12, 2026 at 01:06:35AM +0700, Vo Thanh Cong wrote:
> This patch fixes the checkpatch.pl warning:
> "WARNING: else is not generally useful after a break or return"
> 
> In sdio_ops_linux.c, the else blocks after break statements are
> redundant. Removing them reduces indentation level and improves
> code readability.
> 
> Signed-off-by: Vo Thanh Cong <thanhcongvo079@gmail.com>
> ---
>  .../staging/rtl8723bs/os_dep/sdio_ops_linux.c | 30 +++++++++----------
>  1 file changed, 14 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
> index 5dc00e9117ae..87444d36c502 100644
> --- a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
> +++ b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
> @@ -219,14 +219,14 @@ u32 sd_read32(struct intf_hdl *pintfhdl, u32 addr, s32 *err)
>  			if (*err == 0) {
>  				rtw_reset_continual_io_error(psdiodev);
>  				break;
> -			} else {
> -				if ((-ESHUTDOWN == *err) || (-ENODEV == *err))
> -					padapter->bSurpriseRemoved = true;
> -
> -				if (rtw_inc_and_chk_continual_io_error(psdiodev) == true) {
> -					padapter->bSurpriseRemoved = true;
> -					break;
> -				}
> +			}
> +
> +			if ((-ESHUTDOWN == *err) || (-ENODEV == *err))
> +				padapter->bSurpriseRemoved = true;
> +
> +			if (rtw_inc_and_chk_continual_io_error(psdiodev) == true) {
> +				padapter->bSurpriseRemoved = true;
> +				break;
>  			}
>  		}
>  	}
> @@ -295,14 +295,12 @@ void sd_write32(struct intf_hdl *pintfhdl, u32 addr, u32 v, s32 *err)
>  			if (*err == 0) {
>  				rtw_reset_continual_io_error(psdiodev);
>  				break;
> -			} else {
> -				if ((-ESHUTDOWN == *err) || (-ENODEV == *err))
> -					padapter->bSurpriseRemoved = true;
> -
> -				if (rtw_inc_and_chk_continual_io_error(psdiodev) == true) {
> -					padapter->bSurpriseRemoved = true;
> -					break;
> -				}
> +			}
> +			if ((-ESHUTDOWN == *err) || (-ENODEV == *err))
> +				padapter->bSurpriseRemoved = true;
> +			if (rtw_inc_and_chk_continual_io_error(psdiodev) == true) {
> +				padapter->bSurpriseRemoved = true;
> +				break;

You dropped the blank line before this if statement, why?

Please preserve line breaks like this, it makes the code easier to read
and understand.

thanks,

greg k-h
