Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D3C2C80
	for <linux-staging@lists.linux.dev>; Sun,  2 Jan 2022 17:06:47 +0000 (UTC)
Received: from dslb-188-104-058-096.188.104.pools.vodafone-ip.de ([188.104.58.96] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <postmaster@kaiser.cx>)
	id 1n44Jg-0005Gp-NC; Sun, 02 Jan 2022 18:06:44 +0100
Received: from martin by martin-debian-2.paytec.ch with local (Exim 4.94.2)
	(envelope-from <martin@martin-debian-2.paytec.ch>)
	id 1n44Jf-000DmX-6I; Sun, 02 Jan 2022 18:06:43 +0100
Date: Sun, 2 Jan 2022 18:06:43 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Michael Straube <straube.linux@gmail.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/7] staging: r8188eu: UsbRxHighSpeedMode is set but
 never used
Message-ID: <YdHbo6YXFmI+UQJh@martin-debian-1.paytec.ch>
References: <20220101084937.3411-1-straube.linux@gmail.com>
 <20220101084937.3411-3-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220101084937.3411-3-straube.linux@gmail.com>
Sender: "Martin Kaiser,,," <martin@martin-debian-2.paytec.ch>

Thus wrote Michael Straube (straube.linux@gmail.com):

> The field UsbRxHighSpeedMode of struct hal_data_8188e is set but
> never used. Remove it.

> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
> v3: no changes
> v2: no changes

>  drivers/staging/r8188eu/hal/usb_halinit.c      | 5 -----
>  drivers/staging/r8188eu/include/rtl8188e_hal.h | 3 ---
>  2 files changed, 8 deletions(-)

> diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
> index 104705ef170e..96db9a8e7667 100644
> --- a/drivers/staging/r8188eu/hal/usb_halinit.c
> +++ b/drivers/staging/r8188eu/hal/usb_halinit.c
> @@ -502,16 +502,11 @@ usb_AggSettingRxUpdate(

>  static void InitUsbAggregationSetting(struct adapter *Adapter)
>  {
> -	struct hal_data_8188e *haldata = &Adapter->haldata;
> -
>  	/*  Tx aggregation setting */
>  	usb_AggSettingTxUpdate(Adapter);

>  	/*  Rx aggregation setting */
>  	usb_AggSettingRxUpdate(Adapter);
> -
> -	/*  201/12/10 MH Add for USB agg mode dynamic switch. */
> -	haldata->UsbRxHighSpeedMode = false;
>  }

>  static void _InitOperationMode(struct adapter *Adapter)
> diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
> index e8cb093abb62..8b54f52f49e2 100644
> --- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
> +++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
> @@ -262,9 +262,6 @@ struct hal_data_8188e {
>  	u8	OutEpQueueSel;
>  	u8	OutEpNumber;

> -	/*  Add for USB aggreation mode dynamic shceme. */
> -	bool		UsbRxHighSpeedMode;
> -
>  	/*  2010/11/22 MH Add for slim combo debug mode selective. */
>  	/*  This is used for fix the drawback of CU TSMC-A/UMC-A cut.
>  	 * HW auto suspend ability. Close BT clock. */
> -- 
> 2.34.1

Acked-by: Martin Kaiser <martin@kaiser.cx>
