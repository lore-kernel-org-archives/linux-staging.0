Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F022A3FED
	for <linux-staging@lists.linux.dev>; Mon,  4 Oct 2021 08:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633334673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b2znbHeTUtMfJ6z4tVBa0MoQXXesDQGCaycD18oxgNs=;
	b=IU3SQmGzCG5b4xwYvLRLa6TcD9ZMvN1MunqclG9JzdneB9+Z0yRtLnSMKIyRL2XZF1y16G
	4YGHRahW0KC+G5M8+1ZVtUmPvAJZNGgBBYy68ZhS+9wLpeP3110CqHya1qQ3oXVgnhXyMF
	0PQ9EHDGEm/FkiAjx8l4xJo7XtSWgVo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-xhgFnWsGP-2jvW7jfJ5PLQ-1; Mon, 04 Oct 2021 04:04:31 -0400
X-MC-Unique: xhgFnWsGP-2jvW7jfJ5PLQ-1
Received: by mail-ed1-f71.google.com with SMTP id 14-20020a508e4e000000b003d84544f33eso16390181edx.2
        for <linux-staging@lists.linux.dev>; Mon, 04 Oct 2021 01:04:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=b2znbHeTUtMfJ6z4tVBa0MoQXXesDQGCaycD18oxgNs=;
        b=iWpF8wAD6pKK+opbowfmOxavwhAgoc+NWFbQNjyWMPa9mkc+X825+/gnmeMtYfQTnN
         BMsKl9AN4kXJILhQ1fPf6kpOHvrYY1N6JGdajtawynsjtnchmUs7YLDsSNovhRjn9tcL
         YHq1LCR13QoQ9DOitHv/RwGIq7ti2fbP3UFbFq+Yl0RD9hBonNeBRSXHd5ZP0yT/rLcb
         awewyB+vLBt4+ZwdBQX2/5SWtfGX0If3Vf2CkrpnzM3wVsXaVTocUu7vRrL+sdRz0tzn
         jbO0J/lNYJ8iKk1JxHtub/8M1Db2SulyMH2vJSj4mnjZB7wv7E6Hd5brTdH1RzfqpTYx
         jszQ==
X-Gm-Message-State: AOAM532mlM6MzH9bFqAcixK8AvmHdVoQOd4LSharo1ASjK+p/dLgGYgE
	10jSU0upLlWbBsmtBB1guKinjQWZFXmSzhp8q5CU1uWnp7XboFLqEOMt+lZEI7NeOkQNrbNY1C7
	eOTD1UuxFoFBBDkremGs5toWi9g==
X-Received: by 2002:a05:6402:1157:: with SMTP id g23mr17111298edw.379.1633334670831;
        Mon, 04 Oct 2021 01:04:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHDDAKdXSAn82KOTUnDct9UjyTAsKHFkUha0zXYEjle2CuvhBgiNLZygCtsXzjOKucrZp2bQ==
X-Received: by 2002:a05:6402:1157:: with SMTP id g23mr17111274edw.379.1633334670642;
        Mon, 04 Oct 2021 01:04:30 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id j14sm6935098edl.21.2021.10.04.01.04.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Oct 2021 01:04:30 -0700 (PDT)
Subject: Re: [PATCH] staging: rtl8723bs: core: remove reassignment of same
 value to variable
To: Saurav Girepunje <saurav.girepunje@gmail.com>,
 gregkh@linuxfoundation.org, fabioaiuto83@gmail.com, ross.schm.dev@gmail.com,
 marcocesati@gmail.com, fmdefrancesco@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
References: <YVnX1HIYoisW621x@user>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <a110ec8f-0b80-1f44-b60f-e0ac62313832@redhat.com>
Date: Mon, 4 Oct 2021 10:04:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YVnX1HIYoisW621x@user>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 10/3/21 6:18 PM, Saurav Girepunje wrote:
> Remove reassignment of same value to variable pstat->auth_seq.
> On if (seq == 1) assigning the value 2. At the end of if statement
> also assigning the value pstat->auth_seq = seq + 1 that is again
> assigning the value 2.
> 
> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> index 3ee4d35ca8d7..059cd85f4b03 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -808,7 +808,6 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
>  			pstat->state &= ~WIFI_FW_AUTH_NULL;
>  			pstat->state |= WIFI_FW_AUTH_STATE;
>  			pstat->authalg = algorithm;
> -			pstat->auth_seq = 2;

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


>  		} else if (seq == 3) {
> 
>  			p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + 4 + _AUTH_IE_OFFSET_, WLAN_EID_CHALLENGE, (int *)&ie_len,
> --
> 2.32.0
> 

