Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137184C62
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 17:20:14 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id l14so5537541eja.7
        for <linux-staging@lists.linux.dev>; Fri, 09 Sep 2022 10:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=VNJB3n4FUi+BHktH6vzQujwSPpO94XEVY5hhJm3auuk=;
        b=n1oW3uTx5XQ+9CsTanRj1ei6pfz0sPENUkGDfzIkKq5TUi3LzHtWhRYedTagb6m5wr
         Z9AQLYW3+wHogDcXUiax4vSS5mEFRQvLLggCh7bfxjTuTCAhVJk9ortTBnfpFeq486Eu
         O1D+EhVr7T0z9pO0N9mRcc3Ab7CcwM60iyDDSoNic9B1M0yYYp5TmqktexJc96HRbDg5
         qow0fTO4rmNoAtgh69YmLrKY4zBl5Yw1YX+dT4l/m67rYMxiP4bSJsuvIVGX7J+qh6Gg
         BwisT/8bi/nO5Pf9J8YKTCsh1zFg1rJzL1bU3LlNy6M86x/pYIldXIHcHwj7PquZQLS/
         CzeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=VNJB3n4FUi+BHktH6vzQujwSPpO94XEVY5hhJm3auuk=;
        b=TNNkRRNelZgGt2CnkxrXyJ2VGO4l8pUYe18I0AEKeboxuzsD3tPkCbI7Egt8Mq1A9h
         PMJzZ6re4AKToHfSOnOwQl2j2FQefY64Y+pnOwRHBF5cvM2KQfFvgqLJfec8A1w4PoLY
         X3zuhZABda8/Hqeq4W1AdCEfFzx9pas7kFHYh+tIdnLYCRRyQJC/Q0dPC7t9/u/fXR4n
         DuBWY7NNAfdhWsArhKgohnmKxFdF8i/dEiVStJvf020h4tbq+iT2VKICtKrszDl18OVu
         SQXMxa9ZVCu0ffzXXtIenByMkyzhIPZkDGPwg46mUAvayF+dYTsPSOqlgP06ElJfnh1y
         ZUAg==
X-Gm-Message-State: ACgBeo0m82W14ZA2GQxBTYZhOB9kQiOXFBj60V9KCwlTQrrtiyOSoMq8
	yhaXTo2uHyorPCjScaguzKyxmalenSE=
X-Google-Smtp-Source: AA6agR5chadUkv5bhym96Don8egp9jM+IYDc2Zi0yDo26xtYcyfjpYArncrSs7Ou54Ucj6ifzdkGgg==
X-Received: by 2002:a17:906:5a64:b0:741:3586:92f with SMTP id my36-20020a1709065a6400b007413586092fmr10732962ejc.721.1662744013125;
        Fri, 09 Sep 2022 10:20:13 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f3e:6a99:2499:da3b:c93f:9b48? (p200300c78f3e6a992499da3bc93f9b48.dip0.t-ipconnect.de. [2003:c7:8f3e:6a99:2499:da3b:c93f:9b48])
        by smtp.gmail.com with ESMTPSA id f10-20020a170906048a00b0073d83f80b05sm528314eja.94.2022.09.09.10.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 10:20:12 -0700 (PDT)
Message-ID: <a0c8fa9d-cc86-b39b-e65f-e8a0ccf12a15@gmail.com>
Date: Fri, 9 Sep 2022 19:20:09 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] staging: rtl8192e: Fix return type for implementation of
 ndo_start_xmit
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Dan Carpenter <error27@gmail.com>, GUO Zihua <guozihua@huawei.com>
References: <20220908203243.GA23048@matrix-ESPRIMO-P710>
 <YxrxywN9wDypohyY@kroah.com> <YxryqJs4k3B26/7o@kroah.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <YxryqJs4k3B26/7o@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/9/22 10:00, Greg Kroah-Hartman wrote:
