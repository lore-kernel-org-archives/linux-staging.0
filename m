Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913FB14B960
	for <linux-staging@lists.linux.dev>; Sat, 21 Sep 2024 13:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726926706; cv=none; b=fsYhCOlHH8Dsm5gqIFDTtAn9sfcFBnXD5RSHGxlgQ8sDcefxkbYv5OdLL1hr2D4VkqVagEFxOBI0myOIERfpPuV7IaC2Jt4ScfoHiIr+ZuIokRaq6uJnfc93hMX0ufrSUAtpI4bAE40L3BQxgaqFjuF/SFJynD4W3LEHKnYCllw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726926706; c=relaxed/simple;
	bh=6nI3Dz3gIFEVc72j50dXce4137Z5MixftS/Z5i0v970=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JNx5BgUaOR5Q8ofQeM1MHxchh75c1TCr9j7C6sBDHngorTnw2LFHbajQXse3B4p3NW86yXDfZ39x6ab2qaMHp575tY1ooN4I+yoAO1I4egn2h8nWFOAokUaZfZs18QoqA8lHflLtAep1n46IiURp2pooAGD0AP4H67LjdqX8ZBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RbZoRkj6; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RbZoRkj6"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c3ed267a7bso3352540a12.3
        for <linux-staging@lists.linux.dev>; Sat, 21 Sep 2024 06:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726926703; x=1727531503; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0MFL6BailCJB3061a8fsY3OzkrReKVjvVUW19uyfz2E=;
        b=RbZoRkj6p4Bj5JaAdIbsaKSVIs6GY8OhahdZlmtE3XUeNWUPNqHkfMOypKDzr8FN8B
         ZS2XkHf7LLtSddc3MX3DGpttpqO03n5ouRBMoqV8oob1J3UDGlp/RNC4DNsyxEodiwek
         DD7SSgUnXBn8cUKLxOIm7RGnJBHrdzHGIiPRY9JzQJpNmPG4r65PUKJZGh0cVCgmtUU4
         WhGNU39JUQTKFikjbFWt5BT0Q96wv2NRs+6ttAjCuPNUSDh7wO2b9WbI6pJ+5RHtMDOS
         mVGOeW95IRsBoGLlp6pLYsBYfuaMwHBWjQqnA8JcbuMmwUrypGu1EYYBNJq+0Gu+Xmyl
         CUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726926703; x=1727531503;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0MFL6BailCJB3061a8fsY3OzkrReKVjvVUW19uyfz2E=;
        b=H9szpnMRjxTP7M5pZm6zP60YDOfNMlgN5usAEQw/GkZvDiVgrAZaLlOExw63jfL5Ko
         aP0gdCQPNjJ4yTTmQNkBdlIsLsL5ea/dpqZGFj2Q493XL6Ehy3e/uJfHiGSRPV0zYNk8
         DgirjlqHNXZ3v4X7TUD62mBY1jwGv+D3SaPIeLvQiT0yFbSNi6LwEDX/qyX5pJK8kXRW
         iuGjmSxkBYGB8v1YiF5cmcsWUH7ninV1pgtcJMzix23d2vLB7lCcRw6MpnEl+G0FLORu
         hdFECeanYJTyVXXVKSMXQQmr1Fs9oio2aPKQFzEw+tovNdrAgXRxE7BYWJVRTkx+Ep9K
         e3VA==
X-Gm-Message-State: AOJu0YyQyHWsqsd7vd6xVaFgbiIUgIH68jWYV/9ytx26Z3NwQA5ZYoFy
	eVPgIARhkSBmoHsjLG8g4EoFQlpV6kETUo9Z7XDtY7S7rNf6ph55
X-Google-Smtp-Source: AGHT+IGTNIq/QmYS7w8UykA2MiPqJw15goy+S/ZQArhH1a3LM7SDHLzMd8LYMunf7YgDHCp+EOPgrQ==
X-Received: by 2002:a17:907:e20b:b0:a86:7b01:7dcc with SMTP id a640c23a62f3a-a90d4fe6f35mr525311566b.18.1726926702514;
        Sat, 21 Sep 2024 06:51:42 -0700 (PDT)
Received: from [192.168.0.105] (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a906109676esm976883366b.33.2024.09.21.06.51.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Sep 2024 06:51:42 -0700 (PDT)
Message-ID: <3fc0202a-d0b7-479f-8528-fed30e0e458c@gmail.com>
Date: Sat, 21 Sep 2024 15:51:41 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] staging: rtl8192e: rtllib_rx.c: Fix alignment to
 open parentheses
