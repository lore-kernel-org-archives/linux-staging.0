Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799EE3FC2
	for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 10:58:35 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id i28so5977361lfl.2
        for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 03:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5b4nVpxfO8+NW6CZGRFVhkfRZGNTXTJfSlprSFO/SUc=;
        b=hSnH37Gz97HUiPA9Iv84KZEa8lYGj8z7xoa7efQ50GAJ19HS4m6QoOsNQ6kxT8+O9T
         H3ZWG+2Z+0Rx0r34Hih+3IOPEcPKulLgTwk8ZdDW3xhr9btKN5DDmqpzz5j2gy98rfBQ
         Cl8fzQq3NfloQ6pWweFkd1Kvsx+Tjz9un/xMmWqCKfX9yNNHz5b1rounJ9eW4HRO3M2b
         oZuUqoycE2qzb96dEw7x8tF2rqryuVwjjyAOunoC6jYz/B/+4hlXbUjTojGJ6A2xkjGz
         gc1c9lQAxMXhdFTtLy4/KygOFnPBghLkrWar3Sn77IqGrCKS2kMxRfTzPLWc4Ya9bLid
         uuNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5b4nVpxfO8+NW6CZGRFVhkfRZGNTXTJfSlprSFO/SUc=;
        b=aDu1H4qi6iKU4NlyObYgez7ZVV1+ui8IZUGht3nfBZKUqo7hWEXmY8knUCyd4Ax4ep
         V00Jplz3BJv4X9ZgHDL0LxCoy2B+ZCSPRzlrqQzENxPW39EuWIrlF8r/2ICZ9YHXdBc5
         AcOjhzxxzm/Fkx9mT6TLL7w0LPA+sJ88iBPZzeQz3Hu5poEIFqqZrpSICMhL9/X/QJka
         b3O+LwJXHy4v82TmB0+1Q35vGZcCZkBL38fu/1YutmKqLYBdtfE0BLpi+0aujbpInPbi
         bqWrMfBnvZtMAlN7YWp/zDG7BlBSsbZwFPi67hK5L9KLUQ/pUL95chOqvKLxonQgOCOO
         kXPw==
X-Gm-Message-State: AOAM531iiPHVxYMWprdfsg5vCEbBBKeFdOLE5qvwiv+0r2/LI8bIJZl4
	b2quGT1YXMEtHo5nu7+plyA=
X-Google-Smtp-Source: ABdhPJxtZciDlTE0gnbhK5e2fl7b2yxfmam1d6kJUpnab2Faffe3FszLMv/toy3qAuhLyM+xnOrBGw==
X-Received: by 2002:a05:6512:3ca4:: with SMTP id h36mr2240189lfv.170.1629975513576;
        Thu, 26 Aug 2021 03:58:33 -0700 (PDT)
Received: from localhost.localdomain ([46.61.204.60])
        by smtp.gmail.com with ESMTPSA id q9sm314463lfn.170.2021.08.26.03.58.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Aug 2021 03:58:33 -0700 (PDT)
Subject: Re: [PATCH v3 4/6] staging: r8188eu: add error handling of rtw_read16
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 straube.linux@gmail.com, fmdefrancesco@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1629789580.git.paskripkin@gmail.com>
 <d06f3173e0a4c6f5449d5551cbfb0202849332b7.1629789580.git.paskripkin@gmail.com>
 <YSdx4ixYYAyZkOzR@kroah.com>
