Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402F33FC8
	for <linux-staging@lists.linux.dev>; Mon, 27 Sep 2021 11:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632743482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FAAFmmttYKv0+kVUPuJp9q/QqV+8DAP59uUvJMpuDGU=;
	b=KRWyoOXvZQ6bg9sO13J0kuxWPLoFJ1iIDJldu1+9MvJgghINb1o//gRN5Ox+G64dwt0Y91
	CtF8FxshiqmRioh6jKEB7BJ9AMHS10Ogt+v8tQ26oQj6+DX7JTfZaw0WVYlJ8AeNKjlWJz
	RQLF8drBg1ZkyUsQW9yideE8ej37GzU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-uXK15dsCM_acMxr1_EJ_OQ-1; Mon, 27 Sep 2021 07:51:19 -0400
X-MC-Unique: uXK15dsCM_acMxr1_EJ_OQ-1
Received: by mail-ed1-f69.google.com with SMTP id l29-20020a50d6dd000000b003d80214566cso17390767edj.21
        for <linux-staging@lists.linux.dev>; Mon, 27 Sep 2021 04:51:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FAAFmmttYKv0+kVUPuJp9q/QqV+8DAP59uUvJMpuDGU=;
        b=Ki9+sQQMO1x64+SiX7SxO7uVlnmkwGNS62fH6koONBbTwDKBpXXLrRofAcD4pljUzz
         5GOYH3DYw7roJWnXdZBOIuooSAEcEi4NtCMQ0qUBx3UIlvqE0E8429QBGNGE/WaBslJ6
         ty3C/zsvHe7N659Za7WdA9rqAZVn1J58zM2iu4oYHt9aqls/GhaVBWMwKtaKqK1tPaQT
         Rz+/WCnS2QiU3lePPNNe8aXEoYaoPvdF8Dd5m0KWrk6kbbBz5wdRhrnlZRxF5MC9ScXk
         f0uRShlu/kDNg+/tFAxnQix0z1RNN8klUG5kTCUBMjUgaulPOgPkqpUBoyXd6liJucuQ
         7doQ==
X-Gm-Message-State: AOAM532zUZQNQCqwIMIfKB7L1ncW7vepe3th1fXh/x5zXSCempK3firs
	wcxwTfpLmgp3l1eKciO8ZB2IG7WA0hI9CP9FUI8p26TrSQIKJAWB9iEwT9GnyAlh5zPngZ4AXTE
	jOIe8PAet6AwHcrIl1o8ipEIFXw==
X-Received: by 2002:a17:906:dc47:: with SMTP id yz7mr10119354ejb.487.1632743477831;
        Mon, 27 Sep 2021 04:51:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxbqNV2eYafPP8c75+i5zT8dgetv4aibQSC7rfpRdyczZ3eD1Vw707E1bBkk+SBQP3B3lSxQ==
X-Received: by 2002:a17:906:dc47:: with SMTP id yz7mr10119333ejb.487.1632743477599;
        Mon, 27 Sep 2021 04:51:17 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id g9sm8751645ejo.60.2021.09.27.04.51.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Sep 2021 04:51:17 -0700 (PDT)
Subject: Re: [PATCH] staging: rtl8723bs: remove meaningless pstat->passoc_req
 check in OnAssocReq()
To: Longji Guo <guolongji@uniontech.com>, gregkh@linuxfoundation.org,
 fabioaiuto83@gmail.com
Cc: ross.schm.dev@gmail.com, marcocesati@gmail.com, fmdefrancesco@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20210927114925.15940-1-guolongji@uniontech.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <6bec8a71-2233-9549-ab5e-1b1f62e2f488@redhat.com>
Date: Mon, 27 Sep 2021 13:51:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210927114925.15940-1-guolongji@uniontech.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 9/27/21 1:49 PM, Longji Guo wrote:
> kfree(NULL) is safe and the check 'if (pstat->passoc_req)' before kfree
> is not necessary.
> 
> Signed-off-by: Longji Guo <guolongji@uniontech.com>
Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Next time please mark a new (v2) version as such please by changing
the [PATCH] in the subject to [PATCH v2].

You can do this, by for example doing:

git format-patch -v2 HEAD~
git send-email v2-0001-.....patch

Regards,

Hans



> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> index 375d2a742dd2..51390a30fa55 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -1344,12 +1344,8 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
>  			issue_asocrsp(padapter, status, pstat, WIFI_REASSOCRSP);
>  
>  		spin_lock_bh(&pstat->lock);
> -		if (pstat->passoc_req) {
> -			kfree(pstat->passoc_req);
> -			pstat->passoc_req = NULL;
> -			pstat->assoc_req_len = 0;
> -		}
> -
> +		kfree(pstat->passoc_req);
> +		pstat->assoc_req_len = 0;
>  		pstat->passoc_req =  rtw_zmalloc(pkt_len);
>  		if (pstat->passoc_req) {
>  			memcpy(pstat->passoc_req, pframe, pkt_len);
> 

