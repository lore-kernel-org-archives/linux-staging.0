Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AF2423A66;
	Wed, 18 Mar 2026 15:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773849591; cv=none; b=hUmfWExZvSv1hzXrAgjPCWZZqT2E0uJw8qDocQy+DuaLgs8ip9Xhtw+kPFznQCJveR43ltZtlHo5JN6APIUXokrh3KtaWqJplwAFQ1WNXPgcgQt11VFGgGxoieJjl00Fry79ZVJ/XRMQqErlZ4GvtUTWrPZ0+VIf/0RPI6gjenU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773849591; c=relaxed/simple;
	bh=R8ViTTGTWb0vWJGPL71Ma0KWdpbUUgEBAf+cmhd1m4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hOV7yjNVG5aukg8iwHrPrxkUjhX1Q9VNcK02gMnYh7BwY+JKSodfhdBETZwe+FVqT22SZZi01XjJXXCAWdhUWG5uPVi45/KuiZvkeKtYF52WpgRkBYwrPCp7L3SCj5oiNdi2NHPfOR6scO2WQf6YZyEw5ufuPRDn3MKDZqb63rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tHMvCX5P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tHMvCX5P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A5D7C2BC87;
	Wed, 18 Mar 2026 15:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773849590;
	bh=R8ViTTGTWb0vWJGPL71Ma0KWdpbUUgEBAf+cmhd1m4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tHMvCX5Pujb1jcerlqBVxASzWXouIXSbrEkSTQyoe9iW95YMGZYrQKr5PJcsVgi5e
	 x2I5aNST40LpnS6teSNxkxpcYol/51/SR80WOlGPLcuhe/OmqOQX3AEARwVG5lk2DQ
	 L886QydFvqkX8U0zESZ/7sG0yFZ3Sg/8CSMZB1ZQ=
Date: Wed, 18 Mar 2026 16:59:46 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?H=FCseyin?= Can Erdem <erdemhuseyincan09@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: rtl8723bs: add parentheses around macro
 arguments
Message-ID: <2026031810-schilling-pointing-86d6@gregkh>
References: <2026031807-june-stress-0ba7@gregkh>
 <20260318153515.5071-1-erdemhuseyincan09@gmail.com>
 <20260318153515.5071-2-erdemhuseyincan09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260318153515.5071-2-erdemhuseyincan09@gmail.com>

On Wed, Mar 18, 2026 at 06:35:15PM +0300, Hüseyin Can Erdem wrote:
> Add parentheses around macro arguments in IS_FW_HEADER_EXIST_8723B
> and AVAILABLE_EFUSE_ADDR to avoid potential operator precedence issues.
> 
> Signed-off-by: Hüseyin Can Erdem <erdemhuseyincan09@gmail.com>
> ---
>  drivers/staging/rtl8723bs/include/rtl8723b_hal.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
> index 32a93653b..cd3b49338 100644
> --- a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
> +++ b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
> @@ -28,7 +28,7 @@
>  #define FW_8723B_END_ADDRESS   0x1FFF /* 0x5FFF */
>  
>  #define IS_FW_HEADER_EXIST_8723B(fw_hdr) \
> -	((le16_to_cpu(fw_hdr->signature) & 0xFFF0) == 0x5300)
> +	((le16_to_cpu((fw_hdr)->signature) & 0xFFF0) == 0x5300)
>  
>  struct rt_firmware {
>  	u32 fw_length;
> @@ -133,7 +133,7 @@ struct rt_firmware_hdr {
>  #define EFUSE_IC_ID_OFFSET 506 /* For some inferiority IC purpose.
>  				* Added by Roger, 2009.09.02.
>  				*/
> -#define AVAILABLE_EFUSE_ADDR(addr) (addr < EFUSE_REAL_CONTENT_LEN_8723B)
> +#define AVAILABLE_EFUSE_ADDR(addr) ((addr) < EFUSE_REAL_CONTENT_LEN_8723B)
>  
>  #define EFUSE_ACCESS_ON  0x69 /* For RTL8723 only. */
>  #define EFUSE_ACCESS_OFF 0x00 /* For RTL8723 only. */
> -- 
> 2.47.3
> 
> 

Please slow down, there is no rush here.  Take at least a day before
sending a new version of a patch.

Also, why was this not marked as a "v2" or "v3" or whatever it really
is?

thanks,

greg k-h
