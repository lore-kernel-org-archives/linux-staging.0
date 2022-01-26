Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F008168
	for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 10:26:12 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id y15so53839329lfa.9
        for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 02:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=JBuWtik7LMy3F0tZeItzrFUrCNM6hkXa3Q1aN59RsBA=;
        b=Ekgs2EYw50nyD1x1t3pixFS8bs8OxZICI/3+cxOHhZ0vbKJtbmNnyfq4jc2uKKZkC6
         iAB07lg3EW9dtTB0ieXIh4//aeK6Ojxp6QlKj+QhSdnQXW6302ZcbyyN6PRrA5a7AYfm
         WbweAJ9MvYTnoozdA7VtCJgjKUuprS86MjERUTWCK3dM/yJSF/Ug/+UxsPZmW9DxfvgL
         ctzsmM03KAoSXof/dH8nyxv4Gkm02gj7ZCXjCXU2EXDdV/Y76tiWjJkiS0yWEJ16TO//
         WN5QQedd34NlZFMVVRI+5u0g1Pmyym6WAKvqMzVlq6iOH+9TtyE/Htj0p5KcYgNv+AR5
         cpHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=JBuWtik7LMy3F0tZeItzrFUrCNM6hkXa3Q1aN59RsBA=;
        b=tf1dQvQxp7l1Xs0wnPHBdMBzbMoYAwefIRFP1kzhoRQdqCBFNaAHsL+bmtpyF8b5VQ
         XAb97unjn+HfUhGmaSYOP5rdWahQqIRP6JDbita1xzWzc86J4HRZkSG5jXqClgcB8EQX
         DyicAKtQxhR6UTDBLWM2+fTLqCejg0RIA+QGPjknVqNxGb1ANjcxqZb2NskqbyNTJV7B
         RpZ+38Xw9O3YD1ecmipnv3/IQ0gM5f9onFGWOWJq9R+Nf07rgv9mOK+dOBeqZFgygLAm
         Ee0lESY1uzXmduP4CGTY69eTi6SULLH1GLmRwihW4N0mjc2KibIWs5ArgO45uEarCyht
         UT9A==
X-Gm-Message-State: AOAM531Lb2sSiCXTNCLPkA+ccoG8qXiwA03rPbytgtg03oOq1sUy5vk9
	uCoYQ/Dy5M0EtrbzBoG4Yqg=
X-Google-Smtp-Source: ABdhPJwKwnsRBlqvUoLKTHrSyQj8uUXFSX/FmudG4LYAu5KSPT2vGMNNTQ04zW2W9f3M6m2tpPVgeA==
X-Received: by 2002:a05:6512:10d2:: with SMTP id k18mr19638544lfg.167.1643192770102;
        Wed, 26 Jan 2022 02:26:10 -0800 (PST)
Received: from [192.168.1.11] ([94.103.227.208])
        by smtp.gmail.com with ESMTPSA id b39sm1516962ljr.88.2022.01.26.02.26.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jan 2022 02:26:09 -0800 (PST)
Message-ID: <b5bbe488-ac43-fd89-7c65-36bfa9c903a6@gmail.com>
Date: Wed, 26 Jan 2022 13:26:08 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 06/10] staging: r8188eu: remove DBG_88E calls from
 os_dep/ioctl_linux.c
Content-Language: en-US
To: Phillip Potter <phil@philpotter.co.uk>
Cc: gregkh@linuxfoundation.org, dan.carpenter@oracle.com,
 Larry.Finger@lwfinger.net, straube.linux@gmail.com, martin@kaiser.cx,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220124224415.831-1-phil@philpotter.co.uk>
 <20220124224415.831-7-phil@philpotter.co.uk>
 <a681a562-eb41-9dc8-703a-5b235c15a3a1@gmail.com> <YfCgQbFxfVZXw9Fg@equinox>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <YfCgQbFxfVZXw9Fg@equinox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Phillip,

On 1/26/22 04:13, Phillip Potter wrote:

[snip]

}
>> 
>> And here you also removes the reads. I guess, some kind of magic pattern is
>> used
>> 
> 
> So these calls are macro arguments, they would never be executed under
> normal circumstances anyway, unless the rtw_debug kernel module was
> passed in as 5 or more - it is 1 by default. The DBG_88E macro would
> expand during preprocessing phase to (for example):
> 
> do {
> 	if (5 <= GlobalDebugLevel)
> 		pr_info("R8188EU: " "dbg(0x450) = 0x%x\n", rtw_read32(padapter, 0x450));
> } while (0)
> 
> As this is never executed under normal circumstances anyway, I would say
> calls like these are therefore safe to remove. Happy to be convinced
> though :-) Many thanks.
> 

I see your point, thanks for explanation.

Well, in this case, you may left all reads, that are executed during 
normal lifetime of a driver. We know, that there is at least 1 place, 
where read() call removal can break things. Might be there are couple of 
other places we don't know about.

IMHO the best thing you can do is to leave these reads and leave a 
comment like "hey, please remove me and test". One day useless reads 
should be anyway removed, since ideally rtw_read family must get 
__must_check annotation + normal error handling.

Thanks :)




With regards,
Pavel Skripkin
