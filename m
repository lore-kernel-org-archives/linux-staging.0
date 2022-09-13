Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AF03C26
	for <linux-staging@lists.linux.dev>; Tue, 13 Sep 2022 17:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663088592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CtO5Xdb0N97OeHRHV6OUstfsbFzWaKQfS8VlpP0nq7Q=;
	b=JuNDjSRjUMRANO9E1uERVyn/5XGSgtXwPG3kI0u6aayoQUVvQSD0d4O3EK4UOPSSOlq6d2
	rZXManS7m5UNjnifkYP5vpQBQD3zz6Rn78Kpu+guIwLxL77IkfkOgu5KjqGGlKQ5DKsan3
	XZ9LheKtkwXCZUGP0NPTlNnYLtKsvQ8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-397-1cpjB62PPTaXyjNWZBT8KQ-1; Tue, 13 Sep 2022 13:03:11 -0400
X-MC-Unique: 1cpjB62PPTaXyjNWZBT8KQ-1
Received: by mail-wr1-f71.google.com with SMTP id h2-20020adfa4c2000000b00228db7822cbso3411549wrb.19
        for <linux-staging@lists.linux.dev>; Tue, 13 Sep 2022 10:03:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=CtO5Xdb0N97OeHRHV6OUstfsbFzWaKQfS8VlpP0nq7Q=;
        b=7Qx09Mup567/g/UrGRO9+agitbnhLQ/Fc1bLgESdPwfkfFYyQlaw4XE3y8UBeETSNj
         kkMwQN66CPhemWv7Up+lTGZ6hgiD1yFCjUiLpdhAB4XO9MVRcRd+0XAhqV5A4OAtNMD4
         k+yMCcbYKxf8csT320XwIUvRaF8pKTwncWhh88pJ65HBwQ/+NiV4o91zMtA7g004kiGu
         VvQXZrEQpWQkNd38ijW2vYIrCWJrjvbIjZQsOgRxUAHjKRHP+bsYbCGzlZwaoxn/JSly
         HqrpvO0ACEXpXPseRrGLulURI7Rp2cbFqwSbFVYnwSZu+aLQURlKnr7vNtM9hvXP0AoG
         ceww==
X-Gm-Message-State: ACgBeo3XcHyrwXa23bWzb9+dZo4T90YzuEmL85gocJtnliutcqVtoaP2
	q6x/OxHIHnGLINHJXPzNOV4WTDYvvVolosi/r6KOHhYPyHNramNkjEDuXliTIYQXdGwN1MSyH+B
	V8JEVwV+UzPhVnYcO8dXmQLT/ZQ==
X-Received: by 2002:a05:600c:3ac9:b0:3a5:f114:1f8 with SMTP id d9-20020a05600c3ac900b003a5f11401f8mr195517wms.204.1663088590461;
        Tue, 13 Sep 2022 10:03:10 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4aO/4fVjNMJofzSVlfRIoz3khYyy7gU3WXB6xMNRwAcPZ7rka1mteCwyHUCe73jFfhjQ/2qQ==
X-Received: by 2002:a05:600c:3ac9:b0:3a5:f114:1f8 with SMTP id d9-20020a05600c3ac900b003a5f11401f8mr195499wms.204.1663088590285;
        Tue, 13 Sep 2022 10:03:10 -0700 (PDT)
Received: from [172.16.38.152] ([185.122.133.20])
        by smtp.gmail.com with ESMTPSA id c6-20020a056000104600b002252ec781f7sm11076430wrx.8.2022.09.13.10.03.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 10:03:09 -0700 (PDT)
Message-ID: <44d028b3-599a-a268-d4c7-3d61d247961b@redhat.com>
Date: Tue, 13 Sep 2022 19:03:09 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2] staging: rtl8723bs: remove braces in single statement
 blocks
To: Kang Minchul <tegongkang@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev
References: <6cb85919-878a-73a5-0f2a-669d6062727b@redhat.com>
 <20220913162510.3134430-1-tegongkang@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220913162510.3134430-1-tegongkang@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/13/22 18:25, Kang Minchul wrote:
> This commit cleans up checkpatch warning as follows:
> WARNING: braces {} are not necessary for single statement blocks
> 
> Signed-off-by: Kang Minchul <tegongkang@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
> Reverted erased code which invokes error.
> 
>  drivers/staging/rtl8723bs/core/rtw_recv.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> index d8d394b67eeb..f360c7c631cb 100644
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
> @@ -2084,10 +2080,8 @@ s32 rtw_recv_entry(union recv_frame *precvframe)
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

