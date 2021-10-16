Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE412C81
	for <linux-staging@lists.linux.dev>; Sat, 16 Oct 2021 09:46:01 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1mbgGN-0003BM-0X; Sat, 16 Oct 2021 11:45:59 +0200
Date: Sat, 16 Oct 2021 11:45:58 +0200
From: Martin Kaiser <lists@kaiser.cx>
To: Michael Straube <straube.linux@gmail.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] staging: r8188eu: pMacPhyMode is not used
Message-ID: <20211016094558.wxgjy4t7k6lslwqb@viti.kaiser.cx>
References: <20211015163507.9091-1-straube.linux@gmail.com>
 <20211015163507.9091-7-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015163507.9091-7-straube.linux@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote Michael Straube (straube.linux@gmail.com):

> pMacPhyMode is not used. Remove it from odm_dm_struct and remove
> related dead code.

> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>  drivers/staging/r8188eu/hal/odm.c     | 3 ---
>  drivers/staging/r8188eu/include/odm.h | 3 ---
>  2 files changed, 6 deletions(-)

> diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
> index 85bc5050cda5..a2cbe727f6e0 100644
> --- a/drivers/staging/r8188eu/hal/odm.c
> +++ b/drivers/staging/r8188eu/hal/odm.c
> @@ -231,9 +231,6 @@ void ODM_CmnInfoHook(struct odm_dm_struct *pDM_Odm, enum odm_common_info_def Cmn
>  	/*  */
>  	switch	(CmnInfo) {
>  	/*  Dynamic call by reference pointer. */
> -	case	ODM_CMNINFO_MAC_PHY_MODE:
> -		pDM_Odm->pMacPhyMode = (u8 *)pValue;
> -		break;
>  	case	ODM_CMNINFO_TX_UNI:
>  		pDM_Odm->pNumTxBytesUnicast = (u64 *)pValue;
>  		break;
> diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
> index 9745069060d7..6cbf64df9be7 100644
> --- a/drivers/staging/r8188eu/include/odm.h
> +++ b/drivers/staging/r8188eu/include/odm.h
> @@ -269,7 +269,6 @@ enum odm_common_info_def {

>  	/*  Dynamic value: */
>  /*  POINTER REFERENCE-----------  */
> -	ODM_CMNINFO_MAC_PHY_MODE,	/*  ODM_MAC_PHY_MODE_E */
>  	ODM_CMNINFO_TX_UNI,
>  	ODM_CMNINFO_RX_UNI,
>  	ODM_CMNINFO_WM_MODE,		/*  ODM_WIRELESS_MODE_E */
> @@ -621,8 +620,6 @@ struct odm_dm_struct {
>  	bool	bool_temp;
>  	struct adapter *adapter_temp;

> -	/*  MAC PHY Mode SMSP/DMSP/DMDP = 0/1/2 */
> -	u8	*pMacPhyMode;
>  	/* TX Unicast byte count */
>  	u64	*pNumTxBytesUnicast;
>  	/* RX Unicast byte count */
> -- 
> 2.33.0

Acked-by: Martin Kaiser <martin@kaiser.cx>
