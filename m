Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2093331739
	for <linux-staging@lists.linux.dev>; Mon, 27 Nov 2023 19:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncc/IJIK"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40b2e763b83so6055895e9.1
        for <linux-staging@lists.linux.dev>; Mon, 27 Nov 2023 11:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701114573; x=1701719373; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/7y5gQC5hvIBvBFDJ+KIWxjtV9gEjJrCiDgYolpeuvA=;
        b=ncc/IJIKQDx8fK5uam9IacDerRC8FASW8Ej+c9EyFm+IWQEwObu+lGJI+kD7pNi+9B
         iIy+Lu0r2TniJLc+iUq6n/xOUCVoo84+7Hj2VuE3Gvc9BQtjmKV2ArYamQz69cnrRkdw
         qcIWQTKR8paUm6fQlnGxredzIqyXMc+N0Sm9GesW5iBk4ADp3JMABMNDWVlq/uOZ015e
         se48iFvO2pvyQjl63Znpssz8PW9M27c3Nnj6czVpAgozyc/Ej6BqIfRVSk89C5QvzjB0
         vuuYqX2hJ7E0a1uwigJP7lSvvLkoT/ddRAHlFCI0TsE98Ypgmu9uXyYtFjRS7KY9Q8ER
         6p9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701114573; x=1701719373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/7y5gQC5hvIBvBFDJ+KIWxjtV9gEjJrCiDgYolpeuvA=;
        b=YYO+Ew2XsUKXbBHpVt46GrW6mUlg/tvrZKuiwTnByNiUdJ01Z72bqXYMrBLVTCoGP3
         KLiaslZGQnr8X84m5+w2B8XWpR/T4Pu42zWEDp3lXgCZcfPr8G1xMfmAZ8fWPNu2zM0N
         ftrX2kUfAtvb0Ho/q0NnZuPDya3FU5c+qt7mfkvx29UfAcEmNn5LkudX5twVNwXm2fo+
         baJAu1M3AjR74ZOjbh8feDoIaoXcr4GYBqzy14mu7YiG7PsnD5fqjiAeCdVwEnLFlR0c
         QeTf6S1Etzj1cJz3XjG83nTCnXFzzoM+rBXXRTRGrXoatqjkgHuOfZbRGVRlFOqlwbms
         lvdQ==
X-Gm-Message-State: AOJu0YxICfXeB+d8a4N3tHYDvSZdbMLTg760ORbFSNMfQeepuAi7TDJF
	7Ev9HbqG4D8Ri5j69ZpSQyA=
X-Google-Smtp-Source: AGHT+IHFbu2EXNV30J7b0sqEBX6koH+mWUJRXjpUY+IfCwIsBE+KsG69ZPnEC5xWDO9coIa3UHLxcw==
X-Received: by 2002:a05:600c:257:b0:408:3836:525f with SMTP id 23-20020a05600c025700b004083836525fmr9048648wmj.1.1701114573090;
        Mon, 27 Nov 2023 11:49:33 -0800 (PST)
Received: from [192.168.0.104] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id n17-20020a05600c4f9100b004090798d29csm14819478wmq.15.2023.11.27.11.49.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 11:49:32 -0800 (PST)
Message-ID: <91d11256-d855-4a80-9a8c-0c987b22aed9@gmail.com>
Date: Mon, 27 Nov 2023 20:49:31 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/15] Staging: rtl8192e: Rename CamelCase vars
To: Tree Davies <tdavies@darkphysics.net>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 anjan@momi.ca, gregkh@linuxfoundation.org,
 Gary Rookard <garyrookard@fastmail.org>
References: <20231127054305.148276-1-tdavies@darkphysics.net>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20231127054305.148276-1-tdavies@darkphysics.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/27/23 06:42, Tree Davies wrote:
> This Series renames 15 variables to fix checkpatch warnings.
> 
> Thank you in advance to reviewers
> ~Tree
> 
> Tree Davies (15):
>    Staging: rtl8192e: Rename variable pTxTs
>    Staging: rtl8192e: Rename variable BAReq
>    Staging: rtl8192e: Rename variable Delba
>    Staging: rtl8192e: Rename variable TSpec
>    Staging: rtl8192e: Rename variable TxAdmittedBARecord
>    Staging: rtl8192e: Rename variable TxPendingBARecord
>    Staging: rtl8192e: Rename variable pDialogToken
>    Staging: rtl8192e: Rename variable pTsCommonInfo
>    Staging: rtl8192e: Rename variable TxCurSeq
>    Staging: rtl8192e: Rename variable TsAddBaTimer
>    Staging: rtl8192e: Rename variable DelbaParamSet
>    Staging: rtl8192e: Rename variable pBaParamSet
>    Staging: rtl8192e: Rename variable pBaTimeoutVal
>    Staging: rtl8192e: Rename variable pAdmittedBA
>    Staging: rtl8192e: Rename variable TsCommonInfo
> 
>   drivers/staging/rtl8192e/rtl819x_BAProc.c | 178 +++++++++++-----------
>   drivers/staging/rtl8192e/rtl819x_TS.h     |  12 +-
>   drivers/staging/rtl8192e/rtl819x_TSProc.c |  56 +++----
>   drivers/staging/rtl8192e/rtllib.h         |   2 +-
>   drivers/staging/rtl8192e/rtllib_tx.c      |  22 +--
>   5 files changed, 135 insertions(+), 135 deletions(-)
> 

Hi Tree,

thanks for your patches, those work on hardware well.

I am about to delete the block acknowledgment (ba) from the driver. 
Reason is that ba is not properly working. The AP seems to try around 
before it gives up. This is slowing down the connection build up.

My issue is that I need to remove the following parts:

Function rtllib_process_action() that reacts when the AP sends packets 
with ba.

The following three timers are also part of this functionality
timer_setup(&pTxTS->ts_add_ba_timer, TsAddBaProcess, 0);
timer_setup(&pTxTS->tx_pending_ba_record.timer, rtllib_ba_setup_timeout, 0);
timer_setup(&pTxTS->tx_admitted_ba_record.timer, 
rtllib_tx_ba_inact_timeout, 0);

And I cannot really remove the ones without the others. So some kind of 
encirclement is happening.

Just wanted to inform you about what I plan to do.

Have a good day.

Bye Philipp










