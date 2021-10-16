Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BECD2C81
	for <linux-staging@lists.linux.dev>; Sat, 16 Oct 2021 09:29:58 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1mbg0j-0002zW-EL; Sat, 16 Oct 2021 11:29:49 +0200
Date: Sat, 16 Oct 2021 11:29:49 +0200
From: Martin Kaiser <lists@kaiser.cx>
To: Michael Straube <straube.linux@gmail.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] staging: r8188eu: remove empty functions from odm.c
Message-ID: <20211016092949.7746u74o2f5lgyzo@viti.kaiser.cx>
References: <20211015163507.9091-1-straube.linux@gmail.com>
 <20211015163507.9091-2-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015163507.9091-2-straube.linux@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote Michael Straube (straube.linux@gmail.com):

> Remove empty functions from odm.c.

> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>  drivers/staging/r8188eu/hal/odm.c             | 32 -------------------
>  drivers/staging/r8188eu/hal/odm_HWConfig.c    |  7 +---
>  drivers/staging/r8188eu/include/odm.h         |  7 ----
>  drivers/staging/r8188eu/include/odm_precomp.h |  2 --
>  4 files changed, 1 insertion(+), 47 deletions(-)

> diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
> index 2178ffe41bb3..627213392795 100644
> --- a/drivers/staging/r8188eu/hal/odm.c
> +++ b/drivers/staging/r8188eu/hal/odm.c
> @@ -196,13 +196,9 @@ void ODM_DMWatchdog(struct odm_dm_struct *pDM_Odm)
>  	    (pDM_Odm->AntDivType == CGCS_RX_HW_ANTDIV)	||
>  	    (pDM_Odm->AntDivType == CG_TRX_SMART_ANTDIV))
>  		odm_HwAntDiv(pDM_Odm);
> -	else if (pDM_Odm->AntDivType == CGCS_RX_SW_ANTDIV)
> -		odm_SwAntDivChkAntSwitch(pDM_Odm, SWAW_STEP_PEAK);

This was the last user of SWAW_STEP_PEAK. The define can be removed now
(maybe in a follow-up patch).

Acked-by: Martin Kaiser <martin@kaiser.cx>
