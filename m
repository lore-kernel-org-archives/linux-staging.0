Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D833FC8
	for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 08:48:03 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id b15so23153117lfe.7
        for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 01:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:references:in-reply-to:content-transfer-encoding;
        bh=YLhOQn+Jnote/jetddmL5KWhArEpZJ+bxFl8aVZbrxw=;
        b=ZkNsr7s2eLMbpMuW3mZ3vdtZ+4tlM7k1QNFPatU7oePxZhqLepT0lMLSw7He1Q2JZJ
         LCL/4ZxwPUANjqO/AzlIA7pJuuQ+/WoqBaitDSxhZz5ZzANfh00MQdzmt0wKkhCktzSJ
         trqgRXhnjFct2lCEp6CjiEtF3rWfAhThkRa0XI190oDuBeLhDQ4uhUFuZ7BGG27OXimz
         dnLTmR6JDpCux8iCDALKnuHp8jXegxLA0WJZqAbqAcy4PsfRgRUFb69MJXex58T7uaNk
         5/b0jbQhXqz61B6P/sIYfbU3IIF7S89cK2W1mXugfml2WSuij5uIDSXYSYxzIp+GeiAO
         Q5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:references:in-reply-to
         :content-transfer-encoding;
        bh=YLhOQn+Jnote/jetddmL5KWhArEpZJ+bxFl8aVZbrxw=;
        b=ptJBTyYky/SZQdF474Xa/QZd4YujdvnKX7l6bjKEKTSY/L2TcgHX5Q9nc/AvPFQE7F
         jR24A6erKj8FuLOw4gcBr11cEXVPlHDziBYxibHDmIWeJ4lgJY1z1NTxJ4toj/SmkraW
         O93TSX0FbvDT6q2TsvJJWhe3mvwJMzILTR3OG3ZEFYpdoec8gtC5OASFWJDQfRrlMkKN
         cd3qbkGjuBy98eW5RRvuKKPXAmcgntpH/9hKD9aahnhUSJm8LzQpVxn2A0BaOegF4tm5
         RlDBxBbs1Cdsx3QyjSLJ/PD+OaHDLgB+VtNX47bA+ply1thmB6lZOttwpC/tYRjoZRqg
         +7LA==
X-Gm-Message-State: AOAM530KRXN/zPpFm8v+V0+zEl6zbvKdC9H4xCpaVze2tyPEZetwVpG/
	3qyNIfmaIfN8ZVzzpv5FpEw=
X-Google-Smtp-Source: ABdhPJw1J3y4qLeJYG9w1mREqK82SnGndgOBUDU6BmiLhXKpw92ZNRmAAmyD0zvkLijUi+dFs4oNjA==
X-Received: by 2002:a2e:9ad6:: with SMTP id p22mr3938778ljj.65.1632386881019;
        Thu, 23 Sep 2021 01:48:01 -0700 (PDT)
Received: from [192.168.1.11] ([217.117.246.37])
        by smtp.gmail.com with ESMTPSA id o23sm396623lfc.172.2021.09.23.01.48.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Sep 2021 01:48:00 -0700 (PDT)
Message-ID: <4434c136-6bfc-9a25-d0ba-f989c655fa69@gmail.com>
Date: Thu, 23 Sep 2021 11:47:59 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v9 16/16] staging: r8188eu: remove usb_vendor_req_mutex
Content-Language: en-US
From: Pavel Skripkin <paskripkin@gmail.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, David Laight <david.Laight@aculab.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Martin Kaiser <martin@kaiser.cx>
References: <20210921181834.29677-1-fmdefrancesco@gmail.com>
 <20210921181834.29677-17-fmdefrancesco@gmail.com>
 <dd99d40d-297e-8d27-dabe-d0e4c633d391@gmail.com>
In-Reply-To: <dd99d40d-297e-8d27-dabe-d0e4c633d391@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/21 16:21, Pavel Skripkin wrote:
> On 9/21/21 21:18, Fabio M. De Francesco wrote:
>> From: Pavel Skripkin <paskripkin@gmail.com>
>> 
>> This mutex was used to protect shared buffer for USB requests. Since
>> buffer was removed in previous patch we can remove this mutex as well.
>> 
>> Furthermore, because it was used to serialize the calls to the Core USB
>> API, we thoroughly tested the enabling of concurrent firing of USB requests
>> without the mutex and found no problems of any kind in common use cases.
>> 
>> Co-developed-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
>> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
>> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> 
> Hi, Greg!
> 
> If all is OK with previous 15 patches, please, do not take this one, it
>    causes problems with connection... :)
> 
> I don't understand what went wrong after v8, but anyway, this one should
> not be applied for now, since it's broken
> 
> 
> Thank you
> 
>


Just to be clear: previous 15 patches _are_ tested and do not cause any 
misbehavior or bugs.

I guess, the stack buffer maybe the problem here, since it's the only 
change on this side since v8. I didn't have a chance to take a closer 
look, but I will do it on weekends, I hope :)



With regards,
Pavel Skripkin