From: Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <ce0db9b5-9222-0b84-81ba-d584b0dd5739@gmail.com>
Date: Thu, 26 Aug 2021 13:58:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YSdx4ixYYAyZkOzR@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/26/21 1:50 PM, Greg KH wrote:
> On Tue, Aug 24, 2021 at 10:27:35AM +0300, Pavel Skripkin wrote:
>> _rtw_read16 function can fail in case of usb transfer failure. But
>> previous function prototype wasn't designed to return an error to
>> caller. It can cause a lot uninit value bugs all across the driver code,
>> since rtw_read16() returns local stack variable to caller.
>> 
>> Fix it by changing the prototype of this function. Now it returns an
>> int: 0 on success, negative error value on failure and callers should pass
>> the pointer to storage location for register value.
>> 
>> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
>> ---
>>  drivers/staging/r8188eu/core/rtw_debug.c      |  7 +++-
>>  drivers/staging/r8188eu/core/rtw_io.c         |  9 ++---
>>  drivers/staging/r8188eu/core/rtw_mp_ioctl.c   |  4 +-
>>  drivers/staging/r8188eu/hal/odm_interface.c   |  4 +-
>>  .../staging/r8188eu/hal/rtl8188e_hal_init.c   | 29 +++++++++++----
>>  drivers/staging/r8188eu/hal/rtl8188e_phycfg.c |  5 ++-
>>  drivers/staging/r8188eu/hal/usb_halinit.c     | 37 ++++++++++++++++---
>>  drivers/staging/r8188eu/hal/usb_ops_linux.c   | 22 +++++++++--
>>  .../staging/r8188eu/include/odm_interface.h   |  2 +-
>>  drivers/staging/r8188eu/include/rtw_io.h      |  6 +--
>>  drivers/staging/r8188eu/os_dep/ioctl_linux.c  | 28 +++++++++++---
>>  11 files changed, 115 insertions(+), 38 deletions(-)
>> 
>> diff --git a/drivers/staging/r8188eu/core/rtw_debug.c b/drivers/staging/r8188eu/core/rtw_debug.c
>> index 8b7d3eb12bd0..a41675e101ac 100644
>> --- a/drivers/staging/r8188eu/core/rtw_debug.c
>> +++ b/drivers/staging/r8188eu/core/rtw_debug.c
>> @@ -91,7 +91,12 @@ int proc_get_read_reg(char *page, char **start,
>>  				proc_get_read_addr, (u8) tmp);
>>  		break;
>>  	case 2:
>> -		len += snprintf(page + len, count - len, "rtw_read16(0x%x)=0x%x\n", proc_get_read_addr, rtw_read16(padapter, proc_get_read_addr));
>> +		error = rtw_read16(padapter, proc_get_read_addr, (u16 *) &tmp);
>> +		if (error)
>> +			return len;
>> +
>> +		len += snprintf(page + len, count - len, "rtw_read16(0x%x)=0x%x\n",
>> +				proc_get_read_addr, (u16) tmp);
>>  		break;
>>  	case 4:
>>  		len += snprintf(page + len, count - len, "rtw_read32(0x%x)=0x%x\n", proc_get_read_addr, rtw_read32(padapter, proc_get_read_addr));
>> diff --git a/drivers/staging/r8188eu/core/rtw_io.c b/drivers/staging/r8188eu/core/rtw_io.c
>> index 2714506c8ffb..fd64893c778d 100644
>> --- a/drivers/staging/r8188eu/core/rtw_io.c
>> +++ b/drivers/staging/r8188eu/core/rtw_io.c
>> @@ -45,18 +45,15 @@ int __must_check _rtw_read8(struct adapter *adapter, u32 addr, u8 *data)
>>  	return _read8(pintfhdl, addr, data);
>>  }
>>  
>> -u16 _rtw_read16(struct adapter *adapter, u32 addr)
>> +int __must_check _rtw_read16(struct adapter *adapter, u32 addr, u16 *data)
>>  {
>> -	u16 r_val;
>>  	struct io_priv *pio_priv = &adapter->iopriv;
>>  	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
>> -	u16 (*_read16)(struct intf_hdl *pintfhdl, u32 addr);
>> +	int (*_read16)(struct intf_hdl *pintfhdl, u32 addr, u16 *data);
>>  
>>  	_read16 = pintfhdl->io_ops._read16;
> 
> Why do you need this extra pointer abstraction anyway?  Please unwind
> that first, which will make this function go away (or get easier to
> understand at the least...)
> 
It was there before my changes :) I had a plan to clean up DBG macros 
and this abstraction after adding error handling...


If you feel, that these clean up are needed before error handling, I can 
add them to this series :) Anyway, some of them are already in my local 
tree



With regards,
Pavel Skripkin
