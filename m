Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD013D86
	for <linux-staging@lists.linux.dev>; Fri, 28 Jul 2023 06:16:07 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-99be4c6910aso21983366b.1
        for <linux-staging@lists.linux.dev>; Thu, 27 Jul 2023 23:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690524965; x=1691129765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ulD+jGAERfOBD4mt/Di4lPdx1Csw98WhuKZo73fBdX8=;
        b=qJlp/+OIBvM8DpMP7qbgBsja1aFwxPLSMRVPLB34OJOf6sMHBpEqLl8mS1KgbdOkMz
         1H8jKiMJ3yeUt7EbYPcJo293wZofNByvPYpDTQc13fLA2/AWFR33opRGPxCGe7nWDvlI
         W18+nFdg2Bc2ersWy91UKtlm2XT7a3bthNQYnxad90T0yc7T7ZRo7bmg/idWwqQpeZRE
         4pTMoMQnoI+E6Kf6vxI+LOJ7N94IWe8kTTebMMdAAYoXhbvyPLvv3XmLAQhxR5ftvkH4
         q/b906KvatDToadFNrXBYaau1pRADrjzd8RbutAKzeU3sWlSpfrwF8VmBC9aLa4dajtD
         gxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690524965; x=1691129765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ulD+jGAERfOBD4mt/Di4lPdx1Csw98WhuKZo73fBdX8=;
        b=EPuLzF5I8XgXVPQj98q2oE/n0XrSRnhrMzk/bMZgxkJKOn7t12WppNVOez6Mb0OgWc
         Wst4CSnpkBpuqSZbFbvvQUKqwcTucnfT6hH+2IHZITizf1hnh/0Sumy13v0Q+cI++NYr
         JJi+KWhMn16Y1VUiBrr69Mcs54TZK+8HOLjgkqnzyvqKFhbMWY2/bPVq3+iVkA5awvQ8
         WAZSLP0rFa0DSkxh3AA20BP/VbRbVtzSMG6+FUU4qVSSKH2MpkJT4dWbqUuk69fM+j32
         E1POLMc2dSTNKSjF9NsukyBMsR41ia8pygY5+sMtty4lHRS81xZUK8b4CP4baCtsrXIV
         FhBg==
X-Gm-Message-State: ABy/qLbCbJWmx/5NrmS7sK/10B93ppEsdyRFGD5khSOT6IZJM3sptrhy
	+tQtJpECUZwR82uK0lhzDzA=
X-Google-Smtp-Source: APBJJlFHa1n5RUu6Fkxms5HcSulXc3nohRDrQPmwIIBghyF0PnEOvLUeKqc89gxjeZp3otiaOkHq/g==
X-Received: by 2002:a17:906:51dd:b0:993:eed1:8f7 with SMTP id v29-20020a17090651dd00b00993eed108f7mr1150254ejk.3.1690524964961;
        Thu, 27 Jul 2023 23:16:04 -0700 (PDT)
Received: from [192.168.0.103] (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id t7-20020a1709063e4700b0098d15d170a0sm1633773eji.202.2023.07.27.23.16.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 23:16:04 -0700 (PDT)
Message-ID: <f4aaf5f5-a6b0-ef10-0d9b-fc52035ca309@gmail.com>
Date: Fri, 28 Jul 2023 08:16:03 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 0/5] Staging: rtl8192e: Function name cleanup series 1
To: Tree Davies <tdavies@darkphysics.net>, gregkh@linuxfoundation.org,
 anjan@momi.ca, error27@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230728054742.622297-1-tdavies@darkphysics.net>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20230728054742.622297-1-tdavies@darkphysics.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/28/23 07:47, Tree Davies wrote:
> Rename functions to fix checkpatch warning: Avoid CamelCase
> 
> 
> Changelist:
> v3: Changed patch #5, Rename global function ResetBaEntry to rtllib_reset_ba_entry
> v2: Sent to mailing list via git send-email, patches are the same.
> 
> Tree Davies (5):
>    Staging: rtl8192e: Rename function ActivateBAEntry
>    Staging: rtl8192e: Rename function DeActivateBAEntry
>    Staging: rtl8192e: Rename function TxTsDeleteBA
>    Staging: rtl8192e: Rename function RxTsDeleteBA
>    Staging: rtl8192e: Rename function ResetBaEntry
> 
>   drivers/staging/rtl8192e/rtl819x_BAProc.c | 44 +++++++++++------------
>   drivers/staging/rtl8192e/rtl819x_TSProc.c |  6 ++--
>   drivers/staging/rtl8192e/rtllib.h         |  2 +-
>   3 files changed, 26 insertions(+), 26 deletions(-)
> 
Hi Tree,

those patches have been accepted and cannot be applied again.

commit c928e84ce577262da288c0178c8c77620ba8b430 (HEAD -> 
staging-testing, origin/staging-testing)
Author: Tree Davies <tdavies@darkphysics.net>
Date:   Wed Jul 26 23:19:47 2023 -0700

     Staging: rtl8192e: Rename function RxTsDeleteBA

     Rename function RxTsDeleteBA to rx_ts_delete_ba in order to Fix 
checkpatch
     warning: Avoid CamelCase

     Signed-off-by: Tree Davies <tdavies@darkphysics.net>
     Link: 
https://lore.kernel.org/r/20230727061948.579480-5-tdavies@darkphysics.net
     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

commit 7b31905582358d566332182653a4e5552dba1574
Author: Tree Davies <tdavies@darkphysics.net>
Date:   Wed Jul 26 23:19:46 2023 -0700

     Staging: rtl8192e: Rename function TxTsDeleteBA

     Rename function TxTsDeleteBA to tx_ts_delete_ba in order to Fix 
checkpatch
     warning: Avoid CamelCase

     Signed-off-by: Tree Davies <tdavies@darkphysics.net>
     Link: 
https://lore.kernel.org/r/20230727061948.579480-4-tdavies@darkphysics.net
     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

commit 8dd56eaa9450fb19f6bcc73956b3b1477331d28b
Author: Tree Davies <tdavies@darkphysics.net>
Date:   Wed Jul 26 23:19:45 2023 -0700

     Staging: rtl8192e: Rename function DeActivateBAEntry

     Rename function DeActivateBAEntry to deactivate_ba_entry in order 
to Fix
     checkpatch warning: Avoid CamelCase

     Signed-off-by: Tree Davies <tdavies@darkphysics.net>
     Link: 
https://lore.kernel.org/r/20230727061948.579480-3-tdavies@darkphysics.net
     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

commit ca77687ae3f6d65fb26a0e1f93b54753af3581fc
Author: Tree Davies <tdavies@darkphysics.net>
Date:   Wed Jul 26 23:19:44 2023 -0700

     Staging: rtl8192e: Rename function ActivateBAEntry

     Rename function ActivateBAEntry to activate_ba_entry in order to Fix
     checkpatch warning: Avoid CamelCase

     Signed-off-by: Tree Davies <tdavies@darkphysics.net>
     Link: 
https://lore.kernel.org/r/20230727061948.579480-2-tdavies@darkphysics.net
     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


Bye Philipp
