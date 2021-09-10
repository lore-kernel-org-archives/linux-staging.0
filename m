Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260D83FC2
	for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 06:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631255071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pnqlEhLtfhytMeRqppmfXFCckHKhqrWYsJrwlC/wIv4=;
	b=erByxi5Js2WtirE9MePbb//F6382h3Y/0nEIesNz7pWIj5PHiM4mu2DLGvNXlNxEOfRhaG
	GEspjQTUiTB+YXbgWqdm0jy2WcI+YC6SwBub8JV2FbDQeHOY1adfs+3t+QYLcAK4k384Q4
	Oh/LXaix3STF4UN27C/8rSTPa5DzV0A=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-UDVPKQ33OAKi5Cly4A3YiQ-1; Fri, 10 Sep 2021 02:24:29 -0400
X-MC-Unique: UDVPKQ33OAKi5Cly4A3YiQ-1
Received: by mail-ed1-f72.google.com with SMTP id z17-20020a05640240d100b003cac681f4f4so345721edb.21
        for <linux-staging@lists.linux.dev>; Thu, 09 Sep 2021 23:24:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pnqlEhLtfhytMeRqppmfXFCckHKhqrWYsJrwlC/wIv4=;
        b=3UA7iKmMhyGWlZU/BxgxURugN130IO5AbO3todH0vSeCFu6bvpugIlUgkrZEV+4hiu
         fYh0EQI63pZ0O8q8xgN5kzzDt8gvphZ+QpnSokbzFaVUf0/cemT0AdeMnnBk0J6wEH/2
         0pLmS/P2tY0LbcQP2RfQ+GBV50SzLMzDRUSEnlnhfo1qMfxfl02z3c65b2Cigh0ZW5mZ
         L0GbBdZXsC1aoCHSpTb8wbi2kYT9WGZ9D4ITnOzayg6v4AfSuVkJ6UD4mv8YCRlqxKed
         zKrx2qjsjQyMnL9aOMgr49Rly9Uu1eojPWUWWNxjU/z0QJSmuH9EH8giNYBf9YWpqnP7
         Y91g==
X-Gm-Message-State: AOAM531yi2O8VmZ2YtH+l8CpkyaqABHPedbRMrjyUWU9ZKPHIDGFNDd/
	627qUBC3Klj2nTZ8iMMbD1lpB3LSU5I1eOZghjJs9SGh+mkB1f+th59mMG7vClKjdmSzEH+ee72
	NbGsYYWAsv3ZCQr2AjPfLpl/gCw==
X-Received: by 2002:a17:906:5408:: with SMTP id q8mr7398373ejo.54.1631255068482;
        Thu, 09 Sep 2021 23:24:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySHpKwGqt60OguV1nAVbYXS6ixd+RRfr7vvv0dTOupfqnEpbcGDztj8pVK2vfAO7tCNUk0eg==
X-Received: by 2002:a17:906:5408:: with SMTP id q8mr7398351ejo.54.1631255068242;
        Thu, 09 Sep 2021 23:24:28 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id gz22sm1926879ejb.15.2021.09.09.23.24.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Sep 2021 23:24:27 -0700 (PDT)
Subject: Re: [PATCH] staging: rtl8723bs: remove unused macros from
 ioctl_linux.c
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20210909211922.24872-1-straube.linux@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <d39f410e-ac89-54e1-5c54-a17bdc5ebc49@redhat.com>
Date: Fri, 10 Sep 2021 08:24:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210909211922.24872-1-straube.linux@gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 9/9/21 11:19 PM, Michael Straube wrote:
> These macros are not used in the driver, remove them.
> Found with GCC -Wunused-macros.
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 14 --------------
>  1 file changed, 14 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
> index 908022a17b3f..27fb1be036b8 100644
> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
> @@ -15,20 +15,6 @@
>  
>  #define RTL_IOCTL_WPA_SUPPLICANT	(SIOCIWFIRSTPRIV+30)
>  
> -#define SCAN_ITEM_SIZE 768
> -#define MAX_CUSTOM_LEN 64
> -#define RATE_COUNT 4
> -
> -/*  combo scan */
> -#define WEXT_CSCAN_HEADER		"CSCAN S\x01\x00\x00S\x00"
> -#define WEXT_CSCAN_HEADER_SIZE		12
> -#define WEXT_CSCAN_SSID_SECTION		'S'
> -#define WEXT_CSCAN_CHANNEL_SECTION	'C'
> -#define WEXT_CSCAN_ACTV_DWELL_SECTION	'A'
> -#define WEXT_CSCAN_PASV_DWELL_SECTION	'P'
> -#define WEXT_CSCAN_HOME_DWELL_SECTION	'H'
> -#define WEXT_CSCAN_TYPE_SECTION		'T'
> -
>  static int wpa_set_auth_algs(struct net_device *dev, u32 value)
>  {
>  	struct adapter *padapter = rtw_netdev_priv(dev);
> 

