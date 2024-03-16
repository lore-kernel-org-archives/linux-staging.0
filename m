Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C951918AF4;
	Sat, 16 Mar 2024 13:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710595992; cv=none; b=f41kZXB8rIArzew9kkS6Qfs8znFuycm9WmrmpSUwlmac0XzRnSYMMHa0BrpwuUTj3dvXWMfS40fUogwDxK+OmGBaZAm2PGQONr2GI0M2p/m9vvW8f/6mVsMUyeZGJxs+SfcfWHps8EYKtIaKF8QSCf8Uk1zUFuZKQPLpepU0gOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710595992; c=relaxed/simple;
	bh=WEiSlYwDRXH4IPCklBUzgqCSlEfIx6IDRCsQ3Paj36s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JpBQfbu9xd/IsGD8LHqJqoyfTr5X/6JrRgeauRg+U5qXwHBZh6ZO8KxOJtRmqKD9b/B0Ph/PyQ+2hnOt0rU4xbaOtFb6P3PmgSVaLFZMDBxf6lcBEEkUHg1Ay1bO26VVwYBDP1ttDeLN3HHcXbPFPj0RjrOugTSXKmPoVvHPovs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I4uyJbke; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I4uyJbke"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a469ba7e230so25776066b.0;
        Sat, 16 Mar 2024 06:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710595989; x=1711200789; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mHC9EB8QIa0MMKESDC3f0/7my1UpCaENtscEfQXCYcU=;
        b=I4uyJbkegaSJycZx8tovyaCZuE3GhkaM/cK4Bku0mcJV3viGYvSC+2JZIvxzoi5GGR
         KYDaDL3askNyaM9EbQ1h/8Yx3dlr2qJ8oA5vVVnTuim+lms0fU5wfp5SERHD+zLWf0oK
         TRZWhUYdt4aI83dHheZOhV9Bst/tWu7AsSZ/zNU37sY1aU3ZzfNEVegq4QM2I0YSIP94
         SoJz3kVoDF0nWlIE8mdmceD3SPSZVJ0Wn5BWMnx2u6rJOPJc32ru1/ohDHdhtO4f1UsH
         VaNj+gl7iYMd4YO1Ep4k83dOPXf6IhISE6y12siYeDb5S1nYi9GsrnYZSCTWuqYGInLP
         9wYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710595989; x=1711200789;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mHC9EB8QIa0MMKESDC3f0/7my1UpCaENtscEfQXCYcU=;
        b=B+TXxS6HpeGtdzg9P16cexsOY1A3DIsI9ICFk+8wrIpqErIHX6OrMUQOcBi0O04vXd
         MbP3o7K6dfgTuEYnpG/XZjKhY063VDO4sa/std1YDn1W07e6Yx5w2vkaNe1NiY/LWXPD
         wp+0qfu03SZuY94MozuLifOSuYykLnfnJBmGQ1/2tioOeSwuz111mhNflZjPXIkpMxKY
         de+vtYVyAEl3+CUQhwiQhiZ9uu+PmUqnM5R7VCxSI6i+0bQ1Vnx1S7EtqAQuEKM3tGGj
         1fikwwbKLn16X4818DdoxfojrngNdwhxQevjhwFLByhsHOqw4ZwxZmnKi5WsAMJ8jJyX
         aRfg==
X-Forwarded-Encrypted: i=1; AJvYcCUcH59EMvmU6JmMJee6PZ2wwA9hJTaC9trFG/vQd4UltFGYastMp3FX6GCmCKwFnv145MOp7FGf5zyF/0iDNjqn0TQ2yMjW0VcavWoAz40/RNxUZOJ9aj4WXyljB3r7uNSlWffXsPHUQw==
X-Gm-Message-State: AOJu0YwT+BFZEc/ZEKC3yc4XRsuHmATPi0VlR7f5nbAzGm35YaJWU2F2
	/Si8zE8IWkujJ9q2sG0q042Ou+BG2S/pEZwqQB5zh7A7/f1P7gY7
