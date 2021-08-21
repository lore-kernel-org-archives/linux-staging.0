Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABA63FC0
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 10:35:53 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id f10so11343599lfv.6
        for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 03:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=p2ILHip+Un1i8xbxO/LoD+DyRHpJxEJdvl8oLcuRnHQ=;
        b=HlJ94LgCCzrbrmCls+aMx5C7thPSzEjKqX8GffT/ofEJSl5GYT8Bthi2/AqB4ga4JU
         TV6OT4QNtKUr8bi2CtXiQDr/IlDERZyzYNV9wBTC8HLLngq9dVul7jmccA4TsM9WIy/1
         dfUU4u4NCdYk+8xoLC7WcGuechxu/9mgP1JuCYYg8pVCgcnQFeNi/cwcHg4afvJpW/8d
         kZzU1LFgXt9p97xE62Ar8qu8JsDLjMf7OZWXPpWpzDrDvdIBDg6LtzDZVXrdH4Rxu1EH
         hHWt4p1nO4xxKkg2ZsKIKagSiZdAzkxB4CtdJTYq+jww2NrQ0uNQnWruTDrpFjaPmVDc
         O3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p2ILHip+Un1i8xbxO/LoD+DyRHpJxEJdvl8oLcuRnHQ=;
        b=KqTfyrEiwMyG1pta9z0rnMLv0CuT+dWy8Y3YxraGM0HTgZtyIoLkOe8/OPEwoVdu3T
         d664zNZ9J+r+RIYi8JjsQJyRZM6OdsdlgCe8YDIouVs8qWmVPGkFD7/OJKfdowhtbcF/
         VvdpGdwbZtYMgVQaVn/Kc70mVlcK5wLwrC5oeXiLPVEPFqc9ZEfFNl+wRv21fvFM0L6c
         6XW1zUw3qh/6gqeJY0vNL/PMXFtFeWxQxIN5tnt6/ku1os6WCe82+EpB+F6XpqBGxgQq
         kNSR7TQakiSuujsAFy/0+AAFyXOOYZSbb3r9KsLVdheZqRRva3UVXUvOGtLubdOgROGd
         5gLQ==
X-Gm-Message-State: AOAM53234NCUDwsdYAOIgQhVFlCluWbBXLYbAXqUHO6sLyZdyAlAaL+G
	mv9X3o8kTxoasV9IdnN9Few=
X-Google-Smtp-Source: ABdhPJxkz0ni7Le9UGTzLsIj5pXNyCyUv5SR8rcnU/55XuQVun9xBXgF7LKKf4DhBL5YLjcemeXWfw==
X-Received: by 2002:a05:6512:3d91:: with SMTP id k17mr18218873lfv.166.1629542151956;
        Sat, 21 Aug 2021 03:35:51 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id l14sm748043lji.106.2021.08.21.03.35.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Aug 2021 03:35:51 -0700 (PDT)
Subject: Re: [PATCH RFC 1/3] staging: r8188eu: add proper rtw_read* error
 handling
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 gregkh@linuxfoundation.org, straube.linux@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1629479152.git.paskripkin@gmail.com>
 <f4fb967c992c29c8d2e8f67e78835b52a60d2e52.1629479152.git.paskripkin@gmail.com>
 <5720270.rXTAdOU5UK@localhost.localdomain>
From: Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <31d61caa-d07d-193f-cd8e-adfbda1ff9e2@gmail.com>
Date: Sat, 21 Aug 2021 13:35:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <5720270.rXTAdOU5UK@localhost.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/21/21 8:55 AM, Fabio M. De Francesco wrote:
> On Friday, August 20, 2021 7:07:36 PM CEST Pavel Skripkin wrote:
>> rtw_read*() functions call usb_read* inside. These functions could fail
>> in some cases; for example: failed to receive control message. These
>> cases should be handled to prevent uninit value bugs, since usb_read*
>> functions blindly return stack variable without checking if this value
>> _actualy_ initialized.
>> 
>> To achive it, all usb_read* and rtw_read*() argument list is expanded
> 
> Dear Pavel,
> 
> Please, achive --> achieve.
> 
>> with pointer to error and added error usbctrl_vendorreq() error checking.
>> If transfer is successful error will be initialized to 0 otherwise to
>> error returned from usb_control_msg().
>> 
>> To not break the build, added error checking for rtw_read*() call all
>> across the driver.
>> 
>> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
>> ---
>>  drivers/staging/r8188eu/core/rtw_debug.c      |  79 +++-
>>  drivers/staging/r8188eu/core/rtw_efuse.c      |  83 +++-
>>  drivers/staging/r8188eu/core/rtw_io.c         |  18 +-
>>  drivers/staging/r8188eu/core/rtw_mp.c         |  37 +-
>>  drivers/staging/r8188eu/core/rtw_mp_ioctl.c   |  20 +-
>>  drivers/staging/r8188eu/core/rtw_pwrctrl.c    |   6 +-
>>  drivers/staging/r8188eu/core/rtw_sreset.c     |   7 +-
>>  drivers/staging/r8188eu/hal/HalPwrSeqCmd.c    |   9 +-
>>  drivers/staging/r8188eu/hal/hal_com.c         |  22 +-
>>  drivers/staging/r8188eu/hal/odm_interface.c   |  12 +-
>>  drivers/staging/r8188eu/hal/rtl8188e_cmd.c    |  37 +-
>>  drivers/staging/r8188eu/hal/rtl8188e_dm.c     |   6 +-
>>  .../staging/r8188eu/hal/rtl8188e_hal_init.c   | 198 +++++++--
>>  drivers/staging/r8188eu/hal/rtl8188e_phycfg.c |  26 +-
>>  drivers/staging/r8188eu/hal/rtl8188e_sreset.c |  20 +-
>>  drivers/staging/r8188eu/hal/rtl8188eu_led.c   |  17 +-
>>  drivers/staging/r8188eu/hal/usb_halinit.c     | 394 ++++++++++++++----
>>  drivers/staging/r8188eu/hal/usb_ops_linux.c   |  16 +-
>>  drivers/staging/r8188eu/include/rtw_io.h      |  18 +-
>>  drivers/staging/r8188eu/os_dep/ioctl_linux.c  | 168 +++++---
>>  20 files changed, 941 insertions(+), 252 deletions(-)
> 

