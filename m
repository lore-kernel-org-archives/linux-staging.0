Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFA633FF
	for <linux-staging@lists.linux.dev>; Thu, 29 Sep 2022 20:42:06 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id e18so3524781edj.3
        for <linux-staging@lists.linux.dev>; Thu, 29 Sep 2022 13:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=7/n3ABaUTRcR3L7JaQr4FFYwlrritFlsMPjvjhOLDtk=;
        b=OtLco8xWueA+aVZNsnymivhruFHcJXTtKPSqO9cDiFmSKjmbcssOseu16roF73PVOX
         fbxsc4znz/Txr2cmB2VkXJWRSI+0H6MHzmPhhmN3W3TwUo0y4SjtstpFj6GAJK5gl4BP
         cMp57rIXR0aKFLXalSdYerVp46frgFOyy2A+25T7PsfvxNO/nwfIn8ITns3jEAIl3/rg
         cz61cufnLmKyMKYI0H2DQ+eB+QIe6CKY0CEesHHJFAn3tilrAApRgOoUg4FyGHdGY7cj
         /crbznBR4/LXHkuYWIjkxVwyTjIlbm7Del/2nPLxe7+nWUsz1X1LwhRLVOcADyecQl64
         c1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=7/n3ABaUTRcR3L7JaQr4FFYwlrritFlsMPjvjhOLDtk=;
        b=LhnsFdfJCrrMnR2rbkQuz3RG/oPC69y/7Z23iG4rs15MKnPJj9sFwRLscWK0ScUOv5
         PeTSOPIRL+ElLzdg6pUZSk9S5Xa/YHDnrbOj2sAvZnl3YZh6Qa3ymxOKbtLcMRBEzAXm
         IUHeQGY6C/7GSTOhCwQ7q+bM1JdN74B3SoARW2phZkThzKd0eKtlsS1FDjA4ReJ57qgy
         Fbv6iXsSDGjEyovOHm4NyMT+gk9Edy4goApJNWGZXWhxf7Z5DLRh155ZTLsE//og5P5W
         dxi+1f5y3KB1Y+D/7ls+ezAHx5FG1pPfldikkILXWJU7eamrELLwIbq/7zRzGUUEEhqd
         wwHQ==
X-Gm-Message-State: ACrzQf3CocaBsESjtuupzUW57w5NDytFk6O2PuA/F8S2Xxumo4ULnqSb
	cOvCZihCrknJ6i/n628hU+c+WPyrIeE=
X-Google-Smtp-Source: AMsMyM7tQT5J6d2wodgWqZ2oVSmfZnqzOIeHwOcvtJXUUR4LJLsfyi4TpzHBZ0tO/dESUGHg7aAtNQ==
X-Received: by 2002:a05:6402:4148:b0:440:cb9f:d10f with SMTP id x8-20020a056402414800b00440cb9fd10fmr4952906eda.77.1664484124788;
        Thu, 29 Sep 2022 13:42:04 -0700 (PDT)
Received: from [192.168.1.102] (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id kw22-20020a170907771600b0078250005a79sm72472ejc.163.2022.09.29.13.42.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 13:42:04 -0700 (PDT)
Message-ID: <030ae1db-916e-a28b-5852-3c89e8eb45fa@gmail.com>
Date: Thu, 29 Sep 2022 22:42:03 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] staging: rtl8192e: Rename variable Bandwidth to avoid
 CamelCase