X-Google-Smtp-Source: AGHT+IHVrh6pEILasMtVcrz+IZPkELuUnYGvWMB9pXDIdtuRjNwAM4opEGO5VcYGv2Tw2gW6+kKL1g==
X-Received: by 2002:a05:6402:388a:b0:568:bf5e:db25 with SMTP id fd10-20020a056402388a00b00568bf5edb25mr991485edb.0.1710595988775;
        Sat, 16 Mar 2024 06:33:08 -0700 (PDT)
Received: from [192.168.0.104] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id fj12-20020a0564022b8c00b005685eaa19d2sm2664736edb.5.2024.03.16.06.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Mar 2024 06:33:08 -0700 (PDT)
Message-ID: <02462be1-477b-422a-9f4c-9c8222d8d279@gmail.com>
Date: Sat, 16 Mar 2024 14:33:07 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] staging: vt6655: Remove unused function
 RFbAL7230SelectChannelPostProcess
To: Dan Carpenter <dan.carpenter@linaro.org>, forest@forestbond.com
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>, gregkh@linuxfoundation.org,
 Linux Staging Drivers <linux-staging@lists.linux.dev>,
 Linux Outreachy <outreachy@lists.linux.dev>,
 Bagas Sanjaya <bagasdotme@gmail.com>
References: <20240311035649.25043-1-dorine.a.tipo@gmail.com>
 <20240311060747.32876-1-dorine.a.tipo@gmail.com>
 <36c92e00-213e-4f25-9720-66912b4da56f@moroto.mountain>
 <d0f975e8-3ce4-4a2b-b52e-51b748a8601d@gmail.com>
 <4e162fac-078e-4a37-9a6a-fad186b0d27a@moroto.mountain>
 <66b9d80f-94f2-44f5-8ad9-b73caa14bb44@gmail.com> <ZfPV7rd0YHc9pChi@archie.me>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <ZfPV7rd0YHc9pChi@archie.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/15/24 06:00, Bagas Sanjaya wrote:
> On Thu, Mar 14, 2024 at 07:45:28PM +0100, Philipp Hortmann wrote:
>> On 3/14/24 07:36, Dan Carpenter wrote:
>>> On Thu, Mar 14, 2024 at 06:33:58AM +0100, Philipp Hortmann wrote:
>>>> On 3/11/24 08:31, Dan Carpenter wrote:
>>>>> The main issue with this patch is that it doesn't apply, but I have a
>>>>> few other comments as well.
>>>>>
>>>>> Why is Forest Bond not on the CC list?  Please use get_maintainer.pl.
>>>>
>>>> Hi Dan,
>>>>
>>>> reason why some omit Forest Bond is that the emailaddress seems to not exist
>>>> anymore - find below. Can I issue a patch to change this?
>>>>
>>>> Who is then entered to the M: in MAINTAINERS?
>>>> STAGING - VIA VT665X DRIVERS
>>>> M:	Forest Bond <forest@alittletooquiet.net>
>>>> S:	Odd Fixes
>>>> F:	drivers/staging/vt665?/
>>>>
>>>
>>> Yeah.  His current email is forest@forestbond.com, but let's mark it as
>>> orphan.  You actually have this hardware, don't you?  Do you want to
>>> take over?
>>>
>>> regards,
>>> dan carpenter
>>>
>>
>> Hi Dan,
>>
>> I do have vt6655 and vt6656 hardware.
>> But I have no idea what commitment I am entering into.
>> Please send me a link to a description of what my obligations are?
> 
> Hi Philipp,
> 
> You can refer to Documentation/maintainer/feature-and-driver-maintainers.rst.
> 
> Thanks.
> 

Hi Dan,

yes I want to take over driver maintainership for drivers/staging/vt665?/.

Thanks for your proposal.

Bye Philipp

