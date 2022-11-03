Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FB879C9;
	Thu,  3 Nov 2022 22:20:21 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id cl5so4727791wrb.9;
        Thu, 03 Nov 2022 15:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cf8DyO3ETGIYIQixIwKb3/INqyxv6CyPu5H1onnqtpo=;
        b=O9W0Tx6z8L5sNpkX2mbG3O33oB2qNPs4kmph5QqsaPe8h9RdIzU9Jz3QXsDbpoSZKe
         EPwfpsMp4kqs8gyqLRE2kBDDqAV0INcmTMETMJC7rCBz1cImhMLszqMzZaVzVMuKYeBw
         ejBnw30ziiT2rjTOrirfOOM4Bei3+NdaZsRkQhrQ/IE82nHNRE6M7ObH5S7oEdwHUWh0
         KKrcc9filjcz2jjT0S0pHEjZf+qweJrNnf9SKays320YDL1pQDwIKkDYqtRRxjWDc1aU
         9pjr/vOemWgbJSkvKj6LdMCipu6NsbzNf3sQAvUwA+R4Xw9/bVzHjXh2yYa83gtYhRo6
         NqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cf8DyO3ETGIYIQixIwKb3/INqyxv6CyPu5H1onnqtpo=;
        b=Tki1Db8OaHFrWV3vOD6sEHB/m/Lj9J1hY3B1YZJMaqAOO2Z8Bb0flADrb/WBUKXdFP
         YXhrdbY9CdZ8HQCoM3qGV/QkUCokIXL9CEu2Qsg2Dv8UfAbEHy3QInrXAh0xkhrqLyo5
         IdA7VXBqr3bwG9ZFiF8VUIDM0KycZUd7l5IuPUemPAliBxlh30cEjI9c9DtdyiIp/b6C
         TLnrpjcoTx6UDKoO1thQxXEet0uig5rgAas1OPalxZXlvqh9JqIho9QYlP3jamMgsbHo
         VlJ0HjQZF38sbstet4uvmRodE3b+9MT1fZw5jFeMco1vC3WUiiu3Gr84uIktQ2y80aJ+
         af7w==
X-Gm-Message-State: ACrzQf3xM2yyjpYGfKoH9VkRmsb29kImeNbJHa7tx6UojtO4Nvtx/ppR
	J8FMLBpdHgYx/uE16Rz4k6I=
X-Google-Smtp-Source: AMsMyM4O6fnBvFSjwoPfULQ9oW+sdz397iRedLTXAymWOj2Y8WQJzF8GSW5Mhe3M0LNqq0MOR75GEg==
X-Received: by 2002:a5d:6ac6:0:b0:236:84b5:6660 with SMTP id u6-20020a5d6ac6000000b0023684b56660mr20392596wrw.555.1667514019465;
        Thu, 03 Nov 2022 15:20:19 -0700 (PDT)
Received: from [192.168.1.103] (p54a07888.dip0.t-ipconnect.de. [84.160.120.136])
        by smtp.gmail.com with ESMTPSA id z8-20020a056000110800b002383e977920sm1716203wrw.110.2022.11.03.15.20.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 15:20:19 -0700 (PDT)
Message-ID: <71d6f856-e8f1-0874-e1d0-782e6913bc4a@gmail.com>
Date: Thu, 3 Nov 2022 23:20:18 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] staging: vt6655: change 2 variable names wFB_Opt0 and
 wFB_Opt1
Content-Language: en-US
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>,
 gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
