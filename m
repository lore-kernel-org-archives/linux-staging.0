Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32127E9
	for <linux-staging@lists.linux.dev>; Sun, 20 Aug 2023 04:41:02 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3fe3194d21dso4258115e9.1
        for <linux-staging@lists.linux.dev>; Sat, 19 Aug 2023 21:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692506461; x=1693111261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sEUiRsdPM8OsMS9j6lOuFSmnlNffxKK6lGvWrTtGvTc=;
        b=Z2LoOFLQhoSyIRraDxLb1NhBh3Hbx7fewSTMOey4roIQfcP2N4PJ+Z7Xd84gNb42Qi
         kFzV9P7JyLZR4EmuMD2tFnSi/ECqhbTaO6BWwPohhtKcarlyqwDS/9VTu8nkhO60LXs2
         MrojCqtqFZKtv3qgDas/bt2LvbK/eLZ8YjfFdoTZVldUToobmVMkkPHn9dTv3gyNXhYA
         LH/EkCFjuctFPeHnnXiN4UAjq+8YwxYRGLLyKj1+Z2iTnC3bybpWO+rkP1QYlgdVQ7gV
         UzzcAHO0YRA98206N4sIBVWz9LsYmNJ7iDkMgwCfijn9f6fbxgm1xw0bVlA7Mn419q6l
         KbtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692506461; x=1693111261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sEUiRsdPM8OsMS9j6lOuFSmnlNffxKK6lGvWrTtGvTc=;
        b=ADKC8tZZfdhZdrDGHhwB6dFevfOvFl2FabG5K5o09hGJ6c4IpXKQa1nX42YL3ICjEH
         TLN65OrBVPHHe163aLH2G4niMtmXQOev7IMS5B9GVp4kWEB+ZcyEVYYOr7WgU63baBWG
         3ocuMkhL/zSuKz9HINM9huQZFZw5gZii0IEaLZYkgoKjcXyo4YsnDONI4oyD4h0qo2zp
         CHzDWF5E2R0WQfIRwppYi89jyUTw59hysOMNAHFChPL2cCeGzeT4jfZFy1Hkkxv4FiZ/
         Vr6uXAi8rbTPeAkzWNI83Q9XfrR9vi3VLy2PqxbaDvG9qhEugSXzAcKqsibsI/av/U0O
         SJtg==
X-Gm-Message-State: AOJu0Yw9bZuSbPDvZVxz4M/ozoGPeFUZS83ZJ8KaFtwm6x55wppmuqsc
	JxMHGgpfUlLQG4FsRwDIjos=
X-Google-Smtp-Source: AGHT+IHvwx3O+C7FQgW4JE6fShqykkLZpAPUcfCqh6aGflD2JZBqoZqiYujZjgbqd15ea+dn66nCsQ==
X-Received: by 2002:a05:600c:54ea:b0:3fe:d780:4f93 with SMTP id jb10-20020a05600c54ea00b003fed7804f93mr2909656wmb.0.1692506460508;
        Sat, 19 Aug 2023 21:41:00 -0700 (PDT)
Received: from [192.168.0.100] (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id q13-20020adffecd000000b00317643a93f4sm8144019wrs.96.2023.08.19.21.40.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Aug 2023 21:41:00 -0700 (PDT)
Message-ID: <f84189f9-6561-67cf-2e4f-8bc80d6e06f9@gmail.com>
Date: Sun, 20 Aug 2023 06:40:59 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 00/16] Staging: rtl8192e: Rename struct rx_ts_record
 references
To: Tree Davies <tdavies@darkphysics.net>, gregkh@linuxfoundation.org,
 anjan@momi.ca
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230820004744.278022-1-tdavies@darkphysics.net>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20230820004744.278022-1-tdavies@darkphysics.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/20/23 02:47, Tree Davies wrote:
> The goal of this series is to fix checkpatch warning Avoid CamelCase,
> for all references of struct rx_ts_record. In most cases renames the
> references to, ts, to make the naming consistent.
> 
> The first 8 patches have been sent before, and versioned appropriately.
> 
> Thank you in advance to the reviewers,
> ~ Tree
> 
> Tree Davies (16):
>    Staging: rtl8192e: Rename variable pRxTs in function rx_ts_delete_ba()
>    Staging: rtl8192e: Rename variable pTS in function
>      rtllib_rx_ADDBAReq()
>    Staging: rtl8192e: Rename variable pRxTs in function rtllib_rx_DELBA()
>    Staging: rtl8192e: Rename variable pRxTs in function
>      rtllib_ts_init_del_ba()
>    Staging: rtl8192e: Rename variable pRxTs in function
>      rtllib_rx_ba_inact_timeout()
>    Staging: rtl8192e: Rename variable pRxTs in function
>      RxPktPendingTimeout()
>    Staging: rtl8192e: Rename variable pTS in function ResetRxTsEntry()
>    Staging: rtl8192e: Rename variable pRxTS in function TSInitialize()
>    Staging: rtl8192e: Rename variable tmp in function GetTs()
>    Staging: rtl8192e: Rename variable pRxTS in function RemoveTsEntry()
>    Staging: rtl8192e: Rename variable pTS in function prototype
>      rtllib_FlushRxTsPendingPkts()
>    Staging: rtl8192e: Rename variable pTS in function AddReorderEntry()
>    Staging: rtl8192e: Rename variable pTS in function
>      rtllib_FlushRxTsPendingPkts()
>    Staging: rtl8192e: Rename variable pTS in function
>      RxReorderIndicatePacket()
>    Staging: rtl8192e: Rename variable pRxTS in function
>      rtllib_rx_check_duplicate()
>    Staging: rtl8192e: Rename variable pTS in function
>      rtllib_rx_InfraAdhoc()
> 
>   drivers/staging/rtl8192e/rtl819x_BAProc.c | 36 ++++-----
>   drivers/staging/rtl8192e/rtl819x_TSProc.c | 73 +++++++++---------
>   drivers/staging/rtl8192e/rtllib.h         |  2 +-
>   drivers/staging/rtl8192e/rtllib_rx.c      | 94 +++++++++++------------
>   4 files changed, 102 insertions(+), 103 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>



