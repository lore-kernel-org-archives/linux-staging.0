Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66021EEFD
	for <linux-staging@lists.linux.dev>; Sun, 17 Mar 2024 20:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710706059; cv=none; b=BS1G3gigd1bPaoe9w2tBrRuNPtpaLzsRVsOxWV4y7JkRZcRCRajc2dXvmSZt5ds/B6SQMhOMLptnnINQPJ8ZTF07wAs32UXuZ6hO7sgBhQqjEoF4p64p+vabOC/trBr5HEcAsbCVQjLJ8wzBB3I/bnFrBrM5jStZ5Qq+VDR/Yk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710706059; c=relaxed/simple;
	bh=kdZ6u9Ut7hq0bFYMJMl7COnPyTq4zEv4NiIpOq2MWP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GHY/P7Tt5iNpwAOUcpj/HDnRbi6X3bk/NGjBJZCmaOHwdQ1rGLkhI8+6v0ykhQbrV7fe5HAEXEsVeyF9/9/dBBcAk1Q8tMdM+eMEJXaScZzNN9EW3FMZTNIO7UzTy7Tf9xg8964vPcuVkVaDmpQp1Pe9wW37v6fU+EKcqLFLiqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5igsEjq; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5igsEjq"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a469dffbdfeso58836966b.0
        for <linux-staging@lists.linux.dev>; Sun, 17 Mar 2024 13:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710706056; x=1711310856; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V4qvZkUQarrx0iYNI4lczPEauFHLXfI/CeYtxbbYnts=;
        b=l5igsEjqTx3nEwtmgW9ZQUD4et61Fy528o8xhEVfNWCNy4bi1tPzdjqBT1MAS26XYr
         RSnUIwv+UqDKzuTHFtZQe8ETuMoN7MMj/tPFERHPDzd9AM8yR/wW6VM+UUMIEordrtY6
         2YoAmb1prwabMBUOwFw91PTh0pySrOyiFFCKV8tfYhIR71k5PYm7VdKWBkOr6+KH72JI
         qxpT8mSintbR3n2T85QXKYm/E+SxapU8qWM6o9Z/52OOJfkey9dbt4EjysftH/WlCk85
         /upgNfVJw1yp+Agr2OE4Ra0AG1CPrjA0Bc+czzz1UpWe1Az3V/OMyVJU24rt6T+r8ssu
         9gdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710706056; x=1711310856;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V4qvZkUQarrx0iYNI4lczPEauFHLXfI/CeYtxbbYnts=;
        b=cne4r55XuMWzCrd4ijh0HIYXtoP6/wNbcZmKCqfuBTqb64eblNbm/k14+sJt8xW+k8
         QMUkVa+cdy4wCxULW7uE/QY+qvchLme6NFyEUiDsJ6qNxyx10YDgDvwzr+TZ/lLE+p0C
         U9oJfgd5Qxs/MztRqtoQlAkJKBzCuIMsYPS7V93GklDI/P68Yl9kJefRTK3+BrMlSXPJ
         vf0QkEDceoWf1C2PTaMJs8lYJdkfuPUJ1MLnCdNjNGl86xaHxYlX74Vqi+ijSaZOqx/D
         hoz1sBkTF2S9i8Dg18bw5iHbo6TRPl9VtmeB3OWw8rXl5y4soTn1XLujiN/lsfo82EOU
         wByg==
X-Forwarded-Encrypted: i=1; AJvYcCUTgpGASBODhphHWDwghntlrElRPyKexfYQFPJbaTr0w8rhr6JO9X+ata95x3IeRU6PY3eP3UAgT+7/TRcJy5wb+hhRH+USKR81lzW6tg==
X-Gm-Message-State: AOJu0YwDcVEkGHtGEan/j2fz01czD+tF4aOZCH3d6YH1n0OiBPdNkI0d
	3T3f5yi5lhSI+0LXOCYdSGcOzRCF+lfSxFsW7GXhWGz0x7YE7KBqUjW8VN79
X-Google-Smtp-Source: AGHT+IGH8v2ezB+ucuzXtpOUhaAWijlhYPJr5qUhZXrNfUz4HvronYNFXKEvNtU/vbrW/qLfDalJGw==
X-Received: by 2002:a17:907:720b:b0:a46:aaaa:9424 with SMTP id dr11-20020a170907720b00b00a46aaaa9424mr2979935ejc.5.1710706055903;
        Sun, 17 Mar 2024 13:07:35 -0700 (PDT)
