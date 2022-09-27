Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27869653
	for <linux-staging@lists.linux.dev>; Tue, 27 Sep 2022 07:04:37 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id dv25so18660997ejb.12
        for <linux-staging@lists.linux.dev>; Tue, 27 Sep 2022 00:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=85wRM5vT7C3yxSFzarsFiDvwboVCqeLcyg6XJQXKuYw=;
        b=kooSZqt2vqboGFbvn5LWXuyzyxDlyH3wii3Wp7fUyBxrDIM8sdHqVxqKGc8TGP5PrT
         n7aFCHzL4Yjr45XgstiXsknuccLZ2ylotuB10pr/N1jZ3tLkeKy5+fdzS3XfCQSu/kPZ
         gqzYK5Gg7fCF1bKERnAJLp7ItfSNf69FmvBax2jNST6Ug6HvmHi7gOz5EFbxsNzNkzG0
         Q4LMVp9K2eyxv/RHFAFO1cXWmUoejTDN8OavDSwvQ/tx9332AMMcqCXLXNmTLZ2jL6HO
         wwWdqzjaq1XMyAIrA19eTpoMh5M9AzRlFcDrk/70c0h+QJ8sOc2iI6Q3/5hhdeFikpnU
         NBZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=85wRM5vT7C3yxSFzarsFiDvwboVCqeLcyg6XJQXKuYw=;
        b=Br4EZGQwBdwNxXxxWLKrChArkNOp5f6WVLrerJH/sbKXsm8K3beQwrv8TDJAS3+DlV
         udZYyS6EIckQ6HXKZi/McycK+Ge6kXdgI9JSSIYwYJKAZz2zErc7qEheA+PYoU71jbz3
         byO4AdmSmBRmaZ0XdYPm9MhYfEASxo3hz1471gmedtH4cItEEdXDD3HcmxDFKpg0VATN
         GSQdgoCNf8Ie+MqRkTYwkcovMQSuXZWJ+GPIajDjy1Ou7sGomDYgvgXVVvw6lNkPgdUN
         3SHoRoWR5R4wikFYvgchMXPrJSODVTsRBXmvGOirMke2EYue8nX58v1P5ji7uPrxpv8a
         JPLg==
X-Gm-Message-State: ACrzQf3NtFXiBbKCNg5C07sCMZslpjiaGaSoi3zpgLXjoG4nF47uieU7
	XBLmylqVARmD15aEkD3TxT0=
X-Google-Smtp-Source: AMsMyM7p6B7+VAjMfY1SDNN3ZYzuP8rwoBpy7NRLO9tOx/5Lj+xOVFZerUM+H9fWxeW47kv6/PjAyw==
X-Received: by 2002:a17:907:a0c7:b0:77f:a9d2:9be2 with SMTP id hw7-20020a170907a0c700b0077fa9d29be2mr21015201ejc.352.1664262275344;
        Tue, 27 Sep 2022 00:04:35 -0700 (PDT)
Received: from [192.168.0.100] (ip5f5abb59.dynamic.kabel-deutschland.de. [95.90.187.89])
        by smtp.gmail.com with ESMTPSA id d14-20020a056402078e00b00457160c3c77sm643221edy.20.2022.09.27.00.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 00:04:34 -0700 (PDT)
Message-ID: <95bc3971-7c01-ba9f-c6f8-984b6ae76846@gmail.com>
Date: Tue, 27 Sep 2022 09:04:33 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v3] staging: r8188eu: fix too many leading tabs
To: Joash Naidoo <joash.n09@gmail.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, paskripkin@gmail.com,
 dan.carpenter@oracle.com, linux-staging@lists.linux.dev
References: <20220919132310.1494-1-joash.n09@gmail.com>
 <Yy7kON0jNecPXN/k@kroah.com> <87y1u5xrkh.fsf@gmail.com>
Content-Language: en-US
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <87y1u5xrkh.fsf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/27/22 08:24, Joash Naidoo wrote:
> 
> Greg KH <gregkh@linuxfoundation.org> writes:
> 
>> On Mon, Sep 19, 2022 at 03:23:10PM +0200, Joash Naidoo wrote:
>>> Coding style fix. Fix too many leading tabs and line length.
>>>
>>> Signed-off-by: Joash Naidoo <joash.n09@gmail.com>
>>> ---
>>> Changes in v3:
>>>     - Fix flipped condition mistake
>>>     - move skb NULL check before dereferencing it
>>> Changes in v2:
>>>     - Flip additional nested if conditions and don't reverse     the 
>>> last if statement
>>>     - Move declarations to start of function
>>>     - Separate converting __constant_htons to htons to another     patch
>>
>> Always test-build your changes before sending them out so you do not get
>> grumpy emails from maintainers asking why you didn't test-build your
>> changes...
>>
>> thanks,
>>
>> greg k-h
> Hi Greg,
> 
> Indeed building and testing is a vital step before sending
> changes. Is this message referring to my V3 patch not building? Or
> referring to my earlier versions?
> 

Hi Joash,

v3 introduces a gcc warning.

drivers/staging/r8188eu/core/rtw_br_ext.c: In function 'dhcp_flag_bcast':
drivers/staging/r8188eu/core/rtw_br_ext.c:606:9: warning: ISO C90 
forbids mixed declarations and code [-Wdeclaration-after-statement]
   606 |         __be16 protocol = *((__be16 *)(skb->data + 2 * ETH_ALEN));
       |         ^~~~~~


regards,
Michael
