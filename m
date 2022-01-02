Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C70E2CA4
	for <linux-staging@lists.linux.dev>; Sun,  2 Jan 2022 17:24:04 +0000 (UTC)
Received: from dslb-188-104-058-096.188.104.pools.vodafone-ip.de ([188.104.58.96] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <postmaster@kaiser.cx>)
	id 1n44aN-0005Mv-VU; Sun, 02 Jan 2022 18:24:00 +0100
Received: from martin by martin-debian-2.paytec.ch with local (Exim 4.94.2)
	(envelope-from <martin@martin-debian-2.paytec.ch>)
	id 1n44aN-000FLx-3k; Sun, 02 Jan 2022 18:23:59 +0100
Date: Sun, 2 Jan 2022 18:23:59 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Michael Straube <straube.linux@gmail.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/7] staging: r8188eu: remove unused fields from
 struct hal_data_8188e
Message-ID: <YdHfrzh+DXl1g5XG@martin-debian-1.paytec.ch>
References: <20220101084937.3411-1-straube.linux@gmail.com>
 <20220101084937.3411-6-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220101084937.3411-6-straube.linux@gmail.com>
Sender: "Martin Kaiser,,," <martin@martin-debian-2.paytec.ch>

Thus wrote Michael Straube (straube.linux@gmail.com):

> Remove unused fields from struct hal_data_8188e.

> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
> v3: no changes
> v2: no changes

>  .../staging/r8188eu/include/rtl8188e_hal.h    | 30 -------------------
>  1 file changed, 30 deletions(-)

> diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
> index 40b3db34b8f2..2ce42d647a34 100644
> --- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
> +++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
> @@ -175,15 +175,9 @@ struct hal_data_8188e {

>  	u16	BasicRateSet;

> -	/*  EEPROM setting. */
> -	u16	EEPROMSVID;
> -	u16	EEPROMSDID;
>  	u8	EEPROMRegulatory;
> -
>  	u8	EEPROMThermalMeter;

> -	bool	EepromOrEfuse;
> -
>  	u8	Index24G_CCK_Base[RF_PATH_MAX][CHANNEL_MAX_NUMBER];
>  	u8	Index24G_BW40_Base[RF_PATH_MAX][CHANNEL_MAX_NUMBER];
>  	/* If only one tx, only BW20 and OFDM are used. */
> @@ -192,11 +186,6 @@ struct hal_data_8188e {
>  	s8	BW20_24G_Diff[RF_PATH_MAX][MAX_TX_COUNT];
>  	s8	BW40_24G_Diff[RF_PATH_MAX][MAX_TX_COUNT];

> -	u8	TxPwrLevelCck[RF_PATH_MAX][CHANNEL_MAX_NUMBER];
> -	/*  For HT 40MHZ pwr */
> -	u8	TxPwrLevelHT40_1S[RF_PATH_MAX][CHANNEL_MAX_NUMBER];
> -	/*  For HT 40MHZ pwr */
> -	u8	TxPwrLevelHT40_2S[RF_PATH_MAX][CHANNEL_MAX_NUMBER];
>  	/*  HT 20<->40 Pwr diff */
>  	u8	TxPwrHt20Diff[RF_PATH_MAX][CHANNEL_MAX_NUMBER];
>  	/*  For HT<->legacy pwr diff */
> @@ -205,7 +194,6 @@ struct hal_data_8188e {
>  	u8	PwrGroupHT20[RF_PATH_MAX][CHANNEL_MAX_NUMBER];
>  	u8	PwrGroupHT40[RF_PATH_MAX][CHANNEL_MAX_NUMBER];

> -	u8	LegacyHTTxPowerDiff;/*  Legacy to HT rate power diff */
>  	/*  The current Tx Power Level */
>  	u8	CurrentCckTxPwrIdx;
>  	u8	CurrentOfdm24GTxPwrIdx;
> @@ -213,21 +201,12 @@ struct hal_data_8188e {
>  	u8	CurrentBW4024GTxPwrIdx;

>  	/*  Read/write are allow for following hardware information variables */
> -	u8	framesync;
> -	u32	framesyncC34;
> -	u8	framesyncMonitor;
> -	u8	DefaultInitialGain[4];
>  	u8	pwrGroupCnt;
>  	u32	MCSTxPowerLevelOriginalOffset[MAX_PG_GROUP][16];
> -	u32	CCKTxPowerLevelOriginalOffset;

>  	u8	CrystalCap;
> -	u32	AntennaTxPath;			/*  Antenna path Tx */
> -	u32	AntennaRxPath;			/*  Antenna path Rx */
>  	u8	ExternalPA;

> -	u8	b1x1RecvCombine;	/*  for 1T1R receive combining */
> -
>  	u32	AcParam_BE; /* Original parameter for BE, use for EDCA turbo. */

>  	struct bb_reg_def PHYRegDef[2];	/* Radio A/B */
> @@ -254,17 +233,9 @@ struct hal_data_8188e {
>  	u8	FwRsvdPageStartOffset; /* Reserve page start offset except
>  					*  beacon in TxQ. */

> -	/*  2010/08/09 MH Add CU power down mode. */
> -	bool		pwrdown;
> -
>  	u8	OutEpQueueSel;
>  	u8	OutEpNumber;

> -	/*  2010/11/22 MH Add for slim combo debug mode selective. */
> -	/*  This is used for fix the drawback of CU TSMC-A/UMC-A cut.
> -	 * HW auto suspend ability. Close BT clock. */
> -	bool		SlimComboDbg;
> -
>  	u16	EfuseUsedBytes;

>  	struct P2P_PS_Offload_t	p2p_ps_offload;
> @@ -280,7 +251,6 @@ struct hal_data_8188e {
>  	u8	C2hArray[16];
>  	u8	UsbTxAggMode;
>  	u8	UsbTxAggDescNum;
> -	u32	MaxUsbRxAggBlock;

>  	enum usb_rx_agg_mode UsbRxAggMode;
>  	u8	UsbRxAggBlockCount;	/*  USB Block count. Block size is
> -- 
> 2.34.1

Acked-by: Martin Kaiser <martin@kaiser.cx>
