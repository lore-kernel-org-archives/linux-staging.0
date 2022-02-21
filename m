Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9092433CE
	for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 18:48:25 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id qk11so35607314ejb.2
        for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 10:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=vrA7knS+1mH335VFNHAwLVaOZ0ABUiEx8O7DVSOsX/s=;
        b=nXiGzwnFJcabMOTlYk5USDFPUydtGqYwR8cUqnO2d/7zYnhGtWg8xS8uaxL88YCk9+
         egKGQUy+wqdntUqlnOiJxAvSIVvufLAY+c+B0n0EZx1+BQ5mMlHL3GBM8Pu7c9D9v1RI
         e29ubqi7say0HZM7Qc4TmbBfXT4kN/lz0GidnZmIhIjLWCerpvwjoL2jmmMCzvCwMnGh
         7I4BDdTso5G1XLz1/I5RGiDMNxzl0m45PnGuxeTN/ypUmDsa1CHYJFi4UePPgbYOGhnk
         +WoMkMBuK0gLtGlyYgx4YEHagOaAgkctLL1hwY9rMIPYwKxFvmFbq+Nh1142sgcJgmTc
         gjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vrA7knS+1mH335VFNHAwLVaOZ0ABUiEx8O7DVSOsX/s=;
        b=hIiWkVjeXEbrypt6KVx70WxAda//944ylNkJzuRN8IMPgAmU4BcXlQ53gx9evmLC4g
         AUfdwXcFu/QH8jEGjNWGVAUpohjOIZjmB94VJtgFx1Gwme7lLBXCVKglX1oT2oYctEtQ
         uy3yzi1VuNotH/X6A7LzZAMXObBE/KJvzyNHbFvEwSdBlwsHY6y/W3xSwxUJtG+oeyQX
         9Xj/4ZVpNe7Vt0hDGtIiq3Y/UtR216WtHzdC2aKe+CxGwmF05KDVrwABJ1dXLMa2p0m/
         0Q/OHMmz0l1Y3qQDLTa1mVy12ENSPpNE3wyrZUQdwBJKmS8FA2YoSvyyHhJYCnXLvdW0
         KYxQ==
X-Gm-Message-State: AOAM5301mqmiUKh+nsLOXc8SoZMbqzz2BzfQAzJI/L5gRo2oK7kLAGkX
	3KRCRm3xSGyOa8QSCJ50RAM=
X-Google-Smtp-Source: ABdhPJzwj+WUqtLBnZx/7AVxQv1trxO08byXV7PaSlvqNfgaiXgyKzDN/XWpOU4TziEy1iaC3bPmCQ==
X-Received: by 2002:a17:906:4ad6:b0:6b8:33e5:c3a1 with SMTP id u22-20020a1709064ad600b006b833e5c3a1mr16916742ejt.472.1645469303934;
        Mon, 21 Feb 2022 10:48:23 -0800 (PST)
Received: from [192.168.0.253] (ip5f5abb8f.dynamic.kabel-deutschland.de. [95.90.187.143])
        by smtp.gmail.com with ESMTPSA id p4sm5431949ejm.47.2022.02.21.10.48.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Feb 2022 10:48:23 -0800 (PST)
Message-ID: <fc8e4d44-fa64-f8bf-a442-87c1437978fa@gmail.com>
Date: Mon, 21 Feb 2022 19:48:22 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 0/5] staging: r8188eu: odm cleanups
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220221073306.16636-1-straube.linux@gmail.com>
 <YhPIOp/k/u9GUv73@kroah.com>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <YhPIOp/k/u9GUv73@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/21/22 18:13, Greg KH wrote:
> On Mon, Feb 21, 2022 at 08:33:01AM +0100, Michael Straube wrote:
>> This set removes two more functions from the unwanted hal/odm layer.
>> Tested on x86_64 with Inter-Tech DMG-02.
>>
>> v2:
>> Fixed a typo in the commit message of patch 2/5.
>> unsed -> used
>>
>> Michael Straube (5):
>>    staging: r8188eu: remove ODM_CmnInfoHook()
>>    staging: r8188eu: convert two u8 variables to bool
>>    staging: r8188eu: remove enum odm_bw
>>    staging: r8188eu: convert type of pBandWidth in odm_dm_struct
>>    staging: r8188eu: remove ODM_CmnInfoUpdate()
>>
>>   drivers/staging/r8188eu/hal/odm.c             | 56 +------------------
>>   drivers/staging/r8188eu/hal/rtl8188e_dm.c     | 19 ++++---
>>   drivers/staging/r8188eu/include/odm.h         | 29 +---------
>>   drivers/staging/r8188eu/include/rtw_mlme.h    |  2 +-
>>   drivers/staging/r8188eu/include/rtw_pwrctrl.h |  2 +-
>>   5 files changed, 16 insertions(+), 92 deletions(-)
>>
>> -- 
>> 2.35.1
>>
>>
> 
> This patch series does not apply to my tree.  Please rebase and resend.
> 

Hi Greg,

looks like you already applied v1 of this series.
The only change in v2 was fixing a typo in a commit message..

regards,

Michael


