Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BF51F0E3C
	for <linux-staging@lists.linux.dev>; Sat, 21 Dec 2024 11:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734780579; cv=none; b=jq19U28uYBKg25+dxGv3d+KsoCq9iiBnGP36Ff00qQYUlt1a8cEPZJjT9PcO4p2SlZ/VpngEX2EEqcivaAKN7/FZOn4e1X8HrpKomy7/8geyEzSTwxKOuUMJZBgFTIGvns97wh7Ee1UlTmtzTgmg2M5kRJa++ohKdbM5dSlWxOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734780579; c=relaxed/simple;
	bh=M95Q45a+S4okLrPxtCToZN78qSZJ4gLS3N5midkMDuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gBrwtkxxo139zgJwAkgGDFXVv/rlT2XsTuZWvLyHSyrnZMMpXehRtmRLkQIZEoTOgkZgAFB7SxCmxjHs+5w1g5WhVsehal8RFM2GIH9ofjG12lD7mBAFEZTcAZjYo8LnTL5PMIiNtkK+fbZMedcYKi4mWdHrFqwoAAjfOdr4has=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AJ8k58Qn; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AJ8k58Qn"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-72a7d21db1eso239542b3a.3
        for <linux-staging@lists.linux.dev>; Sat, 21 Dec 2024 03:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734780577; x=1735385377; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PmtXehoW7x3so4SbUDnv5CcTQyXH+DZ9Sj8N214cQ0I=;
        b=AJ8k58Qn2MOg/GTxZURCR+YTwcZj/XJffw0rvzIWK8TAABcEa7lsalwEEBOe1SMsXC
         MNeG64CY0yNiKdm9BQRWCi6toaLkNkoVnnX5v6kXCdJQufjTCHsKH28jwyYn0GaqHLb6
         jHnU2t/F5yhnE1RqzqO8DbRLSmfCHl6OTmDa4y6xirTqYJlPIBlLHjyZpiU5XNczBLn5
         +asy+oGYZVom+YbnT50DRKjUn3+r4pHB5eWjuinuD7xPwx1GxXkwRQdUQ7bAgcEGG3Xn
         MOOphAmTkdVVCIP4wcQGUGkO3tKN6XUsHP+uWqjJ8Zc/hawg+QKwLLQAhaGmAYFAj5KH
         6Dzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734780577; x=1735385377;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PmtXehoW7x3so4SbUDnv5CcTQyXH+DZ9Sj8N214cQ0I=;
        b=EFBDHd3ZAGzS7YI+NM5Jndsh1clKlQKLe7Zn99B/YPSm4/i4TUUioSIuqToKFVo0Su
         LnREQzh9TRkun430RDkaz2z7xKU7ZKTTt1n/CsT5NC15+gFflJjAiqYqhCR8tEi1Q+Fa
         5nLXpjw1zE/uZ8T7P6FFHw0umwQk2wUwO/8VSEB41GaprFGSRnMP7Yyy7CNfj6Pkhotp
         Y0v2D5zaT7qhL8lw/5y0wUCmuI5F9MVaJgRYmUwPTAY5YzhKlE2LMumbUQNTcs1DbugT
         bLHFl5er1JT8zIlBkFq+G2nKx7B/dhaa44X0nkbFdze+/2iWULgH8m8FbcNe6RzcKiw0
         wZvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcGNpJMF9a7NLByM83KNTsdGMI1E+UnaB6sM7YsXqzIDuJVgyIycV6EIqPTENPOQB7+EuumtSQKJUE849w@lists.linux.dev
X-Gm-Message-State: AOJu0YwASngzF6tsfknWTHYsmKZpa/r64aODGUnPebCzV7ymXsbFw7IX
	sytYz9+qFKd2uy6W096xzCkBCRHgZzrY8CKj0cA1M5pkEllKGL754aZxNmUoUAw=
X-Gm-Gg: ASbGnctcJUGopMIwb+97o/IfulycRfz9hO9sOgKEcLjxZIGwHj11IE5xrIehf+M+Hi0
	FCv/3uDDCAQYIG4f5M58eQybaOb49+nW1H4JzOpArwfiqZcD0sTz0OvhmALTxwT9XTqBnGIA6Xo
	XPG9oHCom3DMpxhtemGvcxAD+6m6f8/a5hhncTKnXXGrRBIIegPaZR4FvBYAyw6fDUJ1/aSeoaA
	gt/zhQuM8jNJIi0rKbBR4+2IBuxlwv2dvWLtutZaBXrCn/Dz2DB47MlJ1ibmiTpC0M=
X-Google-Smtp-Source: AGHT+IG7E3coi1smTyxtqjSgAeiEJpTBAtnXuWzlP/BjzfrV4QT6mptTRcC+NmTgKI76pqdEfhjGIg==
X-Received: by 2002:a05:6a00:a84:b0:72a:a7a4:aba5 with SMTP id d2e1a72fcca58-72abdd6f923mr3389186b3a.1.1734780576591;
        Sat, 21 Dec 2024 03:29:36 -0800 (PST)
