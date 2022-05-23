Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE3B2F2E
	for <linux-staging@lists.linux.dev>; Mon, 23 May 2022 17:41:15 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id z17so2382962wmf.1
        for <linux-staging@lists.linux.dev>; Mon, 23 May 2022 10:41:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nqWcOyn3PXt1X1nKWcFnT+4sHBA6gWKtV/kf9MDUA7o=;
        b=1q50GKXg6W3esdHJLKOUH4RDdroPuz2JntYun8oHwqpsExgsekTU0r9UN5TV3IeCrW
         hPuOzD+q1Z0RbBq7YLmQrQpp2VJHr4F26THv8tHFc6PzE9hlCsKtKcFm7jV/W3OeiDM4
         pLSlM67kAHDSzLurLYpsQG265OJKIDu8Mmjb572a9+8SYv/zh8eS/orBuTqiYKIEfjRx
         1yYkwl599DHmHLviJIocpgZZFoe6Q98wOkTq3dE8S0ValDaQQivR+gEW4lXWmPbVu4vi
         svZHsNuXPKL9UHON6Ilv8RedKNMsuuh6nwb9OmTvST4T5VjXZqvCXyw7VesEVd2pMPU7
         YCyA==
X-Gm-Message-State: AOAM531oszmDNyNuljzJt8VnD/qR5UGYeNNZr5t8jv3GK36Y6hGm6uxd
	q+pEovV6TLMtZ3bN0oHcRjk=
X-Google-Smtp-Source: ABdhPJyEdWzCn0L2yyxPQcLUSRH/1H0nuvgdYiTusbHGyusRpWesuhpMBx3CwF3sI0evb0YKQ8o3zg==
X-Received: by 2002:a05:600c:4fd3:b0:394:7fa6:2584 with SMTP id o19-20020a05600c4fd300b003947fa62584mr96129wmq.177.1653327674307;
        Mon, 23 May 2022 10:41:14 -0700 (PDT)
Received: from [192.168.1.126] ([94.205.35.240])
        by smtp.gmail.com with ESMTPSA id x1-20020a1c7c01000000b00397122e63b6sm9334328wmc.29.2022.05.23.10.41.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 10:41:13 -0700 (PDT)
Message-ID: <22589460-930c-b307-acf0-2a49f5f5261f@linux.com>
Date: Mon, 23 May 2022 21:41:09 +0400
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5.10] staging: rtl8723bs: prevent ->Ssid overflow in
 rtw_wx_set_scan()
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 dan.carpenter@oracle.com, straube.linux@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, stable <stable@vger.kernel.org>
References: <YoZk3YLEDYKGG5xe@kroah.com>
 <20220520035730.5533-1-efremov@linux.com> <YounkTGwmcQns3vy@kroah.com>
From: Denis Efremov <efremov@linux.com>
In-Reply-To: <YounkTGwmcQns3vy@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/23/22 19:26, Greg KH wrote:
> On Fri, May 20, 2022 at 07:57:30AM +0400, Denis Efremov (Oracle) wrote:
>> This code has a check to prevent read overflow but it needs another
>> check to prevent writing beyond the end of the ->Ssid[] array.
>>
>> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
>> Cc: stable <stable@vger.kernel.org>
>> Signed-off-by: Denis Efremov (Oracle) <efremov@linux.com>
>> ---
>>  drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> And only 5.10 needs this?  What about all other kernel branches?
> 

From 5.10, 5.4, 4.19, to 4.14.

There is a small spaces conflict in 5.4-4.14 kernels because of
c77761d660a6 staging: rtl8723bs: Fix spacing issues

I sent another patch to handle it.

Thanks,
Denis
