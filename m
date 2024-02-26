Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CB013EFE9
	for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 16:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708966760; cv=none; b=qQGH4BHqJ82x0g0KbPnR/JvfQmbSN0PqwNjbYP75vevwnlFyc8NNmE/uLiTjL4fiBzdgr8/OlTNzwGhVz31ULrkf57bK/8bt2rvFiglAhAign2U7F0VJNfjfKkFwLbS48Ve+Cr6BCpflbUQ+1W5sOKgXIuC6lpuRh9LRMttMtIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708966760; c=relaxed/simple;
	bh=Er5kYmOwbzt4vnhThP5tnUWt8owS9wSl1gKtGt0Oo4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ifJ+rOu56KENjB+KmHS24eBZ8PCviHDav2dnT823sVYxJUBn9XnI6gr0J4Mq4SoHODpTJSTID61ZKI1TuwiiMFfZQnDD6h9XDEv197PdNbR2R+TNPQ71bK1MccMuTlUPXT7arfXHLlACw5wDPfKX3c8moOUgRkro3mdgZ1SXEsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cNJa9J4i; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cNJa9J4i"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-33d90b322b0so863561f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 08:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708966757; x=1709571557; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eptKKzttKp+WY9FQ4xCv+8P8GHnHxpcwbYYbruZKAew=;
        b=cNJa9J4ihH1Rkhbqsqim9WFDfpZZrforRVkvCgLfr30UjlqZiVx9dO7MhkfUIW6sjd
         u06n18NvCdjPfhQprYv+WkgcOHN4Qp3hqwpI+HxeJDed9pSOsj+vwKKaCJGrcXkgaF1E
         ifDTUIw+wPD3GKcSn0aCDeiPwlHVWX7S9Wr0Xt1F/5e2DR5OBzqRufATzqMgdMrryO8d
         VdJgjm9JqYXfLd6y/yKJeCFU2BbW5dBcNAWKTm/DYWHXTZ2Cg3dWIYUzp9Ly8Vfw9vvF
         nNHT6lVOen3xxjde64NhFe0DueGz6K4qhxf8zD150ntw6PBJmdP5uPWk0gLYiRysc2Jv
         pVuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708966757; x=1709571557;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eptKKzttKp+WY9FQ4xCv+8P8GHnHxpcwbYYbruZKAew=;
        b=YyFUcWC5OFEz/T9ljvUlSfusTQVyHe+bcsxoMzKjx6cxHys6FQmRCfDBSIXkTWdsr0
         fnBudrkYXc00a717WGrXrLoRVh1oS7mRg+V1lBKRqVliLJmcDKxnLSSxpRWE4SCfHmc/
         XbjgtWPFSJxT1YFhlswzbq6CtXOeseRoctpTqtGXlq4WddtMRQ7x3n1W0XgEk9zFoKmu
         OkgpfK6+rHXM8RnPR63VPUrjIYkp8EUeavPW6roWJLvLZTIoWdSQhdWSFBRs/J1TG7zO
         vCV0WJDgSF5hf2ICxybt/hqbCf/uXONESMWdagDnrM6Y7IC+jrbzMfxf/nZ4CrWb6jIO
         npGg==
X-Gm-Message-State: AOJu0YzsNCCKMc6NTdhM+6zSsk78B3htNyPz3gzBh4r6w4o++35h7xfr
	B7NYP/9+QJd9glUATwhFp8oDO1Edg2LOsTInOWo51AJFVoVTppL2upxemElBcgA=
X-Google-Smtp-Source: AGHT+IHxRmyFfLI5Nxsic5nNOcezskF5ApgJeljJNXcoAx4s/4UwsRLvaSZxfN1YaExD612ZVRPu+Q==
X-Received: by 2002:a05:6000:1e09:b0:33c:fa05:68b with SMTP id bj9-20020a0560001e0900b0033cfa05068bmr5217307wrb.0.1708966756773;
        Mon, 26 Feb 2024 08:59:16 -0800 (PST)
Received: from [192.168.0.104] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id by15-20020a056000098f00b0033da933b250sm8942363wrb.5.2024.02.26.08.59.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 08:59:16 -0800 (PST)
Message-ID: <236c7275-c8db-4ed8-9568-dd21c5834fc9@gmail.com>
Date: Mon, 26 Feb 2024 17:59:15 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/20] Staging: rtl8192e: Rename function
 rtllib_rx_ADDBAReq()
Content-Language: en-US
To: Tree Davies <tdavies@darkphysics.net>, gregkh@linuxfoundation.org,
 anjan@momi.ca
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240226035624.370443-1-tdavies@darkphysics.net>
 <20240226035624.370443-2-tdavies@darkphysics.net>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240226035624.370443-2-tdavies@darkphysics.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/26/24 04:56, Tree Davies wrote:
> Rename function rtllib_rx_ADDBAReq to rtllib_rx_add_ba_req to fix checkpatch
> warning Avoid CamelCase.
> 
WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit 
description?)
#7:
Rename function rtllib_rx_ADDBAReq to rtllib_rx_add_ba_req to fix checkpatch
> Signed-off-by: Tree Davies <tdavies@darkphysics.net>
> ---
>   drivers/staging/rtl8192e/rtl819x_BAProc.c | 2 +-
>   drivers/staging/rtl8192e/rtllib.h         | 2 +-
>   drivers/staging/rtl8192e/rtllib_softmac.c | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
> index da7319c124e7..bd1d86e0323d 100644
> --- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
> +++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
> @@ -211,7 +211,7 @@ static void rtllib_send_DELBA(struct rtllib_device *ieee, u8 *dst,
>   		netdev_dbg(ieee->dev, "Failed to generate DELBA packet.\n");
>   }
>   
> -int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb)
> +int rtllib_rx_add_ba_req(struct rtllib_device *ieee, struct sk_buff *skb)
>   {
>   	struct ieee80211_hdr_3addr *req = NULL;
>   	u16 rc = 0;
> diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
> index 348644998744..95a8e9416f61 100644
> --- a/drivers/staging/rtl8192e/rtllib.h
> +++ b/drivers/staging/rtl8192e/rtllib.h
> @@ -1771,7 +1771,7 @@ u8 ht_c_check(struct rtllib_device *ieee, u8 *pFrame);
>   void ht_reset_iot_setting(struct rt_hi_throughput *ht_info);
>   bool is_ht_half_nmode_aps(struct rtllib_device *ieee);
>   u16  tx_count_to_data_rate(struct rtllib_device *ieee, u8 nDataRate);
> -int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb);
> +int rtllib_rx_add_ba_req(struct rtllib_device *ieee, struct sk_buff *skb);
>   int rtllib_rx_add_ba_rsp(struct rtllib_device *ieee, struct sk_buff *skb);
>   int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb);
>   void rtllib_ts_init_add_ba(struct rtllib_device *ieee, struct tx_ts_record *ts,
> diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
> index 2545ac8963c4..f12ee685e989 100644
> --- a/drivers/staging/rtl8192e/rtllib_softmac.c
> +++ b/drivers/staging/rtl8192e/rtllib_softmac.c
> @@ -1551,7 +1551,7 @@ static void rtllib_process_action(struct rtllib_device *ieee,
>   	case ACT_CAT_BA:
>   		switch (*act) {
>   		case ACT_ADDBAREQ:
> -			rtllib_rx_ADDBAReq(ieee, skb);
> +			rtllib_rx_add_ba_req(ieee, skb);
>   			break;
>   		case ACT_ADDBARSP:
>   			rtllib_rx_add_ba_rsp(ieee, skb);

