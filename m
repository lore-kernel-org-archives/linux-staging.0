Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDCA3FC2
	for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 15:48:24 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id q21so12184393ljj.6
        for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 08:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jcMOhlnO/6zhJtyyv3sIOHX5NmMWJ45ZG4zs+/T+Fqg=;
        b=cRZBwnLHWS+ul5vbl3qc6LvDiTEf5Ljw7GZjWrgNHaXLMLiIb2PMIiJjWqPGJK2fLD
         rgluypfeUEycuj33q45UE/bSZJJJqrkwHtwJhJGmXGB9wTm0sxSatVJPwKb+PDJTkR2B
         b3ZdAp3NNk7MEXqNeW+T1VdpyXCx/G7OKsDyXU8WZwuHfm6sLuIf3PecCyzYxtQKY4tF
         HKBUZ6ZhCeQ8IuABnNqpNyBnzQoT6jCK5748q5c+rnlIY9pA5lhzdT1LRImzezabEmWr
         GBMqjNl97VN0eUUJf/ahlEXLMhwoz6j6+p5NaS1RFa3JHktmpoM66Kqunb7tYa8BS+Xv
         gJPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jcMOhlnO/6zhJtyyv3sIOHX5NmMWJ45ZG4zs+/T+Fqg=;
        b=Ib7tVJfqZJbzdxrIqzaUJBg/aoD9YE2fS3bCclD2sAgMsG/R5Ow0KBZS1/7bNWJRPq
         k3e2lWv0I4E3hR+52rW9vmMjqMezgbhppHWAS9qLO7Rr3ept65eChfBxVZkdi4w88Ern
         qDGDtMs6NItwffP2ZcXLvDWjJITMUNQ7TWjwjnVenqLdsPDu9LtX9bVjrYgJ8zBeyjRG
         NJ2vK//j1yKIe0A1n7frastlYYIYqWrp7CwZYnELFPyVtW3w2zoIXkndfQWOPy68pahM
         toh2e5MtP5A3fsKytQ7sFNPziQeSJAzeXmoA/vTkV0n6NCu/xvm+BlidzMjoyRk6CzKs
         KAKA==
X-Gm-Message-State: AOAM533I7O4IQAIgmRQVWQK3+ulqbTQr2Al42Wdyaj1SolRyBq3sWyWM
	2YUvI+1qB0MnQgwD24gSnxc=
X-Google-Smtp-Source: ABdhPJyPWMiQzroJM0napci9LaVujtLp905psMmo8OoG//1nJdaD/WhJISRrDOOvnwu/fA0wXBXr3w==
X-Received: by 2002:a2e:a49c:: with SMTP id h28mr8363318lji.510.1630079302471;
        Fri, 27 Aug 2021 08:48:22 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id r22sm627800lfm.7.2021.08.27.08.48.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Aug 2021 08:48:22 -0700 (PDT)
Subject: Re: [PATCH linux-next] drivers:r8188eu: remove unneeded variable
From: Pavel Skripkin <paskripkin@gmail.com>
To: CGEL <cgel.zte@gmail.com>, Larry Finger <Larry.Finger@lwfinger.net>
Cc: Phillip Potter <phil@philpotter.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Straube <straube.linux@gmail.com>, Martin Kaiser <martin@kaiser.cx>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jing Yangyang <jing.yangyang@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
References: <20210825061531.69678-1-deng.changcheng@zte.com.cn>
 <68520ae2-23a8-7948-7feb-aa9a69cc0c59@gmail.com>
Message-ID: <5c6a1d8b-eadc-71ed-5dfa-f2d7615522af@gmail.com>
Date: Fri, 27 Aug 2021 18:48:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <68520ae2-23a8-7948-7feb-aa9a69cc0c59@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/27/21 6:42 PM, Pavel Skripkin wrote:
> On 8/25/21 9:15 AM, CGEL wrote:
>> From: Jing Yangyang <jing.yangyang@zte.com.cn>
>> 
>> Eliminate the following coccicheck warning:
>> ./drivers/staging/r8188eu/os_dep/os_intfs.c:505:6-12:
>>   Unneeded variable "status". Return "_SUCCESS" on line 577
>> ./drivers/staging/r8188eu/os_dep/os_intfs.c:772: 4-7:
>>    Unneeded variable "ret". Return "_SUCCESS" on line 818
>> ./drivers/staging/r8188eu/os_dep/os_intfs.c:823:4-8:
>> Unneeded variable "ret8". Return "_SUCCESS" on line 849
>> 
>> Reported-by: Zeal Robot <zealci@zte.com.cn>
>> Signed-off-by: Jing Yangyang <jing.yangyang@zte.com.cn>

And, please, change subject line to "staging: r8188eu: ..." :)



With regards,
Pavel Skripkin
