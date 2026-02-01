Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F7F220F2C;
	Sun,  1 Feb 2026 13:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769953114; cv=none; b=Yaz26xXCC56457ANQMmsSd4/jtUdeesWPoPz6G/1m+hk0OlJXWjcBiZgY+nzoJhiMmndem5FbIuugW/GcaPytli8CjH5fFbFc6HPyw5INHE28ecodMZD7njfPXhQ3RkVNgrpYNCDbJiP5sMxKSsa8j2yHj8iQlsYQvDPiqMYUsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769953114; c=relaxed/simple;
	bh=LbDp1hmCqDAZupYT+6ih+mDqVXYrOE4h9TUkKCUKsi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FrpEYiqVzxTlLXawIUd3wXYmIbMqyxhsqp7hrfvD4eeRzPzMMnazcL3nRV8cFdKcy4rfZUzOYAgnanfjkV+AdTvjK3DXYgdtRf31HMJ6HtX4Kh6RpDEKBpI7PFxcKrySHKv7eWgCemRXsSgK2BuPh3GXFqzH/ZyoHZt1Qfzcp9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BLAfiYsi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BLAfiYsi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06080C4CEF7;
	Sun,  1 Feb 2026 13:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769953113;
	bh=LbDp1hmCqDAZupYT+6ih+mDqVXYrOE4h9TUkKCUKsi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BLAfiYsiCUjzUvgEIuPguDdbso66Szc2iUP0z51jzejL0XSi4kJmZiiTrQPSAgcKq
	 TtpsVCyTdTshDsnm4N5szHB+KDugwk4uYiG7YFxgMxp0lgp3zJYykrabRh3V90EM/y
	 mPrGIxneFH42f8QSQeVvnh00FWBkA29QTYwFzFQA=
Date: Sun, 1 Feb 2026 14:38:30 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Bera =?iso-8859-1?B?Wfx6bPw=?= <b9788213@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: refactor ODM_SetIQCbyRFpath to
 reduce duplication
Message-ID: <2026020146-kilogram-undercut-b849@gregkh>
References: <aX9UxRK_iYwxhTAm@BERA.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aX9UxRK_iYwxhTAm@BERA.localdomain>

On Sun, Feb 01, 2026 at 04:27:33PM +0300, Bera Yüzlü wrote:
> Refactor ODM_SetIQCbyRFpath to remove duplicated PHY_SetBBReg()
> calls and improve readability.
> 
> The original implementation duplicated the same PHY_SetBBReg()
> calls for both RF paths (S0 / S1) with only the path index
> changing. Introduce a small static inline helper, set_iqc(),
> to encapsulate a single PHY_SetBBReg() invocation and select
> the RF path once based on RFpath. This reduces code duplication,
> makes the intent clearer and eases future maintenance.
> 
> No functional change intended: register keys/values and
> the selection logic remain the same.
> 
> Signed-off-by: Bera Yüzlü <b9788213@gmail.com>
> ---
>  .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    | 33 +++++++++----------
>  1 file changed, 16 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
> index 34692cca33f5..bd535f774852 100644
> --- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
> +++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
> @@ -1074,10 +1074,17 @@ static void _PHY_PathBFillIQKMatrix8723B(
>  /*  */
>  /*  MP Already declare in odm.c */
>  
> +/* Helper */

Function comment is odd, and not really needed.

> +static inline void set_iqc(struct dm_odm_t *Odm, u32 *table)

Don't use inline unless you are forced to.  the compiler should get it
right without it.


> +{
> +	PHY_SetBBReg(Odm->Adapter, table[KEY], bMaskDWord, table[VAL]);

This is just a wrapper #define as well, right?  Why not spell it out to
call the real function instead?

> +}
> +
>  void ODM_SetIQCbyRFpath(struct dm_odm_t *pDM_Odm, u32 RFpath)
>  {
>  
>  	struct odm_rf_cal_t *pRFCalibrateInfo = &pDM_Odm->RFCalibrateInfo;
> +	u8 path;
>  
>  	if (
>  		(pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC80][VAL] != 0x0) &&
> @@ -1085,23 +1092,15 @@ void ODM_SetIQCbyRFpath(struct dm_odm_t *pDM_Odm, u32 RFpath)
>  		(pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC80][VAL] != 0x0) &&
>  		(pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] != 0x0)
>  	) {
> -		if (RFpath) { /* S1: RFpath = 0, S0:RFpath = 1 */
> -			/* S0 TX IQC */
> -			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC94][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC94][VAL]);
> -			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC80][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC80][VAL]);
> -			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC4C][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC4C][VAL]);
> -			/* S0 RX IQC */
> -			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][KEY], bMaskDWord, pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL]);
> -			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][KEY], bMaskDWord, pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][VAL]);
> -		} else {
> -			/* S1 TX IQC */
> -			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC94][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC94][VAL]);
> -			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC80][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC80][VAL]);
> -			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC4C][KEY], bMaskDWord, pRFCalibrateInfo->TxIQC_8723B[PATH_S1][IDX_0xC4C][VAL]);
> -			/* S1 RX IQC */
> -			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][KEY], bMaskDWord, pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL]);
> -			PHY_SetBBReg(pDM_Odm->Adapter, pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][KEY], bMaskDWord, pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][VAL]);
> -		}
> +		path = RFpath ? PATH_S0 : PATH_S1; /* S1: RFpath = 0, S0:RFpath = 1 */

Please do not use ?: statements unless you HAVE to.  Use real if()
statements instead, as that's easier and simpler for people to read and
understand.  The output should be the same, yet you create more readable
code as we write for people first, compilers second.

thanks,

greg k-h