To: =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@protonmail.com>, gregkh@linuxfoundation.org,
 tdavies@darkphysics.net, dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240920193356.32156-1-dominik.karol.piatkowski@protonmail.com>
 <20240920193356.32156-4-dominik.karol.piatkowski@protonmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240920193356.32156-4-dominik.karol.piatkowski@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/20/24 21:36, Dominik Karol Piątkowski wrote:
> This patch aligns the code to open parentheses to improve readability.
> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@protonmail.com>
> ---
>   drivers/staging/rtl8192e/rtllib_rx.c | 91 +++++++++++++---------------
>   1 file changed, 42 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
> index 8fe224a83dd6..e58be8e07917 100644
> --- a/drivers/staging/rtl8192e/rtllib_rx.c
> +++ b/drivers/staging/rtl8192e/rtllib_rx.c
> @@ -409,12 +409,10 @@ static bool add_reorder_entry(struct rx_ts_record *ts,
>   
>   	while (list->next != &ts->rx_pending_pkt_list) {
>   		if (SN_LESS(reorder_entry->seq_num, ((struct rx_reorder_entry *)
> -		    list_entry(list->next, struct rx_reorder_entry,
> -		    list))->seq_num))
> +		    list_entry(list->next, struct rx_reorder_entry, list))->seq_num))
>   			list = list->next;
> -		else if (SN_EQUAL(reorder_entry->seq_num,
> -			((struct rx_reorder_entry *)list_entry(list->next,
> -			struct rx_reorder_entry, list))->seq_num))
> +		else if (SN_EQUAL(reorder_entry->seq_num, ((struct rx_reorder_entry *)
> +			 list_entry(list->next, struct rx_reorder_entry, list))->seq_num))
>   			return false;


Hi Domenik,

I hope to not stress you beyond limits.

Thanks for deviding the patch. I can apply it now to my repo.
First two patches are looking good.

I prefer to have a comma at the end of the line. This line does not 
increase readablility to me.

((struct rx_reorder_entry *)
list_entry(list->next, struct rx_reorder_entry, list))->seq_num))

Sometimes it is better to change less.

The change does not perfectly fit to the description: There you say 
...aligns the code to open parentheses... but you do not need to remove 
line breaks or shorten code to achieve this.

Smaller patches lead to an earlier acceptance. This typically leads to 
more confidence at the beginning for newbies. There is no question about 
that you know what you are doing. But there are some corners where the 
kernel is special.

Find more below.


> ...
> @@ -876,9 +874,9 @@ static int rtllib_rx_check_duplicate(struct rtllib_device *ieee,
>   	frag = WLAN_GET_SEQ_FRAG(sc);
>   
>   	if (!ieee->ht_info->cur_rx_reorder_enable ||
> -		!ieee->current_network.qos_data.active ||
> -		!is_data_frame(skb->data) ||
> -		is_legacy_data_frame(skb->data)) {
> +	    !ieee->current_network.qos_data.active ||
> +	    !is_data_frame(skb->data) ||
> +	    is_legacy_data_frame(skb->data)) {
>   		if (!ieee80211_is_beacon(hdr->frame_control)) {
>   			if (is_duplicate_packet(ieee, hdr))
>   				return -1;
> @@ -887,7 +885,7 @@ static int rtllib_rx_check_duplicate(struct rtllib_device *ieee,
>   		struct rx_ts_record *ts = NULL;
>   
>   		if (rtllib_get_ts(ieee, (struct ts_common_info **)&ts, hdr->addr2,
> -			(u8)frame_qos_tid((u8 *)(skb->data)), RX_DIR, true)) {
> +				  (u8)frame_qos_tid((u8 *)(skb->data)), RX_DIR, true)) {

I am understanding the logic behind this but I cannot really say that 
this increases the readability. It increases the readability of the if 
condition but I am losing readability of the overall code and it 
increases the issue with the too long lines.

I have not looked into the remaining patches.

I need some support from another reviewer.

Your patches are working fine on hardware.

Bye Philipp

>   			if ((fc & (1 << 11)) && (frag == ts->rx_last_frag_num) &&
>   			    (WLAN_GET_SEQ_SEQ(sc) == ts->rx_last_seq_num))
>   				return -1;
