Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCC27F
	for <linux-staging@lists.linux.dev>; Tue,  2 Aug 2022 08:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659430779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6MQqUL0mybjOOLgRIVQsUeJkgad5ME8laUjqFvyJPCs=;
	b=gHBobYsuw7oWxRIx+hS/Txpqcl8/Y9PMGTmoas5XjG6YKXpqkBw/StVMw7Dhef3Lxesx39
	W7SZUspIvrEjUacsJuCAZQ6902HwdRKo+7/+WID4+JcFCkHqVSoV6HsBrId0x+odhnu5od
	VgFkMSfwmU0OjD0cqN6GVTqaEQ2Lc0U=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-oeXNwmp5O-iafgQGkIDQWg-1; Tue, 02 Aug 2022 04:59:36 -0400
X-MC-Unique: oeXNwmp5O-iafgQGkIDQWg-1
Received: by mail-ed1-f70.google.com with SMTP id t13-20020a056402524d00b0043db1fbefdeso2887604edd.2
        for <linux-staging@lists.linux.dev>; Tue, 02 Aug 2022 01:59:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6MQqUL0mybjOOLgRIVQsUeJkgad5ME8laUjqFvyJPCs=;
        b=I0MPgI96pMCyuBzIqC4ms8TUEM9NdojYyMULb02c6y4rEwtMANfFjhekmcfrxgHJR7
         dn2FbjpbAcvAhdDW4yCBPaMlteU7rBKI3leysluf25PLi55CqWQRgaeS2xJgw+TCk8I3
         F2hdgnmHb+8gHOT0Rkm/HOgSS/xlwdQLeLqq0K8MxAD3nq+LLrYXyHNUVoaw/M3nEOyT
         QtrSsSGWXMMbAU+Ii1daicsW/RTVNM/UpYeb3aiCK0HGRUowyoibklmBEn/cmjh7CcL6
         aZkGYIuHJT0F9afk7vFaSroSLx1Xz29xVmndItaW4cWCfvb7ka1zYMR+KC2U2mfyCbuf
         P0xA==
X-Gm-Message-State: ACgBeo0iE7QdxFBV+XjOXK6NkeF2SMpk/hLMOjLmN+p56wZpUl6lTTE0
	e0oY1sivohXhhXTpmCroWMxNffIG6z/0bcU0jD+WziRh+ZYkpzF91R8+WBL/sPtYEPTbD7t8i2w
	HGfNB1hQbN2kxrPba9rSw0BiCjQ==
X-Received: by 2002:a17:906:ef90:b0:730:9af7:5702 with SMTP id ze16-20020a170906ef9000b007309af75702mr3470291ejb.107.1659430775134;
        Tue, 02 Aug 2022 01:59:35 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7ag90gbUb5lOg4jO+d13erT7aUe+ctI2ejRiAU/9F51rP9BOtMPdRsY5gRFTqwjK+0er09dg==
X-Received: by 2002:a17:906:ef90:b0:730:9af7:5702 with SMTP id ze16-20020a170906ef9000b007309af75702mr3470284ejb.107.1659430774933;
        Tue, 02 Aug 2022 01:59:34 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id ft6-20020a170907800600b007263481a43fsm6020946ejc.81.2022.08.02.01.59.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 01:59:34 -0700 (PDT)
Message-ID: <efaa69fc-2402-9cc4-f7c8-86d6a93c6b02@redhat.com>
Date: Tue, 2 Aug 2022 10:59:33 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] staging/rtl8723bs/core: remove inactive initialization
To: Li zeming <zeming@nfschina.com>, gregkh@linuxfoundation.org,
 sevinj.aghayeva@gmail.com, fabioaiuto83@gmail.com, duoming@zju.edu.cn,
 keescook@chromium.org
Cc: straube.linux@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220802012513.2824-1-zeming@nfschina.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220802012513.2824-1-zeming@nfschina.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/2/22 03:25, Li zeming wrote:
> The allocation address of the psta pointer variable is first performed
> in the function, no initialization assignment is required, and no
> invalid pointer will appear.
> 
> Signed-off-by: Li zeming <zeming@nfschina.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index f2242cf2dfb4..6498fd17e1d3 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -2521,7 +2521,7 @@ void rtw_issue_addbareq_cmd(struct adapter *padapter, struct xmit_frame *pxmitfr
>  {
>  	u8 issued;
>  	int priority;
> -	struct sta_info *psta = NULL;
> +	struct sta_info *psta;
>  	struct ht_priv *phtpriv;
>  	struct pkt_attrib *pattrib = &pxmitframe->attrib;
>  	s32 bmcst = IS_MCAST(pattrib->ra);