> On Fri, Sep 09, 2022 at 09:56:59AM +0200, Greg Kroah-Hartman wrote:
>> On Thu, Sep 08, 2022 at 10:32:43PM +0200, Philipp Hortmann wrote:
>>> CFI (Control Flow Integrity) is a safety feature allowing the system to
>>> detect and react should a potential control flow hijacking occurs. In
>>> particular, the Forward-Edge CFI protects indirect function calls by
>>> ensuring the prototype of function that is actually called matches the
>>> definition of the function hook.
>>>
>>> Since Linux now supports CFI, it will be a good idea to fix mismatched
>>> return type for implementation of hooks. Otherwise this would get
>>> cought out by CFI and cause a panic.
>>>
>>> Use enums from netdev_tx_t as return value instead, then change return
>>> type to netdev_tx_t.
>>>
>>> Suggested-by: Dan Carpenter <error27@gmail.com>
>>> Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
>>> ---
>>> Tested with rtl8192e
>>> Transferred this patch over wlan connection of rtl8192e
>>> ---
>>>   drivers/staging/rtl8192e/rtllib.h    |  2 +-
>>>   drivers/staging/rtl8192e/rtllib_tx.c | 10 +++++-----
>>>   2 files changed, 6 insertions(+), 6 deletions(-)
>>
>> Someone sent the same patch before you did:
>> 	https://lore.kernel.org/r/20220905130053.10731-1-guozihua@huawei.com
>>
> 
> This patch does not apply to my tree either :(
> 
> Please rebase and resubmit.
> 
> thanks,
> 
> greg k-h


Sorry Greg,

I cannot find my error.
I just downloaded the patch and applied it to the staging-next branch 
and that worked fine.

Please find my logs below:


kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$ git remote 
show origin
* remote origin
   Fetch URL: 
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
   Push  URL: 
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
   HEAD branch: master
   Remote branches:
     bus_cleanup     tracked
     greybus         tracked
     main            tracked
     master          tracked
     staging-linus   tracked
     staging-next    tracked
     staging-octeon  tracked
     staging-testing tracked
   Local branches configured for 'git pull':
     master          merges with remote master
     staging-next    merges with remote staging-next
     staging-testing merges with remote staging-testing
   Local refs configured for 'git push':
     master          pushes to master          (up to date)
     staging-next    pushes to staging-next    (up to date)
     staging-testing pushes to staging-testing (local out of date)


kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$ git pull
Already up to date.


kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$ git branch -a
   checkout
   master
* staging-next
   staging-testing
   remotes/origin/HEAD -> origin/master
   remotes/origin/bus_cleanup
   remotes/origin/greybus
   remotes/origin/main
   remotes/origin/master
   remotes/origin/staging-linus
   remotes/origin/staging-next
   remotes/origin/staging-octeon
   remotes/origin/staging-testing


kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$ cat 
~/Downloads/PATCH-staging-rtl8192e-Fix-return-type-for-implementation-of-ndo_start_xmit.txt 
| git am
Applying: staging: rtl8192e: Fix return type for implementation of 
ndo_start_xmit


kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$ git log
commit 1990e48f8e9fef88e044e65918566bd87f274b1c (HEAD -> staging-next)
Author: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Date:   Thu Sep 8 22:32:43 2022 +0200

     staging: rtl8192e: Fix return type for implementation of ndo_start_xmit

     CFI (Control Flow Integrity) is a safety feature allowing the system to
     detect and react should a potential control flow hijacking occurs. In
     particular, the Forward-Edge CFI protects indirect function calls by
     ensuring the prototype of function that is actually called matches the
     definition of the function hook.

     Since Linux now supports CFI, it will be a good idea to fix mismatched
     return type for implementation of hooks. Otherwise this would get
     cought out by CFI and cause a panic.

     Use enums from netdev_tx_t as return value instead, then change return
     type to netdev_tx_t.

     Suggested-by: Dan Carpenter <error27@gmail.com>
     Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>

commit 28a2a54901f66a45ab339e944fdfc69667e639c1 (origin/staging-next, 
staging-testing)
Merge: 7bd581f3c263 7e18e42e4b28
Author: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date:   Mon Sep 5 07:57:37 2022 +0200

     Merge 6.0-rc4 into staging-next

     Resolves the merge issue with:
             drivers/staging/r8188eu/os_dep/os_intfs.c

     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

commit 7e18e42e4b280c85b76967a9106a13ca61c16179 (tag: v6.0-rc4, 
origin/staging-linus, origin/main)


Or have you applied the patch already from GUO Zihua <guozihua@huawei.com>?

When I would have seen that GUO Zihua has send that patch already I 
would not have send it. Sorry.

Thanks for your support.

Bye Philipp
