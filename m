Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71A633CC
	for <linux-staging@lists.linux.dev>; Tue, 13 Sep 2022 14:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663079678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m2N4GkZE6DOg8q2OE9cORX7HuVjIsZbB1FVwWfb7vgs=;
	b=Ta8jXgmlQtW3xKPMS3O7OW2sN9GoBlEpOq0DkVg8d/f2u+PAEphbgzBs6DUUG0hN8MRU2I
	tP4kptB2iLspmr7ucWbvvsHsJr6iJfEeFqVW8MERq+BKUaSZbsqAauinvi4fpbdp1C7OZu
	SyKl+X0NeK1WgbZH/DIzf1g6pZhT+Ek=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-65-3MZjnBWdMqqN0xP97eQP3A-1; Tue, 13 Sep 2022 10:34:32 -0400
X-MC-Unique: 3MZjnBWdMqqN0xP97eQP3A-1
Received: by mail-wm1-f71.google.com with SMTP id ay21-20020a05600c1e1500b003b45fd14b53so673135wmb.1
        for <linux-staging@lists.linux.dev>; Tue, 13 Sep 2022 07:34:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=m2N4GkZE6DOg8q2OE9cORX7HuVjIsZbB1FVwWfb7vgs=;
        b=TVBTQHu7wAYyha2oRbSXlNz8b+fv/8d2PUxQNvEcI3NMBn8O19UqFkGNHhaIJxHwgp
         LWRKmg2W8cne1+IykosEunUgTrpCCWHQY6pVB8qF7T4XiL1Co6mbIm/5MFkncXiFSBQV
         o9cTlIZZoA7OllM69lCm9LZUXfBYVHo0mZ1B8BEp3xpYQiSxPf5TX3MEryssntZRoXpj
         S9VA2rDR7NGAlIRO3lL8y3m7tErcshJ9Z3bsuAzFFP7GCKOZw+GuxaOxikivwqW/DTRg
         I4BA4WRmIRnz5PTQ+K2Wg8XrrMXQGee47qIGAW28QwMiE1bUJM1a2dru9/NhsBfC85Wr
         ziog==
X-Gm-Message-State: ACgBeo1bu5FbqBfuYceT/rnUe1duUil3yGCXua1A0drBVs9K/gem+6Ei
	2KaH+8qlGSzVxEOTMscFMaGGTY/EcuBQp08ybMdZ3l+1X9SCwh7rBFAwgRdiRxB3W5pCQoXBUVY
	Mu3Pf/CAGm6rIMU/9SIdYVIxnzw==
X-Received: by 2002:a5d:47c5:0:b0:22a:6ce9:3fbd with SMTP id o5-20020a5d47c5000000b0022a6ce93fbdmr7726368wrc.301.1663079671115;
        Tue, 13 Sep 2022 07:34:31 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4r0okXSde5UfBHKfMw3Gh+hHtK0eNhBEqHTorsh4+bA/CST5TmPWlkWnXJhrsmsM5mC0CrGA==
X-Received: by 2002:a5d:47c5:0:b0:22a:6ce9:3fbd with SMTP id o5-20020a5d47c5000000b0022a6ce93fbdmr7726345wrc.301.1663079670865;
        Tue, 13 Sep 2022 07:34:30 -0700 (PDT)
Received: from [172.16.38.152] ([185.122.133.20])
        by smtp.gmail.com with ESMTPSA id m18-20020a05600c3b1200b003b4935f04a4sm5221408wms.5.2022.09.13.07.34.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 07:34:29 -0700 (PDT)
Message-ID: <6cb85919-878a-73a5-0f2a-669d6062727b@redhat.com>
Date: Tue, 13 Sep 2022 16:34:29 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] staging: rtl8723bs: remove braces in single statement
 blocks
To: Kang Minchul <tegongkang@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev
References: <20220913130648.3116032-1-tegongkang@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220913130648.3116032-1-tegongkang@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Thank you for your patch.

This patch actually changes how the code works (se below),
so NACK to this patch.

On 9/13/22 15:06, Kang Minchul wrote:
> This commit cleans up checkpatch warning as follows:Hi,
> WARNING: braces {} are not necessary for single statement blocks
> 
> Signed-off-by: Kang Minchul <tegongkang@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_recv.c | 19 ++++++-------------
>  1 file changed, 6 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> index d8d394b67eeb..f20eba7fa471 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> @@ -1374,9 +1374,8 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
>  			/* actual management data frame body */
>  			data_len = pattrib->pkt_len - pattrib->hdrlen - pattrib->iv_len - pattrib->icv_len;
>  			mgmt_DATA = rtw_zmalloc(data_len);
> -			if (!mgmt_DATA) {
> +			if (!mgmt_DATA)
>  				goto validate_80211w_fail;
> -			}
>  			precv_frame = decryptor(adapter, precv_frame);
>  			/* save actual management data frame body */
>  			memcpy(mgmt_DATA, ptr+pattrib->hdrlen+pattrib->iv_len, data_len);
> @@ -1385,9 +1384,8 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
>  			/* remove the iv and icv length */
>  			pattrib->pkt_len = pattrib->pkt_len - pattrib->iv_len - pattrib->icv_len;
>  			kfree(mgmt_DATA);
> -			if (!precv_frame) {
> +			if (!precv_frame)
>  				goto validate_80211w_fail;
> -			}
>  		} else if (IS_MCAST(GetAddr1Ptr(ptr)) &&
>  			(subtype == WIFI_DEAUTH || subtype == WIFI_DISASSOC)) {
>  			signed int BIP_ret = _SUCCESS;
> @@ -1651,14 +1649,12 @@ static int check_indicate_seq(struct recv_reorder_ctrl *preorder_ctrl, u16 seq_n
>  	u16 wend = (preorder_ctrl->indicate_seq + wsize - 1) & 0xFFF;/*  4096; */
>  
>  	/*  Rx Reorder initialize condition. */
> -	if (preorder_ctrl->indicate_seq == 0xFFFF) {
> +	if (preorder_ctrl->indicate_seq == 0xFFFF)
>  		preorder_ctrl->indicate_seq = seq_num;
> -	}
>  
>  	/*  Drop out the packet which SeqNum is smaller than WinStart */
> -	if (SN_LESS(seq_num, preorder_ctrl->indicate_seq)) {
> +	if (SN_LESS(seq_num, preorder_ctrl->indicate_seq))
>  		return false;
> -	}
>  
>  	/*  */
>  	/*  Sliding window manipulation. Conditions includes: */
> @@ -1862,8 +1858,7 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
>  
>  			preorder_ctrl->indicate_seq = (preorder_ctrl->indicate_seq + 1)%4096;
>  
> -			if (retval != _SUCCESS) {
> -			}
> +			if (retval != _SUCCESS)
>  
>  			return retval;
>  		}

This effectively changes the code from:

			if (retval != _SUCCESSS) {
				/* Do nothing */
			}

			return retval;

to:

			if (retval != _SUCCESSS)
				return retval;

			/* continue executing next statements ! */

So now when value == _SUCCESS execution will continue instead of returning
_SUCCESS, changing how the code works.

Regards,

Hans



> @@ -2084,10 +2079,8 @@ s32 rtw_recv_entry(union recv_frame *precvframe)
>  	precvpriv = &padapter->recvpriv;
>  
>  	ret = recv_func(padapter, precvframe);
> -	if (ret == _FAIL) {
> +	if (ret == _FAIL)
>  		goto _recv_entry_drop;
> -	}
> -
>  
>  	precvpriv->rx_pkts++;
>  

