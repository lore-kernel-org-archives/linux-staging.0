Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94D9A41
	for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 05:13:45 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-99bcc0adab4so58752366b.2
        for <linux-staging@lists.linux.dev>; Thu, 24 Aug 2023 22:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692940424; x=1693545224;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Atdwlr4ZDNiktFeelgF93mSGgIj/iGi0rNQszZlVpA4=;
        b=JRqmp0QSyt72qo5V3cY0Y5k8QRHmC1Ls5KH6YuJFu1V7KG3KZvjUZ2uvVFpanGmaaU
         wlb3p5+BP9+JQ8HphFo4omJCJAdQyBJ/nm9rZ+QqDLK1LK9qz8C+eZ/QkJsp+FWhmvjx
         iKbREA1UX34MRYfAcxZ9mZojJKrvJj6XzSrG9twaF5iDKmenYtdKh8qWlmrfH5cDJtyl
         QLXjB01usvhO/upOTIRrUW5ktHTjqZHRlV3orlT9Jgg9KxchkFkADCm7lva/vevDro42
         ZgX2dSu2aWqWUiV16z0g2lYoqXgAaPoXMgNe+Xrag0NqcFB6pOOI4Ye+jWPM57RqRBOx
         xnvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692940424; x=1693545224;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Atdwlr4ZDNiktFeelgF93mSGgIj/iGi0rNQszZlVpA4=;
        b=ddW5IRX0BpJAlQVnzK90ybCwuYqx2U6d/JKCfBW/SRqHI5/N1aZxjO3xboPwQo0SHn
         h/JHcg4N0hkQ8hFj3VbVpXcAgybM4tEkDGmjs1T+nnJA31OgbD7wH5JC5MivbfIwL9vS
         wxh+c70J7uTnQqFzq11ncGjxaFgni6CKHXNi7gXixOmdcippHW8Bobs2diQLY5eZ958b
         T2cTy8f19gmUZo9giR9VChSFP0vGAzJu5MK48dVeHRTcDL/kwUNlzqMxXJmtqMp3rXxu
         bdaZSXZJ/utE0mB1kDwlU0jD4yO1wR3DLnEt4UnATMFWch4PKXD21McKdm4JA5P9l/Mf
         MXng==
X-Gm-Message-State: AOJu0Yw/PSU/JznjXzZnGtZ88N5DaVnvi+FVNbtZtP9+lc9sndSmXGUh
	SnCHmqLlDi8jIZdMb2q9I5M=
X-Google-Smtp-Source: AGHT+IEgarRabzEcG24RtoV2YIp8m8hWRSh94oPfHQvl0dgLnog3qHo8ZEbPuFDN1wXxUV+4gMXAbw==
X-Received: by 2002:a17:907:1de6:b0:9a1:f21e:cdfd with SMTP id og38-20020a1709071de600b009a1f21ecdfdmr4319104ejc.34.1692940423527;
        Thu, 24 Aug 2023 22:13:43 -0700 (PDT)
Received: from [192.168.0.101] (ip5f5aba12.dynamic.kabel-deutschland.de. [95.90.186.18])
        by smtp.gmail.com with ESMTPSA id u22-20020a17090626d600b00993159ce075sm505143ejc.210.2023.08.24.22.13.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 22:13:43 -0700 (PDT)
Message-ID: <69226eca-d345-f6fa-59fe-3c55674cc534@gmail.com>
Date: Fri, 25 Aug 2023 07:13:42 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] staging: rtl8192e: prefer strscpy over strncpy
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, philipp.g.hortmann@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230805075114.15186-1-straube.linux@gmail.com>
 <2023080952-maroon-waviness-9621@gregkh>
 <b15bc777-b470-3c15-5ea7-8ef2f89622c3@gmail.com>
 <cbca3311-2d5d-4b87-8966-e2b57d74d6e1@kadam.mountain>
Content-Language: en-US
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <cbca3311-2d5d-4b87-8966-e2b57d74d6e1@kadam.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/10/23 07:01, Dan Carpenter wrote:
> On Wed, Aug 09, 2023 at 08:02:05PM +0200, Michael Straube wrote:
>> On 8/9/23 14:21, Greg KH wrote:
>>> On Sat, Aug 05, 2023 at 09:51:14AM +0200, Michael Straube wrote:
>>>> Replace strncpy with strscpy in two places where the destination buffer
>>>> should be NUL-terminated. Found by checkpatch.
>>>>
>>>> WARNING: Prefer strscpy, strscpy_pad, or __nonstring over strncpy - see: https://github.com/KSPP/linux/issues/90
>>>
>>> If a global search/replace could be done, it would have happend a long
>>> time ago.
>>>
>>> How was this tested?  The functions work differently, are you sure there
>>> is no change in functionality here?
>>>
>>
>> It was only compile tested. To me it looked as it does not change
>> functionality, but looking a bit deeper at it I'm not sure anymore.
>> So, we should leave it as is.
> 
> So there are three main differences between strncpy() and strcpy().
> 
> 1) The return.
> 2) strncpy() will always write net->hidden_ssid_len bytes.  If the
>     string to copy is smaller than net->hidden_ssid_len bytes it will
>     fill the rest with zeroes.  This can be important for preventing
>     information leaks.
> 3) strscpy() will always add a NUL terminator where strncpy() just
>     truncates a too long string without adding a terminator.
> 
> We want #3.  We don't care about #1.  The only thing to check is #2.
> 
> regards,
> dan carpenter
> 

Thank you Dan,

so in this case we should/could replace strncpy with strscpy_pad,
correct?

regards,
Michael
