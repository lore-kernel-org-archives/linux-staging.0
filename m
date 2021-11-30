Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDDC2CA1
	for <linux-staging@lists.linux.dev>; Tue, 30 Nov 2021 20:22:58 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id u1so47034419wru.13
        for <linux-staging@lists.linux.dev>; Tue, 30 Nov 2021 12:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=02uY4AmojDwifo7LgepwuVCqs4Jz+sFd/07AQHN7lY0=;
        b=jbF/TxWeIOG9zF+Sg6hp+nRBv7Ql9V7HNVmAjWhvG7abajbX923ZC/ZZs+GFWcFKjp
         JpHt3aGvrrWCQAXAaV8IjEWvrRk+E3Qfl71sdfYM7jWB+7sH8sernuoAs7OZl4ljHY1z
         ArHlhlavWip4kdFPzLyrdOMRCbwf1xTqcT+arquc+ngNhHn0ieqwUmFuWi3aaQW/9nnk
         iLa53Wx/Yjo30/xm2KgOtU2vqczHgVVlCx/v5kqwDzNU09uRLlggFDVt5i8XGdvVRugd
         XbeG1iMzmFe/7bsrtrrb8HI4FWRRSC6vCntmUbwmM4InTF/yc2485UuWWZoHNppHOOhl
         o/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=02uY4AmojDwifo7LgepwuVCqs4Jz+sFd/07AQHN7lY0=;
        b=ZD5jPKy73qmlY/6SEFrcAAlEXTo9a6SGQjh0FFfDKBn4hbi7Z8vqmfYX5cWLEkvU4v
         h641kJjhFalxn3NZuRPxhH38/CvudNBFQdwySaC3pxsMaCp57TBBoP6olJMoSR13tyfP
         HD7LR64fmmVKLffAPjIns54Z7LFUgLGuLEh4xJroVVX2gOMMjZsmobuw4/2Hbh1R+FSU
         dJjMSfn3k8RvOjOXdzI4bihvLjM8r2a756peYFFfnIAsEMhFgK4lsB32pv3iqbko1KXU
         WpbSGL5pHSDS/daEb/WyjTVYgDMoGTH0CuKBv4R4WB6YmP22wuxUng6/pU4+bZDLvL7b
         TDpg==
X-Gm-Message-State: AOAM5324qQc4NHCG/V0oWKvG/Vqrmhqy34WQXyYWNuo7kot0XrXfEp1c
	XF4+nHaf7WAGx9OSl1+sNc3B8U9yrQI=
X-Google-Smtp-Source: ABdhPJzJTgk7rUqaZ3m5/DRW8UjR5XiojzKeXyklSH+D4g5cHUFuA0L9SjbjHQ/YuoUjc9TpybqKSw==
X-Received: by 2002:a5d:64e7:: with SMTP id g7mr1264073wri.350.1638303776509;
        Tue, 30 Nov 2021 12:22:56 -0800 (PST)
Received: from ?IPV6:2003:ea:8f1a:f00:cdea:1258:1cb4:5e92? (p200300ea8f1a0f00cdea12581cb45e92.dip0.t-ipconnect.de. [2003:ea:8f1a:f00:cdea:1258:1cb4:5e92])
        by smtp.googlemail.com with ESMTPSA id m125sm3216445wmm.39.2021.11.30.12.22.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Nov 2021 12:22:56 -0800 (PST)
Message-ID: <8597bdf2-c383-43b5-6205-f78c90b4957a@gmail.com>
Date: Tue, 30 Nov 2021 21:22:50 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] staging: fbtft: add spi_device_id table
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-staging@lists.linux.dev
References: <aadbd32c-c0ab-4c8a-c590-3334f736f224@gmail.com>
 <CAMuHMdU_90XdFZM6kVA78XUX+7+Jm1WqjBmBN7irVOY3k-Gcfg@mail.gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <CAMuHMdU_90XdFZM6kVA78XUX+7+Jm1WqjBmBN7irVOY3k-Gcfg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.11.2021 09:16, Geert Uytterhoeven wrote:
> Hi Heiner,
> 
> On Mon, Nov 29, 2021 at 10:12 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>> After 5fa6863ba692 ("spi: Check we have a spi_device_id for each DT
>> compatible") we need the following to make the SPI core happy.
>>
>> Works for me with a SH1106-based OLED display.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/staging/fbtft/fbtft.h
>> +++ b/drivers/staging/fbtft/fbtft.h
>> @@ -307,12 +307,19 @@ static const struct of_device_id dt_ids[] = {                              \
>>                                                                            \
>>  MODULE_DEVICE_TABLE(of, dt_ids);                                           \
>>                                                                            \
>> +static const struct spi_device_id spi_ids[] = {                            \
>> +       { .name = _compatible },                                           \
> 
> Shouldn't this be the part of _compatible after the "<vendor>," prefix?
> 

You're right. I was fooled by a new bug in SPI core that made the warning
suddenly disappear:
https://patchwork.kernel.org/project/spi-devel-general/patch/44b2ad71-dc4b-801c-237f-9c233f675c0d@gmail.com/

>> +       {},                                                                \
>> +};                                                                         \
>> +                                                                          \
>> +MODULE_DEVICE_TABLE(spi, spi_ids);                                        \
>>                                                                            \
>>  static struct spi_driver fbtft_driver_spi_driver = {                       \
>>         .driver = {                                                        \
>>                 .name   = _name,                                           \
>>                 .of_match_table = dt_ids,                                  \
>>         },                                                                 \
>> +       .id_table = spi_ids,                                               \
>>         .probe  = fbtft_driver_probe_spi,                                  \
>>         .remove = fbtft_driver_remove_spi,                                 \
>>  };                                                                         \
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 