Received: from [192.168.0.104] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id h21-20020a17090619d500b00a46447348e8sm4059941ejd.191.2024.03.17.13.07.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Mar 2024 13:07:35 -0700 (PDT)
Message-ID: <6c772d15-d249-4175-93f4-ca523006129b@gmail.com>
Date: Sun, 17 Mar 2024 21:07:34 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] staging: wlan-ng: Driver broken since kernel 5.15
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>, Lee Jones <lee@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Larry.Finger@lwfinger.net, johannes@sipsolutions.net, kvalo@kernel.org,
 arnd@arndb.de
References: <6dc14151-e71e-4118-826d-3ca5c8ee907f@gmail.com>
 <fba3951f-00b7-41af-8ef4-1e7c86e0cb48@moroto.mountain>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <fba3951f-00b7-41af-8ef4-1e7c86e0cb48@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/11/24 08:04, Dan Carpenter wrote:
> On Sat, Mar 09, 2024 at 11:09:24PM +0100, Philipp Hortmann wrote:
>> Hi,
>>
>> I would remove the driver from the mainline kernel. What are your thoughts?
>>
>> I bought two WLAN devices (DUT: D-Link DWL-122 and T-Sinus 111 data) that
>> are supported by wlan-ng driver. Issue is that the driver is not working
>> anymore.
>>
>> The error picture is that the device does not receive any packets.
>> The dmesg says:
>> [  123.695917] prism2_usb 2-1.6:1.0 wlan0: Unknown mgmt request message
>> 0x0e4f9800
>> [  127.508211] prism2_usb 2-1.6:1.0 wlan0: Unknown mgmt request message
>> 0x04f0d000
>> ...
>>
>> A working commit 8fc4fb1728855a22f9149079ba51877f5ee61fc9 (HEAD) Date: Mon
>> Jul 5 11:16:28 2021 -0700
>> A failing commit  d980cc0620ae77ab2572235a1300bf22519f2e86 (HEAD) Date:  Fri
>> Jul 16 19:08:09 2021 -0700
> 
> Those dates are 11 days apart during the v5.14 merge window.  You're
> saying 5.15 is broken but the broken commit is in 5.14-rc2 so it really
> was broken earlier.
> 
> There were only 3 patches to wlan-ng between v5.13 and v5.14.
> 
> $ git log --oneline v5.13..v5.14 drivers/staging/wlan-ng/
> b1e9109aeff3 staging: wlan-ng: silence incorrect type in argument 1 (different address spaces)
> ad843f392035 staging: wlan-ng: remove redundant initialization of variable txresult
> ea82ff749587 staging: wlan-ng: cfg80211: Move large struct onto the heap
> 
> Obviously I'm going to suspect the largest patch.  Reviewing that patch
> now, I see we removed a memset() from the loop.  That seems like a bug.
> 
> -               memset(&msg2, 0, sizeof(msg2));
> -               msg2.msgcode = DIDMSG_DOT11REQ_SCAN_RESULTS;
> -               msg2.bssindex.data = i;
> +               msg2->msgcode = DIDMSG_DOT11REQ_SCAN_RESULTS;
> +               msg2->bssindex.data = i;
> 
> That's the only interesting change so I suspect it's the issue...
> Could you test this patch?  I feel like if you're the first person to
> complain since Aug 29 2021 then probably we should just remove the
> driver.  Greg is on vacation so lets hold off on removing it until he
> comes back.
> 
> regards,
> dan carpenter
> 
> 
> diff --git a/drivers/staging/wlan-ng/cfg80211.c b/drivers/staging/wlan-ng/cfg80211.c
> index 471bb310176f..0c270ed8ce67 100644
> --- a/drivers/staging/wlan-ng/cfg80211.c
> +++ b/drivers/staging/wlan-ng/cfg80211.c
> @@ -347,6 +347,7 @@ static int prism2_scan(struct wiphy *wiphy,
>   	for (i = 0; i < numbss; i++) {
>   		int freq;
>   
> +		memset(msg2, 0, sizeof(*msg2));
>   		msg2->msgcode = DIDMSG_DOT11REQ_SCAN_RESULTS;
>   		msg2->bssindex.data = i;
>   


Hi Dan,

sorry it is so crowded here.

You are right with the statement that it is this commit.
commit ea82ff749587807fa48e3277c977ff3cec266f25 (HEAD)
Author: Lee Jones <lee.jones@linaro.org>
Date:   Wed Apr 14 19:10:39 2021 +0100

     staging: wlan-ng: cfg80211: Move large struct onto the heap

     Fixes the following W=1 kernel build warning(s):

      drivers/staging/wlan-ng/cfg80211.c: In function ‘prism2_scan’:
      drivers/staging/wlan-ng/cfg80211.c:388:1: warning: the frame size 
of 1296 bytes is larger than 1024 bytes [-Wframe-larger-than=]

But It is not depending on the line you pointed to.

I need another week to look into this.

Thanks for your support.

Bye Philipp

