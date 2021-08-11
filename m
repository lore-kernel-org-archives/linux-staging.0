Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1840F177
	for <linux-staging@lists.linux.dev>; Wed, 11 Aug 2021 06:39:57 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id g138so1135128wmg.4
        for <linux-staging@lists.linux.dev>; Tue, 10 Aug 2021 23:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cmfIb0rfZ8OajcQAfXM5Dv+4gR8K8sf2e4DEU0yVO0Q=;
        b=YGrxiAjBhoWOmWo5j025rIfB824lFLwQ+xjKxk8Hu7gBmMpgF2D9BqrGnKQgfh2TCe
         R9cTRo/Y1XMM23s1ySJEW/62FdcjxzuvseKZZosRhF3Mq6HTG5Y3csHNtPw29cGqnX5e
         QbcM+znkrvVcRQuJbikSBTgQFelixsdCW1aRwMRUfUepwEJS3TPpqthlQ71z0irzqJBX
         aLKkRmYsqFVyfSDbYgtOpuWwh9OPTurCcsIMM5n1hVSqMVQLCWqdbQXrevx47iL6ULvo
         b80DApIv3QOevv5gEaCrad9+gOCmSoeCQalM0T/9YrGRj3N4+2XBN0+IjzEECW0Xdpim
         WK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cmfIb0rfZ8OajcQAfXM5Dv+4gR8K8sf2e4DEU0yVO0Q=;
        b=baVEZMwkCjBELU6u/40A9D568spgCPXuEn7kxc5EuWLIeGjk8tdXcL+PT+4nEs0vUZ
         wGxtrxirkE3iMOUFz/EZo+j5eUgYd+QD8mza+LGNYsN5phdMNcnvGfKQr3nTpLChFJXF
         csiI/t4UiAGRYlYlGFaGCR7kyG/Yb81gP91JeKgko1XsIxYM6XqLf/IfN+bUPga5Bs3a
         GBkPUHyb95qDF1ANYAnPzQyauH0/U5/thxbt2oSumqu5hj8z8wHASPqGx1n0g4EbB1Ar
         28R8G3ZRf+ucDCaKQ7DAedAHv1yNUBVr+yLf1GVi1GHw1LAsqYfyYxAWFi1bgy5RQI9W
         US+g==
X-Gm-Message-State: AOAM533C74Y0F6BxQ+rDlf2qZ/7igCCaVuhdono235z0VxTPh8WZXulp
	FBJgULkW5BF3qG0esLpgXSg=
X-Google-Smtp-Source: ABdhPJykimIynP8A12fgkSUmxJ7HMSw3E9OvNUrTrXt24IpAaX5tam+FO+i+iDVf6AVMAJgDxT9cZg==
X-Received: by 2002:a05:600c:3b94:: with SMTP id n20mr25252155wms.54.1628663995413;
        Tue, 10 Aug 2021 23:39:55 -0700 (PDT)
Received: from ?IPv6:2a02:8108:96c0:3b88::2571? ([2a02:8108:96c0:3b88::2571])
        by smtp.gmail.com with ESMTPSA id q5sm25856759wrx.33.2021.08.10.23.39.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Aug 2021 23:39:55 -0700 (PDT)
Subject: Re: [PATCH 0/8] staging: r8188eu: cleanup several warnings
To: Phillip Potter <phil@philpotter.co.uk>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20210810235047.177883-1-phil@philpotter.co.uk>
From: Michael Straube <straube.linux@gmail.com>
Message-ID: <37fc4e87-3131-eb54-d47d-8ed4dc85e983@gmail.com>
Date: Wed, 11 Aug 2021 08:39:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210810235047.177883-1-phil@philpotter.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/11/21 1:50 AM, Phillip Potter wrote:
> This series does a lot of cleanup, and came about due to me noticing
> that the Makefile contains several lines that silence build warnings
> about unused variables, functions and so on.
> 
> It accomplishes does three things therefore:
> (1) Removes the unused functions no longer called by rtw_ioctl, which
>      was deleted in a previous patch (with the exception of the android
>      code, which I will add back in once ndo_siocdevprivate is merged in).
> (2) Cleanup all build warnings resulting from removing the offending
>      Makefile lines.
> (3) Remove the offending Makefile lines so that future build warnings
>      can be caught locally before submission as well.
> 
> Phillip Potter (8):
>    staging: r8188eu: remove unused functions from os_dep/ioctl_linux.c
>    staging: r8188eu: remove unused oid_null_function function
>    staging: r8188eu: remove unused label from recv_indicatepkt_reorder
>    staging: r8188eu: remove rtw_mfree_sta_priv_lock function
>    staging: r8188eu: remove unused variable from rtl8188e_init_dm_priv
>    staging: r8188eu: remove unused variable from rtw_init_drv_sw
>    staging: r8188eu: remove unused variable from rtw_init_recv_timer
>    staging: r8188eu: remove lines from Makefile that silence build
>      warnings
> 
>   drivers/staging/r8188eu/Makefile             |    9 -
>   drivers/staging/r8188eu/core/rtw_recv.c      |    2 -
>   drivers/staging/r8188eu/core/rtw_sta_mgt.c   |    9 -
>   drivers/staging/r8188eu/hal/rtl8188e_dm.c    |    1 -
>   drivers/staging/r8188eu/include/rtw_ioctl.h  |    6 -
>   drivers/staging/r8188eu/os_dep/ioctl_linux.c | 1538 ++----------------
>   drivers/staging/r8188eu/os_dep/os_intfs.c    |    1 -
>   drivers/staging/r8188eu/os_dep/recv_linux.c  |    2 -
>   8 files changed, 127 insertions(+), 1441 deletions(-)
> 

Acked-by: Michael Straube <straube.linux@gmail.com>

Michael
