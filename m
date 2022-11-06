Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58ACD28EC
	for <linux-staging@lists.linux.dev>; Sun,  6 Nov 2022 15:35:00 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id k2so24360710ejr.2
        for <linux-staging@lists.linux.dev>; Sun, 06 Nov 2022 07:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9FDFktrW0wAx1f1BHMw8rTl7LtbuKPcvRcQH3aU1BUY=;
        b=i1F0zpJdoS7qsJHG0GXrYnqlWxoIIgR98FqkJOT4VIq6uqdMEPlOrbb/9YtnRU7yAt
         G1opFuHvwMiAwq/eWRolKzHqBzAOe4iocyZs9vnTuT4GQf3mL6gxJE3RRTMjA9KG5Mrj
         57seTB88bwzKb9Zxki1vGNDTzZtzZ4vOIECiihG8fSHvOrPZ3ijUK46nI9L9v9eRYTqb
         9vVYJHFqp51OvteKzRB1cuwbTmlWX9YajCyRHmAMsd0kkSC1W/0nvpNcn5a6lwlMkeqt
         kRCFjMVNss63ocgICbmC7PajbzzfssQ2oA1C+MfWzGjf5k670t6Y1dajkc31F/+BsOxd
         SjmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9FDFktrW0wAx1f1BHMw8rTl7LtbuKPcvRcQH3aU1BUY=;
        b=Fs2VJgqHfyMDaXv+R2JDwl7pg9SGeu0CWu7iB5ftjt+DDoNeKNOxHfn4a72Sbt4xBh
         ujWsDUsEVsFHD5Z0BUXKenKp1H5Ix1G05NoEcYvSdt3IyT6lDt5Dp9CQTDF30e3Bg8zw
         o3OvZXjDamv+JO9tYGYnN/9yw/uC0sxuJH36DDEd8/TMTpA2bVw7QpmvP9O0Tq7i02fE
         tvP9R0sQ1jM/YLEwaDRV+6g37V+LatsB6WGdSMTnShlrTmeHBzBRIGCTcBrpG1wKHUz5
         TnciOUY/5wxPrF4NMi2eBoKN9NTbBRKMBKoXD07oFOmUahrQATfP5LIqsgfpivvJLrWP
         +uUg==
X-Gm-Message-State: ACrzQf0X5vFBQ063OEOqmFrJlXiFt7xf9yj/p9L+nbWRcbizs34Xu6+s
	i+971zd7ukGbwScEipR0Pwc=
X-Google-Smtp-Source: AMsMyM4Wusv1N6eymYj7LFUZv5YPrfkF3/s4LOCO8kwE4pocykCIEAsR5icMC7SwSgCi++NCEvYC/A==
X-Received: by 2002:a17:907:2710:b0:7ad:86f9:9bad with SMTP id w16-20020a170907271000b007ad86f99badmr44542860ejk.32.1667748898578;
        Sun, 06 Nov 2022 07:34:58 -0800 (PST)
Received: from [192.168.0.101] (ip5f5abba7.dynamic.kabel-deutschland.de. [95.90.187.167])
        by smtp.gmail.com with ESMTPSA id s26-20020aa7cb1a000000b00462e1d8e914sm2782339edt.68.2022.11.06.07.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Nov 2022 07:34:58 -0800 (PST)
Message-ID: <5fa89086-c81d-0a3d-8d0d-0bb293052c5c@gmail.com>
Date: Sun, 6 Nov 2022 16:34:57 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] staging: r8188eu: clean up error handling in
 rtw_start_drv_threads()
To: Deepak R Varma <drv@mailo.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20221106133443.8872-1-straube.linux@gmail.com>
 <Y2fGGsV5ZwxmkTNB@qemulion>
Content-Language: en-US
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <Y2fGGsV5ZwxmkTNB@qemulion>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/22 15:35, Deepak R Varma wrote:
> On Sun, Nov 06, 2022 at 02:34:43PM +0100, Michael Straube wrote:
>> Convert the error handling in the function rtw_start_drv_threads() to
>> the common logic used in the kernel. Another step to get rid of _FAIL
>> and _SUCCESS which uses inverted logic.
> 
> Hello Michael,
> Can you please tell how did you find this opportunity for improvement? Are you
> using some tool or is it a manual code review/analysis?
> 

Hi Deepak,

I just used git grep to search for _FAIL or _SUCCESS and then looked at
the code manually.

Regards,
Michael
