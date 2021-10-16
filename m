Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9302C81
	for <linux-staging@lists.linux.dev>; Sat, 16 Oct 2021 09:32:36 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1mbg3O-00031m-A5; Sat, 16 Oct 2021 11:32:34 +0200
Date: Sat, 16 Oct 2021 11:32:34 +0200
From: Martin Kaiser <lists@kaiser.cx>
To: Michael Straube <straube.linux@gmail.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] staging: r8188eu: remove
 ODM_SingleDualAntennaDefaultSetting()
Message-ID: <20211016093234.dojgrummv3pmj23c@viti.kaiser.cx>
References: <20211015163507.9091-1-straube.linux@gmail.com>
 <20211015163507.9091-3-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015163507.9091-3-straube.linux@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote Michael Straube (straube.linux@gmail.com):

> Function ODM_SingleDualAntennaDefaultSetting() is not used,
> remove it.

> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>  drivers/staging/r8188eu/hal/odm.c     | 11 -----------
>  drivers/staging/r8188eu/include/odm.h |  2 --
>  2 files changed, 13 deletions(-)

> diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
> index 627213392795..030bc7bd9905 100644
> --- a/drivers/staging/r8188eu/hal/odm.c
> +++ b/drivers/staging/r8188eu/hal/odm.c
> @@ -1190,14 +1190,3 @@ u32 ConvertTo_dB(u32 Value)

>  	return dB;
>  }
> -
> -/*  Description: */
> -/* 	Set Single/Dual Antenna default setting for products that do not do detection in advance. */
> -/*  Added by Joseph, 2012.03.22 */
> -void ODM_SingleDualAntennaDefaultSetting(struct odm_dm_struct *pDM_Odm)
> -{
> -	struct sw_ant_switch *pDM_SWAT_Table = &pDM_Odm->DM_SWAT_Table;
> -
> -	pDM_SWAT_Table->ANTA_ON = true;
> -	pDM_SWAT_Table->ANTB_ON = true;

ANTA_ON and ANTB_ON can now be removed from struct sw_ant_switch.
