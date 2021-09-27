Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CC73FCF
	for <linux-staging@lists.linux.dev>; Mon, 27 Sep 2021 08:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632731252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xd2B5fP8mQFJBNajYxsw0M/C64aAXorv26cE9NMuxUI=;
	b=iuzbM2/UWEPuYgQUnGbZf1NUMdvvw6hYgron9pF95WauHu1qE8d68K7MiguONV9abBNTQN
	KcrnjX1v/VftkIbLF9yjjtUySQ25ycGdHqCYTRcCCxJ1EzkVeO0HTbQdU1tR5/OgGeofth
	3wyOU+ETEnsDQiQ1b6RZvS/wFHAeOko=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-t64YGtxhP62xv-DnIdLWfQ-1; Mon, 27 Sep 2021 04:27:23 -0400
X-MC-Unique: t64YGtxhP62xv-DnIdLWfQ-1
Received: by mail-ed1-f72.google.com with SMTP id a7-20020a509e87000000b003da71d1b065so2941404edf.4
        for <linux-staging@lists.linux.dev>; Mon, 27 Sep 2021 01:27:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Xd2B5fP8mQFJBNajYxsw0M/C64aAXorv26cE9NMuxUI=;
        b=tF4MZV8vuKFwZ5AuE1hNwPLLpeD+lvvi4uDqFZM/Dd94X5s69sQOOe/M55H0FX7IJu
         ASBCXdGJb1vPDHs0FHnJfUeWCFVXQLctGugxFuXO0xBPw5k/FCvly1h2sn4OWnakLCxB
         +jTOeFhFzV47chFg8Fn2D2fdx0VoJbrLVcRKzKYhoHAbChNcyrJX/38z6ZBwVsX+6m2v
         m+LYS1VzXmn4ONh9BucQosMlXA8h0QSJ/g5KG0FMvNXMEKYco2aRfqRpQMXvvKaNqK5v
         RPL9liNJXVxCGPMQcTuyrUiVEGFs9+5S8tXwJYFtevInIyGhNYA355VNVzANdnzGztkj
         0ILg==
X-Gm-Message-State: AOAM5301yoXXiDamlXvIyTVjPbE+e6jVXGZa1/LNP6efWqF5uA2NnBB/
	eRaJKMUAQPFWRxQDTukmTZZjpKGMJ0sSFeJrS9iCOqxK0LVdzA/LSCXMmHy+AURGdHHAKrZ+Pui
	YdOqHnrnlKgtzGp/S4GMPwfanGQ==
X-Received: by 2002:a05:6402:21ef:: with SMTP id ce15mr21341504edb.19.1632731242832;
        Mon, 27 Sep 2021 01:27:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnaUDH9Y9p6JlmlVpo4at+7c8OOuBUxcgBd+LF71OeobsFVs6GkDkwTlUHXfTat8CiCOUYcQ==
X-Received: by 2002:a05:6402:21ef:: with SMTP id ce15mr21341496edb.19.1632731242641;
        Mon, 27 Sep 2021 01:27:22 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id w5sm8445816ejz.25.2021.09.27.01.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Sep 2021 01:27:22 -0700 (PDT)
Subject: Re: [PATCH] staging: rtl8723bs: remove meaningless pstat->passoc_req
 check in OnAssocReq()
To: Longji Guo <guolongji@uniontech.com>, gregkh@linuxfoundation.org,
 fabioaiuto83@gmail.com
Cc: ross.schm.dev@gmail.com, marcocesati@gmail.com, fmdefrancesco@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20210927033056.27503-1-guolongji@uniontech.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <13ccfad4-ed3c-5cff-653f-1c78ca0af883@redhat.com>
Date: Mon, 27 Sep 2021 10:27:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210927033056.27503-1-guolongji@uniontech.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 9/27/21 5:30 AM, Longji Guo wrote:
> kfree(NULL) is safe and the check 'if (pstat->passoc_req)' before kfree
> is not necessary.
> 
> Signed-off-by: Longji Guo <guolongji@uniontech.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> index 375d2a742dd2..a46ab97524aa 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -1344,11 +1344,9 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
>  			issue_asocrsp(padapter, status, pstat, WIFI_REASSOCRSP);
>  
>  		spin_lock_bh(&pstat->lock);
> -		if (pstat->passoc_req) {
> -			kfree(pstat->passoc_req);
> -			pstat->passoc_req = NULL;
> -			pstat->assoc_req_len = 0;
> -		}
> +		kfree(pstat->passoc_req);
> +		pstat->passoc_req = NULL;

This "pstat->passoc_req = NULL;" is not necessary, since directly afterwards
pstat->passoc_req gets overwritten with the return value from rtw_zmalloc()
so please drop this line too.

Regards,

Hans



> +		pstat->assoc_req_len = 0;
>  
>  		pstat->passoc_req =  rtw_zmalloc(pkt_len);
>  		if (pstat->passoc_req) {
> 

