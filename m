Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD35072
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 14:59:21 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id c21so41279915edj.0
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 07:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=niEaq0kKF0iBjZuQ5Wc+yWHyu7KChWeCovcL9cnN++E=;
        b=N/E/clcVaUzIw1MZ0BMtPR/SsYJsDQgTVU0UloalL7Zpu93go3m/VVNuynwUkYmnKD
         VDmtJl1yEuHfvfiy8+gP6y7HS7D9eZ73qXzixTXLM7Q+M6zdDoaubXKejHqK2xjPnm0Z
         jli4RluD89eVd3ix1GPF/lsPe00z2n6E+bLhK2rcVHKz4NbNv85UAs7qt+3ve588ykFl
         PxMcBZJZgAah8bE4dnBHJBZtL8BHMvTfq0dJkvNq4TZch+9dvpwnhqp9LWPdrff54V8Z
         ZQfbL9meWdiyjj41mP8taNDbvrvhN9dWuaf8EdompyZ98N8xmpadXcs/dsTqRrppMXwB
         lLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=niEaq0kKF0iBjZuQ5Wc+yWHyu7KChWeCovcL9cnN++E=;
        b=v5U/wygMS62611FkqgN4+5F21mgVO7rLodI19fWfzUHtm7qvYiLXiKtLE/0RQN4piG
         j9Aw9ITD5y33PgzC0PN8u7pywL1M8rjxujoImtJm77fCI3gS5dK/HchcilkkET5bWbRS
         xPCPUyHNRFWMLUW4U5Pgfhed3tcIGwPqzH5cXpzSdX0fdC1W7zNcnuSejzIa5ogyedYR
         2P2FR2DkXHF/p1GQ4VQ6/+++PhiMNP/lCjVhUWDVugBIpropeRZV15KWSzebg1/83hQ3
         3Wrkv07I6tHyuLO4OHuhtkYlbavAFyOdWsTcOQY/nOpA9bH8OsxBoXY/fOSkrCU6wWif
         xbyg==
X-Gm-Message-State: AOAM531wwijcyBhdp3qG+FY4HP7iNFh4zNAUa5SCsb3kPwDF3E7ul2Dr
	kt+U3bDzZC7TqPO0+hYiJts=
X-Google-Smtp-Source: ABdhPJyIRbr3ljVCgKs9CgAY+OiUSwsCODmJaBh0YO2QVEQe4grRflUHFfO3/Ww/OwuebG+if21TdA==
X-Received: by 2002:a50:d802:: with SMTP id o2mr18734216edj.95.1631977160139;
        Sat, 18 Sep 2021 07:59:20 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::cde? ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id p11sm3723781ejb.61.2021.09.18.07.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Sep 2021 07:59:19 -0700 (PDT)
Message-ID: <deba6fb6-8b6e-6b7e-67b2-53be87d9ac7a@gmail.com>
Date: Sat, 18 Sep 2021 16:59:18 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 1/2] staging: r8188eu: brfoffbyhw is always false
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20210911161019.26881-1-martin@kaiser.cx>
 <20210918135722.23976-1-martin@kaiser.cx>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20210918135722.23976-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/21 15:57, Martin Kaiser wrote:
> As a consequence of the bHWPwrPindetect removal, brfoffbyhw is never set
> to true any more. Remove the variable and code that depends on
> brfoffbyhw == true.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
> v3:
> - another rebase against today's staging-testing branch
> 
> v2:
> - rebased against today's staging-testing branch
> 
>   drivers/staging/r8188eu/include/rtw_pwrctrl.h | 1 -
>   drivers/staging/r8188eu/os_dep/ioctl_linux.c  | 7 -------
>   drivers/staging/r8188eu/os_dep/usb_intf.c     | 1 -
>   3 files changed, 9 deletions(-)
> 

Looks good to me.

Acked-by: Michael Straube <straube.linux@gmail.com>

Thanks,
Michael

