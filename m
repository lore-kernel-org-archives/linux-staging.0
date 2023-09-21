Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5309199B8
	for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 15:56:05 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-52f1ece3a76so263036a12.0
        for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 08:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695311764; x=1695916564; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RYno1ZJZxkD4vk/Haa7DuZReObG5ynelS4rpVSOvG3w=;
        b=jC/wMOV6s4Rk2m3q7hZZsLIrG1Egv7zRN4Ie7qw2IV3wNjKet0S/ugI2zCLydedfzv
         IQe0FUmyBZM0cxHHOk7W8esyN2aPWJUAdkbezmm+5yFLcDbZtGsO2fvRTrMv0bx24rnN
         byq8XOVizGNIZYEn6C0qNC+N6yDJE/unG4015XMwuc+pRvoheA8+lpfoZBt3BrbxftZ8
         H/XxuVuv+sbmOsMN1gy9IFxd6fKPWVMicuxMHNjmBi4SMMyiKWNyrl7y6c5ZxYSqUWd4
         Uuc0jXAZESBwnmMeLoIACGqNN+DC8bRMQN9IV5nlcVe3/8dYoVHqSUpK6eX9+r68XFO2
         Z7xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695311764; x=1695916564;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RYno1ZJZxkD4vk/Haa7DuZReObG5ynelS4rpVSOvG3w=;
        b=GyDQ7ebdQy3w9LtWNj5Yl9+wzs6vcP4ovr1jvEtM+gZCh10Oa66682v/4W5faD4F01
         zCOEDbyNUHUf6YBKBm0Cn94HguXJulrULoYm18IMuLysaPvgvul1aIJzCNAEBrl0Wksx
         Fww/ru8Rzug67L+wNUnL/K5Sfv5u0TV03KJxNb9EPCqD/jtKYBYDhCH93V4rlxV73Bl8
         OUKWNE6Di9y3yw2gM1uSYKiBC0N7Lexf4LGPaxa7rLMb+yt1Y7Uh4tzQi7ZIT3aYJWU3
         yjksuBa44B56s8lrwmlsbMuqfekd3AB2OYCVv44ZYRulF+AeiRqspfsnBAxPa4lMyU4v
         NbWQ==
X-Gm-Message-State: AOJu0YzdDRPO4WW6+wtJGYsA5UNt3YMLhkn5tj1BkpMWKt5iwElprcHl
	QElNxcvI9SNxAwCKeUYQNQY=
X-Google-Smtp-Source: AGHT+IG9d1svIapCRWcs3sULEe5wW0jguhBJFgzhPLiS72gscJIBp0Qmm+cDiXey5SMrS/Zkpe+Wtg==
X-Received: by 2002:a05:6402:2695:b0:521:f2a7:d57a with SMTP id w21-20020a056402269500b00521f2a7d57amr5463731edd.2.1695311763759;
        Thu, 21 Sep 2023 08:56:03 -0700 (PDT)
Received: from [192.168.0.102] (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id n26-20020a056402061a00b005313c60165asm1028680edv.77.2023.09.21.08.56.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Sep 2023 08:56:03 -0700 (PDT)
Message-ID: <13773b73-147e-6e52-64c9-bedd1bf826f8@gmail.com>
Date: Thu, 21 Sep 2023 17:56:02 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 00/11] Staging: rtl8192e: Function and Variable rename
 series
To: Tree Davies <tdavies@darkphysics.net>, gregkh@linuxfoundation.org,
 anjan@momi.ca
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230921032515.96152-1-tdavies@darkphysics.net>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20230921032515.96152-1-tdavies@darkphysics.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/21/23 05:25, Tree Davies wrote:
> This series fixes 11 checkpatch Avoid Camelcase issues throughout the
> driver.
> 
> Thank you in advance to reviewers
> Tree
> 
> Tree Davies (11):
>    Staging: rtl8192e: Rename variable Time
>    Staging: rtl8192e: Rename variable pAdmittedBa
>    Staging: rtl8192e: Rename variable pPendingBa
>    Staging: rtl8192e: Rename variable Dst
>    Staging: rtl8192e: Rename variable pPendingBA
>    Staging: rtl8192e: Rename variable Addr
>    Staging: rtl8192e: Rename variable pStatusCode
>    Staging: rtl8192e: Rename variable Policy
>    Staging: rtl8192e: Rename function GetTs()
>    Staging: rtl8192e: Rename function TSInitialize
>    Staging: rtl8192e: Rename variable StatusCode
> 
>   drivers/staging/rtl8192e/rtl819x_BAProc.c | 74 +++++++++++------------
>   drivers/staging/rtl8192e/rtl819x_TS.h     |  2 +-
>   drivers/staging/rtl8192e/rtl819x_TSProc.c | 36 +++++------
>   drivers/staging/rtl8192e/rtllib.h         |  8 +--
>   drivers/staging/rtl8192e/rtllib_module.c  |  2 +-
>   drivers/staging/rtl8192e/rtllib_rx.c      |  4 +-
>   drivers/staging/rtl8192e/rtllib_tx.c      |  4 +-
>   7 files changed, 65 insertions(+), 65 deletions(-)
> 


Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
