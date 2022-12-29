Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3F91FAF
	for <linux-staging@lists.linux.dev>; Thu, 29 Dec 2022 16:32:25 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id tz12so46126452ejc.9
        for <linux-staging@lists.linux.dev>; Thu, 29 Dec 2022 08:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EUcRrqj7KVVFNBxTEMN+gtchFt3l7f47KAVCKCtQJX4=;
        b=V9C1Rce+meqGk+jTLxjCr2AcH6Pg3UnTKtfJ/z2d61mNLw1dVXaJbA2guD7+ytxM/Z
         MdPWJJ1SXBOrYYuyeUkSfwq8WMbi/tkBrOJgHrHACj4BgKagdZmexxCX8NpG9A0TeDCC
         QuvUCueN6PxTP8/8Tf+b8T4xM1L5B/vPaqo38n+X7vjH9KjiUNzf+hOQA7x8lakz/kgP
         t6LlEznUiZQQUKq5AiilscXFvICLO1PugpBMFxDkbA+yhkTPuXQi8abRbTyOJtCZ1lm6
         W291cOrdXKyxMyI9qfmyXEY4OMnIxo1LRU8e7+JzZ5vOonkwbjkGt3U1Qx9ALM+crmwu
         HpkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EUcRrqj7KVVFNBxTEMN+gtchFt3l7f47KAVCKCtQJX4=;
        b=uU+gIaYyCvfgMiIw0fPyDCTifYzjz3T7yhN9sYMXdz4UPtUQepWPIaMtBal5rENAxs
         tMFKfWsSeii0nYdPoCFoLNiXKg9CfeB5So2g4jfg9Wj9Pw9aCdJ9xfWH5SMD0XHTpAAf
         +K48vXjxCvO37OZDAffywI04vncwy/zLQnLbnvliZdUuqjXdoK5dHaQdIJ7f899RiXhm
         YC70LQOANSHbWnX7TfsbvkE4jXymjQamP/eC5ZieturdV9QUMJa31Hz+bjpDiZZYXkuD
         squW8+MaNMeXxeoREP/cJaeSEehW8k4Z7JvxZqkBKivmPnna27hud/DOI8JBfE9kZ6pg
         hXTw==
X-Gm-Message-State: AFqh2kpvI+fS4155DWKANnZr6R77hWTNeTxo8PrK1ZHSGBDzIuNOxtdJ
	/IqKzn2p4UZZ9wVp/r39TuE=
X-Google-Smtp-Source: AMrXdXtR5Lh3briAqybdca5viWLw7hYZ3/jLgEtA5lRgRnOGkfQBXcogBBqSpFwa5brOCKLiN0mgtQ==
X-Received: by 2002:a17:907:3f8d:b0:7b9:62ab:dc3d with SMTP id hr13-20020a1709073f8d00b007b962abdc3dmr6922779ejc.1.1672331544220;
        Thu, 29 Dec 2022 08:32:24 -0800 (PST)
Received: from [192.168.1.102] (p54a07888.dip0.t-ipconnect.de. [84.160.120.136])
        by smtp.gmail.com with ESMTPSA id l18-20020a1709060cd200b0084c70c187e8sm3275793ejh.165.2022.12.29.08.32.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Dec 2022 08:32:23 -0800 (PST)
Message-ID: <4a1642a0-35a8-c978-8016-94d9235a37d6@gmail.com>
Date: Thu, 29 Dec 2022 17:32:22 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/7] staging: rtl8192e: Rename variables from r8192_priv
 start with ChannelPlan
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1672330343.git.philipp.g.hortmann@gmail.com>
Content-Language: en-US
In-Reply-To: <cover.1672330343.git.philipp.g.hortmann@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/29/22 17:25, Philipp Hortmann wrote:
> Rename variables to avoid CamelCase which is not accepted by checkpatch.
> 
> Philipp Hortmann (7):
>    staging: rtl8192e: Rename ChannelPlan, eeprom_ChannelPlan and CckPwEnl
>    staging: rtl8192e: Rename TSSI_13dBm, Pwr_Track and NumTotalRFPath
>    staging: rtl8192e: Rename CCKPresentAtt...
>    staging: rtl8192e: Rename TxPowerLevelCCK...
>    staging: rtl8192e: Rename TxPowerLevelOFDM24G...
>    staging: rtl8192e: Rename MCSTxPowerL.., LegacyHTTxPowe.. and
>      AntennaTx..
>    staging: rtl8192e: Rename SetRFPowerSta.., RfReg0Value and
>      bTXPowerDa..
> 
>   .../rtl8192e/rtl8192e/r8190P_rtl8256.c        |  14 +--
>   .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |  78 +++++++-------
>   .../staging/rtl8192e/rtl8192e/r8192E_phy.c    | 100 +++++++++---------
>   drivers/staging/rtl8192e/rtl8192e/rtl_core.c  |  10 +-
>   drivers/staging/rtl8192e/rtl8192e/rtl_core.h  |  42 ++++----
>   drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    |  30 +++---
>   6 files changed, 137 insertions(+), 137 deletions(-)
> 

Tested with rtl8192e
Transferred this patch over wlan connection of rtl8192e

Bye Philipp
