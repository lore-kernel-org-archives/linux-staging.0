Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD713FC0
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 19:35:26 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id n5so15449487wro.12
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 12:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5aJIU45FbDH+4PMzPrOxxvTKWlGFVwAzGeiDLaD41k0=;
        b=lAGhEoYZIl2Ie7hO48KDMvxIjOcn0/C4lr2t2yRDHqDKSjRqf37nU02YJ0kA3DLv7t
         kLFybcA9GC6SMWIDTYWbqMCY0hbm89mU0uJyj5h9RMmnuqHT8kykedxirxLXqyeZQESZ
         LbyClQcJU6ZGelz9gQtQy5X9iVanwKMzn4W+6pc3UqjafmyTEPdck69eRI4pcPjqLwVK
         tTGJwaZV0PnK/v0OLNWyLkKW4t+3D/vwTJYJLyp3dG+HNlmbfvKdKXfn9NuXMV2k3VFX
         o4tlHhu6KTKKB5eQ8Yl8Rg1FjMzZoffoLJGrqkOusYL/G/uvrBM6dGlu2vPS6CrTQCog
         HM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5aJIU45FbDH+4PMzPrOxxvTKWlGFVwAzGeiDLaD41k0=;
        b=PpSKhheYaLtZXNZGxAKRg+kYuHm3WdVTThJNvZ1FQ5TXR0lTVWKdIzVSK5ugyb0+f4
         52GjH146518sgCEhRi2XH1nUG+klQp3HoS2RQcEL8+ZuTo1P/mOQFDg2YIgRYJvweQ4h
         R0FWFf3GOHcZuJkUWkJyppHn6sfRdSSldAtBuL7dbySNC/KdvRgESK1MJy82snQq24g8
         dbEznMxhpVOmbSgWbimEHt3qSj95RA2g4penj+XnKOVOmhxi3Vm8inTHQYNxf1OIr12U
         6xEC/thJAT+Qj1db2O9NKfD7DE0SYKtvluo8XCZzGEYcFhpjnw0T2OVkN6Fy5W3C37CQ
         Z4eQ==
X-Gm-Message-State: AOAM531s2LtTNLlfFOTi6Na9rlq7Gn6MWR6hpqRux24wUsO1C1QwoMFH
	q6kHvvzTkW2MpVWEKypIJkYUZO7t4Pg=
X-Google-Smtp-Source: ABdhPJywIJYbxkHiK7gragRF97lVPMSpwj9XblpvzAikHbFSFGDRdVqiCQqu4idcJvzdNYrGC1m7uA==
X-Received: by 2002:a05:6000:120d:: with SMTP id e13mr15488253wrx.6.1629747324915;
        Mon, 23 Aug 2021 12:35:24 -0700 (PDT)
Received: from ?IPv6:2a02:8108:96c0:3b88::3c39? ([2a02:8108:96c0:3b88::3c39])
        by smtp.gmail.com with ESMTPSA id n14sm5615292wrx.10.2021.08.23.12.35.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Aug 2021 12:35:24 -0700 (PDT)
Subject: Re: [PATCH] staging: r8188eu: make rtw_deinit_intf_priv return void
To: Pavel Skripkin <paskripkin@gmail.com>, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20210823184059.19742-1-paskripkin@gmail.com>
From: Michael Straube <straube.linux@gmail.com>
Message-ID: <e01ea557-b006-a5b9-884a-81670376fe6c@gmail.com>
Date: Mon, 23 Aug 2021 21:34:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210823184059.19742-1-paskripkin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/23/21 8:40 PM, Pavel Skripkin wrote:
> rtw_deinit_intf_priv() always return success, so there is no need in
> return value
> 
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> ---
>   drivers/staging/r8188eu/os_dep/usb_intf.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
> index e002070f7fba..37694aa96d13 100644
> --- a/drivers/staging/r8188eu/os_dep/usb_intf.c
> +++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
> @@ -129,13 +129,10 @@ static u8 rtw_init_intf_priv(struct dvobj_priv *dvobj)
>   	return rst;
>   }
>   
> -static u8 rtw_deinit_intf_priv(struct dvobj_priv *dvobj)
> +static void rtw_deinit_intf_priv(struct dvobj_priv *dvobj)
>   {
> -	u8 rst = _SUCCESS;
> -
>   	kfree(dvobj->usb_alloc_vendor_req_buf);
>   	_rtw_mutex_free(&dvobj->usb_vendor_req_mutex);
> -	return rst;
>   }
>   
>   static struct dvobj_priv *usb_dvobj_init(struct usb_interface *usb_intf)
> 

Looks good to me, thanks.

Acked-by: Michael Straube <straube.linux@gmail.com>
