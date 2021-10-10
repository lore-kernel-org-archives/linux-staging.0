Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1919072
	for <linux-staging@lists.linux.dev>; Sun, 10 Oct 2021 12:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633869927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hGzveYbUBicRzug96qwjzZADX2Wt9eAHz5hNvkN82fY=;
	b=TXQ+h/dlTJGqV33hL/H71QLplMGRmVypkBYWQAgR+w7ztgf8VBRV/XDE62ifXCSyDmlbdu
	K6Joz3ZBOYYaPb5HVFsLkKLTEOpoKoYDGhbFvGi1sZxLSoF9wS8SgHI6BTE74ZY5cG8M6f
	tIHECgNpaSZbO9ahtxTd5Vb/Wh9kXI0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-pffY-mZYPC2HnqMLpTMFmA-1; Sun, 10 Oct 2021 08:45:23 -0400
X-MC-Unique: pffY-mZYPC2HnqMLpTMFmA-1
Received: by mail-ed1-f71.google.com with SMTP id d3-20020a056402516300b003db863a248eso1334171ede.16
        for <linux-staging@lists.linux.dev>; Sun, 10 Oct 2021 05:45:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hGzveYbUBicRzug96qwjzZADX2Wt9eAHz5hNvkN82fY=;
        b=A6VO9ai+ltLRGHpKc4Y/RWv5MedKrVfgDXi+IYPse1BTqXHrQ6KDAfchLr98EHwXlT
         qPNYqCIizQP/D4h2+S1gFEEWZp5kEPUwr0NvoFdeDW1Y4cvPnGuX9TWnn9tUZzsW1pnw
         lTznY2oWnyLL65L3jGX7Rp2h7gitEGzCs3lWDSRm6rQJuoA15P01Sflbf6gBE6Pj3u2M
         QKVZpAm+WMS13yK0TLJbAQZj2R3b8RDEl4+AUgwPTPT5etUcBp8zkpWKLxta10W6fFkv
         zpSg+0E4mTQIvslmmOoPNf1tVvXXp/QM7np7pF32gcPlcY6QCgIT/YhDIwSDOBJw3Byu
         teWA==
X-Gm-Message-State: AOAM530PZuaetZ3GWyaRhAzZICIBUxVqajtwro61IQCXXH6jw6z96OOj
	WN5Tt294kLZgVe85CbLNn+Zr7fF68HtoeM5llWY8/Tn41eKZ1iZpYy9m4Xx5qSJTrrBogv2MlFU
	nTuH/E31pgxYXtKEpm9ez0EwEYg==
X-Received: by 2002:a05:6402:268c:: with SMTP id w12mr31316107edd.376.1633869922640;
        Sun, 10 Oct 2021 05:45:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5R81f51iOnHvmeJnqpJ7elPHbjPZqqu58M/bMxC5dmnMuMA5wa5cZk8kiknyGER654My7eg==
X-Received: by 2002:a05:6402:268c:: with SMTP id w12mr31316077edd.376.1633869922440;
        Sun, 10 Oct 2021 05:45:22 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id oz11sm2036382ejc.72.2021.10.10.05.45.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Oct 2021 05:45:22 -0700 (PDT)
Subject: Re: [PATCH] staging: rtl8723bs: hal: remove duplicate check
To: Saurav Girepunje <saurav.girepunje@gmail.com>,
 gregkh@linuxfoundation.org, fabioaiuto83@gmail.com, marcocesati@gmail.com,
 dan.carpenter@oracle.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
References: <YWKRfYpTioAmTWa0@user>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <6c589c93-b224-1490-5f38-63947f02ff6a@redhat.com>
Date: Sun, 10 Oct 2021 14:45:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YWKRfYpTioAmTWa0@user>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 10/10/21 9:08 AM, Saurav Girepunje wrote:
> Remove 'bPerformance' from if condition check. As on previous
> if condition it is already check for same variable.
> 
> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

> ---
>  drivers/staging/rtl8723bs/hal/odm_DIG.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/odm_DIG.c b/drivers/staging/rtl8723bs/hal/odm_DIG.c
> index beda7b8a7c6a..7e92c373cddb 100644
> --- a/drivers/staging/rtl8723bs/hal/odm_DIG.c
> +++ b/drivers/staging/rtl8723bs/hal/odm_DIG.c
> @@ -544,7 +544,7 @@ void odm_DIG(void *pDM_VOID)
>  	/* 1 Adjust initial gain by false alarm */
>  	if (pDM_Odm->bLinked && bPerformance) {
> 
> -		if (bFirstTpTarget || (FirstConnect && bPerformance)) {
> +		if (bFirstTpTarget || FirstConnect) {
>  			pDM_DigTable->LargeFAHit = 0;
> 
>  			if (pDM_Odm->RSSI_Min < DIG_MaxOfMin) {
> --
> 2.32.0
> 

