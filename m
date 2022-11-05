Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB8A1C3A;
	Sat,  5 Nov 2022 08:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667637857; bh=bAk3FzXFB1FTmgCiwSf7T/cjmRSbfail6sGHWJPETpI=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=bQFnEJtfrGaeKaD79WcFGlzDn9bfRpyldTlPTVtVnq0qwUaLBu0Ryq86W+7oheOKB
	 yrU3TaaoLIHFTYRTAYO2IE3KeTC52aFIT7AyeFEu5m+xYRCjVhkIxiL3Pa6an6zTQC
	 ppVtBFnYBhfLtZMQsOQ7MA7jWYHLJiBmH6RWcn8g=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Sat,  5 Nov 2022 09:44:17 +0100 (CET)
X-EA-Auth: HLkBRIQF0+jx+aMp0bDL1op/IV9t6+/4wBPPd4CvvBS2RL3/Mx2ABVOCBRpOqRWIdGu+Xw7rq4bDfqDOviLhIJiMGVoNnUUs
Date: Sat, 5 Nov 2022 14:14:12 +0530
From: Deepak R Varma <drv@mailo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: rtl8723bs: Simplify underutilized 2D array
 to 1D array
Message-ID: <Y2YiXCCyH9zJssCX@qemulion>
References: <cover.1667586648.git.drv@mailo.com>
 <4fb8d9783553d15a58e774d7137519d46e58ee3a.1667586648.git.drv@mailo.com>
 <Y2YghalNBdtaAQdr@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2YghalNBdtaAQdr@kroah.com>

