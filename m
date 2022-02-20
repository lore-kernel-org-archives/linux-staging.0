Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6686D181
	for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 16:30:11 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id a8so27127255ejc.8
        for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 08:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=OWLpcBVa2M4tskUxAekykJf3XE4zqcHsbnkNsOcSIRk=;
        b=OExUL0nKv5AWNW77ihPgtZ0duZyFBCSH7B0XGHkXHeRORnzb5LfNn1CBEX3OMY08vb
         mtEdoxwa8GxbLD+QjdcavbJ24ggBqFpQnJVR081KF6hK8A3+cLe+ARKl2Mk2XX2azVeB
         Ite7Nt5XXgTANrkk+cmarOTwAGId4tsprSx0+yNqQXwoDxfAffi/tS1ojzzaImtUx+iG
         jgTAg2NylQ3+yEJj3hVXM9qfap6S+T5Yccfa+JLlsEhoBalqLJdn13jLxhitd3KzFEFA
         IpkwADNrtm37awybkEyKuRQp/yS6OyLWUoTAU4dH7rm0AC+6k9CH26tK3vlZhSWg5eKr
         9v0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OWLpcBVa2M4tskUxAekykJf3XE4zqcHsbnkNsOcSIRk=;
        b=WnPnhrKAp3ZB69PGCLmk/32CX5Jwg7vgL8O3DDTD0QrurRcFlruP7uCqpuW2bpUrh0
         Tti7ZL2o2glBAhbxR2MXm6MiYdfQifiqyY7gEfKRL8nimFXHTGqsqHE2dzMQ+lwQ6MDy
         z2QuEt41uCoR3RgEFS1NBcG4oveNHdxvweljKCRwAtu5HC+wqByE3pia2VayCmruQYmt
         0GM33XYsXq9Fn+f94kfmVYY4YCGbwg4g7o3gtWbk5/81gL27XWI1YkyeIfoNYBp+GxGn
         U0V2M7JjoNDB4MaghrNFp5XWBrcGOaZHgek3nxh9uCUMdzxVbTxhQXGo4a/1lvAxxQiD
         e9Og==
X-Gm-Message-State: AOAM531IFMRjdRhbQlnqlX0OVzByuFvP5pp4lgKzlgFXjXxoiupa5SvK
	+ytaprxrQksmI+Q5HQQej68=
X-Google-Smtp-Source: ABdhPJyd2RU/junM5/4SP6yca5whc9aoFfekgEyHnrTAndRTVOAuYulMS96VkhBSpJH9QAWYDA21sg==
X-Received: by 2002:a17:906:4ad9:b0:6cf:93f:f77e with SMTP id u25-20020a1709064ad900b006cf093ff77emr13244335ejt.558.1645374609631;
        Sun, 20 Feb 2022 08:30:09 -0800 (PST)
Received: from [192.168.0.151] (ip5f5abb8f.dynamic.kabel-deutschland.de. [95.90.187.143])
        by smtp.gmail.com with ESMTPSA id l24sm7606251edv.88.2022.02.20.08.30.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Feb 2022 08:30:09 -0800 (PST)
Message-ID: <94160654-ec16-cad2-3cc2-46628caaa17e@gmail.com>
Date: Sun, 20 Feb 2022 17:30:08 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 2/3] staging: r8188eu: refactor rtw_ch2freq()
Content-Language: en-US
To: Pavel Skripkin <paskripkin@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220220154847.7521-1-straube.linux@gmail.com>
 <20220220154847.7521-3-straube.linux@gmail.com>
 <cb7db1ac-8e7e-d549-a5c0-fcd072ae815e@gmail.com>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <cb7db1ac-8e7e-d549-a5c0-fcd072ae815e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/20/22 17:20, Pavel Skripkin wrote:
> Hi Michael,
> 
> On 2/20/22 18:48, Michael Straube wrote:
>> -static int ch_freq_map_num = ARRAY_SIZE(ch_freq_map);
>> -
>>   u32 rtw_ch2freq(u32 channel)
>>   {
>> -    u8    i;
>> -    u32    freq = 0;
>> -
>> -    for (i = 0; i < ch_freq_map_num; i++) {
>> -        if (channel == ch_freq_map[i].channel) {
>> -            freq = ch_freq_map[i].frequency;
>> -                break;
>> -        }
>> -    }
>> -    if (i == ch_freq_map_num)
>> -        freq = 2412;
>> -
>> -    return freq;
>> +    return ch_freq_map[channel - 1];
>>   }
> 
> What if channel has wrong value? The old code returned some default 
> value, but with new one we will hit OOB.
> 

Hi Pavel,

thanks for reviewing. Yeah, I thought about adding a check for channel
value between 1 and 14. But I did not add it because I think if this
function will ever be called with channel < 1 or channel > 14, then the
calling code must be wrong.

Would be nice to see what others think about this.

Thanks,
Michael
