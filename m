Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2531D2EF
	for <linux-staging@lists.linux.dev>; Wed,  9 Aug 2023 18:02:29 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4fe216edaf7so1443073e87.0
        for <linux-staging@lists.linux.dev>; Wed, 09 Aug 2023 11:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691604147; x=1692208947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s7fGsaZkei2JbOs46S4RpA6VOYs6YwSnheNDWkYL++U=;
        b=a3W4WLPinW03b2ad1A+a050W18mixwpnK6EG3o8SX18sJQ9+VS3uF5GUvaAj03aoKn
         /JpxmLXFAYt1Hl9G7rDBbKpj9Cey2xI0F2hY7khLrdJgyznwW0gxpPWPNH0UCmzTJSOe
         6iCvfP6BSqeYe9/4W5BedFFmTNapxluo9wAsrWQ3IgQUSfNsVbVMJ8ReQQMWADdIzMW3
         /+0FA3N5qOMy0yCi/dxtFRg3EVeZeMutlq83QTK5Ex1HfMbG9vIC2Jfni7jByGD3uW2N
         Oy01LHBOaes6WZYwx/veEBONEOavAVKxriQAYFWsTz27AaXZpnNnwgiRfUKxbyRmBBoz
         GThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691604147; x=1692208947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s7fGsaZkei2JbOs46S4RpA6VOYs6YwSnheNDWkYL++U=;
        b=AIQoPogmW8LbJF5ZNNG/nnselih87zzkXtZWFw2aaVyIjI/EYFTV1BCSYBiGOF5opw
         /10sUqJPmimBRM0j4G3+aGyjd78VnsaFm4B7IbtEHk131fAthUKs+VaVp35I0mWafXcu
         apm0YTCJYdvodXoPJSMfyTq/VGtI3OI5JUIk8utBRy6VLvgKnk1/xRw1hj7Wj5rWtVsO
         vgZKpRb0vwKpNaLOQ5QXglTQbVQ1Z2nUuUrJxw1IwehjZYeILM3DzQdPkLdy/U3pWZXF
         6nSXTLqkhY+EnlbdLl/bSjGJJDLuqMuiL35XOVfSAqMuBu0wbT6KpKnn3Q1yOviob45S
         y6sw==
X-Gm-Message-State: AOJu0YwtRq/b7sgkv7A33gjtLNO3nkQ1cU4XNy0cdK8zMPOsXiMYnCjC
	zJZ+416LTbMIuLJlaGtPRmOy+JBaoVA=
X-Google-Smtp-Source: AGHT+IEpLPXq7kk+7GLW3TMiNBOTYKDDcnqIVDWbtbKXR/emAzIG6dv949BLDTrnlt95Q5g886I5rw==
X-Received: by 2002:a17:907:7fa1:b0:99c:c8eb:51b2 with SMTP id qk33-20020a1709077fa100b0099cc8eb51b2mr455602ejc.2.1691604126433;
        Wed, 09 Aug 2023 11:02:06 -0700 (PDT)
Received: from [192.168.0.101] (ip5f5abbd8.dynamic.kabel-deutschland.de. [95.90.187.216])
        by smtp.gmail.com with ESMTPSA id bi20-20020a170906a25400b0099bcd1fa5b0sm8283337ejb.192.2023.08.09.11.02.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 11:02:05 -0700 (PDT)
Message-ID: <b15bc777-b470-3c15-5ea7-8ef2f89622c3@gmail.com>
Date: Wed, 9 Aug 2023 20:02:05 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] staging: rtl8192e: prefer strscpy over strncpy
To: Greg KH <gregkh@linuxfoundation.org>
Cc: philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20230805075114.15186-1-straube.linux@gmail.com>
 <2023080952-maroon-waviness-9621@gregkh>
Content-Language: en-US
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <2023080952-maroon-waviness-9621@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/9/23 14:21, Greg KH wrote:
> On Sat, Aug 05, 2023 at 09:51:14AM +0200, Michael Straube wrote:
>> Replace strncpy with strscpy in two places where the destination buffer
>> should be NUL-terminated. Found by checkpatch.
>>
>> WARNING: Prefer strscpy, strscpy_pad, or __nonstring over strncpy - see: https://github.com/KSPP/linux/issues/90
> 
> If a global search/replace could be done, it would have happend a long
> time ago.
> 
> How was this tested?  The functions work differently, are you sure there
> is no change in functionality here?
> 

It was only compile tested. To me it looked as it does not change
functionality, but looking a bit deeper at it I'm not sure anymore.
So, we should leave it as is.

thank you
Michael