On Sat, Nov 05, 2022 at 09:36:21AM +0100, Greg Kroah-Hartman wrote:
> On Sat, Nov 05, 2022 at 12:04:56AM +0530, Deepak R Varma wrote:
> > Member variable "Value" of structure iqk_matrix_regs_setting is
> > declared to be a 2D array of [3][IQK_Matrix_REG_NUM] grid. However
> > the primary index of this array is only used for index 0, the other
> > two elements are never used. Simplify this array to a one dimension
> > degree. The resultant code is simpler and is easy to maintain.
> >
> > Suggested-by: Dan Carpenter <error27@gmail.com>
> > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > ---
> >  drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c | 18 +++++++++---------
> >  drivers/staging/rtl8723bs/hal/odm.h            |  2 +-
> >  2 files changed, 10 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
> > index a52748f7b56e..9317a4462c02 100644
> > --- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
> > +++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
> > @@ -244,8 +244,8 @@ void ODM_TxPwrTrackSetPwr_8723B(
> >  			Final_CCK_Swing_Index = 0;
> >
> >  		setIqkMatrix_8723B(pDM_Odm, Final_OFDM_Swing_Index, RFPath,
> > -			pDM_Odm->RFCalibrateInfo.IQKMatrixRegSetting[ChannelMappedIndex].Value[0][0],
> > -			pDM_Odm->RFCalibrateInfo.IQKMatrixRegSetting[ChannelMappedIndex].Value[0][1]);
> > +			pDM_Odm->RFCalibrateInfo.IQKMatrixRegSetting[ChannelMappedIndex].Value[0],
> > +			pDM_Odm->RFCalibrateInfo.IQKMatrixRegSetting[ChannelMappedIndex].Value[1]);
> >
> >  		setCCKFilterCoefficient(pDM_Odm, Final_CCK_Swing_Index);
> >
> > @@ -257,8 +257,8 @@ void ODM_TxPwrTrackSetPwr_8723B(
> >  			pDM_Odm->Remnant_OFDMSwingIdx[RFPath] = Final_OFDM_Swing_Index - PwrTrackingLimit_OFDM;
> >
> >  			setIqkMatrix_8723B(pDM_Odm, PwrTrackingLimit_OFDM, RFPath,
> > -				pDM_Odm->RFCalibrateInfo.IQKMatrixRegSetting[ChannelMappedIndex].Value[0][0],
> > -				pDM_Odm->RFCalibrateInfo.IQKMatrixRegSetting[ChannelMappedIndex].Value[0][1]);
> > +				pDM_Odm->RFCalibrateInfo.IQKMatrixRegSetting[ChannelMappedIndex].Value[0],
> > +				pDM_Odm->RFCalibrateInfo.IQKMatrixRegSetting[ChannelMappedIndex].Value[1]);
> >
> >  			pDM_Odm->Modify_TxAGC_Flag_PathA = true;
> >  			PHY_SetTxPowerIndexByRateSection(Adapter, RFPath, pHalData->CurrentChannel, OFDM);
> > @@ -267,16 +267,16 @@ void ODM_TxPwrTrackSetPwr_8723B(
> >  			pDM_Odm->Remnant_OFDMSwingIdx[RFPath] = Final_OFDM_Swing_Index;
> >
> >  			setIqkMatrix_8723B(pDM_Odm, 0, RFPath,
> > -				pDM_Odm->RFCalibrateInfo.IQKMatrixRegSetting[ChannelMappedIndex].Value[0][0],
> > -				pDM_Odm->RFCalibrateInfo.IQKMatrixRegSetting[ChannelMappedIndex].Value[0][1]);
> > +				pDM_Odm->RFCalibrateInfo.IQKMatrixRegSetting[ChannelMappedIndex].Value[0],
> > +				pDM_Odm->RFCalibrateInfo.IQKMatrixRegSetting[ChannelMappedIndex].Value[1]);
> >
> >  			pDM_Odm->Modify_TxAGC_Flag_PathA = true;
> >  			PHY_SetTxPowerIndexByRateSection(Adapter, RFPath, pHalData->CurrentChannel, OFDM);
> >  			PHY_SetTxPowerIndexByRateSection(Adapter, RFPath, pHalData->CurrentChannel, HT_MCS0_MCS7);
> >  		} else {
> >  			setIqkMatrix_8723B(pDM_Odm, Final_OFDM_Swing_Index, RFPath,
> > -				pDM_Odm->RFCalibrateInfo.IQKMatrixRegSetting[ChannelMappedIndex].Value[0][0],
> > -				pDM_Odm->RFCalibrateInfo.IQKMatrixRegSetting[ChannelMappedIndex].Value[0][1]);
> > +				pDM_Odm->RFCalibrateInfo.IQKMatrixRegSetting[ChannelMappedIndex].Value[0],
> > +				pDM_Odm->RFCalibrateInfo.IQKMatrixRegSetting[ChannelMappedIndex].Value[1]);
> >
> >  			if (pDM_Odm->Modify_TxAGC_Flag_PathA) { /* If TxAGC has changed, reset TxAGC again */
> >  				pDM_Odm->Remnant_OFDMSwingIdx[RFPath] = 0;
> > @@ -1760,7 +1760,7 @@ void PHY_IQCalibrate_8723B(
> >  /* by sherry 20120321 */
> >  	if (final_candidate < 4) {
> >  		for (i = 0; i < IQK_Matrix_REG_NUM; i++)
> > -			pDM_Odm->RFCalibrateInfo.IQKMatrixRegSetting[0].Value[0][i] = result[final_candidate][i];
> > +			pDM_Odm->RFCalibrateInfo.IQKMatrixRegSetting[0].Value[i] = result[final_candidate][i];
> >  		pDM_Odm->RFCalibrateInfo.IQKMatrixRegSetting[0].bIQKDone = true;
> >  	}
> >
> > diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
> > index fe9782d2d4fd..e16a769850c5 100644
> > --- a/drivers/staging/rtl8723bs/hal/odm.h
> > +++ b/drivers/staging/rtl8723bs/hal/odm.h
> > @@ -481,7 +481,7 @@ enum odm_type_alna_e { /* tag_ODM_TYPE_ALNA_Definition */
> >
> >  struct iqk_matrix_regs_setting { /* _IQK_MATRIX_REGS_SETTING */
> >  	bool bIQKDone;
> > -	s32 Value[3][IQK_Matrix_REG_NUM];
> > +	s32 Value[IQK_Matrix_REG_NUM];
>
> This field is used to store values (as your above patch shows), but
> where is it actually used?  Are you sure it is needed at all?

Hi Greg,
For this driver, the values are passed onto setIqkMatrix_8723B() as arguments
and used inside this function. They are needed to be retained in the structure.

Thank you,
./drv


>
> thanks,
>
> greg k-h
>


