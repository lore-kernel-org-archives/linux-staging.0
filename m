Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A891BF319
	for <linux-staging@lists.linux.dev>; Fri, 30 Aug 2024 19:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725045084; cv=none; b=aNf6BONinjv6oPm/3X16W2+YC0JbEMg2EwMTi9fYrVQH5AB24laKSB0cQRR0kg5IcfOuH5DI8oRwjFEcHmIttnCJRohcdr9yGkenMFb6l7oXPRXSwMA6xtMKvpDgvjTRHROfE4DFKXZn+KwyqSr8icrOpTQN2++7+z2QNk/e37Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725045084; c=relaxed/simple;
	bh=nTTilP3oVCZy0LaSd6ZTEG07Kd7VQsLiW26jY7giLqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UuVQU3jC4tW50/PGFiMGHJc4i9DXAcolEnP/GuOU77h5AmXhUOc+yEUxM3WhJ6WFGiYBigG3/6hRqy0w9Olpyy3GT2eeYS8FE3vbocpcW9SnZlUxREajazYiTLZoyV+5XobOY0qoTbBVNnKp2j41eTCDKD6PHp9+23JVwAiuo+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQ4OxVVx; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQ4OxVVx"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a868d7f92feso257929766b.2
        for <linux-staging@lists.linux.dev>; Fri, 30 Aug 2024 12:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725045081; x=1725649881; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OkZBG3rpBRmlfDuRPWhmuH7VSYrBmmDQec7CX2pdIpg=;
        b=NQ4OxVVxX/qz+mGd//8b0mWyfz2hZxlVSOtFnul3CYQhffh0Lty95QsHpCkVqBFT/8
         OECXqXNbRpVwESb4zl5uBEkAhG3hwOmE+O5/UvzBoCTlh42/tXCeIbV7F01v9Xu5bn+8
         yX923b9mZbs22d3SxdSyGj559E9UpcPk4LDRIDBTsTqPQwFZs/hofxr2GmjPx+fzBPUR
         Vl8un95kBJkC9jgymwU4AFDfHRYJUJytO4tq9227+RIDpTc+w0p8mo4/ELLwscFlDO5P
         um7pJLylcGb4d4BLNSqhvfYWuBsnOo7J+aNWNwv6Sten84afPaP3XTvqfVyLtMlixiK9
         Gw4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725045081; x=1725649881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OkZBG3rpBRmlfDuRPWhmuH7VSYrBmmDQec7CX2pdIpg=;
        b=o1FrnFZQi17Cpo+V9vbejxs+FjfTP1QkeafW5Gv4R3YU6NlTfOWkWMMls5KjYa8aTk
         hQzbzbY7pCoLZV705rDwD94d6DcyjDR/Sjdjp5vt4InJkhG6irqP34Cw/owUDv4d3Mza
         vsY0GYj9Swutbm271WKxg3QO8yh5Pn6Noch9eDr+U29501k1zmrkxSgegSzIeBJafDW8
         BcFa8h8Mlx16vCY7wxtgcUAXYa1ZdjrwDdBEi9uvfbmYAIeq9FVbrmC6CH11UntHbxLl
         lSgNXCMNOjuIq/2MxuQmKDS4a1R0jTLytN8ZQmjLeY1raJ34REfH4UIRug+Sx8BuAYiF
         VCRQ==
X-Gm-Message-State: AOJu0YyG5+UYJocUZUda6mzOwAfd4U1K0Y9VpSu1eF8djEX/NwWhpjzp
	HOKDipvUhSl0dnDusbhIeKp/IA8KLWaPoI2XnabGj6amzkWmykAm
X-Google-Smtp-Source: AGHT+IH5pjZ9hybiZdbfPomfDdLM2BZXeH0wztRXDN3lR1j9bQ7w2wpl76IsnqRrFuNaYyZw+bZzKg==
X-Received: by 2002:a17:907:d8c:b0:a86:8863:2bf0 with SMTP id a640c23a62f3a-a897fa74f73mr645436266b.48.1725045080837;
        Fri, 30 Aug 2024 12:11:20 -0700 (PDT)
Received: from [192.168.0.104] (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988fef4c3sm242445066b.32.2024.08.30.12.11.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 12:11:20 -0700 (PDT)
Message-ID: <252c48f2-37f4-4a55-845f-8fa0a046a31a@gmail.com>
Date: Fri, 30 Aug 2024 21:11:19 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] Staging: rtl8192e: Rename variable pNetwork
To: Tree Davies <tdavies@darkphysics.net>, gregkh@linuxfoundation.org,
 anjan@momi.ca
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240830020508.532945-1-tdavies@darkphysics.net>
 <20240830020508.532945-2-tdavies@darkphysics.net>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240830020508.532945-2-tdavies@darkphysics.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/30/24 04:05, Tree Davies wrote:
