Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D223D75
	for <linux-staging@lists.linux.dev>; Tue, 11 Oct 2022 19:50:36 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id u21so21617972edi.9
        for <linux-staging@lists.linux.dev>; Tue, 11 Oct 2022 12:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M89Vx2J0KtMWAdMcthflIEuzD6tUlYrH96nIaPjnnvE=;
        b=QWoEO75NAvLSgM7TpG0IH05vifJHnXawd8BnYsvWBiBGCix5bKvv66irbmkvNy3VtO
         /NgHq0SvK+KvTjVT8sbKuDyaDEWg119NLH1D/1e75moMKlkcIgb+/eSTvlowV4y/fBfO
         ynPX6R44LiRuZAEq7mMAzzhsurnUlFOEPY7TEqPSDSlE0BxIxlutYMB5HhoPE6mdMwjr
         PH2xFwgOnpy1TYp302LV0Hg3ACswQQntPxFcrP/iyWbyfsmzdfeisgvoY/eC6bPDkAZx
         LoeP0wfEHXiT1nOkLNwS2vy8lIuG5WhJeFbG4RPu6udmtlKkHxHfpTMXJOfsnJ4ggU41
         YjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M89Vx2J0KtMWAdMcthflIEuzD6tUlYrH96nIaPjnnvE=;
        b=EQHwnyw4zB6FAauXiUu9p4Sk9YPquvVq2n5FKgbOFFmRMSAnZ5RMzhUrPLr7Q5ArJ2
         3Hr0cuM+xHwayXNEbL2owIpHW67ubSQInJKufaEhxooc07VDNojEJpnztrsDvlz7R/nU
         9pOw4ksexmhvIW4pkep0PDeacPvRNapsW6tGsJRXGrffCgZfIF0K0Txm/KUKzRCigCfl
         hqke6OOqQax2Ilqpb8lCSx6YG73yi8f7DDV+LPj+DG19rZVtq1pgJpV4qvqmwloj9OA0
         gzKyX3iG//ngzx7ddYEzNhlhbXpoiOARBCmGm5hUYjhAGGzk6DT0I1eV4nLGPnbK/+vy
         jl6w==
X-Gm-Message-State: ACrzQf2i1rQX0OFUR8IwoV/vKoXBQJwqsqcU0RD7jWUeTBg/Nu3p1rXH
	uu8IkYL9hQBzuNK0OOOJQpFwSe3SRbQ=
X-Google-Smtp-Source: AMsMyM7NPEOWHr4E70WwMC8sqC8pFKS2G6I+xg/o0LCVKDtnnICIVL8IhzZcldBNNijvcZ61JOfHxg==
X-Received: by 2002:a05:6402:11d1:b0:45c:1fef:ee43 with SMTP id j17-20020a05640211d100b0045c1fefee43mr11268817edw.36.1665517835056;
        Tue, 11 Oct 2022 12:50:35 -0700 (PDT)
Received: from [192.168.1.102] (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id z8-20020a1709060f0800b0077826b92d99sm193784eji.12.2022.10.11.12.50.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 12:50:34 -0700 (PDT)
Message-ID: <7b2302e1-7212-95f0-8936-b642a431b033@gmail.com>
Date: Tue, 11 Oct 2022 21:50:33 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] staging: rtl8192e: remove unnecessary braces for
 single statement blocks
