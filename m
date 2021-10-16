Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0015B2C81
	for <linux-staging@lists.linux.dev>; Sat, 16 Oct 2021 09:43:54 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1mbgEJ-00039Y-L9; Sat, 16 Oct 2021 11:43:51 +0200
Date: Sat, 16 Oct 2021 11:43:51 +0200
From: Martin Kaiser <lists@kaiser.cx>
To: Michael Straube <straube.linux@gmail.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] staging: r8188eu: remove ODM_AntselStatistics_88C()
Message-ID: <20211016094351.ntxyhsycadtz5yv3@viti.kaiser.cx>
References: <20211015163507.9091-1-straube.linux@gmail.com>
 <20211015163507.9091-5-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015163507.9091-5-straube.linux@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote Michael Straube (straube.linux@gmail.com):

> Function ODM_AntselStatistics_88C() is not used, remove it.

> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>  drivers/staging/r8188eu/hal/odm.c     | 21 ---------------------
>  drivers/staging/r8188eu/include/odm.h |  3 ---
>  2 files changed, 24 deletions(-)

> diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
> index 28bd6f36cddd..d3d13164ca8f 100644
> --- a/drivers/staging/r8188eu/hal/odm.c
> +++ b/drivers/staging/r8188eu/hal/odm.c
> @@ -1016,27 +1016,6 @@ void odm_InitHybridAntDiv(struct odm_dm_struct *pDM_Odm)
>  	ODM_AntennaDiversityInit_88E(pDM_Odm);
>  }

> -void ODM_AntselStatistics_88C(struct odm_dm_struct *pDM_Odm, u8 MacId, u32 PWDBAll, bool isCCKrate)
> -{
> -	struct sw_ant_switch *pDM_SWAT_Table = &pDM_Odm->DM_SWAT_Table;
> -
> -	if (pDM_SWAT_Table->antsel == 1) {
> -		if (isCCKrate) {
> -			pDM_SWAT_Table->CCK_Ant1_Cnt[MacId]++;
> -		} else {
> -			pDM_SWAT_Table->OFDM_Ant1_Cnt[MacId]++;
> -			pDM_SWAT_Table->RSSI_Ant1_Sum[MacId] += PWDBAll;
> -		}
> -	} else {
> -		if (isCCKrate) {
> -			pDM_SWAT_Table->CCK_Ant2_Cnt[MacId]++;
> -		} else {
> -			pDM_SWAT_Table->OFDM_Ant2_Cnt[MacId]++;
> -			pDM_SWAT_Table->RSSI_Ant2_Sum[MacId] += PWDBAll;
> -		}
> -	}
> -}
> -

Yet again, that seems to make a bunch of variables unused.
I guess that antsel, CCK_Ant1_Cnt, OFDM_Ant1_Cnt, RSSI_Ant1_Sum and their
Ant2 versions can be removed (haven't tried it yet, though).

I'm really curious to see what's left when we're done with all these
removals...

Best regards,
Martin
