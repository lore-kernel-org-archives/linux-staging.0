Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54ACB7C
	for <linux-staging@lists.linux.dev>; Sun,  3 Apr 2022 11:20:12 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id k21so12416641lfe.4
        for <linux-staging@lists.linux.dev>; Sun, 03 Apr 2022 04:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/nGCKkYfJckWjtQDHrGmqAfeKE621bI4+5SiFBLzr8w=;
        b=P4yB+NzYokpaQuk5EcyxPKue0k3iutinq/kqDEo62aZP+OHjThk/HpKhqNAbOGAr/f
         f+hybWpSpNr5Y2fAAC/G2HHq2MilW2isdChwE0L4fPwgHCQAvnICccinWrfaUIO2cTVy
         +yrx3m8h0KNMCiuUt9GSaoQS8wPezgYPHnIv53yEbA7DtQ4W+UMOttRY9BJyEvBbLIsm
         3qdvaE45RTuqlCNFhnrMsLwM848MbZoeSyR6kLMu/gnRsBtgJLb9x62rFoahc3RCZcQU
         UdYGQpd97ZzUJmB9RyojxvABjMxboI9fiNMhX4dzxXdlO1IuFET6SikbKz6X+RIB59pM
         hjbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/nGCKkYfJckWjtQDHrGmqAfeKE621bI4+5SiFBLzr8w=;
        b=Qez+GPSUrbDS9gTqcxe0rTRZlCdAoSKfhEMYKQn0sz5wrPJCuZW4CnMgjy8JUr1k+v
         p2TW5xw1tEt/EEI1eJQFdvK2vMfaXg2pWCP0omlyDD/U3hHSJEMFgc7W6QwuP8Ls8TPN
         7HYFA8q8qL7KoA4FxBw6fqGjjErc97aU+bl2uob5Z8IGSaXDo8dKVD/99k8a6aUXbTvK
         F/OdHXTS54NW1mtoXR0vk0DNSALXB46SjxXMVz9tpZ9qqbkN0Xbl1dMg2Cdw7O3RhVic
         9f61fqHEEbCmMRdigWyh/chr3HhDXnIsrKYIuPMxvPAS1OUOcVphYfuPWYHOK62XtpXR
         5IVA==
X-Gm-Message-State: AOAM533X9arI7ve1DE77ScXjEDTy+l7NJZCD3RnWapz+YYuuCzh0fOla
	2cfqleGy+o9J5jia4YEyyhk=
X-Google-Smtp-Source: ABdhPJwipfILAHh1MtoZP7KcMZajG5mHZyIdWjyutVWgLNiaRtxZUKmxZSlYuPYTkXtaQxv6zJzb7Q==
X-Received: by 2002:a05:6512:3184:b0:44a:78f2:500b with SMTP id i4-20020a056512318400b0044a78f2500bmr19313093lfe.434.1648984810166;
        Sun, 03 Apr 2022 04:20:10 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.67.247])
        by smtp.gmail.com with ESMTPSA id i13-20020a2e808d000000b0024b0d63079fsm482238ljg.50.2022.04.03.04.20.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Apr 2022 04:20:09 -0700 (PDT)
Message-ID: <8652baf2-212a-c843-fb69-f4fd4c216775@gmail.com>
Date: Sun, 3 Apr 2022 14:20:08 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] staging: r8188eu: Fix unsafe memory access by memcmp.
Content-Language: en-US
To: Charlie Sands <sandsch@northvilleschools.net>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <Ykdcv6Sm3oDE9IEp@sckzor-linux.localdomain>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <Ykdcv6Sm3oDE9IEp@sckzor-linux.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Charlie,

On 4/1/22 23:12, Charlie Sands wrote:
> This patch fixes sparse warnings about the memcmp function unsafely
> accessing userspace memory without first copying it to kernel space.
> 
> Signed-off-by: Charlie Sands <sandsch@northvilleschools.net>
> ---
>   drivers/staging/r8188eu/os_dep/ioctl_linux.c | 20 ++++++++++++--------
>   1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> index 7df213856d66..1cfac1b27eb7 100644
> --- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> +++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> @@ -3233,23 +3233,27 @@ static int rtw_p2p_get(struct net_device *dev,
>   			       struct iw_request_info *info,
>   			       union iwreq_data *wrqu, char *extra)
>   {
> -	if (!memcmp(wrqu->data.pointer, "status", 6)) {
> +	char wrqu_data_ptr[9];
> +	if (copy_from_user(wrqu_data_ptr, wrqu->data.pointer, 9))
> +		return 0;

-EFAULT is standard return value in case of `copy_{to_from}_user` failure



With regards,
Pavel Skripkin