Content-Language: en-US
To: Rui Li <me@lirui.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <166535769195.7.8013937898116750731.67872946@lirui.org>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <166535769195.7.8013937898116750731.67872946@lirui.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/22 01:21, Rui Li wrote:
> This commit cleans up checkpatch warning as follows:
> braces {} are not necessary for single statement blocks
> 
> Signed-off-by: Rui Li <me@lirui.org>
> ---
> Changes since v2:
>   - Correct commit message title
>   - Add changelog
> 
> Changes since v1:
>   - Only fix one of checkpatch warnings
> ---
>   drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c |  3 +--
>   drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c |  9 +++------
>   drivers/staging/rtl8192e/rtl8192e/rtl_dm.c     | 12 ++++--------
>   3 files changed, 8 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
> index 18e4e5d84878..8d20b0deca37 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
> @@ -1112,9 +1112,8 @@ void  rtl92e_fill_tx_desc(struct net_device *dev, struct tx_desc *pdesc,
>   	if (cb_desc->bHwSec) {
>   		static u8 tmp;
>   
> -		if (!tmp) {
> +		if (!tmp)
>   			tmp = 1;
> -		}
>   		switch (priv->rtllib->pairwise_key_type) {
>   		case KEY_TYPE_WEP40:
>   		case KEY_TYPE_WEP104:
> diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
> index 1b592258e640..4e3d183be0f2 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
> @@ -522,9 +522,8 @@ static bool _rtl92e_bb_config_para_file(struct net_device *dev)
>   		rtStatus  = rtl92e_check_bb_and_rf(dev,
>   						   (enum hw90_block)eCheckItem,
>   						   (enum rf90_radio_path)0);
> -		if (!rtStatus) {
> +		if (!rtStatus)
>   			return rtStatus;
> -		}
>   	}
>   	rtl92e_set_bb_reg(dev, rFPGA0_RFMOD, bCCKEn|bOFDMEn, 0x0);
>   	_rtl92e_phy_config_bb(dev, BaseBand_Config_PHY_REG);
> @@ -1379,9 +1378,8 @@ static bool _rtl92e_set_rf_power_state(struct net_device *dev,
>   					i++;
>   				}
>   
> -				if (i >= MAX_DOZE_WAITING_TIMES_9x) {
> +				if (i >= MAX_DOZE_WAITING_TIMES_9x)
>   					break;
> -				}
>   			}
>   			rtl92e_set_rf_off(dev);
>   			break;
> @@ -1398,9 +1396,8 @@ static bool _rtl92e_set_rf_power_state(struct net_device *dev,
>   					i++;
>   				}
>   
> -				if (i >= MAX_DOZE_WAITING_TIMES_9x) {
> +				if (i >= MAX_DOZE_WAITING_TIMES_9x)
>   					break;
> -				}
>   			}
>   
>   			if (pPSC->RegRfPsLevel & RT_RF_OFF_LEVL_HALT_NIC &&
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
> index 702551056227..641961a14c52 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
> @@ -267,9 +267,8 @@ static void _rtl92e_dm_check_ac_dc_power(struct net_device *dev)
>   			"PATH=/usr/bin:/bin",
>   			 NULL};
>   
> -	if (priv->ResetProgress == RESET_TYPE_SILENT) {
> +	if (priv->ResetProgress == RESET_TYPE_SILENT)
>   		return;
> -	}
>   
>   	if (priv->rtllib->state != RTLLIB_LINKED)
>   		return;
> @@ -330,9 +329,8 @@ static void _rtl92e_dm_check_rate_adaptive(struct net_device *dev)
>   	bool bshort_gi_enabled = false;
>   	static u8 ping_rssi_state;
>   
> -	if (!priv->up) {
> +	if (!priv->up)
>   		return;
> -	}
>   
>   	if (pra->rate_adaptive_disabled)
>   		return;
> @@ -777,9 +775,8 @@ static void _rtl92e_dm_tx_power_tracking_cb_thermal(struct net_device *dev)
>   		tmpRegA = rtl92e_get_bb_reg(dev, rOFDM0_XATxIQImbalance,
>   					    bMaskDWord);
>   		for (i = 0; i < OFDM_Table_Length; i++) {
> -			if (tmpRegA == OFDMSwingTable[i]) {
> +			if (tmpRegA == OFDMSwingTable[i])
>   				priv->OFDM_index[0] = i;
> -			}
>   		}
>   
>   		TempCCk = rtl92e_get_bb_reg(dev, rCCK0_TxFilter1, bMaskByte2);
> @@ -1066,9 +1063,8 @@ void rtl92e_dm_restore_state(struct net_device *dev)
>   	u32	reg_ratr = priv->rate_adaptive.last_ratr;
>   	u32 ratr_value;
>   
> -	if (!priv->up) {
> +	if (!priv->up)
>   		return;
> -	}
>   
>   	if (priv->rate_adaptive.rate_adaptive_disabled)
>   		return;

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
