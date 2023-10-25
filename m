Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23BF27EFF
	for <linux-staging@lists.linux.dev>; Wed, 25 Oct 2023 22:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b5wDpNTb"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-52f1ece3a76so75655a12.0
        for <linux-staging@lists.linux.dev>; Wed, 25 Oct 2023 15:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698274101; x=1698878901; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h1Wtmp4jaolI15oZgo//tqFOl12QGRnI6l3LLvFOdIo=;
        b=b5wDpNTb2rGdsIALUfqa/roiPweera78POE7LBZIigOkCCttYncfPSg0lojf8qa+GZ
         65ANqnsTO5lSVTDkrHapEQltGECYZvmHYRukqirbisTqEXbPQKaUIeU/FFA2F26D5uUJ
         2CDoywOlNsib33RrCid6OVj73u5GfHuE/JemarkDKN1OdzUzowzARB0do2syKBuJBhy7
         ivzUmH8dlVsKoLwYPNfeKw3U3rnQnHWk4bJFTjWmFcPbyiFSEmTRySrrQWQ/kjvQLZr0
         p8Ts2A0Bsqgw4l2ch6vCrlFYz/jNUVTXb7jN7E5EoHJe37av6VY25VNs6Z8pkXueG56Z
         9CYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698274101; x=1698878901;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h1Wtmp4jaolI15oZgo//tqFOl12QGRnI6l3LLvFOdIo=;
        b=cVsnzg1RQzRABxemklE5k30z+wQdiLMCFYEy9Dce+5uXIgHwqdAspwBaQdm1R/gafG
         TV3BtoWR2IW9B18X+N/9MHqkHHiMAPBjSunJPwjoLZ0FHE8Md3Tr1A4HTemluHJbsdwE
         cxbrnJNmhSDsGjgptqFJHWQCa7hwiaideGu8liM9GKhstCA8hdTd+0txbggtOQ2wjVcJ
         2Aw0/lhJzp0e5tCnuqsVjsCT3gmqfI1XspK0EiW08GK2YnsSHcBWlVOKmVSSZ0iWvUtF
         qerYdvalIREK3veMum+TfmDsN5dNjp2RXiL39ivlCwipC3ei9h7YWSWst7E+W7BcV3Tc
         18+A==
X-Gm-Message-State: AOJu0YzRilrJEsWAgNR5cd1+js6LLT/e+/YsYIq6tEfIh8Spd8IxwYTQ
	9vIVExAoAOn7XD7UgJ9iXd0=
X-Google-Smtp-Source: AGHT+IGZysA7t84XKVRzSA8XE25oFrQWSh3/UAeHsseDmefuOjgMHv8S1Go5CrpHtdDA4m4jNf1AlA==
X-Received: by 2002:a17:906:21b:b0:9ce:c4f4:5f97 with SMTP id 27-20020a170906021b00b009cec4f45f97mr243735ejd.1.1698274100762;
        Wed, 25 Oct 2023 15:48:20 -0700 (PDT)
Received: from [192.168.0.103] (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id 26-20020a170906011a00b009ae69c303aasm10545728eje.137.2023.10.25.15.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 15:48:20 -0700 (PDT)
Message-ID: <c608f328-387e-431b-b3c2-4b8fa0c4f11f@gmail.com>
Date: Thu, 26 Oct 2023 00:48:18 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] [RFC] wifi: remove ipw2100/ipw2200 drivers
Content-Language: en-US
To: Witold Baryluk <witold.baryluk@gmail.com>, arnd@kernel.org
Cc: Larry.Finger@lwfinger.net, alexandre.belloni@bootlin.com, arnd@arndb.de,
 claudiu.beznea@tuxon.dev, davem@davemloft.net, geert@linux-m68k.org,
 geoff@infradead.org, gregkh@linuxfoundation.org, gregory.greenman@intel.com,
 ilw@linux.intel.com, johannes@sipsolutions.net, kuba@kernel.org,
 kvalo@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-wireless@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 nicolas.ferre@microchip.com, pavel@ucw.cz, quic_jjohnson@quicinc.com,
 stas.yakovlev@gmail.com, stf_xl@wp.pl
References: <CAEGMnwo6RFqADPO5FRkRUNL=GfV6DY8UuwgsypEYOD3LTnXdJg@mail.gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <CAEGMnwo6RFqADPO5FRkRUNL=GfV6DY8UuwgsypEYOD3LTnXdJg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/23 00:27, Witold Baryluk wrote:
> I might be interested in modernizing the driver, but I have no idea how 
> much effort it would be (in terms of changed fraction of code). 20k LOC 
> is neither small or big, and not obvious (a lot of it would be 
> unchanged), if it is a week of work, or months of work.

Hi Witold,

I am trying to do this with rtl8192e.
One possibility is to take the following patch series as a starting point:
https://yhbt.net/lore/all/1414604649-9105-1-git-send-email-tvboxspy@gmail.com/

For me as a beginner and hobbyist this is a huge task. I am happy when I 
can finish it until next summer.

In case of questions feel free to ask.

Bye Philipp