Received: from [192.168.1.19] ([171.76.86.134])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad90c182sm4746276b3a.189.2024.12.21.03.29.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Dec 2024 03:29:36 -0800 (PST)
Message-ID: <fc10d4ac-8ad0-4756-8d65-8700aa7f8f21@gmail.com>
Date: Sat, 21 Dec 2024 16:59:31 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: gpib: cb7210: Add error handling
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dpenkler@gmail.com, dan.carpenter@linaro.org, roheetchavan@gmail.com,
 arnd@arndb.de, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org
References: <20241221091121.35476-1-niharchaithanya@gmail.com>
 <2024122119-unclamped-affecting-0e0a@gregkh>
 <2024122133-outskirts-causing-099a@gregkh>
Content-Language: en-US
From: Nihar Chaithanya <niharchaithanya@gmail.com>
In-Reply-To: <2024122133-outskirts-causing-099a@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 21/12/24 15:13, Greg KH wrote:
> On Sat, Dec 21, 2024 at 10:25:41AM +0100, Greg KH wrote:
>> On Sat, Dec 21, 2024 at 02:41:25PM +0530, Nihar Chaithanya wrote:
>>> The if condition in cb7210_init_module() would always fail as
>>> the value of err is constantly 0. The function
>>> cb_pcmcia_init_module() can be refactored into a single line,
>>> and can be replaced entirely with pcmcia_register_driver().
>>>
>>> Replace redundant cb_pcmcia_init_module() with
>>> pcmcia_register_driver() which returns appropriate error code if
>>> it fails. Handle the error if it fails and print the debug message.
>>>
>>> This issue was reported by Coverity Scan.
>>> Report:
>>> CID 1635894: (#1 of 1): 'Constant' variable guards dead code (DEADCODE)
>>> dead_error_line: Execution cannot reach this statement: return -1;.
>>>
>>> Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
>>> ---
>>> v1 --> v2: Replaced the redundant cb_pcmcia_init_module() with
>>> 	   pcmcia_register_driver().
>>>
>>>   drivers/staging/gpib/cb7210/cb7210.c | 13 ++++---------
>>>   1 file changed, 4 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
>>> index 63df7f3eb3f3..abd6632d8448 100644
>>> --- a/drivers/staging/gpib/cb7210/cb7210.c
>>> +++ b/drivers/staging/gpib/cb7210/cb7210.c
>>> @@ -1351,12 +1351,6 @@ static struct pcmcia_driver cb_gpib_cs_driver = {
>>>   	.resume		= cb_gpib_resume,
>>>   };
>>>   
>>> -int cb_pcmcia_init_module(void)
>>> -{
>>> -	pcmcia_register_driver(&cb_gpib_cs_driver);
>>> -	return 0;
>>> -}
>>> -
>>>   void cb_pcmcia_cleanup_module(void)
>>>   {
>>>   	DEBUG(0, "cb_gpib_cs: unloading\n");
>>> @@ -1526,11 +1520,12 @@ static int __init cb7210_init_module(void)
>>>   	gpib_register_driver(&cb_pcmcia_interface, THIS_MODULE);
>>>   	gpib_register_driver(&cb_pcmcia_accel_interface, THIS_MODULE);
>>>   	gpib_register_driver(&cb_pcmcia_unaccel_interface, THIS_MODULE);
>>> -	err += cb_pcmcia_init_module();
>>> +	err = pcmcia_register_driver(&cb_gpib_cs_driver);
>>>   #endif
>>> -	if (err)
>>> +	if (err) {
>>> +		pr_err("cb7210: registering PCMCIA driver with the bus core failed\n");
>>>   		return -1;
>> Not your issue, but "-1" is not a valid error number, shouldn't this be
>> returning a real error (i.e. the one that was returned?)
>>
>> And err += is crazy, thanks for removing that, BUT you forgot to unwind
>> the previous functions so now if pcmcia_register_driver() fails, you
>> have a semi-registered system and then the module will unload (as init
>> fails) and bad things will happen :(
So I need be unregistering the driver if the pcmcia_register_driver() fails
right?
>> So you kind of just made the code worse overall, not better, which
>> really isn't a good idea for a "bugfix" that covertity was trying to
>> point out.
> And (this is taking you down a path that is much larger than you
> expected to just fix this one issue, sorry), it looks like
> gpib_register_driver() can fail, so it MUST return an error value so you
> can properly unwind from it.  So that too needs to be fixed up here
> (also minor nit, gpib_register_driver() should not be calling pr_info(),
> but that's a different issue.)
Yes Greg, gpib_register_driver() should be returning -ENOMEM if it fails,
thank you for pointing it out, I'll change the gpib code wherever the
drivers are registered, I'll send the patch as soon as I can.
> In all, there are loads of tiny things like this to fix up in the gpib
> code, which is great, have fun!
yes, I am happy to contribute.
> thanks,
>
> greg k-h
thank you,
Nihar
