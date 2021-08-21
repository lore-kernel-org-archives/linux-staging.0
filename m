Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B476172
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 08:31:18 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id q11-20020a7bce8b0000b02902e6880d0accso10553023wmj.0
        for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 01:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=r7pMHJHEpzcWJsiIgozc5/rwwa0w5oIqSH99Gp1LvZc=;
        b=uPCKWc8K8AKx5H4A21P2GNS3AbV/2CMVbHGyoHRDLOhZPkfYmDbe2dn7DhykZSwiNu
         uzH+PTrsrK1UQeCUMbU+ZMO8KzEqmoML2lkzF4hByVNnnhHTPpN9Sujxe1csS9X3DeOd
         1bJcx2ERWwrQVjhlO+NwXPiRcKFzqL1w1q51Uz43vAROVPuXXOcLMxgTOpsHFuf3kjTw
         YGRlnPXApvJnQg+tQU9Iw7RpH2l31pxrIKNlSBljO4WB3icMr8SbOc4s3unTkLKB7DLB
         jncwp4mbC4p42kCOyAvV9P5JZ1FvXmzPwZh50uKjEasMldBMhqGncittlmjn2c1nEbWq
         i1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=r7pMHJHEpzcWJsiIgozc5/rwwa0w5oIqSH99Gp1LvZc=;
        b=kyKaHtVdAqJyUP7WuE92YcrIhy17O9kaD9OGG7fTptGTxTpuR662o5hMqHHobMnID8
         h+OH1JrsSvNrYKmx2P6o4Vqlf/UeL5TXbOqLJDrmNEMUU2Ub2MShTSVO8X9a7vlX22Ac
         mc+nnh7LilZdQazUaAl+Q0ZVDdTDB9Pcj3AQB56nzrHjd4O7So1Fz7w5rPsPYc152YX9
         T0IH2IIQCBF6PsR9oRtdjZTDAB+FDPfo0bJdtJgc/AvWDWeKHzhJpdAx4g0IN8rbeRPz
         TnNYNs0PpzUctH32VepJj5OQ6YqFMvqZAIRc4oQlOv80NMRgC8BEz0mmrmQwK6B+/8e+
         +ciw==
X-Gm-Message-State: AOAM532REB290XlbbxEp/6QkFwqxpe2paup8s4dYDO9rgjbKaGqfijKz
	wlHkMwddG5QLvTIeBG40Uqk=
X-Google-Smtp-Source: ABdhPJx7NgH1Z2cNI0g3ADakQrP0PNMiBePXzpV5ILN0HSt72FliKqv8qda4/OSzKlG/TVvhxlTSTQ==
X-Received: by 2002:a1c:cc03:: with SMTP id h3mr6687171wmb.73.1629534677135;
        Sat, 21 Aug 2021 01:31:17 -0700 (PDT)
Received: from ?IPv6:2a02:8108:96c0:3b88::2744? ([2a02:8108:96c0:3b88::2744])
        by smtp.gmail.com with ESMTPSA id y13sm6991025wmj.27.2021.08.21.01.31.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Aug 2021 01:31:16 -0700 (PDT)
Subject: Re: [PATCH] staging: r8188eu: remove forward declaration of
 Efuse_Read1ByteFromFakeContent
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 gregkh@linuxfoundation.org, Phillip Potter <phil@philpotter.co.uk>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 martin@kaiser.cx, Larry.Finger@lwfinger.net
References: <20210821000508.79422-1-phil@philpotter.co.uk>
 <5110838.kRcMR4ARJC@localhost.localdomain>
From: Michael Straube <straube.linux@gmail.com>
Message-ID: <b0819fe2-e7cf-b6bc-5930-a31e10da811d@gmail.com>
Date: Sat, 21 Aug 2021 10:30:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <5110838.kRcMR4ARJC@localhost.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 8/21/21 5:17 AM, Fabio M. De Francesco wrote:
> On Saturday, August 21, 2021 2:05:08 AM CEST Phillip Potter wrote:
>> Remove forward declaration of Efuse_Read1ByteFromFakeContent function
>> from core/rtw_efuse.c, as the function is defined in full directly
>> after this and therefore this forward declaration is redundant.
>>
>> Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
>> ---
>>   drivers/staging/r8188eu/core/rtw_efuse.c | 6 ------
>>   1 file changed, 6 deletions(-)
> 
> Philip,
> 
> It's pretty clear that this function has only a translation unit visibility.
> Why don't you make it clear by defining it with storage class "static"?
> 
> Thanks,
> 
> Fabio
> 
> 

Hi Phillip,

I agree with Fabio, making the function static avoids the 
[-Wmissing-prototypes] warning and makes it clear that it is only used 
in this file.

Thanks,

Michael
