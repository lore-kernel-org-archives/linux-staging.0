Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842A33D6C
	for <linux-staging@lists.linux.dev>; Sat,  4 Nov 2023 11:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DPZlxDvS"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-408fd07bb78so4245365e9.1
        for <linux-staging@lists.linux.dev>; Sat, 04 Nov 2023 04:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699097979; x=1699702779; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VC+Vc18HpjDuM9zWgO0MZbqut4q/1GieWVs47SxImQ4=;
        b=DPZlxDvSeent4izKRG6n5ltFcLXw30VVUMkk9uFastZa/7BQv/3AFC4Wxxn+IySYej
         upXBz1RFHFEwwM1uIwQ5/hU9QIt+PLiFatYwfJoL0sJbGJO2mIdoYdJVZ3L2I7I7uYdK
         s3vVMFl/Moeqt6sWftji48u3hKvaHDt9OYb5evFd0K4EiTnWKB60+kp/NP+xZwXKtOQb
         o3ssmMhD1/QWuSReg9Uh0cuDENPpIBaNs5FXrylV1YZ2+fFvlXcY3g3XmN+tOMO2Mfl4
         qlM4r9yowKgWDuzoNQBPnoX9R6M2XI/8eECRou67eAsBDchTiocaHKwnPjjo4/3PklGi
         s67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699097979; x=1699702779;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VC+Vc18HpjDuM9zWgO0MZbqut4q/1GieWVs47SxImQ4=;
        b=tG1yxnaWQ78DqaTo1ROgXTYxPOGrjGST68QRPDPeWpEAFwEYkKhiRSbCZE1xtW1Dt5
         Og2qVcKR3PcbiHLy4nxkwrLryWjsgX1K01tcKTan5gUpL9UKynOtj+s+To/k9kUTu4hJ
         2n867d4Dk/tFv0NUPtASOKbWpf/nHopVYGa2oFjxAvTk7pQ5fbI4sGh0spahqMxGQ7RH
         8mNcjijfJw1/ztxfV9bk1iHR7uCfpuewFaxiZc5K4pXLFPlzG3zPXtbQvlBQjuK5Mewi
         j0+LdcwlY4WiB4/PTAuR9S1fl29broVvok77nYE4NQ7WGxq2y+nsmLFSpNN6FgmIMvBP
         HGjQ==
X-Gm-Message-State: AOJu0YxwvkR2apS0E+BsZNQqhM9pv/8607JvPMGkgAdShrGRmDt3J7B3
	nPVjFdM5rNKNS1tpiG5kr68=
X-Google-Smtp-Source: AGHT+IHX5f1HLte02nzyZNKgs/kxN9IuJMQRjXsXHwsrJreD9jq6XeILbmbew3HV57LWCb07veaayw==
X-Received: by 2002:a05:600c:1c1b:b0:403:334:fb0d with SMTP id j27-20020a05600c1c1b00b004030334fb0dmr19559329wms.4.1699097979324;
        Sat, 04 Nov 2023 04:39:39 -0700 (PDT)
Received: from [192.168.0.101] (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id a1-20020a05600c348100b003fe1fe56202sm5610361wmq.33.2023.11.04.04.39.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Nov 2023 04:39:38 -0700 (PDT)
Message-ID: <0056c9ec-6e05-44b2-a7c5-e3c743454e22@gmail.com>
Date: Sat, 4 Nov 2023 12:39:32 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] Type encoding info dropped from variable and
 function names in NIC driver part2
To: Pavan Bobba <opensource206@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1698730318.git.opensource206@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <cover.1698730318.git.opensource206@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/23 06:34, Pavan Bobba wrote:
> This patchset series consist of fixes to issues found by checkpatch
> 
> Pavan Bobba (11):
>    staging: vt6655: Type encoding info dropped from variable name
>      "qwBSSTimestamp"
>    staging: vt6655: Type encoding info dropped from variable name
>      "qwTSFOffset"
>    staging: vt6655: Type encoding info dropped from function name
>      "CARDqGetTSFOffset"
>    staging: vt6655: Type encoding info dropped from function name
>      "CARDbSetBeaconPeriod"
>    staging: vt6655: Type encoding info dropped from variable name
>      "wBeaconInterval"
>    staging: vt6655: Type encoding info dropped from variable name
>      "qwNextTBTT"
>    staging: vt6655: Type encoding info dropped from function name
>      "CARDqGetNextTBTT"
>    staging: vt6655: Type encoding info dropped from function name
>      "CARDbRadioPowerOff"
>    staging: vt6655: Type encoding info dropped from function name
>      "CARDvSafeResetTx"
>    staging: vt6655: Type encoding info dropped from variable name
>      "pCurrTD"
>    staging: vt6655: Type encoding info dropped from variable name
>      "apTailTD"
> 
>   drivers/staging/vt6655/card.c        | 90 ++++++++++++++--------------
>   drivers/staging/vt6655/card.h        | 18 +++---
>   drivers/staging/vt6655/device.h      |  4 +-
>   drivers/staging/vt6655/device_main.c | 18 +++---
>   drivers/staging/vt6655/rxtx.c        |  2 +-
>   5 files changed, 66 insertions(+), 66 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>

