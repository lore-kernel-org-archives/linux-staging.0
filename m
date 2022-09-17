Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8E439B
	for <linux-staging@lists.linux.dev>; Sat, 17 Sep 2022 19:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663443549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pn+iLPOX92b5x8QXcBf6zM8CJkq15W50QIZ7ofVQySI=;
	b=MXEt3yrmXxuEyKwj0jCxmJy1cnRjUAiAmbt8xokd3XaT38lqncXyKH5wLqtkCPSnWAAECt
	bGm5dhyT96drAQ8pySFHZn4jqh/FA75/3uoMc1E6GjD/KNC2S1eomIp++JaOfkL6C7MiF0
	SWM44/uMfyBbOz6CJWJEKAAZKMf80AE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-378-OvWoHN7FMESpnUVV4ut4Gw-1; Sat, 17 Sep 2022 15:39:02 -0400
X-MC-Unique: OvWoHN7FMESpnUVV4ut4Gw-1
Received: by mail-ed1-f71.google.com with SMTP id w20-20020a05640234d400b00450f24c8ca6so17272908edc.13
        for <linux-staging@lists.linux.dev>; Sat, 17 Sep 2022 12:39:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=pn+iLPOX92b5x8QXcBf6zM8CJkq15W50QIZ7ofVQySI=;
        b=fcm80rGq7Psao692yPHFmpFyk4x5ZNfcT+zAVOb3X8eYmvAqciPuF2jLR1+BYgejUJ
         GPuLVhnXzyoifIg2Wo1kPfrfmAefMnrcUGnCByKF8rfs5s6ybOQTnIxRZu2/I8pOj1zF
         2q0O7kADLUwE9udWEe9KymD3BdzTeSRErV1MehJf80/Ml2ppzrOdvibj+fln87RB2jzH
         qBGsyk6Bg5aRnlXg1QpkaryCd5zhivxbQj/I0mV/AP7DKHmWp7litpE26riMP/41jXka
         vazRlg9QoZjy3mshvbQ9JKvzAjbIY8lxrhk6i4GP3UkEfpyAAMgdDBEUK42nU9jEaDYU
         44Qg==
X-Gm-Message-State: ACrzQf3zgVUiZOvRpLXLoWOjbVpwWCdoKFX8BSjO1kqrs0qLfS7T92Sl
	8fbjlAkYu5Nd2PoU9brE1D4k9vl5sDfDFLdF4ZG0JCgRWrFFykJLgsXyxUl8uhpJ0uWjtWoVU5I
	I3tIOoUjCs7ZV2xcL0oDcSUEf2Q==
X-Received: by 2002:a17:907:a049:b0:77c:1f27:1b28 with SMTP id gz9-20020a170907a04900b0077c1f271b28mr8125403ejc.20.1663443541367;
        Sat, 17 Sep 2022 12:39:01 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6nm3DKzCudD7urgfuCW5ZPmx6NzwELOaO85/nt28Ojofl73dxdJEuexl8Sr73Fon0uyzMz+A==
X-Received: by 2002:a17:907:a049:b0:77c:1f27:1b28 with SMTP id gz9-20020a170907a04900b0077c1f271b28mr8125396ejc.20.1663443541199;
        Sat, 17 Sep 2022 12:39:01 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id j1-20020a170906094100b0076f1d939128sm10008877ejd.54.2022.09.17.12.39.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Sep 2022 12:39:00 -0700 (PDT)
Message-ID: <516a1ca5-a26c-c8d7-918e-d433852db2ae@redhat.com>
Date: Sat, 17 Sep 2022 21:39:00 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 2/2] staging: rtl8723bs: Insert blank line after
 declarations
To: Kang Minchul <tegongkang@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Fabio Aiuto <fabioaiuto83@gmail.com>, Kees Cook <keescook@chromium.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220917181620.3237192-1-tegongkang@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220917181620.3237192-1-tegongkang@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/17/22 20:16, Kang Minchul wrote:
> This patch fixes checkpatch warning as follows:
> 
>   WARNING: Missing a blank line after declarations
> 
> Signed-off-by: Kang Minchul <tegongkang@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/staging/rtl8723bs/core/rtw_recv.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> index ad6fb6c3d1f0..dade4d07662b 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> @@ -245,6 +245,7 @@ u32 rtw_free_uc_swdec_pending_queue(struct adapter *adapter)
>  {
>  	u32 cnt = 0;
>  	union recv_frame *pending_frame;
> +
>  	while ((pending_frame = rtw_alloc_recvframe(&adapter->recvpriv.uc_swdec_pending_queue))) {
>  		rtw_free_recvframe(pending_frame, &adapter->recvpriv.free_recv_queue);
>  		cnt++;
> @@ -397,6 +398,7 @@ static union recv_frame *decryptor(struct adapter *padapter, union recv_frame *p
>  
>  	if (prxattrib->encrypt > 0) {
>  		u8 *iv = precv_frame->u.hdr.rx_data+prxattrib->hdrlen;
> +
>  		prxattrib->key_index = (((iv[3])>>6)&0x3);
>  
>  		if (prxattrib->key_index > WEP_KEYS) {
> @@ -882,6 +884,7 @@ static signed int sta2ap_data_frame(struct adapter *adapter, union recv_frame *p
>  		}
>  	} else {
>  		u8 *myhwaddr = myid(&adapter->eeprompriv);
> +
>  		if (memcmp(pattrib->ra, myhwaddr, ETH_ALEN)) {
>  			ret = RTW_RX_HANDLED;
>  			goto exit;
> @@ -1125,6 +1128,7 @@ static union recv_frame *recvframe_chk_defrag(struct adapter *padapter, union re
>  	psta = rtw_get_stainfo(pstapriv, psta_addr);
>  	if (!psta) {
>  		u8 type = GetFrameType(pfhdr->rx_data);
> +
>  		if (type != WIFI_DATA_TYPE) {
>  			psta = rtw_get_bcmc_stainfo(padapter);
>  			pdefrag_q = &psta->sta_recvpriv.defrag_q;
> @@ -1207,6 +1211,7 @@ static signed int validate_recv_mgnt_frame(struct adapter *padapter, union recv_
>  	{
>  		/* for rx pkt statistics */
>  		struct sta_info *psta = rtw_get_stainfo(&padapter->stapriv, GetAddr2Ptr(precv_frame->u.hdr.rx_data));
> +
>  		if (psta) {
>  			psta->sta_stats.rx_mgnt_pkts++;
>  			if (GetFrameSubType(precv_frame->u.hdr.rx_data) == WIFI_BEACON)
> @@ -1480,6 +1485,7 @@ static signed int validate_recv_frame(struct adapter *adapter, union recv_frame
>  		retval = validate_recv_data_frame(adapter, precv_frame);
>  		if (retval == _FAIL) {
>  			struct recv_priv *precvpriv = &adapter->recvpriv;
> +
>  			precvpriv->rx_drop++;
>  		} else if (retval == _SUCCESS) {
>  #ifdef DBG_RX_DUMP_EAP

