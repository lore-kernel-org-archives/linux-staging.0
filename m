Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C5C2E9ECA
	for <linux-staging@lists.linux.dev>; Wed, 14 Jan 2026 04:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768366105; cv=none; b=QNZTLHW076m5YQRPaPd6ben0gdpKFP0C+sDqWS0iOLHvP/x+RboelV0shMGkufxTYBaIPZKFwONWU2kdj9F0XpR3tuBUn2y8dI8gMDyVYm/A0zQ3Xy7AuQFcVGxv/149ISknkQPSfvVho/Ob+TrUTGFlv4hMxDgb4lSmZ3O2LGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768366105; c=relaxed/simple;
	bh=oeTWw/wWzUGbKLctFX+tsmOs0yR7460JiMwJcdOjAy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hL1knEdX0mtuMa6pwiOSPG3ftQVHheyVKqDvQmXulQ2WA+tSZugclF4S9p7wI+o8Yk+AIc9DZd8JUHUs02J5d4PMIAg90FGdrbKzKj2FLzAjNakYPFSIhy3FVHUCGKgNrfAOZ12xawmOwCSBPO+qM9zEdxgpaeaMLeD6/0bHSDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DU129mPL; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DU129mPL"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a137692691so54132575ad.0
        for <linux-staging@lists.linux.dev>; Tue, 13 Jan 2026 20:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768366076; x=1768970876; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3NFwjquWWIMR4Koo5/Xpv9KWDdiEv/zD2N0krq4V/fs=;
        b=DU129mPL40g9kKpS9+MsqAMsypFXmH/k9OLkaoxFdssdWzNSqzzlj1rDhkTpgTzDGO
         G6ruWGD70ICqNqM2VHEUcZgAy5x4W4FEamPlEB8g9hfNVgE+1BvDsHAp3gqPAuBRQo2s
         05ccCDgSj+34CYT22+SRL8QjZeokLvR7ssnmG/T0lpCX3mOX5qa9CmmUzAODp+kacWW+
         8If6W9AOyMxk3jKantxKRGIlX7bWhe3QFTce82zMVSOZyctOlhjjzJz6b2SXxqkRsT9R
         53+fYhuRAoQf0Nkj2HIbKHXhe3M7f7P0ppNE+BaAmQn8VMD9sdaHTbKw5yoRTWVCy0xi
         TnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768366076; x=1768970876;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3NFwjquWWIMR4Koo5/Xpv9KWDdiEv/zD2N0krq4V/fs=;
        b=JNhLHejiG5uTVIsJCLjv1liWiyiQJXCMVME7rZMI8ODXX90r7J7QcuF0d2qqVXhcg0
         GBQMsOSbdjoNVAz4YWexabVTk2w8nTavnkDq4Obg9DdiosNtuBapdjLD/26NSgBUnRdl
         Su0zqArV1q27Sh1IltjADCO9r3lqbBRYgSIezXF6o6ldRv5kXyPsCVkAk3UrjyRJylur
         i4CA+5Tg+E5YMJvZHOIukQk0QXEhNLYXul8a1vy6Y1qAI1Jo8LniewLPgYNHBYZ1FZx2
         Ckg2B5kJxF6vpmxGTcebKntdHgl3eYMTrH8QLcMM3dYP7WEFrhTmj15uS5j81j0yfbw4
         SDWg==
X-Forwarded-Encrypted: i=1; AJvYcCWfLfTWARfiD9MpZN+2PJeRhUuhzzyt7HIe8WXcAQZTOF0MXWJ2L6Zk+QQyERpjf5RmpOK6CfMLQEjyrvK0@lists.linux.dev
X-Gm-Message-State: AOJu0YxFEVm/xNvFN3mpAoNJ3k2mSB7SOdouy2ZmYn/H+d6Vwvx9Gq/K
	8IbEnfkdAQKtR9zlvUWHYvG0zxfceK3SYbdvM0Ma1QFU5hLWF9varMx1
X-Gm-Gg: AY/fxX488yKSWGhRMMxuCn/P7wV385SKcb5RGFWgNvarHvURTor+Q7tXuKm31WYtqRY
	VW0f4kPOG6ANS2AU0bUDRjCrErTQLOvOBqBKgSMe7r8CeNY89Uf+pmWLGDpZk00ZJv29X4rsACP
	aYu1jZp7xXoCdqiuyyVdf/ctSRhGf0j7t0E0iaGW1XXexcbqhsTIYJYc6CA+qB6qyuooezZ8UdR
	lYB0h3H4uJftkZTQRW11q9kNiMU0cIiPJhnh1nDJwpzZdXjoaw4VNBBIAy1xOyDiyYPiNHPwBdU
	S3xmc6NHR02Qvq2v+LLfUgu3Oz6fBm5wpsBin3vRsZwoMOzJsPFqlOAdypjtsGFPl9sNJivMOAQ
	vKtyD3ibyOM0bB6doh0c5H9YttTZsDP7+FkonEDPAmSZPgvifgtfJOwOQyZEGKFJUDREnyKH48S
	5cRBRLjSpaBaWjmivGGXhLxpalqIODXV4m4d5COQ7Y0hD7MoJ8ewMC53P04rg4
X-Received: by 2002:a17:903:11c3:b0:2a0:c884:7f03 with SMTP id d9443c01a7336-2a59bc12d90mr8348595ad.44.1768366075547;
        Tue, 13 Jan 2026 20:47:55 -0800 (PST)
