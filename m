Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C2C1119D
	for <linux-staging@lists.linux.dev>; Thu,  8 Jun 2023 12:43:38 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-514ae02330cso122836a12.0
        for <linux-staging@lists.linux.dev>; Thu, 08 Jun 2023 05:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686228216; x=1688820216;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1kF14myJ9coZ4lMq/FbV5XcnhvclWxzYZwqJzREvQWY=;
        b=WKkEy3Q4+ewVvNCmCIvX6aT5c3OVhyIXQz9HE+qi+rUrQwcSqx+AuMHmCu8wVkupcu
         2jqaH0XBQuD67KubFyPpnCFIp+EYLfKy0OfFuE0Xhwf3mDQocLcx9aEzsu/58Yc/lkz/
         vhnrLU85DQlSxlLkFL/KRVRuLbpcW6zM4K/HZb7/qtNf2nLceu2wivUT8C7v3gQroWeQ
         0P1r7sCa3v5Oee5buRIWWmlmhPCTMfKqzL0p55iq19vqbNHuV/yximZDrkAliL0h/EZQ
         lzbJH4k149D3I12R8+q7+OROC10vmMwQWyNbSXT1upnp+53m6r6RdvPxokuLqvTgjPO1
         QM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686228216; x=1688820216;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1kF14myJ9coZ4lMq/FbV5XcnhvclWxzYZwqJzREvQWY=;
        b=Wppvr9t4q42SQoywAit1b9u7uFnfHgdPQDs/+G8xBJDB96a/COFvPPAc1C31cyFh8g
         0ag/WU0ICJRZbLa53mHBV9NIlc4gNd/IIes6n5FAHEhLLTUfnFRYbR5WSZB7P8cJBf9G
         KPSz5Jtu9/P6ih+S+pcMI5XSB6oQBw70gq1h0tSEePPisKTYOxrFTP9tvkZZvXPRoqwm
         WjwDpq6ty7+9VDVO9iI29JfztjdCHjHZV2YdyB1JGEgSeT2JIlCgEIa1x7bHJ1bJzDAD
         dPuJ38e7/ptmfybDejg4yaj8qrEI30pFZSoRS5tlY3tqnrLYp5nsnrbiUvBg4+SvYiDA
         SJ0A==
X-Gm-Message-State: AC+VfDxeDliXvqCt6I4hOpD7JtZ878vKkhk74sY/imAwvlwjXKSYWa5a
	CxP7JFyJCb/fAzun1eM4E/s=
X-Google-Smtp-Source: ACHHUZ52cbzXPOGxsnd9kqnQxzY/ckFBG6Q9SQKeEbtINPN+3gclg7J/BnPytMoAdBRnwdumtUmkug==
X-Received: by 2002:a17:906:51d3:b0:977:eabf:c103 with SMTP id v19-20020a17090651d300b00977eabfc103mr4943959ejk.5.1686228216172;
        Thu, 08 Jun 2023 05:43:36 -0700 (PDT)
Received: from [192.168.0.105] (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id d13-20020a170906370d00b00977d0f1c5bcsm647234ejc.69.2023.06.08.05.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 05:43:35 -0700 (PDT)
Message-ID: <b0480060-a7df-255a-4965-a48dac793960@gmail.com>
Date: Thu, 8 Jun 2023 14:43:34 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/5] staging: rtl8192e: Remove variable SetWirelessMode
Content-Language: en-US
To: Yogesh Hegde <yogi.kernel@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1686149467.git.yogi.kernel@gmail.com>
 <fba56522e419351b05e33df8cd0ac31806534d8c.1686149467.git.yogi.kernel@gmail.com>
 <01a162c5-f0de-47b1-97e7-8a451a89df80@kadam.mountain>
 <90813181-02a1-b54f-132b-c68e7b797bb6@gmail.com>
 <20230608095938.GA598514@yogi-Zephyrus>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20230608095938.GA598514@yogi-Zephyrus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/8/23 11:59, Yogesh Hegde wrote:
> On Wed, Jun 07, 2023 at 10:18:28PM +0200, Philipp Hortmann wrote:
>> My compiler does not compile this patch:
>>    LD [M]  drivers/staging/rtl8192e/rtl8192e/r8192e_pci.o
>>    MODPOST drivers/staging/rtl8192e/Module.symvers
>> ERROR: modpost: "rtl92e_set_wireless_mode"
>> [drivers/staging/rtl8192e/rtllib.ko] undefined!
>> make[1]: *** [scripts/Makefile.modpost:136:
>> drivers/staging/rtl8192e/Module.symvers] Error 1
>> make: *** [Makefile:1978: modpost] Error 2
>>
>> Did this compile on your system Yogesh?
> No, while sending the patch I partially compiled it
> `make drivers/staging/rtl8192e` but when I fully compile it `make all` it gives
> me the same error. It is a mistake on my part.
To build one module you need to use:
make -C . M=drivers/staging/rtl8192e

> 
>> But I think it does not work because this driver is divided into two
>> modules.
>>
>> To load the driver I am using the following lines:
>> sudo insmod drivers/staging/rtl8192e/rtllib.ko
>> sudo insmod drivers/staging/rtl8192e/rtl8192e/r8192e_pci.ko
> I was not aware of this and assumed that ideally the driver has only one (PCI)
> interface so all the files should be compiled into one `.ko` file and loaded.
> 
>> So this line is required:
>> priv->rtllib->SetWirelessMode = rtl92e_set_wireless_mode;
>> as one name is used in one module and one in the other module.
> Yes, this makes sense now.
> 
> Moving forward,
> Dan, Greg and Philipp what would be the best fix for this issue,
> 1.  Patchset to combine both the modules into one module
I had a look for this and it was not difficult at all to combine. But a 
patch long ago divided the two modules, to make it more like the driver 
this one should be merged to, in the wireless subsystem. Please see TODO 
file.

> 2.  Revert back this patchset to v1.
> 
> Looking forward for your response.
> 
> Regards
> Yogesh

Bye Philipp
