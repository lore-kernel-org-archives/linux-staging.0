Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D803E72
	for <linux-staging@lists.linux.dev>; Sun, 20 Jun 2021 13:32:06 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1luxYL-0006ok-96; Sun, 20 Jun 2021 15:31:57 +0200
Date: Sun, 20 Jun 2021 15:31:57 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Michael Straube <straube.linux@gmail.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8188eu: remove useless comment
Message-ID: <20210620133157.myatkutw2ts26cvj@viti.kaiser.cx>
References: <20210619175055.5122-1-straube.linux@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210619175055.5122-1-straube.linux@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote Michael Straube (straube.linux@gmail.com):

> Remove block comment about function HwSuspendModeEnable92Cu.
> The comment contains no useful information and there is even
> no HwSuspendModeEnable92Cu function in the driver code.
> 'git grep -n HwSuspendModeEnable92Cu drivers/staging/rtl8188eu'
> returns nothing.

> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>  drivers/staging/rtl8188eu/hal/usb_halinit.c | 16 ----------------
>  1 file changed, 16 deletions(-)

> diff --git a/drivers/staging/rtl8188eu/hal/usb_halinit.c b/drivers/staging/rtl8188eu/hal/usb_halinit.c
> index dcdf868b394d..6c88675ae251 100644
> --- a/drivers/staging/rtl8188eu/hal/usb_halinit.c
> +++ b/drivers/staging/rtl8188eu/hal/usb_halinit.c
> @@ -601,22 +601,6 @@ static void _InitAntenna_Selection(struct adapter *Adapter)
>  		haldata->CurAntenna = Antenna_B;
>  }

> -/*-----------------------------------------------------------------------------
> - * Function:	HwSuspendModeEnable92Cu()
> - *
> - * Overview:	HW suspend mode switch.
> - *
> - * Input:		NONE
> - *
> - * Output:	NONE
> - *
> - * Return:	NONE
> - *
> - * Revised History:
> - *	When		Who		Remark
> - *	08/23/2010	MHC		HW suspend mode switch test..
> - *---------------------------------------------------------------------------
> - */
>  enum rt_rf_power_state RfOnOffDetect(struct adapter *adapt)
>  {
>  	u8 val8;
> -- 
> 2.32.0

You're right. The function for this comment is already gone.

Reviewed-by: Martin Kaiser <martin@kaiser.cx>
