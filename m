Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0C82DA768
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 07:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775029138; cv=none; b=qVTapnKe8MScqALjeGVovWGegeBgax+yjscyhUUtv0smH30SSgyp4ZGbrnFJoITfua8CpEp6zTETnDxR6Hjg1Wt1JrdFWW8S8FsrLx/ah6zLD358PEMdSZpyU4mWLV6Ufu2G1tlWUCRwZwPCny++AYLVBdJLOfMwHjVT7Swhy/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775029138; c=relaxed/simple;
	bh=H9TEuiJB7UYgf4s2VZRBm/geMslyyE1XUZxYn6x2doM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZouyahylaJgPU7JICZCPCIgC69TEdO2hWKQcivkvKv1WHT/3H77QyRNU/SezoPIqrxtd6fUbrrC3Hy8VBHi1t6EvW9ExNs2gEooWsEzdxZrQKXZ6jSBBndKrj+bxiYd3ARy9XulClHDSa6z1A/L1AUKWbRU7pRSvhybVO6zzrGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tHCc2+K9; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tHCc2+K9"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-43d03db7f87so1491076f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 00:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775029135; x=1775633935; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0hng9RR5CeR54tq0f6tFpdO96x26vuGH7IA9lqNqowU=;
        b=tHCc2+K9NdZN6A/rgZveCViLnC5EmfilSCw5n+64uLYiJ7LjRboB0dmOf3p5Nk9wXn
         m/pxCp9klmvztp46fagjxSlvzfkru8P+Xx8KwFFkdeduvu7MyhDKg/woudNflpDUDRys
         oifn4bs8UdCawNjeOr6GFfYnt8QKsOk0/LgMScB9J0Ti6NTQQfKPiigBOxW9K+dOFaZE
         cnIVtSMvZsDKd0HbyyyV4aDMCKfNGttUG8Y4Qw9FS1vxn88kq25PF9xWhTskzbey1W0S
         MAkjPCWJuyXqQ1OFxedUFx/fOULl5p+vZ6TnMWSbpgFrExk+dAotSkpE7UWNTfpGI+EV
         FMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775029135; x=1775633935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0hng9RR5CeR54tq0f6tFpdO96x26vuGH7IA9lqNqowU=;
        b=H/hr6VjYKAY8pKV8RVv5ioNPgNSwwykZx6Ofjd5gEm/oJ0vuR96V5+X8EV+dI56Id5
         XIeU2u1VduTxvDv0LZlHJ9asHTUavzLTfEjjOksFSZ0/rSzCetMXR/qLeFHRzMIWUt4S
         UG78/sl7O2/GlufuG1GNruSYvu7X3HljXhxvhrtrwDUlSsyvGiefBhejsB1OgeufvQLm
         fXCL3uhZmzx9UPf8/iwiZkAASv9GVzSZjeP0VDbnLxxxQKI3CZ3+x7Ia7viESxU/ptQS
         2kFr1hPezWc/ZaP/MsT23xS/mCVE99kjekSQ/NGHEpxJN8KafLbpJeNZ2kwSvymiMv7O
         TrdA==
X-Forwarded-Encrypted: i=1; AJvYcCXsyUCk/8KOeMAV1xocEfWfypBPi8qaXxPZmh2uwRdSNXFegpi9yx3/IeBPRX/ArVvmzV5Rt6cLwXFzKTZ2@lists.linux.dev
X-Gm-Message-State: AOJu0YyPMlsqqO16j8HXiFgC1Fjw24/RTAKtBks7XXDD79nKfQAmwjzi
	rguwk9l7k5a8D6+cNrE73ohuKCjIzCOr8DiNFox5hm/ed9VdenJ5oZ7ERIgX/tb2
X-Gm-Gg: ATEYQzwIDsP25jzhQUhEVmFXtsm/7HV8EzKkFwiFF39BUUQ1jtfylenjOq9fYtHJXnO
	aPsuNHz+00egdwdhTYaioPqnOaxCbvzc4DZ5W2UZtMToUYO66TnehftPexYyX/sjOEY0Du87KGk
	v7npwKBlugjBLTCajEMfo4sPNed86GFaofAOl5Gc+13m+7X2UUKZhqDhOYO3SVvBg966theFNjQ
	PP9k8dlVKiUIBN6rDJSfZ8eQSzeSgpqTw9o3ZI9OfnUMmfBt6rgR+0dobJw7lezgaUCLNNQrek6
	o9QWk59dDTAHqJQOaZaZw+xEzDeY8VtWxW4Xt073HANvpyQU3w6+4APCNk+Z/31ChF5ft7SiQAy
	XAvtxtGmgQJukVh4QzbT4buiKUIpj/47Q4xmxHiPVV1KaVLGd3zKGGbLiORBu04dHTVcHw+W/Ox
	QiQ+NGa5RNfyJPVxJyd6je
X-Received: by 2002:a05:6000:40e0:b0:43b:48d3:2a46 with SMTP id ffacd0b85a97d-43d150d1046mr4353633f8f.33.1775029135015;
        Wed, 01 Apr 2026 00:38:55 -0700 (PDT)
