Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825CF233924;
	Tue,  7 Jul 2026 11:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783423624; cv=none; b=p+WVRYISOzyzOfkHgKLLhBCE1s0yPoph51UfIXJj4/nUmSsI2RQRp/elg4fXxzBxG3ZUtuEAt2EzAspbjuszR/yudnL0o4ceyKDnwalCQGVJd2Ms5I/7dy/AMPo29jOBWJ2bmsFd0DKbi02kq7Xkf3K8rh+ZFGPp0dK8vpY56xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783423624; c=relaxed/simple;
	bh=HvZQmMYlR8hZBLGVYXCVHXaa2ss9ZL4iC2cCGP1K4nM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e1dfqWeXxCTBw/OFdEhL0PfTcX3OhDRS0dOUE/ny7ySoec8Qr3p1B892UUHIavb0ZQkv1IiImsQnLba/wf8fjYdVCykGs4/A2vKTe5f1jcD5zcycwz1G5m6lR60PUSa21Fl7FrCgkr5BYLGo+ZPHE75Diy4ZFRKDbZWQvyOPaDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LaWhJSGP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LaWhJSGP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE7E61F00A3A;
	Tue,  7 Jul 2026 11:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783423623;
	bh=WvajQ9DKRAta5cKUO9qqGBAUZ5OfOVm0QNM1PsXMInY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LaWhJSGPgp3CGpdIUXIBlYCGm7uqGBMfJEGdnRptbFC6dvcLgBXmYXtRD2gjTM8Jr
	 9yO+X3hk8i+GmUCIhYOaf39S81q483iT7VGh2wxImzAorxM4SLWe2F79qqonod0O8S
	 74/GwYyzBOrtr+guhP9gnOmNKTv0Z4MJCHptG7bs=
Date: Tue, 7 Jul 2026 13:27:00 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bruce Ou <oubruce1234@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix CamelCase warnings for bResult
 and Address in rtw_efuse.c
Message-ID: <2026070748-army-tweezers-dbff@gregkh>
References: <20260623085650.17951-1-oubruce1234@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623085650.17951-1-oubruce1234@gmail.com>

On Tue, Jun 23, 2026 at 04:56:49PM +0800, Bruce Ou wrote:
> Signed-off-by: Bruce Ou <oubruce1234@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_efuse.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> index b5dc5892f..355ac2004 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> @@ -44,7 +44,7 @@ Efuse_CalculateWordCnts(u8 word_en)
>  u8
>  EFUSE_Read1Byte(
>  struct adapter *Adapter,
> -u16		Address)
> +u16		address)
>  {
>  	u8 byte_temp = {0x00};
>  	u8 temp = {0x00};
> @@ -53,13 +53,13 @@ u16		Address)
>  
>  	Hal_GetEfuseDefinition(Adapter, EFUSE_WIFI, TYPE_EFUSE_REAL_CONTENT_LEN, &content_len);
>  
> -	if (Address < content_len) {/* E-fuse 512Byte */
> +	if (address < content_len) {/* E-fuse 512Byte */
>  		/* Write E-fuse Register address bit0~7 */
> -		temp = Address & 0xFF;
> +		temp = address & 0xFF;
>  		rtw_write8(Adapter, EFUSE_CTRL + 1, temp);
>  		byte_temp = rtw_read8(Adapter, EFUSE_CTRL + 2);
>  		/* Write E-fuse Register address bit8~9 */
> -		temp = ((Address >> 8) & 0x03) | (byte_temp & 0xFC);
> +		temp = ((address >> 8) & 0x03) | (byte_temp & 0xFC);
>  		rtw_write8(Adapter, EFUSE_CTRL + 2, temp);
>  
>  		/* Write 0x30[31]= 0 */
> @@ -89,7 +89,7 @@ u16	addr,
>  u8	*data)
>  {
>  	u32 tmpidx = 0;
> -	u8 bResult;
> +	u8 result;

This should now be a boolean, right?

thanks,

greg k-h
