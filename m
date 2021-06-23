Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001662FB1
	for <linux-staging@lists.linux.dev>; Wed, 23 Jun 2021 13:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624453713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=laMK981mv0ZnD0B9GFNK7CVhuuQIdDNlKXWiyssjTBI=;
	b=fr/RcsRSz6f965K/DfFVqtg+XbkTIGfycVxZ1+MSXXMaCHfa8j8L+El+U8bfCl9lhefPLn
	ue53HbiNcs7mmGez12jHrq8jPhOkucPYD+8WwqgueIxEslH91k+RAfKEY4HgdNCN8Hqjmq
	DLTfpmBhzV8LxVBWq/z2yV79HzbPTo0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-nf5h8gbnPsKZTVe-Z_uYvQ-1; Wed, 23 Jun 2021 09:08:32 -0400
X-MC-Unique: nf5h8gbnPsKZTVe-Z_uYvQ-1
Received: by mail-ed1-f69.google.com with SMTP id v8-20020a0564023488b0290393873961f6so1267869edc.17
        for <linux-staging@lists.linux.dev>; Wed, 23 Jun 2021 06:08:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=laMK981mv0ZnD0B9GFNK7CVhuuQIdDNlKXWiyssjTBI=;
        b=UV5fUXjQR5qmTO6H3F9UfBOo2P+kFz9Ml73AEHrf8bbsib8L7zdlISoh6yHydLQ+kT
         FDTyzSSdkd+ZDRBQpCnESm4Z2bMBLcQR3SKCc65FZ7zVDgzpPKVg+QXfT4gyygzpD8mh
         1ST6uK9Bu9SJnn8o0wG1vf7Z0JCvjjhea5QLHAY4ezfAs4i/GMBHkVNx1fuJjatI4B/C
         ne3RFbUYwqljbGK3Xc1OEEvBGxe5s9H3oj1RzWp2S2yijedBIOkk5yx9adgZ/gCuICT2
         ooX9ttvl9y95HTmqWZuxlZqwXtN3r8zcfoM0T6ZnV+9bo51YIvASVFrsVFfQyNQeNc3W
         muRQ==
X-Gm-Message-State: AOAM5302BK/2re6dZDlC6a5/Hg/rE+wYEEIJEc8eDaxF028gVwknML5b
	WssSN7dgvbWNscFZzBFiwrgmK7c3CHPyJpo4VFD4odGQDszXN71vhCBGQG/qUUbfvQc8fOJNPKC
	yksOqNuxsPLg3Cf1g8Z9jcL03hA==
X-Received: by 2002:a05:6402:214:: with SMTP id t20mr12498358edv.20.1624453711626;
        Wed, 23 Jun 2021 06:08:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZyOJdESTaoaBILztmfKMoUyzU0klenAe/9rbnsswLUshPvy0GTs8FlOlUumkGgkSEzu3bfQ==
X-Received: by 2002:a05:6402:214:: with SMTP id t20mr12498337edv.20.1624453711490;
        Wed, 23 Jun 2021 06:08:31 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id cb14sm7954783edb.68.2021.06.23.06.08.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jun 2021 06:08:30 -0700 (PDT)
Subject: Re: [PATCH] staging: rtl8723bs: convert function to static
To: Fabio Aiuto <fabioaiuto83@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20210623130103.7727-1-fabioaiuto83@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <a5e755c3-48c9-40d4-fccb-1b9146fe762f@redhat.com>
Date: Wed, 23 Jun 2021 15:08:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210623130103.7727-1-fabioaiuto83@gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 6/23/21 3:01 PM, Fabio Aiuto wrote:
> function chk_sta_is_alive() is used only inside core/rtw_ap.c
> so remove the prototype and convert it to static.
> 
> Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

> ---
>  drivers/staging/rtl8723bs/core/rtw_ap.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
> index 23bbdf084631..3e2d8b735fc8 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ap.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
> @@ -164,8 +164,7 @@ static void update_BCNTIM(struct adapter *padapter)
>  	pnetwork_mlmeext->IELength = offset + remainder_ielen;
>  }
>  
> -u8 chk_sta_is_alive(struct sta_info *psta);
> -u8 chk_sta_is_alive(struct sta_info *psta)
> +static u8 chk_sta_is_alive(struct sta_info *psta)
>  {
>  	sta_update_last_rx_pkts(psta);
>  
> 

