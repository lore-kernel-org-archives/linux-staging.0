Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59953FC6
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 06:38:04 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id k5so35775150lfu.4
        for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 23:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BdPvjfrmQQ4X+2I95FNkIpXIjWZA9GaTy/9OAFloBV0=;
        b=toFjt6rXy7Pmusgj8L6nhqNZ72vjcFD+p7frAiTVgYwHglEQA32TuNvsRsy2149h2x
         x7+BNvF7jCCI08tGc94PHdsOTonYIZW1TJ2Zt9SHIWHJOq2O704TgFxelhd92Cj7KZk/
         98gVfKzrZ1qTSv0Y5F7q0LL/LDf4ntFzaH1SVViELm+FDKwbTxFZSckWsubfkYtFguCX
         8hHuX49+hnhcbFwxaWlHVGHx6uDDEjDq8dE5gvxB3OfRCWott89GkpzpRl35ND0FMwj4
         SsBcPmcnw/wdqqGBKlT++qkCtXTYTGxh0BcpywyID4+5zJSWZVaZompfTLP/mNUraXmG
         adGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BdPvjfrmQQ4X+2I95FNkIpXIjWZA9GaTy/9OAFloBV0=;
        b=eghQaMGzbOD+MVIYuHZ/vSEAOnfEr+jODN0No20D5Fj6VFMsIghmH3zbT9YACqZWaF
         kiHwHWDHftNPTfKlos+T4HPi91gAQPi/ZgesN8IUu3WDm7t3srCntr6KSxiUU2vN7kEP
         ZJLUTvNmutddQpumPTCTCr4m1UTVfhXqIsLYCK0W2RdTetg6k2cyGkivtYWLgLYSYN/d
         FyXtGpfmvhzeg8dQZgR5+bSiYdszjCtulFyu0fsPTjqWz0Renzh7XUAcAiOgR55JHJgy
         UdmbVuxysWKPdiWYVxSjqKoopAZw5UnJL/aGueGAebnwNuur9+7lMZgODQVYtjCjx4SB
         cXVA==
X-Gm-Message-State: AOAM531TdwliLAMaXhPk+rpWI9NPakDdce9QSvPh9rbMx9NLXPawfqWx
	tNSbWSB93M1jUz79Re9WQEQ=
X-Google-Smtp-Source: ABdhPJwXKCiqe20T6HnUOSclz2zhNoM9BVFqEW4cvHnujWCGK34E+f5nA8oWSI+7bvYhRFABuk9m8g==
X-Received: by 2002:a05:6512:77:: with SMTP id i23mr23709477lfo.411.1629700682815;
        Sun, 22 Aug 2021 23:38:02 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id e4sm1346793ljq.84.2021.08.22.23.38.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Aug 2021 23:38:02 -0700 (PDT)
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
Message-ID: <21610b71-3f8e-4688-f669-44c8c849aac5@gmail.com>
Date: Mon, 23 Aug 2021 09:38:00 +0300
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

I've copy-pasted previous DBG() macro. I have a plan to clean up these 
debug macros in future, but I want to make these clean ups on top of 
this RFC to not rebase this huge patch set many times :)

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

To be honest, I made this macro, because I am lazy :P rtw_dbg_port() had 
a lot DBG_88E() calls with just register value, so I decided to wrap this.

I still believe, that this macro is useful, since callers won't care 
about creating temp variable and checking read() error code. This macro 
doesn't cover situation, where we want to print register + smth else, so 
if you have any idea about improvements, please, let me know :)


With regards,
Pavel Skripkin
