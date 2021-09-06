Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4EA3FC0
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 16:50:09 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id n18so4221804plp.7
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 09:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mzSa9wZBKlWhK0MfqqmZO/9vUDeVuVCig7dzjAMX9tU=;
        b=poqQLF143MSqjX1x09dOGpUZELMkqVG4vNZB2PH8jKS7wyUw0A9iY9zGVZ3qWDJ9rb
         oawjx9L3oObPLILFPPfqAuzEjlafiSg8GXvwrRH+KOGkTvmwonfCQfTe010LosiSNJVZ
         Cq9NWoiUfK6hmL0NLmUBxsyXLsSPWx/xnSf0b9+6UuERLwEZ0+niwqvqKaKs3n68jnu4
         t3I9t2bhawcfYthhIeyvt6QhSAxJPRmnYG1Da0fovy360VJ0fiHwEqk6/M0ya8fuDVEb
         6spBzwAp5I0GRsznKzmnRgir0U1zAv9aksoCiwoZ2i/ztvJCCEhR3KcAyaODBiFFlvHe
         wECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mzSa9wZBKlWhK0MfqqmZO/9vUDeVuVCig7dzjAMX9tU=;
        b=CmW1hWhPB52fg2lSkxf6pu+jXKu0qv8pwm9qcaF7/p9fcNvS3Y3hFSpcjOP19Iw0N0
         Z4mHr5S+Ktj0bBOcsEPSGEt4AyjiNxb0VVEQ8MZYeicTM/IWocViUi35U06pVIWOfdDX
         kOcz8Bjp0IaohJgBXhrz6XXSeqn4Y3PLHD2tF3DzCRAOpq5xsjxt7zfOsT2aB0A7RfaY
         NltEQgu+qDeHzuksMfQmQr1tCr06yDli+ALYa1GPxHIQS/Qiz0AH88jypuBQbAad/sdP
         p5Q91KcVAKha/w5DAPouQCa1zSrcTHx2jliFmZVncPOtJz6EC2tbmb8pk4vCa16PoMlO
         tbHg==
X-Gm-Message-State: AOAM530xFckLfoTT5oujaTJ1R3Xf9yiDfhflkLb5/ezxbnFQG9INwsbi
	p8AaZcFxmJVBQ7G2dsobjPQ=
X-Google-Smtp-Source: ABdhPJy/jURIOVEtyn0M+4wXFYwWfE4UEADRr4DC3FcP1IgRZ/135+xS9pCFjmSYRiKZCcwC4jlp4w==
X-Received: by 2002:a17:902:6f01:b0:138:9aca:efda with SMTP id w1-20020a1709026f0100b001389acaefdamr11493582plk.19.1630947008991;
        Mon, 06 Sep 2021 09:50:08 -0700 (PDT)
Received: from [192.168.1.6] ([117.98.200.228])
        by smtp.gmail.com with ESMTPSA id 11sm8143234pfl.41.2021.09.06.09.50.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Sep 2021 09:50:08 -0700 (PDT)
Cc: saurav.girepunje@hotmail.com, Larry.Finger@lwfinger.net,
 florian.c.schilhabel@googlemail.com, fmdefrancesco@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8712: Move similar execution in to a
 function.
To: Greg KH <gregkh@linuxfoundation.org>
References: <YTUQZdPiYFscIsvU@user> <YTXjSwWcyd6RRMjO@kroah.com>
From: Saurav Girepunje <saurav.girepunje@gmail.com>
Message-ID: <4b62cbec-b356-b920-17ba-3ee7cc6f9713@gmail.com>
Date: Mon, 6 Sep 2021 22:20:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YTXjSwWcyd6RRMjO@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 06/09/21 3:15 pm, Greg KH wrote:
> On Mon, Sep 06, 2021 at 12:15:57AM +0530, Saurav Girepunje wrote:
>> Move the common execution for read_macreg_hdl, write_macreg_hdl,
>> write_bbreg_hdl and write_rfreg_hdl in to a new function
>> common_read_write_hdl.
> 
> You said _what_ you did here, but not _why_ you did this.
> 
> I can't easily see why you did this, please explain it better in the
> next version of this patch.
> 
> thanks,
> 
> greg k-h
> 

Ok, I will add explanation and send next version.

Thanks for review greg.

Regards,
Saurav Girepunje