Content-Language: en-US
To: Yogesh Hegde <yogi.kernel@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220928180350.GA82748@zephyrus>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220928180350.GA82748@zephyrus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/28/22 20:03, Yogesh Hegde wrote:
> Rename variable Bandwidth to bandwidth to avoid CamelCase
> which is not accepted by checkpatch.pl .
> 
> Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>
> ---
> 
> Changes in v2:
>      - Rename variable Bandwidth in file rtl819x_HTProc.c which was missed in v1
> 
> ---
>   drivers/staging/rtl8192e/rtl8192e/r8190P_rtl8256.c | 6 +++---
>   drivers/staging/rtl8192e/rtl8192e/r8190P_rtl8256.h | 2 +-
>   drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c     | 4 ++--
>   drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h     | 2 +-
>   drivers/staging/rtl8192e/rtl819x_HTProc.c          | 8 ++++----
>   drivers/staging/rtl8192e/rtllib.h                  | 4 ++--
>   6 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/r8190P_rtl8256.c b/drivers/staging/rtl8192e/rtl8192e/r8190P_rtl8256.c
> index 956e8e2a728c..ab2e9b729883 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/r8190P_rtl8256.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/r8190P_rtl8256.c
> @@ -10,7 +10,7 @@
>   #include "r8190P_rtl8256.h"
>   
>   void rtl92e_set_bandwidth(struct net_device *dev,
> -			  enum ht_channel_width Bandwidth)
> +			  enum ht_channel_width bandwidth)
>   {
>   	u8	eRFPath;
>   	struct r8192_priv *priv = rtllib_priv(dev);
> @@ -25,7 +25,7 @@ void rtl92e_set_bandwidth(struct net_device *dev,
>   		if (!rtl92e_is_legal_rf_path(dev, eRFPath))
>   			continue;
>   
> -		switch (Bandwidth) {
> +		switch (bandwidth) {
>   		case HT_CHANNEL_WIDTH_20:
>   			rtl92e_set_rf_reg(dev, (enum rf90_radio_path)eRFPath,
>   					  0x0b, bMask12Bits, 0x100);
> @@ -44,7 +44,7 @@ void rtl92e_set_bandwidth(struct net_device *dev,
>   			break;
>   		default:
>   			netdev_err(dev, "%s(): Unknown bandwidth: %#X\n",
> -				   __func__, Bandwidth);
> +				   __func__, bandwidth);
>   			break;
>   		}
>   	}
> diff --git a/drivers/staging/rtl8192e/rtl8192e/r8190P_rtl8256.h b/drivers/staging/rtl8192e/rtl8192e/r8190P_rtl8256.h
> index 4cb483f1a152..3c52e2b43095 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/r8190P_rtl8256.h
> +++ b/drivers/staging/rtl8192e/rtl8192e/r8190P_rtl8256.h
> @@ -9,7 +9,7 @@
>   
>   #define RTL819X_TOTAL_RF_PATH 2
>   void rtl92e_set_bandwidth(struct net_device *dev,
> -			  enum ht_channel_width Bandwidth);
> +			  enum ht_channel_width bandwidth);
>   bool rtl92e_config_rf(struct net_device *dev);
>   void rtl92e_set_cck_tx_power(struct net_device *dev, u8	powerlevel);
>   void rtl92e_set_ofdm_tx_power(struct net_device *dev, u8 powerlevel);
> diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
> index 594db05b6558..1b592258e640 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
> @@ -1194,7 +1194,7 @@ static void _rtl92e_set_bw_mode_work_item(struct net_device *dev)
>   	priv->SetBWModeInProgress = false;
>   }
>   
> -void rtl92e_set_bw_mode(struct net_device *dev, enum ht_channel_width Bandwidth,
> +void rtl92e_set_bw_mode(struct net_device *dev, enum ht_channel_width bandwidth,
>   			enum ht_extchnl_offset Offset)
>   {
>   	struct r8192_priv *priv = rtllib_priv(dev);
> @@ -1206,7 +1206,7 @@ void rtl92e_set_bw_mode(struct net_device *dev, enum ht_channel_width Bandwidth,
>   	atomic_inc(&(priv->rtllib->atm_swbw));
>   	priv->SetBWModeInProgress = true;
>   
> -	priv->CurrentChannelBW = Bandwidth;
> +	priv->CurrentChannelBW = bandwidth;
>   
>   	if (Offset == HT_EXTCHNL_OFFSET_LOWER)
>   		priv->nCur40MhzPrimeSC = HAL_PRIME_CHNL_OFFSET_UPPER;
> diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
> index e89c9ac90989..75629f5df954 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
> +++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
> @@ -75,7 +75,7 @@ u8 rtl92e_config_rf_path(struct net_device *dev, enum rf90_radio_path eRFPath);
>   
>   u8 rtl92e_set_channel(struct net_device *dev, u8 channel);
>   void rtl92e_set_bw_mode(struct net_device *dev,
> -			enum ht_channel_width Bandwidth,
> +			enum ht_channel_width bandwidth,
>   			enum ht_extchnl_offset Offset);
>   void rtl92e_init_gain(struct net_device *dev, u8 Operation);
>   
> diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> index 4a3bd49ce81a..ef3dca51cf99 100644
> --- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
> +++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> @@ -503,7 +503,7 @@ static u8 HTFilterMCSRate(struct rtllib_device *ieee, u8 *pSupportMCS,
>   }
>   
>   void HTSetConnectBwMode(struct rtllib_device *ieee,
> -			enum ht_channel_width Bandwidth,
> +			enum ht_channel_width bandwidth,
>   			enum ht_extchnl_offset Offset);
>   
>   void HTOnAssocRsp(struct rtllib_device *ieee)
> @@ -850,7 +850,7 @@ static void HTSetConnectBwModeCallback(struct rtllib_device *ieee)
>   }
>   
>   void HTSetConnectBwMode(struct rtllib_device *ieee,
> -			enum ht_channel_width Bandwidth,
> +			enum ht_channel_width bandwidth,
>   			enum ht_extchnl_offset Offset)
>   {
>   	struct rt_hi_throughput *pHTInfo = ieee->pHTInfo;
> @@ -859,13 +859,13 @@ void HTSetConnectBwMode(struct rtllib_device *ieee,
>   		return;
>   
>   	if (ieee->GetHalfNmodeSupportByAPsHandler(ieee->dev))
> -		Bandwidth = HT_CHANNEL_WIDTH_20;
> +		bandwidth = HT_CHANNEL_WIDTH_20;
>   
>   	if (pHTInfo->sw_bw_in_progress) {
>   		pr_info("%s: sw_bw_in_progress!!\n", __func__);
>   		return;
>   	}
> -	if (Bandwidth == HT_CHANNEL_WIDTH_20_40) {
> +	if (bandwidth == HT_CHANNEL_WIDTH_20_40) {
>   		if (ieee->current_network.channel < 2 &&
>   		    Offset == HT_EXTCHNL_OFFSET_LOWER)
>   			Offset = HT_EXTCHNL_OFFSET_NO_EXT;
> diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
> index f7c786c8117e..3c72ed2a30a4 100644
> --- a/drivers/staging/rtl8192e/rtllib.h
> +++ b/drivers/staging/rtl8192e/rtllib.h
> @@ -1765,7 +1765,7 @@ struct rtllib_device {
>   	/* check whether Tx hw resource available */
>   	short (*check_nic_enough_desc)(struct net_device *dev, int queue_index);
>   	void (*SetBWModeHandler)(struct net_device *dev,
> -				 enum ht_channel_width Bandwidth,
> +				 enum ht_channel_width bandwidth,
>   				 enum ht_extchnl_offset Offset);
>   	bool (*GetNmodeSupportBySecCfg)(struct net_device *dev);
>   	void (*SetWirelessMode)(struct net_device *dev, u8 wireless_mode);
> @@ -2073,7 +2073,7 @@ int rtllib_wx_get_rts(struct rtllib_device *ieee, struct iw_request_info *info,
>   #define MAX_RECEIVE_BUFFER_SIZE 9100
>   
>   void HTSetConnectBwMode(struct rtllib_device *ieee,
> -			enum ht_channel_width Bandwidth,
> +			enum ht_channel_width bandwidth,
>   			enum ht_extchnl_offset Offset);
>   void HTUpdateDefaultSetting(struct rtllib_device *ieee);
>   void HTConstructCapabilityElement(struct rtllib_device *ieee,

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
