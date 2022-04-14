Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6362B7A
	for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 15:46:16 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id q189so5798696oia.9
        for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 08:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KR/Wxn4SQ4JrdCT3cLRPKdG0x0HkSw7hlrSRgpKxYRQ=;
        b=WxGLEf6RY4Ooaba17rTS2bxOsi1wbArLPsvCGHueZ0EgeXSKI8ehlSomOomZ843peY
         MT99q2ov+J3Rtn4ISYH30xr3Fqbf1IGsbgowwpBIDPIQvgFnzUWNEuWywdaoAGAPT4uL
         hjKlgfvRRNnsfCBpmargyVQR5vZhmFI5OBkEE4wLrszAftAXofSKCQld/66XgO2DCTzt
         RdHJMW1EqEcEf710V5z7bovMgvXw2ghZFAhDl/dFmakku7S9OTCE0rp8sP+1XcjWQdUk
         RtYoMrRiKmRwVSW8GhJXnybLCwgwXRs8DxCsmkBZI9WovUrqv0NCVpQt02+LJAwNCNn8
         EyJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KR/Wxn4SQ4JrdCT3cLRPKdG0x0HkSw7hlrSRgpKxYRQ=;
        b=NQRaWgWPRjBzNGN0GkIHT7eNQ9XtTZig2Dk1RCCh7FIA5JHV5UvocnaVUuK53Q1Zm4
         xJi0xyBdIWyv2SNUbIboBbfQ2k5DzYe+PrjAvCM4wyTnAdqo8tQDVqPTl/yhQ5Q6TOnV
         9MBwAW3OlSy97qsJFGnUafiGsaTwkjURFIYUzOxf5TKfx9b0DyjmwnUymfMFQ0tWQgwS
         qUSYqPalIbjGIWgT6i+fWIT2MfN+2NcA+4t+0QuoITM3gdf6f3aKl7lB0wTc2Qum/fxJ
         mWUy1Sg6yRI/fd+6ZPvERKlZt1G9usQrmnMm5KkQCfr3cWC8FnlVTcrBpJsVuSHOREz8
         Xd8A==
X-Gm-Message-State: AOAM5327zsnTrJwXX0cG+npBIVP9MXCNzBfk+oO4QfdQ/vnKfjb1Msy2
	ZZXq93anb1GwCEbmRbeftGk=
X-Google-Smtp-Source: ABdhPJzcKsa2KobE36DJzPycSbTLyQTt+rNh4aIE9O5a2+cQJKtrZ72LtxatOUPkgz5FF2E/PjnEbw==
X-Received: by 2002:a05:6808:18a0:b0:2d9:bde3:5776 with SMTP id bi32-20020a05680818a000b002d9bde35776mr1996277oib.29.1649951175554;
        Thu, 14 Apr 2022 08:46:15 -0700 (PDT)
Received: from ?IPV6:2603:8090:2005:39b3::100e? (2603-8090-2005-39b3-0000-0000-0000-100e.res6.spectrum.com. [2603:8090:2005:39b3::100e])
        by smtp.gmail.com with ESMTPSA id pp23-20020a0568709d1700b000e2d876505dsm759641oab.32.2022.04.14.08.46.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Apr 2022 08:46:15 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <8d067bcc-3405-420e-655f-ce97b8b5e798@lwfinger.net>
Date: Thu, 14 Apr 2022 10:46:14 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: staging: r8188eu: struct rt_firmware_header issues
Content-Language: en-US
To: David Laight <David.Laight@ACULAB.COM>,
 'Michael Straube' <straube.linux@gmail.com>
Cc: Phillip Potter <phil@philpotter.co.uk>,
 Greg KH <gregkh@linuxfoundation.org>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <94a72ecc-3acd-758b-15a4-a7d56bf03fbe@gmail.com>
 <86a66ea4-45e3-cfa2-9130-f698ae212bfd@gmail.com>
 <51e706400b914552bfda6353020da17e@AcuMS.aculab.com>
 <a40a2a1b-a8f1-e720-be92-48858d4f6678@gmail.com>
 <74ff67ec85e14e16bb2e9f57a4fccb17@AcuMS.aculab.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <74ff67ec85e14e16bb2e9f57a4fccb17@AcuMS.aculab.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/14/22 05:14, David Laight wrote:
> From: Michael Straube
>> Sent: 14 April 2022 11:08
>>
>> On 4/14/22 10:41, David Laight wrote:
>>> From: Michael Straube
>>>> Sent: 13 April 2022 20:42
>>>>
>>>> On 4/13/22 18:27, Michael Straube wrote:
>>>>> Hi all,
>>>>>
>>>>> I think the rt_firmware_hdr structure in rtw_fw.c has some issues.
>>>>>
>>>>>
>>>>> struct rt_firmware_hdr {
>>>>>        /*  8-byte alinment required */
>>>
>>> Probably need an __aligned(8) at the bottom then?
>>
>> I don't see any reason why this is needed. Do I miss something?
> 
> Dunno, the comment might be wrong.

Actually, the le16_to_cpu() references require alignment 4 (I think I got that 
right).

Larry

