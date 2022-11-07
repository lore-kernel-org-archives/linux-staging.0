Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5308A23AA
	for <linux-staging@lists.linux.dev>; Mon,  7 Nov 2022 06:22:40 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id y14so27332629ejd.9
        for <linux-staging@lists.linux.dev>; Sun, 06 Nov 2022 22:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lnpRV+RKEKi831sEC3+boeMrq5kKsgR7b+4traW7Org=;
        b=LTio5AnZiJ2/ECwsKEgwzly/F/6/pPkpSNvRDR84K1GY8nYgYtl+Y0lecthSm1sL/z
         vMTPFVBXb25gibDplG0tti8QNrydsABbz0YBWaft8cDnQtLNed3I5zFQf5HkfXiaXIRZ
         ZNeAWQbQlT5pf/KyX0+lsxNkm6kcW17wVRVj9AlLhD8aIQ9D6ZO07XWUtwNjE0BifgIW
         aST8fyXyLX2xtAchYtC03bOfzX8ff1QMC9ZDES5npnnqrDjPfQBzQxDs/t+ni1lfZVjO
         4p+g86n0oILL4/vheWb4ao7Tn3gqV+w4jMsn+35AigsdD50SATt2YmN0z0X5IzdUHT4m
         K70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lnpRV+RKEKi831sEC3+boeMrq5kKsgR7b+4traW7Org=;
        b=cDjS2bolc7xEOawMXbcBB2RcGvpzT6F4eGA5jSMGX3oFPat3s+yfylzy2TIgU8/OTg
         TXH631B3KRl8CwZzITl0KX+5MXj9dXkh8CO8PSIyESX0Q/gZv40p41LcpvFcRojWQAXs
         00Y5lHIYHM6nk0XwU19Sn31PXr+ckfJ8nRT435gJVIOHwuIT8EKC9PBVdd12qKYhcNay
         qjvWq0X7oXHiirVRRHWmFiLssjhy+B/cJr6BWXa6vc+lVe51ABA4MFtubY6IoVIUqGau
         dJLwjMS73Rc4f/VDTqH8+ozbPFEJdJ3AREiDZe3c29HcvC+KANHXl7piYXZ384G0Gb8b
         tcWw==
X-Gm-Message-State: ACrzQf29dmdBm1LSKy85iYkEIBRfBi9HuGb5GpQtLc70VFMDrRiwsuOD
	gZ5DyuLlKk2qwl1aNs+1NNM=
X-Google-Smtp-Source: AMsMyM6NnAjqds3G9LPHWrxbJamVxExt9r9JQadQSnok2snF/zjbOghyJoO3Aif0t6lax3wZMlOK+g==
X-Received: by 2002:a17:907:25c5:b0:782:978d:c3da with SMTP id ae5-20020a17090725c500b00782978dc3damr44530343ejc.623.1667802158385;
        Sun, 06 Nov 2022 22:22:38 -0800 (PST)
Received: from [192.168.1.100] (p54a07888.dip0.t-ipconnect.de. [84.160.120.136])
        by smtp.gmail.com with ESMTPSA id u12-20020a170906068c00b007919ba4295esm2917783ejb.216.2022.11.06.22.22.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Nov 2022 22:22:38 -0800 (PST)
Message-ID: <e6fc2b31-146c-b5bc-dd7a-17ce95f8ed07@gmail.com>
Date: Mon, 7 Nov 2022 07:22:34 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/9] staging: r8188eu: another round of cleanups
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20221106124901.720785-1-martin@kaiser.cx>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221106124901.720785-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/22 13:48, Martin Kaiser wrote:
> Here's another patch set with several cleanups throughout the driver.
> 
> Martin Kaiser (9):
>    staging: r8188eu: don't store addba request
>    staging: r8188eu: remove some obsolete comments
>    staging: r8188eu: reorder assignments, clarify the header format
>    staging: r8188eu: reformat a function header
>    staging: r8188eu: remove state checks in rtw_led_control
>    staging: r8188eu: clean up rtw_hal_init
>    staging: r8188eu: remove get_fwstate
>    staging: r8188eu: merge two rtw_free_network_nolock functions
>    staging: r8188eu: remove checks in dump_mgntframe
> 
>   drivers/staging/r8188eu/core/rtw_led.c        |  3 +-
>   drivers/staging/r8188eu/core/rtw_mlme.c       | 23 ++++++---------
>   drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 28 ++++++++-----------
>   drivers/staging/r8188eu/core/rtw_recv.c       |  2 --
>   drivers/staging/r8188eu/hal/hal_intf.c        | 19 +++++--------
>   .../staging/r8188eu/hal/rtl8188e_hal_init.c   |  6 +---
>   drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c | 15 ++++------
>   drivers/staging/r8188eu/include/rtw_mlme.h    |  7 -----
>   .../staging/r8188eu/include/rtw_mlme_ext.h    |  4 +--
>   drivers/staging/r8188eu/include/wifi.h        |  8 ------
>   10 files changed, 36 insertions(+), 79 deletions(-)
> 
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
