Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E973FC6
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 06:44:31 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id p38so35887720lfa.0
        for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 23:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jsdxE7ab+h+vcpvNYgh2jFQu7hO2EowvIjQTEsRsMBo=;
        b=PM064RAuQ1e5YseF1LwJT1sn1htwBaxdSekazG1IyHeO6tLVX/QJWL9ebN1q/wuVNO
         0vxw0uF3dqF2wORAemD/PEPkogUb5cWmB00D/QuwHwyesFDt0sabUSoHGkWIk0nGOA/8
         t6mJSuDmKwdIkjo1Mn2GM6RhwLVq2F8+Ur1jVBPMiG5+XLdOYftyt3jfjcJTQmr8lKD0
         xHF9ejQ2vywQEJ6623p0z8UQcRxaS6W9JR9LNLQ7a9UAGyU5HRnxXwLdEiolbCRmVIMD
         xZ1X5fFTY7Md3vwTl3tmyGGSF7NE+teLPPoKu0DQ+58TnpqZeGfCIAbmLUd/eyaVlQlc
         xNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jsdxE7ab+h+vcpvNYgh2jFQu7hO2EowvIjQTEsRsMBo=;
        b=Uq5g7JBNvxRwYpicNkzfql7LoU+YsM8xrWECxznUCbTKQ7+ABxj9NzE2v7bUUC/f8J
         sQBN3GoUyp7H4R2bFUvUre7ovJopFw7DoNGy8EOP9Vyw0KErRe6FUtgCYo+b5Guo5f2c
         5EF7ph7zBfsR3sIYDxYnRnFdkQr7j3HsbB+k8U4755m9WYfC1tOiklTeCCEIeHplH00V
         nHavOseCUnnt4kNobS3OPXgt8lSeJ2ewdkHE01RRFrxlQnIMYuQSI2oQ9Z7cD3l/9Ptl
         TNrJKG2GCSLZWfKg4ZtZHdVH4exy92qNXEprTlyTfDolJ8dpNwAf1Nt4ugHnD4+4lUl2
         fb5w==
X-Gm-Message-State: AOAM532brmhaaUJZ/BI1UzZxz9QSur6d4BzS5WvrcbkJs2bt5s7GbTiM
	VSehGX4ufAmzOCZ3rmqOm2E=
X-Google-Smtp-Source: ABdhPJzMWWqasAagqRrlCbDZDmTLxVDQGaLmtt8xabU0Uw1NCYEcntLkiPawUmDDWzk9OqS3C2aAeg==
X-Received: by 2002:a05:6512:388e:: with SMTP id n14mr82657lft.242.1629701069325;
        Sun, 22 Aug 2021 23:44:29 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id b17sm607579ljj.35.2021.08.22.23.44.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Aug 2021 23:44:28 -0700 (PDT)
Subject: Re: [PATCH RFC v2 0/6] staging: r8188eu: avoid uninit value bugs
To: Phillip Potter <phil@philpotter.co.uk>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Greg KH <gregkh@linuxfoundation.org>,
 Michael Straube <straube.linux@gmail.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <6182ed46-d79d-7f66-c7c0-096486410b4d@gmail.com>
 <cover.1629642658.git.paskripkin@gmail.com>
 <CAA=Fs0=LACN5VqZ1AMkGBVma0W37bQDUeY1DLZ5S5EwV66AyOA@mail.gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <49c23e49-8a62-fe65-d74a-85405d7f2b4f@gmail.com>