> Rename variable pNetwork to network
> to fix checkpatch warning Avoid CamelCase.
> 
> Signed-off-by: Tree Davies <tdavies@darkphysics.net>
> ---
>   drivers/staging/rtl8192e/rtl819x_HTProc.c | 34 +++++++++++------------
>   drivers/staging/rtl8192e/rtllib.h         |  4 +--
>   2 files changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> index dfdb7a7dc14f..188e1fd9554d 100644
> --- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
> +++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> @@ -559,7 +559,7 @@ void ht_initialize_bss_desc(struct bss_ht *bss_ht)
>   }
>   
>   void ht_reset_self_and_save_peer_setting(struct rtllib_device *ieee,
> -				   struct rtllib_network *pNetwork)
> +				   struct rtllib_network *network)
>   {
>   	struct rt_hi_throughput *ht_info = ieee->ht_info;
>   	u8	bIOTAction = 0;
> @@ -567,32 +567,32 @@ void ht_reset_self_and_save_peer_setting(struct rtllib_device *ieee,
>   	/* unmark enable_ht flag here is the same reason why unmarked in
>   	 * function rtllib_softmac_new_net. WB 2008.09.10
>   	 */
> -	if (pNetwork->bssht.bd_support_ht) {
> +	if (network->bssht.bd_support_ht) {
>   		ht_info->current_ht_support = true;
> -		ht_info->peer_ht_spec_ver = pNetwork->bssht.bd_ht_spec_ver;
> +		ht_info->peer_ht_spec_ver = network->bssht.bd_ht_spec_ver;
>   
> -		if (pNetwork->bssht.bd_ht_cap_len > 0 &&
> -		    pNetwork->bssht.bd_ht_cap_len <= sizeof(ht_info->peer_ht_cap_buf))
> +		if (network->bssht.bd_ht_cap_len > 0 &&
> +		    network->bssht.bd_ht_cap_len <= sizeof(ht_info->peer_ht_cap_buf))
>   			memcpy(ht_info->peer_ht_cap_buf,
> -			       pNetwork->bssht.bd_ht_cap_buf,
> -			       pNetwork->bssht.bd_ht_cap_len);
> +			       network->bssht.bd_ht_cap_buf,
> +			       network->bssht.bd_ht_cap_len);
>   
> -		if (pNetwork->bssht.bd_ht_info_len > 0 &&
> -		    pNetwork->bssht.bd_ht_info_len <=
> +		if (network->bssht.bd_ht_info_len > 0 &&
> +		    network->bssht.bd_ht_info_len <=
>   		    sizeof(ht_info->peer_ht_info_buf))
>   			memcpy(ht_info->peer_ht_info_buf,
> -			       pNetwork->bssht.bd_ht_info_buf,
> -			       pNetwork->bssht.bd_ht_info_len);
> +			       network->bssht.bd_ht_info_buf,
> +			       network->bssht.bd_ht_info_len);
>   
>   		ht_info->current_rt2rt_aggregation =
> -			 pNetwork->bssht.bd_rt2rt_aggregation;
> +			 network->bssht.bd_rt2rt_aggregation;
>   		ht_info->current_rt2rt_long_slot_time =
> -			 pNetwork->bssht.bd_rt2rt_long_slot_time;
> +			 network->bssht.bd_rt2rt_long_slot_time;
>   
>   		ht_iot_peer_determine(ieee);
>   
>   		ht_info->iot_action = 0;
> -		bIOTAction = ht_iot_act_is_mgnt_use_cck_6m(ieee, pNetwork);
> +		bIOTAction = ht_iot_act_is_mgnt_use_cck_6m(ieee, network);
>   		if (bIOTAction)
>   			ht_info->iot_action |= HT_IOT_ACT_MGNT_USE_CCK_6M;
>   		bIOTAction = ht_iot_act_is_ccd_fsync(ieee);
> @@ -609,14 +609,14 @@ void ht_reset_self_and_save_peer_setting(struct rtllib_device *ieee,
>   }
>   
>   void HT_update_self_and_peer_setting(struct rtllib_device *ieee,
> -				     struct rtllib_network *pNetwork)
> +				     struct rtllib_network *network)
>   {
>   	struct rt_hi_throughput *ht_info = ieee->ht_info;
>   	struct ht_info_ele *pPeerHTInfo =
> -		 (struct ht_info_ele *)pNetwork->bssht.bd_ht_info_buf;
> +		 (struct ht_info_ele *)network->bssht.bd_ht_info_buf;
>   
>   	if (ht_info->current_ht_support) {
> -		if (pNetwork->bssht.bd_ht_info_len != 0)
> +		if (network->bssht.bd_ht_info_len != 0)
>   			ht_info->current_op_mode = pPeerHTInfo->opt_mode;
>   	}
>   }
> diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
> index 7a1a68317a49..82fef04e5784 100644
> --- a/drivers/staging/rtl8192e/rtllib.h
> +++ b/drivers/staging/rtl8192e/rtllib.h
> @@ -1733,9 +1733,9 @@ void ht_on_assoc_rsp(struct rtllib_device *ieee);
>   void ht_initialize_ht_info(struct rtllib_device *ieee);
>   void ht_initialize_bss_desc(struct bss_ht *bss_ht);
>   void ht_reset_self_and_save_peer_setting(struct rtllib_device *ieee,
> -				   struct rtllib_network *pNetwork);
> +				   struct rtllib_network *network);
>   void HT_update_self_and_peer_setting(struct rtllib_device *ieee,
> -				     struct rtllib_network *pNetwork);
> +				     struct rtllib_network *network);
>   u8 ht_get_highest_mcs_rate(struct rtllib_device *ieee, u8 *pMCSRateSet,
>   		       u8 *pMCSFilter);
>   extern u8 MCS_FILTER_ALL[];

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>

