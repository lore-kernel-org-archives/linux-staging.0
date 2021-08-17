Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A786D19
	for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 12:25:41 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id w5so38257446ejq.2
        for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 05:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ehYfeCKaZsQiuL6rOGdqMuEfjMSHQFgZSBwxefedO90=;
        b=uOi0pVyKP8I+9XLD80J6lRFU/URewMGwoILyautsas/7KScjvsQ/U24ZZeS/IZe6mE
         bB+xh+CzSBYsE9jtPcONi6dhkOwV52vljKiPZtWrdNkv7SqSMP1FVHnR8eRMwDJLCLGJ
         p/v54ufwgiOe49rYEHXbp5bS5C6PdLTqUvMiCgT2jbZcwrZlMnR9cWTziTlG/Xk7VkfR
         IlsgeO0GJNYgK/pR3/SfGmAwYwJ+0lRGvH5ikwVpf0+5IhT1eZp86KxZYEnIDMv46UvU
         WfMz8DRRKfwdPCt0LsyOqWLjT4EgLnxO42HuP/WAjOJpw9dy5rQGQYdx5e7dxnUlxt2Q
         9ubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ehYfeCKaZsQiuL6rOGdqMuEfjMSHQFgZSBwxefedO90=;
        b=Sumksu1jDTFEv9yEqLLw0qVTr7IYmwo6CnWG9jr2mNnwHulbJjm8EVn29vzbsbu4G1
         Y4ceUkUHWcnZNbgf8bBc0yQiFdAoKF+9R7w0BYYRUpvH0bMv+rRlFKpmDfPmXkOPX5i/
         EdUEAB6VE8ohi3KOFCv7JdWb6KxlQCLnUMnK/hiG15bk0sJAagJ5pSGL1rzKiNiOmENi
         +HKH/k5nOa33YbMi6XrkWd6zW8b3wG6iz6MT+oQrwWKac5B4mAr6eD+zsY1csay4dnd0
         mACTqj+KT5XghTIqDKVFmiO2DPebQkzHlJQeF5OzB3Z6PIz3bogrkypvnEeAAhf/K/r5
         PakQ==
X-Gm-Message-State: AOAM531s6vyWLUMeseXbdD3qqnCm4j4HfaMa+H6IUredmp9IQ2SRmwaT
	Qv7vQp5qRNfDiSAuTNVDFJ4=
X-Google-Smtp-Source: ABdhPJz2jR99RTYzwyYyOWmwz/pDZkm5zDnz/Dr62exWVt/yY0MzHyzp/wlvaHHQ/vjLMc+OZFs4jg==
X-Received: by 2002:a17:906:6d11:: with SMTP id m17mr3719942ejr.325.1629203139609;
        Tue, 17 Aug 2021 05:25:39 -0700 (PDT)
Received: from ?IPv6:2a02:8108:96c0:3b88::687e? ([2a02:8108:96c0:3b88::687e])
        by smtp.gmail.com with ESMTPSA id q18sm702041ejc.84.2021.08.17.05.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Aug 2021 05:25:39 -0700 (PDT)
Subject: Re: [PATCH] staging: r8188eu: Remove LINUX_VERSION_CODE check
To: Cai Huoqing <caihuoqing@baidu.com>, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, gregkh@linuxfoundation.org, martin@kaiser.cx,
 insafonov@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20210817081204.2232-1-caihuoqing@baidu.com>
From: Michael Straube <straube.linux@gmail.com>
Message-ID: <20992337-fac8-64c8-887f-ee4cd79bf391@gmail.com>
Date: Tue, 17 Aug 2021 14:24:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210817081204.2232-1-caihuoqing@baidu.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/17/21 10:12 AM, Cai Huoqing wrote:
> no need to check linux version, depending on the latest version
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>   drivers/staging/r8188eu/core/rtw_mlme.c      |  5 ----
>   drivers/staging/r8188eu/os_dep/os_intfs.c    | 26 ++------------------
>   drivers/staging/r8188eu/os_dep/rtw_android.c |  6 -----
>   drivers/staging/r8188eu/os_dep/xmit_linux.c  |  6 -----
>   4 files changed, 2 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
> index 5088b555f55d..ef9d5ad17632 100644
> --- a/drivers/staging/r8188eu/core/rtw_mlme.c
> +++ b/drivers/staging/r8188eu/core/rtw_mlme.c
> @@ -3,7 +3,6 @@
>   
>   #define _RTW_MLME_C_
>   
> -#include <linux/version.h>
>   #include "../include/osdep_service.h"
>   #include "../include/drv_types.h"
>   #include "../include/recv_osdep.h"
> @@ -1499,11 +1498,7 @@ void rtw_dynamic_check_timer_handlder(struct adapter *adapter)
>   

Hi Cai,

the LINUX_VERSION_CODE checks already have been removed in commit

027ed956b526 ("staging: r8188eu: remove kernel version depended code paths")

But I forgot to remove the <linux/version.h> includes, nicely spotted.
You can send a patch that removes them. :)

Thanks,
Michael
