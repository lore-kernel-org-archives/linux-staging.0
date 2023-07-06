Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500A563BA
	for <linux-staging@lists.linux.dev>; Thu,  6 Jul 2023 20:49:01 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2b6c3e23c5fso3032131fa.0
        for <linux-staging@lists.linux.dev>; Thu, 06 Jul 2023 13:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688676539; x=1691268539;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GThZ4Ggr15+pqAxnjvQ9kC8BtTk0gsdP1wNAHgEDJFo=;
        b=HxuOF9aF7fpVGvklE/EfYzn18Uu4zZnT56MUJ8z9GLWccoq4ZAc5ltJjTUAMP9TEgz
         cd9BcYsX/dTBgSXpACCHgcG/tNveEdwq3vOVG99ilif9Bzys5ubyj4mFecMkAIS4AD/9
         kX33TgOh1chkHquSf+pi2frP6jScMJu9auR9AQKNHbtWQLe/g1VcXZaKLZjmtJq8YCi6
         C/4RlHFSAFKQdi8lWRniNCtJ2Odk8IL8p5l8LY53yukgmc4rS8dfJRz/Lw0geTeZnoPL
         LaP7GAub5mttCqfSwc7O2tdFueSmq12ZxN6oa5CB5lZLC7i7XvuzJxiWHc2zrtfV84zA
         Lr9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688676539; x=1691268539;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GThZ4Ggr15+pqAxnjvQ9kC8BtTk0gsdP1wNAHgEDJFo=;
        b=UDwpH+6aA6bAD967xZKZA4JjXcjjfyCiA3XgoEuHjWHZzmfunoXbARZFPHVLEM6o35
         6ncZ/uppsVV/Dfxn4zTnfSZMkfvJPj8a+JInnv5ByecjbxZ17v0hTg6u4V8A7sGVuhqG
         QUhnDFwm8lFSsSdQXG/hcjDtC6jEGctVExJRu6J59dP0jSfj2ptdtb+/7RYrHOu+DOv5
         KgV2sRDDFnD9wNt7+KFzcy0iZXOiqLKae6pOpsI23SPVJc98KdY08d7J1RDVjnltjmCN
         yTu2K4I5C4MavbV/IC2QhnHTKwiB/H7GFlLNUAtTCmY51sr9sqo+bAxEldkeZ+JpM7Ze
         +78A==
X-Gm-Message-State: ABy/qLZR/pXEwhlCjtVGW+A0ViGuLaVMU5mjuW1yPWOrpt0O95EEfK87
	sS/+r+oWoLiQZY2y2Zeypyg=
X-Google-Smtp-Source: APBJJlHH8LCapShEIup2bqszsjZ/kGTp0spSi0HkqSsEF4l8ErdI9N4ncbf5ZYHa8fsZfkFRbJE3ig==
X-Received: by 2002:a2e:a10b:0:b0:2b6:9a47:c4bd with SMTP id s11-20020a2ea10b000000b002b69a47c4bdmr2288618ljl.1.1688676538550;
        Thu, 06 Jul 2023 13:48:58 -0700 (PDT)
Received: from [192.168.0.103] (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id s26-20020a170906355a00b00992b2c5598csm1249745eja.128.2023.07.06.13.48.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 13:48:57 -0700 (PDT)
Message-ID: <6dee04ae-4129-cd7c-0d31-70d29b86c8ff@gmail.com>
Date: Thu, 6 Jul 2023 22:48:56 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] staging: rtl8192e: Rename variable bCurrentHTSupport
Content-Language: en-US
To: Tree Davies <tdavies@darkphysics.net>, gregkh@linuxfoundation.org,
 dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <ZKYgH/BvkE9bdcPm@kimchi.darkphysics>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <ZKYgH/BvkE9bdcPm@kimchi.darkphysics>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/6/23 03:59, Tree Davies wrote:
> This patch renames variable bCurrentHTSupport to bcurrent_ht_support
> to fix checkpatch warning Avoid CamelCase.
> 
> Signed-off-by: Tree Davies<tdavies@darkphysics.net>
> ---
>   drivers/staging/rtl8192e/rtl8192e/rtl_core.c |  2 +-
>   drivers/staging/rtl8192e/rtl8192e/rtl_wx.c   |  2 +-
>   drivers/staging/rtl8192e/rtl819x_BAProc.c    | 12 ++++++------
>   drivers/staging/rtl8192e/rtl819x_HT.h        |  2 +-
>   drivers/staging/rtl8192e/rtl819x_HTProc.c    | 16 ++++++++--------
>   drivers/staging/rtl8192e/rtllib_softmac.c    | 16 ++++++++--------
>   drivers/staging/rtl8192e/rtllib_softmac_wx.c |  2 +-
>   drivers/staging/rtl8192e/rtllib_tx.c         |  8 ++++----
>   8 files changed, 30 insertions(+), 30 deletions(-)


Hi Tree,

when I try to apply your patch on the top of all the other patches I get 
the following error message:

kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$ git apply -v 
~/Downloads/20230706-\[PATCH\]\ staging_\ rtl8192e_\ Rename\ variable\ 
bCurrentHTSupport-10002.txt
Checking patch drivers/staging/rtl8192e/rtl8192e/rtl_core.c...
Checking patch drivers/staging/rtl8192e/rtl8192e/rtl_wx.c...
Checking patch drivers/staging/rtl8192e/rtl819x_BAProc.c...
Checking patch drivers/staging/rtl8192e/rtl819x_HT.h...
Checking patch drivers/staging/rtl8192e/rtl819x_HTProc.c...
Checking patch drivers/staging/rtl8192e/rtllib_softmac.c...
error: while searching for:
	crypt = ieee->crypt_info.crypt[ieee->crypt_info.tx_keyidx];
	encrypt = ieee->host_encrypt && crypt && crypt->ops &&
		((strcmp(crypt->ops->name, "R-WEP") == 0 || wpa_ie_len));
	if (ieee->ht_info->bCurrentHTSupport) {
		tmp_ht_cap_buf = (u8 *)&(ieee->ht_info->SelfHTCap);
		tmp_ht_cap_len = sizeof(ieee->ht_info->SelfHTCap);
		tmp_ht_info_buf = (u8 *)&(ieee->ht_info->SelfHTInfo);

error: patch failed: drivers/staging/rtl8192e/rtllib_softmac.c:816
error: drivers/staging/rtl8192e/rtllib_softmac.c: patch does not apply
Checking patch drivers/staging/rtl8192e/rtllib_softmac_wx.c...
Checking patch drivers/staging/rtl8192e/rtllib_tx.c...


My be the previous send patches are not taken then your chance is better 
that this one will fit. Will see what happens.


You need to put your patches into a patch series.
This reduces email traffic as the reviewer can just send one email and 
does not need to send four.

A possible command for a patch series is looking like this:
git format-patch -o ~/Documents/kernel/patches/ --cover-letter -n 
--thread=shallow --to="Greg Kroah-Hartman 
<gregkh@linuxfoundation.org>,linux-staging@lists.linux.dev,linux-kernel@vger.kernel.org" 
4bbbd60d84e15fdb7bffde98a687ed168a4dfbbd^..HEAD

Use the git commit id of your first patch.

Bye Philipp