Date: Mon, 23 Aug 2021 09:44:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAA=Fs0=LACN5VqZ1AMkGBVma0W37bQDUeY1DLZ5S5EwV66AyOA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/23/21 3:12 AM, Phillip Potter wrote:
> On Sun, 22 Aug 2021 at 15:35, Pavel Skripkin <paskripkin@gmail.com> wrote:
>>
>> Hi, Greg, Larry and Phillip!
>>
>> I noticed, that new staging driver was added like 3 weeks ago and I decided
>> to look at the code, because drivers in staging directory are always buggy.
>>
>> The first thing I noticed is *no one* was checking read operations result, but
>> it can fail and driver may start writing random stack values into registers. It
>> can cause driver misbehavior or device misbehavior.
>>
>> To avoid this type of bugs, i've changed rtw_read* API. Now all rtw_read
>> funtions return an error, when something went wrong with usb transfer.
>>
>> It helps callers to break/return earlier and don't write random values to
>> registers or to rely on random values.
>>
>> Why is this pacth series RFC?
>>   1. I don't have this device and I cannot test these changes.
>>   2. I don't know how to handle errors in each particular case. For now, function
>>      just returns or returns an error. That's all. I hope, driver maintainers will
>>      help with these bits.
>>   3. I guess, I handled not all uninit value bugs here. I hope, I fixed
>>      at least half of them
>>
>>
>> v1 -> v2:
>>   1. Make rtw_read*() return an error instead of initializing pointer to error
>>   2. Split one huge patch to smaller ones for each rtw_read{8,16,32} function
>>      changes
>>   3. Add new macro for printing register values (It helps to not copy-paste error
>>      handling)
>>   4. Removed {read,write}_macreg (Suggested by Phillip)
>>   5. Rebased on top of staging-next
>>   6. Cleaned checkpatch errors and warnings
>>
>> Only build-tested, since I don't have device with r8118eu chip
>>
>> Pavel Skripkin (6):
>>   staging: r8188eu: remove {read,write}_macreg
>>   staging: r8188eu: add helper macro for printing registers
>>   staging: r8188eu: add error handling of rtw_read8
>>   staging: r8188eu: add error handling of rtw_read16
>>   staging: r8188eu: add error handling of rtw_read32
>>   staging: r8188eu: make ReadEFuse return an int
>>
>>  drivers/staging/r8188eu/core/rtw_debug.c      |  79 +++-
>>  drivers/staging/r8188eu/core/rtw_efuse.c      | 125 +++--
>>  drivers/staging/r8188eu/core/rtw_io.c         |  27 +-
>>  drivers/staging/r8188eu/core/rtw_mp.c         |  70 ++-
>>  drivers/staging/r8188eu/core/rtw_mp_ioctl.c   |  13 +-
>>  drivers/staging/r8188eu/core/rtw_pwrctrl.c    |   5 +-
>>  drivers/staging/r8188eu/core/rtw_sreset.c     |   9 +-
>>  .../r8188eu/hal/Hal8188ERateAdaptive.c        |   8 +-
>>  drivers/staging/r8188eu/hal/HalPhyRf_8188e.c  |  21 +-
>>  drivers/staging/r8188eu/hal/HalPwrSeqCmd.c    |   9 +-
>>  drivers/staging/r8188eu/hal/hal_com.c         |  23 +-
>>  drivers/staging/r8188eu/hal/hal_intf.c        |   6 +-
>>  drivers/staging/r8188eu/hal/odm_interface.c   |  12 +-
>>  drivers/staging/r8188eu/hal/rtl8188e_cmd.c    |  33 +-
>>  drivers/staging/r8188eu/hal/rtl8188e_dm.c     |   6 +-
>>  .../staging/r8188eu/hal/rtl8188e_hal_init.c   | 285 +++++++++---
>>  drivers/staging/r8188eu/hal/rtl8188e_phycfg.c |  27 +-
>>  drivers/staging/r8188eu/hal/rtl8188e_sreset.c |  22 +-
>>  drivers/staging/r8188eu/hal/rtl8188eu_led.c   |  18 +-
>>  drivers/staging/r8188eu/hal/usb_halinit.c     | 439 +++++++++++++++---
>>  drivers/staging/r8188eu/hal/usb_ops_linux.c   |  57 ++-
>>  drivers/staging/r8188eu/include/hal_intf.h    |   6 +-
>>  .../staging/r8188eu/include/odm_interface.h   |   6 +-
>>  .../staging/r8188eu/include/rtl8188e_hal.h    |   2 +-
>>  drivers/staging/r8188eu/include/rtw_debug.h   |  13 +
>>  drivers/staging/r8188eu/include/rtw_efuse.h   |   4 +-
>>  drivers/staging/r8188eu/include/rtw_io.h      |  18 +-
>>  drivers/staging/r8188eu/include/rtw_mp.h      |   2 -
>>  drivers/staging/r8188eu/os_dep/ioctl_linux.c  | 179 +++++--
>>  drivers/staging/r8188eu/os_dep/usb_intf.c     |   3 +-
>>  30 files changed, 1138 insertions(+), 389 deletions(-)
>>
>> --
>> 2.32.0
>>
> 
> Dear Pavel,
> 
> Thanks for this. I like the code a lot. One thing I am conflicted on
> is the helper macro for the printing of register values though. Whilst
> I'm not necessarily opposed to the concept of the macro itself, I
> don't think it should rely on GlobalDebugLevel for one thing - if we
> are going to control printing of messages at runtime then in my mind
> this should be done via debugfs and pr_debug or similar - an in-kernel
> mechanism rather than something driver-provided. Also, the example you
> give of:
> 
>          u32 tmp;
>          if (!rtw_read(&tmp))
>                  DBG("reg = %d\n", tmp);
> 
> Doesn't seem overly unclear to me if DBG was a pr_debug or similar,
> but I get what you're saying about repetition. This is just a small
> thing though, would be interested to see what others think. Many
> thanks.
> 

Btw, did you have a chance to test these changes? My r8188eu device 
_should_ come in few days, so I am not able to test it right now :)


With regards,
Pavel Skripkin
