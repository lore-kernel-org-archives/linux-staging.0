Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EB92FB6
	for <linux-staging@lists.linux.dev>; Wed, 19 May 2021 15:55:04 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id b13so6446748pfv.4
        for <linux-staging@lists.linux.dev>; Wed, 19 May 2021 08:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=mwSqfCMAiP+PURiZIgOC/UkNyw6vkzqBNGed4Rp9ynU=;
        b=iANFGf4JppO6R3fOhQhL/k70y/yBwMcjnXBWYENkz3ZBJ9r6IkDNYcn2RQi8qlNHor
         JwuX53ihQdAZcgzky3lqSl4Nn4x1Ar1hK52ruWoyuS6bSMJYoknGbZThHoedI0VziBdJ
         +8p8n8uwJY7I/WWI7e3P8mRmWLVs8Y9mt3B/esMhPhlg1CCRZ6KAeLDJvNjN8+NHkdML
         Cv5sIta8zInfBzSsCot28HuCUHngzr2dSFGd04XnUIf4ZD2mxcyt/FG1b/HMl2DNXZum
         BIp+BWRZzQa4H0MBRNDcvJOGM2z4STDu+RtMqmItqnvwb7YcknldhpqhPEfLTbl2QO/N
         FwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=mwSqfCMAiP+PURiZIgOC/UkNyw6vkzqBNGed4Rp9ynU=;
        b=it7lnQRw93LehD22cQdD3Sc/ByIaaW56mJx0NJ7emrd2s77vUWRimhAdLELx12qVAv
         N4jTonqWq8ysVjGX4ELRrE9Vmxumx26dqysnfXbv6Rl2/l94ZY6E9USb47VPyj9Q0c5J
         1XdWwiOZqZX9LSYcun8nd3o8vpXVxP2VNnzZTsN1Q9YMkrotzlI7Gq1L0shTtfgkCy4l
         5tMrTHahjbknPpXy42BxO8knJx78AidpfwRuNNlo85sfUtepvRTbDA/HVaTfmhOoeinr
         Rz3oHMY+r2CTb4gc8kg0o430YEqFMEYc5UiG897c2dwjIP/gLZ3THQurPk8QOz+dUUC8
         yj/A==
X-Gm-Message-State: AOAM532oc92WgJxO+hNilZJcUDyC1cVc44TGGi/R04Lg6d42b8q+VIFk
	MqDOOdhetZclDqqImrJJ/TiqBIR4POSzNSUJ
X-Google-Smtp-Source: ABdhPJwJl7QMZCtmIHpyb72rLKGG5d4H9TW1ivorGMCTugk1Eyje9xFIIG7+OUidEzNMQZoDkTYWQQ==
X-Received: by 2002:aa7:8f37:0:b029:2db:551f:ed8e with SMTP id y23-20020aa78f370000b02902db551fed8emr11415084pfr.43.1621439703272;
        Wed, 19 May 2021 08:55:03 -0700 (PDT)
Received: from [192.168.1.2] ([103.196.78.23])
        by smtp.gmail.com with ESMTPSA id 10sm9673847pgl.39.2021.05.19.08.54.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 08:55:02 -0700 (PDT)
Subject: Re: [PATCH] staging: android: ashmem: Declared file operation with
 'const' keyword
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Arve_Hj=c3=b8nnev=c3=a5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Christian Brauner <christian@brauner.io>,
 Hridya Valsaraju <hridya@google.com>, Suren Baghdasaryan
 <surenb@google.com>, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20210519081958.7223-1-hridayhegde1999@gmail.com>
 <YKTM8KmXI8bXUSqp@kroah.com> <0ddb894f-f66f-f31b-ef8a-0646e0a99b9f@gmail.com>
 <YKTfbdFhvM7fbpet@kroah.com> <08cf8110-cf84-8784-c919-eba27474b796@gmail.com>
 <20210519145105.GC1417@agape.jhs>
From: Hriday Hegde <hridayhegde1999@gmail.com>
Message-ID: <8c325c0f-d63e-fcac-8073-e5c8acafb74a@gmail.com>
Date: Wed, 19 May 2021 21:24:57 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210519145105.GC1417@agape.jhs>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 19-05-2021 20:21, Fabio Aiuto wrote:
> Hi Hriday,
>
> On Wed, May 19, 2021 at 08:06:14PM +0530, Hriday Hegde wrote:
>> On 19-05-2021 15:20, Greg Kroah-Hartman wrote:
>>> A: http://en.wikipedia.org/wiki/Top_post
>>> Q: Were do I find info about this thing called top-posting?
>>> A: Because it messes up the order in which people normally read text.
>>> Q: Why is top-posting such a bad thing?
>>> A: Top-posting.
>>> Q: What is the most annoying thing in e-mail?
>>>
>>> http://daringfireball.net/2007/07/on_top
>>>
>>> On Wed, May 19, 2021 at 03:00:08PM +0530, Hriday Hegde wrote:
>>>> I am not really sure how to do that and how to reflect it in the patch i followed what was taught in the Beginners course and it does not mention building. I know i need to test it out but is running 'patch -p1 < x.patch what i need to do?
>>> That does not build the code you changed, right?
>>>
>>> I'm sure whatever course you took, it did reference the fact that you
>>> need to ensure that your change actually works properly by the very
>>> least being able to be compiled correctly.  Please go over those
>>> instructions again.
>>>
>>> good luck!
>>>
>>> greg k-h
>> I am using the A Beginner's Guide to Linux Kernel Development (LFD103) by the linux foundation for this but i cant find any commands to as to build and test , the only way i tried compiling is with a custom Makefile and it didn't work, i've got a few errors so the const keyword might not work here since the variable is being written to.
>>
>>
> try following this tutorial from scratch:
>
> https://kernelnewbies.org/FirstKernelPatch
>
> it's simply complete and helps a lot, from
> gathering all tools needed to contribute to the
> community to sending whole patchsets.
>
> In your emails don't go over 80-100 character per line,
> when you ask things or your mails will be difficult
> to read.
>
> thank you,
>
> fabio
Thank you for the guidance,  and will keep the char limit in
mind.

