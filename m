Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F4B2C81
	for <linux-staging@lists.linux.dev>; Thu, 28 Oct 2021 10:40:18 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id z20so23097515edc.13
        for <linux-staging@lists.linux.dev>; Thu, 28 Oct 2021 03:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PW+hyrXKicmL8HA91yjF4KoXuu6RQtVw5GOzxmbduWo=;
        b=euWsN0jgmmjA4uHX5S3LjgBWWj25mJ+EXVZ4bkwTmsmQhUeAIQMWL8qp8gOFBi4n4N
         N69CZmQgmOZj3AqYdxnK3dEJlnYi1DXj5VLgw2Ieje53FtMi7BUx7m44g31PUFNGqbfu
         sBr8zJsj2zKSwjDbTfvG3xqliG8j6LtBbujqNkNguDdK6VzmM5VNi5LkWO7ypyJ5zZOW
         F3PNpMWtlE3TnMr5mI8958oiTiXgC830TEM62Fl4LHiQZdyjYs9f5luKoUmtTs3uusxI
         veMsoqixyB5ZHnuMcpFPGtqy//sG05IjPz5YIzYMU+9LMrvGQi8sc3g056WfBPXqbweA
         voTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PW+hyrXKicmL8HA91yjF4KoXuu6RQtVw5GOzxmbduWo=;
        b=NpQzRmTCQH6Es4hap/oTfeKLhHGbAmlFkNw+N16DDw0MwrlOC2OCTAr0BvYZ4CF3YK
         8Pp/gCZQNfh9Q72VbjmUkrmOQgxUxlpLrbgEjFZYXtIzWjlbdo0/h1pEtNx3HCMXq78r
         CDIj4Apm2k3OVT05mx0mRrfBjh2tgZWBWn+6ljxsyIoEcgaUx6C61sRAO9jdg+7o7RAb
         SNw+V/Sa+tz3y++ncy7TA/X4+GW2himsdyBCk52xZrJfQWcBZfWa9b7RO/rmT78fmoAK
         tiysvPShVWpDtd4ABOmB5qtNLItvs/wsHkDFRsQ5Pvc+RRzZ6UlCmKAEfeSe1yEJwEQ4
         8zYQ==
X-Gm-Message-State: AOAM530umh+1z4gaTvTPjAEChstSJg16zPLmv0BJ454tqyQvEh6aJuX0
	14rYZI4SbK9oXsq8sH7C9Tw=
X-Google-Smtp-Source: ABdhPJwVybFLLGyOGG57fUwOxrB3pXESZ1MJVh9iW60aocNQR2WRLQ41mIKDrYP2K8Lnzuz2r82VvQ==
X-Received: by 2002:a17:906:a0d7:: with SMTP id bh23mr4222879ejb.82.1635417616604;
        Thu, 28 Oct 2021 03:40:16 -0700 (PDT)
Received: from localhost.localdomain (host-79-56-54-101.retail.telecomitalia.it. [79.56.54.101])
        by smtp.gmail.com with ESMTPSA id o10sm1447977edj.79.2021.10.28.03.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 03:40:16 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, Yang Yingliang <yangyingliang@huawei.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, gregkh@linuxfoundation.org
Subject: Re: [PATCH -next] staging: r8188eu: fix missing unlock in rtw_resume()
Date: Thu, 28 Oct 2021 12:40:14 +0200
Message-ID: <2746511.UyKHOQf6m0@localhost.localdomain>
In-Reply-To: <20211028094038.2877341-1-yangyingliang@huawei.com>
References: <20211028094038.2877341-1-yangyingliang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="ISO-8859-1"

On Thursday, October 28, 2021 11:40:38 AM CEST Yang Yingliang wrote:
> Add the missing unlock before return from rtw_resume().
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: 2b42bd58b321 ("staging: r8188eu: introduce new os_dep dir for 
RTL8188eu driver")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/staging/r8188eu/os_dep/usb_intf.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/
r8188eu/os_dep/usb_intf.c
> index 6b93830130e7..5a35d9fe3fc9 100644
> --- a/drivers/staging/r8188eu/os_dep/usb_intf.c
> +++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
> @@ -298,8 +298,10 @@ static int rtw_resume(struct usb_interface *pusb_intf)
>  		pwrpriv->bkeepfwalive = false;
>  
>  	DBG_88E("bkeepfwalive(%x)\n", pwrpriv->bkeepfwalive);
> -	if (pm_netdev_open(pnetdev, true) != 0)
> +	if (pm_netdev_open(pnetdev, true) != 0) {
> +		mutex_unlock(&pwrpriv->lock);
>  		goto exit;
> +	}
>  
>  	netif_device_attach(pnetdev);
>  	netif_carrier_on(pnetdev);
> -- 
> 2.25.1
> 
Good catch, well done!

I recently replaced semaphores with mutexes in this and other r8188eu driver
functions (commit 7e4c7947b42c "staging: r8188eu: Use a Mutex instead of a
binary semaphore") but, while making those changes, I didn't notice that the
'if' in rtw_resume () can lead to a jump to the "exit" label without properly
unlocking the "pwrpriv-> lock" mutex.

Acked-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

Thank you,

Fabio


