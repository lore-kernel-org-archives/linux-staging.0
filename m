Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C76523DF
	for <linux-staging@lists.linux.dev>; Thu,  1 Jun 2023 19:52:09 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-50a20bfe366so325812a12.0
        for <linux-staging@lists.linux.dev>; Thu, 01 Jun 2023 12:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685649127; x=1688241127;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L7DB5CslY4RTslJ0wxKBSVyRAvd6TEsp6LGdNHwa6Dc=;
        b=bnI3uYKh0j3Emc7pF/vIYc4D5CIhjvZpe3qGmWyJ+ZSWP9DyCTlxQ2Mdl6BwK5MxFG
         KfOXEWN1kIaiNfNukWUzL4umaL45baI1jRA/L+j5v6RlW6yaEgm9XsV1PGhkUH91op8J
         Q2Fc909JGXyamRxQbEoh3DdrqEo9+XLB/AAZZgJLiN9RSJ82+eJJQQVXbEHTdhqp6+P3
         y7WRWT1PedCU8lsERyLNvIcwXXmRzTXRPrJ74/gsmkzftBYVcxByVVGMSvusOmbqqZpo
         beqQplFeo09l+oiTxcra4lWk8TLwrcV3pBQYbWKVO5uiCySvmS5itHTiLAuwJCzMu5ju
         ktPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685649127; x=1688241127;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L7DB5CslY4RTslJ0wxKBSVyRAvd6TEsp6LGdNHwa6Dc=;
        b=B1O0QkvHDaBsfBEMESWrURmy8xTMJBmASiSfwyBzoXIi1nJqimaNJeNXBFSPL4OV4y
         z3qyGEqTrq+9VB0w5AXvsIUod7NaaSY5T5MuI0bwuOkV5Vo4mLE/3duF+z/lAT2t8d69
         jWIT0ORa7crnFB7Z9folJUc65RY4iwNN2Q9dVJPcUHPbaSZ08M53Sczee+F6zShuHhS9
         3Ze0n8/dUSMo8lFATRWmQeCfgHX3PE7KzoYVCGNOTtnafw2Ylt0xji6bo1uF3TbOdi0j
         VHe16seUZPQq8matD9n734AmgW2kcdRZ+2Vk6K9n5R2gY1KrT1k8ikKTi07Y9kQbIq4G
         Dqbg==
X-Gm-Message-State: AC+VfDwsryoeIT4+md2aOfH01/LKSyQDZV5h9qPz+7d8y/zxa30zfDTj
	lAlM0WzrEpsd77dylYxOryY=
X-Google-Smtp-Source: ACHHUZ7fAPZnig5m698Cu+gHvUy/7RIb2kjOm1Yh665aOdluUqFAd2uxKS3L09CfVg4Odk29c4FBoQ==
X-Received: by 2002:a05:6402:3593:b0:514:2dd2:d1b9 with SMTP id y19-20020a056402359300b005142dd2d1b9mr4964865edc.3.1685649127152;
        Thu, 01 Jun 2023 12:52:07 -0700 (PDT)
Received: from [192.168.0.103] (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id s21-20020a056402015500b00501d73cfc86sm7537325edu.9.2023.06.01.12.52.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 12:52:06 -0700 (PDT)
Message-ID: <eb13f84f-786c-f00e-4076-19d29e608b17@gmail.com>
Date: Thu, 1 Jun 2023 21:52:05 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] staging: rtl8192e: remove blank lines
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230531053118.17053-1-straube.linux@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20230531053118.17053-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/31/23 07:31, Michael Straube wrote:
> Remove unnecessary blank lines reported by checkpatch.
> 
> Signed-off-by: Michael Straube<straube.linux@gmail.com>
> ---
>   .../staging/rtl8192e/rtl8192e/r8190P_def.h    |  8 ---
>   .../staging/rtl8192e/rtl8192e/r8192E_dev.c    | 16 ------
>   .../staging/rtl8192e/rtl8192e/r8192E_phy.c    | 20 -------
>   .../staging/rtl8192e/rtl8192e/r8192E_phyreg.h |  4 --
>   drivers/staging/rtl8192e/rtl8192e/rtl_cam.c   |  2 -
>   drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    | 29 -----------
>   drivers/staging/rtl8192e/rtl8192e/rtl_pm.c    |  2 -
>   drivers/staging/rtl8192e/rtl8192e/rtl_ps.c    |  1 -
>   drivers/staging/rtl8192e/rtl819x_HT.h         |  6 ---
>   drivers/staging/rtl8192e/rtl819x_Qos.h        |  1 -
>   drivers/staging/rtl8192e/rtl819x_TS.h         |  2 -
>   drivers/staging/rtl8192e/rtllib.h             |  3 --
>   drivers/staging/rtl8192e/rtllib_softmac.c     | 52 -------------------
>   drivers/staging/rtl8192e/rtllib_softmac_wx.c  | 16 ------
>   14 files changed, 162 deletions(-)

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