Received: from ?IPV6:2601:1c0:5780:9200:2c53:988c:79cd:8451? ([2601:1c0:5780:9200:2c53:988c:79cd:8451])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c48931sm211402105ad.29.2026.01.13.20.47.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 20:47:55 -0800 (PST)
Message-ID: <0a90bd0a-cb74-43a3-a50b-4c83bc086556@gmail.com>
Date: Tue, 13 Jan 2026 20:47:54 -0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] staging: fbtft: Use fbdev logging helpers when
 FB_DEVICE is disabled
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, andy@kernel.org,
 deller@gmx.de, kernel test robot <lkp@intel.com>
References: <20260113045909.336931-1-chintanlike@gmail.com>
 <2026011341-chomp-protegee-6be5@gregkh>
Content-Language: en-US
From: Chintan Patel <chintanlike@gmail.com>
In-Reply-To: <2026011341-chomp-protegee-6be5@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 1/12/26 22:16, Greg KH wrote:
> On Mon, Jan 12, 2026 at 08:59:09PM -0800, Chintan Patel wrote:
>> Replace direct accesses to info->dev with fb_dbg() and fb_info()
>> helpers to avoid build failures when CONFIG_FB_DEVICE=n.
> 
> Why is there a fb_* specific logging helper?  dev_info() and dev_dbg()
> should be used instead.


You’re correct that dev_dbg()/dev_info() are the standard logging APIs.

The reason I switched to fb_dbg()/fb_info() is not stylistic: direct
dereferences of info->dev / fb_info->dev are invalid when
CONFIG_FB_DEVICE=n, which causes compile-time errors.

fb_dbg() and fb_info() are framebuffer-specific helpers that handle
this case correctly, allowing logging without touching info->dev.

> 
>> Fixes: a06d03f9f238 ("staging: fbtft: Make FB_DEVICE dependency optional")
> 
> Is this really a bug?

The build failure occurs when CONFIG_FB_DEVICE=n, where direct
dereferences of info->dev / fb_info->dev are not valid. This was 
reported by the kernel test robot.

That said, I’m fine dropping the Fixes tag if you don’t consider this a
regression.

>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202601110740.Y9XK5HtN-lkp@intel.com
>> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
>>
>> Changes in v6:
>> - Switch debug/info logging to fb_dbg() and fb_info()(suggested by Thomas Zimmermann)
>> - Drop dev_of_fbinfo() usage in favor of framebuffer helpers that implicitly
>>    handle the debug/info context.
>> - Drop __func__ usage per review feedback(suggested by greg k-h)
>> - Add Fixes tag for a06d03f9f238 ("staging: fbtft: Make FB_DEVICE dependency optional")
>>    (suggested by Andy Shevchenko)
>>
>> Changes in v5:
>> - Initial attempt to replace info->dev accesses using
>>    dev_of_fbinfo() helper
>> ---
> 
> The changelog stuff goes below the --- line.

Ack.

> 
>>   drivers/staging/fbtft/fbtft-core.c | 19 +++++++++----------
>>   1 file changed, 9 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
>> index 8a5ccc8ae0a1..1b3b62950205 100644
>> --- a/drivers/staging/fbtft/fbtft-core.c
>> +++ b/drivers/staging/fbtft/fbtft-core.c
>> @@ -365,9 +365,9 @@ static int fbtft_fb_setcolreg(unsigned int regno, unsigned int red,
>>   	unsigned int val;
>>   	int ret = 1;
>>   
>> -	dev_dbg(info->dev,
>> -		"%s(regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X)\n",
>> -		__func__, regno, red, green, blue, transp);
>> +	fb_dbg(info,
>> +	       "regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X\n",
>> +	       regno, red, green, blue, transp);
> 
> I dont understand what is wrong with the existing dev_dbg() line (with
> the exception that __func__ should not be in it.
> 
>>   
>>   	switch (info->fix.visual) {
>>   	case FB_VISUAL_TRUECOLOR:
>> @@ -391,8 +391,7 @@ static int fbtft_fb_blank(int blank, struct fb_info *info)
>>   	struct fbtft_par *par = info->par;
>>   	int ret = -EINVAL;
>>   
>> -	dev_dbg(info->dev, "%s(blank=%d)\n",
>> -		__func__, blank);
>> +	fb_dbg(info, "blank=%d\n", blank);
> 
> Same here, what's wrong with dev_dbg()?
> 

Same reason: dereferencing info->dev is invalid when CONFIG_FB_DEVICE=n. 
fb_dbg() handles this correctly without needing info->dev.

>>   
>>   	if (!par->fbtftops.blank)
>>   		return ret;
>> @@ -793,11 +792,11 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
>>   	if (spi)
>>   		sprintf(text2, ", spi%d.%d at %d MHz", spi->controller->bus_num,
>>   			spi_get_chipselect(spi, 0), spi->max_speed_hz / 1000000);
>> -	dev_info(fb_info->dev,
>> -		 "%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
>> -		 fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
>> -		 fb_info->fix.smem_len >> 10, text1,
>> -		 HZ / fb_info->fbdefio->delay, text2);
>> +	fb_info(fb_info,
>> +		"%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
>> +		fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
>> +		fb_info->fix.smem_len >> 10, text1,
>> +		HZ / fb_info->fbdefio->delay, text2);
> 
> When drivers work properly, they are quiet.  Why is this needed at all
> except as a debug message?

Agreed. The informational message during framebuffer registration is not
necessary. I will either remove it entirely or convert it to a 
debug-only message.

I’ll rework the patch accordingly and resend.

Thanks again for the guidance.


