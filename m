Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396D31FECB0
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 12:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752667209; cv=none; b=R8uqZZ934qNrL+LvQGHqcpazB3yhm0bVTdUivn/IDWtlj+YuYS1TQLnwaY9LNAlxeoQ+jw6MlQBE1AHZ7un24l+Kysrj1X+7POs4ryVoRO4nm1QXAPzY8GA+lHA5SClgahMP1Hze6qiBRlXotmFCv9zrtpris52kZNnA0BCOXhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752667209; c=relaxed/simple;
	bh=REfYG0y1V5JUVC4Q7wIXUcib7iF+kuVZMdibeSMEPlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sU2l/02mAFZowLTOQpGxcfcZlJeBASZLYh1mLw6JQ3lTPNs6XpmOJm4a3jcKo8FELfU2y54J+aUWOo0SeP3/vEfpdrJXTTv/vENe8pD+Vk+lLXDmBKF4k1SzuaWaXzAVW8Y+VLYJH9gm/fPyDubkU4eZuzcQFNUMfCXXfORvgVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TZpL51ow; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TZpL51ow"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67F53C4CEF0;
	Wed, 16 Jul 2025 12:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752667208;
	bh=REfYG0y1V5JUVC4Q7wIXUcib7iF+kuVZMdibeSMEPlQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TZpL51ow2z922MHN6YlmciaZ1cY/pJi1V90TcNm0wML/ILMuf+9wfqx1JKp8SEjZi
	 tSGMJRC6Jw08sFWqLxjWBQwnX4Mdg2h1BzoeOjK6qYygXuWDbObALrdBO0P60CfKlx
	 +VNtPRa/X1FYhap7Rm8H0kawG4pYSZCY+RmNJxBQ=
Date: Wed, 16 Jul 2025 14:00:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ignacio =?iso-8859-1?Q?Pe=F1a?= <ignacio.pena87@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 1/3] staging: rtl8723bs: remove unnecessary comment
 separator lines
Message-ID: <2025071645-portly-battalion-a295@gregkh>
References: <20250716113740.73025-1-ignacio.pena87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250716113740.73025-1-ignacio.pena87@gmail.com>

On Wed, Jul 16, 2025 at 07:37:38AM -0400, Ignacio Peña wrote:
> From: Ignacio Pena <ignacio.pena87@gmail.com>
> 
> Remove the long dashed separator lines from block comments as they
> don't follow kernel coding style, as suggested by Greg KH.
> 
> Signed-off-by: Ignacio Pena <ignacio.pena87@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_efuse.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> index 7a74b011d..abc123def 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> @@ -70,7 +70,6 @@ Efuse_Write1ByteToFakeContent(u16 Offset, u8 Value)
>   * When			Who		Remark
>   * 11/17/2008	MHC		Create Version 0.
>   *
> - *---------------------------------------------------------------------------*/
>  void
>  Efuse_PowerSwitch(
>  struct adapter *padapter,
> @@ -163,7 +162,6 @@ EFUSE_GetEfuseDefinition(
>   * When			Who		Remark
>   * 09/23/2008	MHC		Copy from WMAC.
>   *
> - *---------------------------------------------------------------------------*/
>  u8
>  EFUSE_Read1Byte(
>  struct adapter *Adapter,
> @@ -313,7 +311,6 @@ Efuse_WordEnableDataWrite(struct adapter *padapter,
>   * When			Who		Remark
>   * 11/11/2008	MHC		Create Version 0.
>   *
> - *---------------------------------------------------------------------------*/
>  void
>  Efuse_ReadAllMap(
>  	struct adapter *padapter,
> @@ -350,7 +347,6 @@ void Efuse_ReadAllMap(struct adapter *padapter, u8 efuseType, u8 *Efuse, bool bP
>   * When			Who		Remark
>   * 11/12/2008	MHC		Create Version 0.
>   *
> - *---------------------------------------------------------------------------*/
>  static void efuse_ShadowRead1Byte(struct adapter *padapter, u16 Offset, u8 *Value)
>  {
>  	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
> @@ -396,7 +392,6 @@ static void efuse_ShadowRead4Byte(struct adapter *padapter, u16 Offset, u32 *Val
>   * When			Who		Remark
>   * 11/13/2008	MHC		Create Version 0.
>   *
> - *---------------------------------------------------------------------------*/
>  void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType, bool bPseudoTest)
>  {
>  	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
> @@ -429,7 +424,6 @@ void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType, bool bPseudoT
>   * When			Who		Remark
>   * 11/12/2008	MHC		Create Version 0.
>   *
> - *---------------------------------------------------------------------------*/
>  void EFUSE_ShadowRead(struct adapter *padapter, u8 Type, u16 Offset, u32 *Value)
>  {
>  	if (Type == 1)
> -- 
> 2.39.5
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

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