References: <Y2Nu/i957Ill7r+d@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <Y2Nu/i957Ill7r+d@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/22 08:34, Tanjuate Brunostar wrote:
> These variables are named using Hungarian notation, which is not used
> in the Linux kernel.
> 
> Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
> ---
> 
> v3: added a detailed change log to this patch
> 
> v2: corrected errors on the subject line of this patch
> 
>   drivers/staging/vt6655/rxtx.c | 32 ++++++++++++++++----------------
>   1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
> index 9bdcf2337235..31ae99b3cb35 100644
> --- a/drivers/staging/vt6655/rxtx.c
> +++ b/drivers/staging/vt6655/rxtx.c
> @@ -59,12 +59,12 @@ static const unsigned short time_stamp_off[2][MAX_RATE] = {
>   	{384, 192, 130, 113, 54, 43, 37, 31, 28, 25, 24, 23}, /* Short Preamble */
>   };
>   
> -static const unsigned short wFB_Opt0[2][5] = {
> +static const unsigned short fb_opt0[2][5] = {
>   	{RATE_12M, RATE_18M, RATE_24M, RATE_36M, RATE_48M}, /* fallback_rate0 */
>   	{RATE_12M, RATE_12M, RATE_18M, RATE_24M, RATE_36M}, /* fallback_rate1 */
>   };
>   
> -static const unsigned short wFB_Opt1[2][5] = {
> +static const unsigned short fb_opt1[2][5] = {
>   	{RATE_12M, RATE_18M, RATE_24M, RATE_24M, RATE_36M}, /* fallback_rate0 */
>   	{RATE_6M,  RATE_6M,  RATE_12M, RATE_12M, RATE_18M}, /* fallback_rate1 */
>   };
> @@ -298,9 +298,9 @@ s_uGetDataDuration(
>   			wRate -= RATE_18M;
>   
>   			if (byFBOption == AUTO_FB_0)
> -				wRate = wFB_Opt0[FB_RATE0][wRate];
> +				wRate = fb_opt0[FB_RATE0][wRate];
>   			else
> -				wRate = wFB_Opt1[FB_RATE0][wRate];
> +				wRate = fb_opt1[FB_RATE0][wRate];
>   
>   			uNextPktTime = s_uGetTxRsvTime(pDevice, byPktType,
>   						       len, wRate, bNeedAck);
> @@ -353,52 +353,52 @@ s_uGetRTSCTSDuration(
>   	case RTSDUR_BA_F0: /* RTSDuration_ba_f0 */
>   		uCTSTime = bb_get_frame_time(pDevice->preamble_type, byPktType, 14, pDevice->byTopCCKBasicRate);
>   		if ((byFBOption == AUTO_FB_0) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
> -			uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wFB_Opt0[FB_RATE0][wRate - RATE_18M], bNeedAck);
> +			uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, fb_opt0[FB_RATE0][wRate - RATE_18M], bNeedAck);
>   		else if ((byFBOption == AUTO_FB_1) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
> -			uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wFB_Opt1[FB_RATE0][wRate - RATE_18M], bNeedAck);
> +			uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, fb_opt1[FB_RATE0][wRate - RATE_18M], bNeedAck);
>   
>   		break;
>   
>   	case RTSDUR_AA_F0: /* RTSDuration_aa_f0 */
>   		uCTSTime = bb_get_frame_time(pDevice->preamble_type, byPktType, 14, pDevice->byTopOFDMBasicRate);
>   		if ((byFBOption == AUTO_FB_0) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
> -			uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wFB_Opt0[FB_RATE0][wRate - RATE_18M], bNeedAck);
> +			uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, fb_opt0[FB_RATE0][wRate - RATE_18M], bNeedAck);
>   		else if ((byFBOption == AUTO_FB_1) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
> -			uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wFB_Opt1[FB_RATE0][wRate - RATE_18M], bNeedAck);
> +			uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, fb_opt1[FB_RATE0][wRate - RATE_18M], bNeedAck);
>   
>   		break;
>   
>   	case RTSDUR_BA_F1: /* RTSDuration_ba_f1 */
>   		uCTSTime = bb_get_frame_time(pDevice->preamble_type, byPktType, 14, pDevice->byTopCCKBasicRate);
>   		if ((byFBOption == AUTO_FB_0) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
> -			uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wFB_Opt0[FB_RATE1][wRate - RATE_18M], bNeedAck);
> +			uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, fb_opt0[FB_RATE1][wRate - RATE_18M], bNeedAck);
>   		else if ((byFBOption == AUTO_FB_1) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
> -			uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wFB_Opt1[FB_RATE1][wRate - RATE_18M], bNeedAck);
> +			uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, fb_opt1[FB_RATE1][wRate - RATE_18M], bNeedAck);
>   
>   		break;
>   
>   	case RTSDUR_AA_F1: /* RTSDuration_aa_f1 */
>   		uCTSTime = bb_get_frame_time(pDevice->preamble_type, byPktType, 14, pDevice->byTopOFDMBasicRate);
>   		if ((byFBOption == AUTO_FB_0) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
> -			uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wFB_Opt0[FB_RATE1][wRate - RATE_18M], bNeedAck);
> +			uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, fb_opt0[FB_RATE1][wRate - RATE_18M], bNeedAck);
>   		else if ((byFBOption == AUTO_FB_1) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
> -			uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wFB_Opt1[FB_RATE1][wRate - RATE_18M], bNeedAck);
> +			uDurTime = uCTSTime + 2 * pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, fb_opt1[FB_RATE1][wRate - RATE_18M], bNeedAck);
>   
>   		break;
>   
>   	case CTSDUR_BA_F0: /* CTSDuration_ba_f0 */
>   		if ((byFBOption == AUTO_FB_0) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
> -			uDurTime = pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wFB_Opt0[FB_RATE0][wRate - RATE_18M], bNeedAck);
> +			uDurTime = pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, fb_opt0[FB_RATE0][wRate - RATE_18M], bNeedAck);
>   		else if ((byFBOption == AUTO_FB_1) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
> -			uDurTime = pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wFB_Opt1[FB_RATE0][wRate - RATE_18M], bNeedAck);
> +			uDurTime = pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, fb_opt1[FB_RATE0][wRate - RATE_18M], bNeedAck);
>   
>   		break;
>   
>   	case CTSDUR_BA_F1: /* CTSDuration_ba_f1 */
>   		if ((byFBOption == AUTO_FB_0) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
> -			uDurTime = pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wFB_Opt0[FB_RATE1][wRate - RATE_18M], bNeedAck);
> +			uDurTime = pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, fb_opt0[FB_RATE1][wRate - RATE_18M], bNeedAck);
>   		else if ((byFBOption == AUTO_FB_1) && (wRate >= RATE_18M) && (wRate <= RATE_54M))
> -			uDurTime = pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, wFB_Opt1[FB_RATE1][wRate - RATE_18M], bNeedAck);
> +			uDurTime = pDevice->uSIFS + s_uGetTxRsvTime(pDevice, byPktType, cbFrameLength, fb_opt1[FB_RATE1][wRate - RATE_18M], bNeedAck);
>   
>   		break;
>   

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
