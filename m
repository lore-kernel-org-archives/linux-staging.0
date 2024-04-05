Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428C52D022
	for <linux-staging@lists.linux.dev>; Fri,  5 Apr 2024 07:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712303224; cv=none; b=Sc6SAhNnfBlt7vLWxZXf88mxxEFecoopqbu72dzuClV5bDO1ICC4JP9IP6T4XLOh50zlycqfjFyWGNxKSqZWKKRyL4zu45s7GZI3cr4qJIs/t4oJF5Zwp+KGNsS+bJgiJO/f3GTn+ifJ8ikbSqynr2PMqBOeBjvJzaArMtjYyW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712303224; c=relaxed/simple;
	bh=sAja2W8tdOD+sRzkzExkWlXBX/F6AdCmTbElyysLym4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iEWlnbMPoL2548cqeL+x0RH19fU7MZ+VOdbixbrZFGk7uAFPHMMDwVZbSXaDmsLPZ05w6EU7w/srka8ZKa3yapKgN8NzBMrd3veQ6zGsQyI7pDx+W22B778A1fVb4Orzh1E+5JYzP4wdkuw0Ht5KqajwnDb7zVtjCwReH7PULJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hul1qjZp; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hul1qjZp"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4162c2109a5so7991305e9.1
        for <linux-staging@lists.linux.dev>; Fri, 05 Apr 2024 00:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712303221; x=1712908021; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7++/ztIz/hTa+TXzbNPpItS8PqkiLz9qd/xmbL8Ftrk=;
        b=hul1qjZpY3WgT9CK9rnjIxtokiZTeKuQn/J/X9f8bUxLMbLfmZQ1JyhwDa5PwW0nHO
         8Q6gXjpgC1yuzMH2zZYv2uVS6pNnymdsYSpQiObmFghbna6lTToRTis3m4gkPHujzMKF
         9Ul388nKZwq3YRQn/UDbrZp14Gd/JiIpRPydTTAnXKUZ8eCf9BO50SHYN4It3Pu44hDG
         X9mTLAEjRZhi992IGr1PEmFX9UIdf64+EyNpsvuvTZfFKsgU7W4923YcXlNONCCcKAYd
         4TlaBGi16VRbiHEg/45YSpJSTM6bZEk2PtGP2TlpHXPbuXjpD7dGgox4UoR+ie4r8k+/
         QxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712303221; x=1712908021;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7++/ztIz/hTa+TXzbNPpItS8PqkiLz9qd/xmbL8Ftrk=;
        b=ZGsz5M64cDmesrcmkKxhk6zP7JX1YrA24lSL1IAsnAQ+8lf98JrTU/gxSpnN35UDU+
         Bndb5QezrWrPb0BER9Zbs561A+mlytgnYQxKExEVuBxMDj9BZbedbupu1pJruGlG43fF
         EVIwTm056B8niyFExKrAWJgjEX4VyrU2QTJL60o+Gy2exUXx9vXDO7iC6+ZEKwH09KIQ
         ptCJTTfwU795GE++mxvuYxZHRvA+0BUVN3nQugkO07PVJJjbMiBojafUfxSZ31MYAQau
         aYONTMqAg3v6wXToKhzM0g3ou0SWjH8gcZ/O7GolWxnPtoJr/QKmiwrgAGR+vklB9GH/
         vHlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdpA0wLDiR++RjR3HzcaNLfHPHTQ8/YGzoYfb5/JLdblCtc76Z5jToxL2SOfN9+AenWTGKxH9Luwsh8ZFtZsZg+MhdsOx7beJm8Ckslw==
X-Gm-Message-State: AOJu0YzwP0c0bmPNhd+gZK7xQviAOmsWOC/oMlAE7jYW5ned4I9h8eSa
	+MLPv9wizAsfmXMxbBsmUqbSYkf/0AKGEOT3Ay9f2WIvkEM1Ok6i
X-Google-Smtp-Source: AGHT+IHRcg5+bHJr5XkLLgn2JhotFiPzweqk1f09U8ddNLz1uFizxoTin3HUZbfFFfVwAXnXlpztCA==
X-Received: by 2002:a05:600c:19d1:b0:412:dcab:7c79 with SMTP id u17-20020a05600c19d100b00412dcab7c79mr530879wmq.10.1712303221502;
        Fri, 05 Apr 2024 00:47:01 -0700 (PDT)
Received: from ?IPV6:2a06:c701:737b:ef00:2bdf:f41a:ebd1:fb2c? ([2a06:c701:737b:ef00:2bdf:f41a:ebd1:fb2c])
        by smtp.gmail.com with ESMTPSA id v9-20020a05600c470900b0041568e91c41sm5440953wmo.41.2024.04.05.00.47.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Apr 2024 00:47:01 -0700 (PDT)
Message-ID: <9f9d1d2b-dd8c-4325-abb4-4933d7e709ce@gmail.com>
Date: Fri, 5 Apr 2024 10:46:58 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] staging: pi433: Remove duplicated code using the
 "goto" error recovery scheme.
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
 andriy.shevchenko@linux.intel.com, robh@kernel.org, felixkimbu1@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240402111414.871089-1-ikobh7@gmail.com>
 <20240402111414.871089-6-ikobh7@gmail.com>
 <068f3705-9f9b-4d61-be50-a131b9598703@moroto.mountain>
Content-Language: en-US
From: Shahar Avidar <ikobh7@gmail.com>
In-Reply-To: <068f3705-9f9b-4d61-be50-a131b9598703@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/04/2024 19:46, Dan Carpenter wrote:
> On Tue, Apr 02, 2024 at 02:14:13PM +0300, Shahar Avidar wrote:
>> pi433_init had "unregister_chrdev" called twice.
>> Remove it using goto statements.
>>
>> Signed-off-by: Shahar Avidar <ikobh7@gmail.com>
> 
> Your commit message needs to mention all the other changes you made,
> especially the bug fix.  I feel like you're doing too many changes
> really.  Just use the gotos to clean up but don't re-order the calls.
Thanks again for your inputs.
I've reverted some of the changes & split the 5th patch.

> 
> You need to add a Fixes tag.
> I've added the "Fixes" tag, so as the "Reported-by" tag, naming you.

>> ---
>> v2->v1:
>> Followed by Dan Carpenter's <dan.carpenter@linaro.org> comments:
>>          - Remove empty "fail" goto tag.
>>          - Reorder pi433 init & exit calls so they have reverse order.
> 
> Keep the init calls the same.  Re-order the exit calls.  It's a bit of
> a gray area if you can re-order the exit calls in this same patch.  Do
> it in a separate patch just to be safe.
> 
>>          - Add "unreg_spi_drv" goto tag.
>>          - Check "debugfs_create_dir" return value.
> 
> No.  This is wrong.  Debugfs function are not supposed to be checked.
> https://staticthinking.wordpress.com/2023/07/24/debugfs-functions-are-not-supposed-to-be-checked >
Great blog post again. I'm learning.

>>          - Update "if" statments for consistency.
> 
> I like this cleanup, but it's not worth the effort.  Just leave it
> as-is unless you really really need to change it.  Do it in a separate
> patch.
Reverted.

> 
> What qualifies as One Thing Per Patch is a bit of gray area.  Greg tends
> to want things split up into tiny patches.  You have to know your
> maintainer.
> 
> regards,
> dan carpenter
> 
-- 
Regards,

Shahar