Hi, Fabio!


Thank you for feedback

> I agree with Philip: please, split this long patch. If I were you, I'd make
> one patch for each of the three rtw_read*() and a fourth patch for usb_read*().
> 

Make sense. Will fix in v2.

>> --- a/drivers/staging/r8188eu/core/rtw_io.c
>> +++ b/drivers/staging/r8188eu/core/rtw_io.c
>> @@ -34,44 +34,44 @@ jackson@realtek.com.tw
>>  #define rtw_cpu_to_le16(val)		cpu_to_le16(val)
>>  #define rtw_cpu_to_le32(val)		cpu_to_le32(val)
> 
> Not related to your patch, these macros are useless and misleading.
> 

Sorry, I don't get it. I didn't touch these macros, it's part of diffstat.

>> -u8 _rtw_read8(struct adapter *adapter, u32 addr)
>> +u8 _rtw_read8(struct adapter *adapter, u32 addr, int *error)
>>  {
>>  	u8 r_val;
>>  	struct io_priv *pio_priv = &adapter->iopriv;
>>  	struct	intf_hdl *pintfhdl = &pio_priv->intf;
>> -	u8 (*_read8)(struct intf_hdl *pintfhdl, u32 addr);
>> +	u8 (*_read8)(struct intf_hdl *pintfhdl, u32 addr, int *error);
>>  
>>  
>>  	_read8 = pintfhdl->io_ops._read8;
>> -	r_val = _read8(pintfhdl, addr);
>> +	r_val = _read8(pintfhdl, addr, error);
>>  
>>  	return r_val;
>>  }
> 
> I really don't like passing errors through arguments. Why don't you pass
> a storage location where the function save the byte read and instead use the
> return for errors? I think that this would result in a cleaner design. Furthermore,
> it is used everywhere in the kernel.
>    

Yep, this will be more cleaner, but I decided to receive some feedback 
first about the idea. If this error handling is really necessary, I will 
rework this approach :)


>> -u16 _rtw_read16(struct adapter *adapter, u32 addr)
>> +u16 _rtw_read16(struct adapter *adapter, u32 addr, int *error)
>>  {
>>  	u16 r_val;
>>  	struct io_priv *pio_priv = &adapter->iopriv;
>>  	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
>> -	u16 (*_read16)(struct intf_hdl *pintfhdl, u32 addr);
>> +	u16 (*_read16)(struct intf_hdl *pintfhdl, u32 addr, int *error);
>>  
>>  	_read16 = pintfhdl->io_ops._read16;
>>  
>> -	r_val = _read16(pintfhdl, addr);
>> +	r_val = _read16(pintfhdl, addr, error);
>>  
>>  	return r_val;
>>  }
> 
> Same.
> 
>> -u32 _rtw_read32(struct adapter *adapter, u32 addr)
>> +u32 _rtw_read32(struct adapter *adapter, u32 addr, int *error)
>>  {
>>  	u32 r_val;
>>  	struct io_priv *pio_priv = &adapter->iopriv;
>>  	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
>> -	u32	(*_read32)(struct intf_hdl *pintfhdl, u32 addr);
>> +	u32	(*_read32)(struct intf_hdl *pintfhdl, u32 addr, int *error);
>>  
>>  	_read32 = pintfhdl->io_ops._read32;
>>  
>> -	r_val = _read32(pintfhdl, addr);
>> +	r_val = _read32(pintfhdl, addr, error);
>>  
>>  	return r_val;
>>  }
> 
> Same.
> 
> I'm done for now: too many lines to read all at once :)
> 



With regards,
Pavel Skripkin
