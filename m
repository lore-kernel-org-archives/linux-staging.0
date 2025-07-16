Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C50AFBF6
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 04:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752641666; cv=none; b=E8Fpav5gDKDBAmyfoRXe0hmJUoca032WmTSrk/g6BGsiG80YRKah6AqQYySBKIARQ1XLtz44xA9Sii2UdkwDfkAZAhU4Ph8N+We7JH8keh3ZRaEFoNpBHsbJdYVQhCzP5PMdKMTtYSB7d+PZ28mNIfvYNOXsKnJ6wBdlSH8JZZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752641666; c=relaxed/simple;
	bh=zKYtW4QwiSNLEjul/oWj9o0Km9D1rasdRuKakY+L3rA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bxx4bWoUvD3/M5J9Lt/vTFfW7BPJuz/2/2GDl2pWzz3ZW4swd0Ryy6hogG3rgw4QvZMFO0FVYkGuWEUQ9+p+wVXU2CJW8C2AO+Zrz5jGt8Naf7y0k3xzqFwTQFvDYtZ0EY102Xu0qgU6uliiLbrrtY97Squ8jz+9nVfPWtX9SUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DICl5G20; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DICl5G20"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7CA2C4CEF6;
	Wed, 16 Jul 2025 04:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752641666;
	bh=zKYtW4QwiSNLEjul/oWj9o0Km9D1rasdRuKakY+L3rA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DICl5G201J7buEhzheNbb/aL+O4ycs8vHJuObN4HnCnFmENBW1r3SNVh4f2WeqL0n
	 OMXgyUYHg+ab93FcfsMKu8q1UjHWuQIw+Tkt8yFKo5CgyMTgjv1EUM62RcOWazoNoU
	 aIkvCytTZLAifjN73ju3VvOrmp1fEehTVo4PrWsI=
Date: Wed, 16 Jul 2025 06:54:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ignacio =?iso-8859-1?Q?Pe=F1a?= <ignacio.pena87@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: Fix comment style warnings
Message-ID: <2025071607-subfloor-varsity-4ab2@gregkh>
References: <20250715234416.50030-1-ignacio.pena87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250715234416.50030-1-ignacio.pena87@gmail.com>

On Tue, Jul 15, 2025 at 07:44:16PM -0400, Ignacio Peña wrote:
> Fix checkpatch warnings in rtl8723bs driver:
> - Fix block comment style by moving */ to separate line
> - Add missing blank line after variable declarations
> - Remove space before tab in commented code
> 
> These are coding style fixes that don't change functionality.
> 
> Signed-off-by: Ignacio Peña <ignacio.pena87@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c   |  2 +-
>  drivers/staging/rtl8723bs/core/rtw_efuse.c | 19 +++++++++++++------
>  2 files changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index 437934dd2..f02b3b485 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -1318,7 +1318,7 @@ u8 rtw_lps_ctrl_wk_cmd(struct adapter *padapter, u8 lps_ctrl_type, u8 enqueue)
>  	u8 res = _SUCCESS;
>  
>  	/* if (!pwrctrlpriv->bLeisurePs) */
> -	/* 	return res; */
> +	/*	return res; */
>  
>  	if (enqueue) {
>  		ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
> diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> index 7a74b011d..fc6dee711 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> @@ -70,7 +70,8 @@ Efuse_Write1ByteToFakeContent(u16 Offset, u8 Value)
>   * When			Who		Remark
>   * 11/17/2008	MHC		Create Version 0.
>   *
> - *---------------------------------------------------------------------------*/
> + *---------------------------------------------------------------------------
> + */
>  void
>  Efuse_PowerSwitch(
>  struct adapter *padapter,
> @@ -85,6 +86,7 @@ u8
>  Efuse_CalculateWordCnts(u8 word_en)
>  {
>  	u8 word_cnts = 0;
> +
>  	if (!(word_en & BIT(0)))
>  		word_cnts++; /*  0 : write enable */
>  	if (!(word_en & BIT(1)))
> @@ -163,7 +165,8 @@ EFUSE_GetEfuseDefinition(
>   * When			Who		Remark
>   * 09/23/2008	MHC		Copy from WMAC.
>   *
> - *---------------------------------------------------------------------------*/
> + *---------------------------------------------------------------------------
> + */
>  u8
>  EFUSE_Read1Byte(
>  struct adapter *Adapter,
> @@ -313,7 +316,8 @@ Efuse_WordEnableDataWrite(struct adapter *padapter,
>   * When			Who		Remark
>   * 11/11/2008	MHC		Create Version 0.
>   *
> - *---------------------------------------------------------------------------*/
> + *---------------------------------------------------------------------------
> + */
>  void
>  Efuse_ReadAllMap(
>  	struct adapter *padapter,
> @@ -350,7 +354,8 @@ void Efuse_ReadAllMap(struct adapter *padapter, u8 efuseType, u8 *Efuse, bool bP
>   * When			Who		Remark
>   * 11/12/2008	MHC		Create Version 0.
>   *
> - *---------------------------------------------------------------------------*/
> + *---------------------------------------------------------------------------
> + */
>  static void efuse_ShadowRead1Byte(struct adapter *padapter, u16 Offset, u8 *Value)
>  {
>  	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
> @@ -396,7 +401,8 @@ static void efuse_ShadowRead4Byte(struct adapter *padapter, u16 Offset, u32 *Val
>   * When			Who		Remark
>   * 11/13/2008	MHC		Create Version 0.
>   *
> - *---------------------------------------------------------------------------*/
> + *---------------------------------------------------------------------------
> + */
>  void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType, bool bPseudoTest)
>  {
>  	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
> @@ -429,7 +435,8 @@ void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType, bool bPseudoT
>   * When			Who		Remark
>   * 11/12/2008	MHC		Create Version 0.
>   *
> - *---------------------------------------------------------------------------*/
> + *---------------------------------------------------------------------------
> + */
>  void EFUSE_ShadowRead(struct adapter *padapter, u8 Type, u16 Offset, u32 *Value)
>  {
>  	if (Type == 1)
> -- 
> 2.39.5 (Apple Git-154)
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