Received: from bera-arch ([2a02:ff0:c13:2eeb:2e7c:3a4f:2bc2:f78a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e2a7asm36146685f8f.7.2026.04.01.00.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 00:38:54 -0700 (PDT)
From: =?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
To: tommyguo039@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v1] staging: rtl8723bs: remove GEN_CMD_CODE macro and callback array
Date: Wed,  1 Apr 2026 10:38:53 +0300
Message-ID: <20260401073853.15275-1-b9788213@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401000818.51141-1-tommyguo039@gmail.com>
References: <20260401000818.51141-1-tommyguo039@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 31 Mar 2026 20:08:18 -0400, Xiyuan Guo wrote:
> The GEN_CMD_CODE macro and the rtw_cmd_callback function pointer array
> add unnecessary layers of indirection and make the code difficult to
> follow.
> 
> Remove the GEN_CMD_CODE macro and replace the function pointer array
> dispatcher in rtw_cmd_thread() with a switch statement.
> 
> Signed-off-by: Xiyuan Guo <tommyguo039@gmail.com>
> ---

Can't compile it :( Please compile driver with
'make M=drivers/staging/rtl8723bs' before sending your patch.

>  		/* call callback function for post-processed */
> -		if (pcmd->cmdcode < ARRAY_SIZE(rtw_cmd_callback)) {
> -			pcmd_callback = rtw_cmd_callback[pcmd->cmdcode].callback;
> -			if (!pcmd_callback) {
> -				rtw_free_cmd_obj(pcmd);
> -			} else {
> -				/* todo: !!! fill rsp_buf to pcmd->rsp if (pcmd->rsp!= NULL) */
> -				pcmd_callback(pcmd->padapter, pcmd);/* need consider that free cmd_obj in rtw_cmd_callback */
> -			}
> -		} else {
> +		switch (pcmd->cmdcode) {
> +		case _Read_BBREG:
> +		case _Read_RFREG:
> +			rtw_getbbrfreg_cmdrsp_callback(padapter, pcmd);
> +			break;
> +		case _JoinBss:
> +			rtw_joinbss_cmd_callback(padapter, pcmd);
> +			break;
> +		case _DisConnect:
> +			rtw_disassoc_cmd_callback(padapter, pcmd);
> +			break;
> +		case _CreateBss:
> +			rtw_createbss_cmd_callback(padapter, pcmd);
> +			break;
> +		case _SiteSurvey:
> +			rtw_survey_cmd_callback(padapter, pcmd);
> +			break;
> +		case _SetStaKey:
> +			rtw_setstaKey_cmdrsp_callback(padapter, pcmd);
> +			break;
> +		case _SetAssocSta:
> +			rtw_setassocsta_cmdrsp_callback(padapter, pcmd);
> +			break;
> +		default:
>  			rtw_free_cmd_obj(pcmd);
> +			break;
>  		}
>  		flush_signals_thread();
>  		goto _next;

You are deleting a TODO here.

> +	_Read_MACREG,	/*0*/
> +	_Write_MACREG,
> +	_Read_BBREG,
> +	_Write_BBREG,
> +	_Read_RFREG,
> +	_Write_RFREG, /*5*/
> +	_Read_EEPROM,
> +	_Write_EEPROM,
> +	_Read_EFUSE,
> +	_Write_EFUSE,
> +
> +	_Read_CAM,	/*10*/
> +	_Write_CAM,
> +	_setBCNITV,
> +	_setMBIDCFG,
> +	_JoinBss,   /*14*/
> +	_DisConnect, /*15*/
> +	_CreateBss,
> +	_SetOpMode,
> +	_SiteSurvey,  /*18*/
> +	_SetAuth,
> +
> +	_SetKey,	/*20*/
> +	_SetStaKey,
> +	_SetAssocSta,
> +	_DelAssocSta,
> +	_SetStaPwrState,
> +	_SetBasicRate, /*25*/
> +	_GetBasicRate,
> +	_SetDataRate,
> +	_GetDataRate,
> +	_SetPhyInfo,
> +
> +	_GetPhyInfo,	/*30*/
> +	_SetPhy,
> +	_GetPhy,
> +	_readRssi,
> +	_readGain,
> +	_SetAtim, /*35*/
> +	_SetPwrMode,
> +	_JoinbssRpt,
> +	_SetRaTable,
> +	_GetRaTable,
> +
> +	_GetCCXReport, /*40*/
> +	_GetDTMReport,
> +	_GetTXRateStatistics,
> +	_SetUsbSuspend,
> +	_SetH2cLbk,
> +	_AddBAReq, /*45*/
> +	_SetChannel, /*46*/
> +	_SetTxPower,
> +	_SwitchAntenna,
> +	_SetCrystalCap,
> +	_SetSingleCarrierTx, /*50*/
> +
> +	_SetSingleToneTx,/*51*/
> +	_SetCarrierSuppressionTx,
> +	_SetContinuousTx,
> +	_SwitchBandwidth, /*54*/
> +	_TX_Beacon, /*55*/
> +
> +	_Set_MLME_EVT, /*56*/
> +	_Set_Drv_Extra, /*57*/
> +	_Set_H2C_MSG, /*58*/
> +
> +	_SetChannelPlan, /*59*/
> +
> +	_SetChannelSwitch, /*60*/
> +	_TDLS, /*61*/
> +	_ChkBMCSleepq, /*62*/
> +
> +	_RunInThreadCMD, /*63*/ 

Why not use snake case instead?

Thanks,
Bera
