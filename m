Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884B4E4E0;
	Sun, 19 Mar 2023 16:15:59 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id eh3so38030719edb.11;
        Sun, 19 Mar 2023 09:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679242558;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0xI1vkDtYqpmWRObk2pbvA9d3XpNb4E7+cR3cNxuUGM=;
        b=hwuVkLBhnHrpbY9ZY5W98JgUaQyt8diEeixiUjLgrDWtTr2KFyjaT4krv8nXhbWzFi
         ZiHEyE9tzE1XYJbObJNr4vaDeJWxLFZ7rWT2Iav0uiYji49M8Og9RHmQVu/4k58oXgSl
         cO1/suFFf0BiHWRl6CwUwcbggTtR/aPafz6rL48WdisXTLMbS4XBo8VcjlRthw3VYbSI
         ODAp2RRbuGvn1KL7urCirBAvQBATrZlRQnHB8hoX+G+Tbqkj5DJxcRFeNdtA+JCTcxP5
         ggX5HJkjYXhuWzwGyvnzPkDxZuq2XgSKLfzi3HemDlcF1yYI9QoNriBq6D7iNFNDcMyw
         UL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679242558;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0xI1vkDtYqpmWRObk2pbvA9d3XpNb4E7+cR3cNxuUGM=;
        b=eQgRD/lBjSGT+LKqKQ+yO/QrQgo8Hmse9sZ+A4ZRUxAdaeQ8sV0Cudk763HB+8Wh6g
         thGudyt90/LbGaiSnv8aarISBHMq76qo8cHBfeIcVM/Ru4LrAZcNQzE6KpQ7oPjhIp1V
         ef7E/Fq75EutJ2yeVqcJmUSPidIzKudouYgNHstth9CSTt4MTTfRGTT54n3IjiS8vqml
         gYNBbsM2lr+mKVV6Ih6O/OU/WjnHA23pj53+1C+lPJ3Xvov99g+YwpKtaFyIFcKWecFk
         ZrgUHwwI3ZqzxAOi/d1tW609rjKLJCcoTgutJUOEmrimAbI/ZS59iHypMDDTKqWQMv7t
         NXfg==
X-Gm-Message-State: AO0yUKUzsmbJpMnkFXe6phAqR8jgK9Hql9+ll0R16Y0nsBk4bOlhiaOn
	3Ip1McFVLrpHDfujB5G0fEA=
X-Google-Smtp-Source: AK7set96Ivpm+WBhrxE96fHK/LO1ZrgJ4Tuo6cof2W656SK6cHb7owkm0Sy2Pqq/myU8WE596lUkmQ==
X-Received: by 2002:a05:6402:3da:b0:4af:81f1:5afb with SMTP id t26-20020a05640203da00b004af81f15afbmr10509083edw.14.1679242557700;
        Sun, 19 Mar 2023 09:15:57 -0700 (PDT)
Received: from [192.168.1.16] ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id y94-20020a50bb67000000b004be11e97ca2sm3663921ede.90.2023.03.19.09.15.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 09:15:57 -0700 (PDT)
Message-ID: <62070f52-1600-1a6f-b7e5-6fb6850840c4@gmail.com>
Date: Sun, 19 Mar 2023 18:15:55 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] staging: greybus: remove unnecessary blank line
Content-Language: en-US
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev, johan@kernel.org,
 elder@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 greybus-dev@lists.linaro.org, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230319152909.163598-1-eng.mennamahmoud.mm@gmail.com>
 <1775403.TLkxdtWsSY@suse>
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <1775403.TLkxdtWsSY@suse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On ١٩‏/٣‏/٢٠٢٣ ١٨:٠٩, Fabio M. De Francesco wrote:
>
> On domenica 19 marzo 2023 16:29:09 CET Menna Mahmoud wrote:
>
> > Remove unnecessary blank line before struct as reported
>
> > by checkpatch:
>
> >
>
> > " CHECK: Please don't use multiple blank lines "
>
> >
>
> > Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
>
> > ---
>
> > drivers/staging/greybus/pwm.c | 1 -
>
> > 1 file changed, 1 deletion(-)
>
> >
>
> > diff --git a/drivers/staging/greybus/pwm.c 
> b/drivers/staging/greybus/pwm.c
>
> > index 3fda172239d2..26d39e08c3b6 100644
>
> > --- a/drivers/staging/greybus/pwm.c
>
> > +++ b/drivers/staging/greybus/pwm.c
>
> > @@ -24,7 +24,6 @@ struct gb_pwm_chip {
>
> > #define pwm_chip_to_gb_pwm_chip(chip) \
>
> >     container_of(chip, struct gb_pwm_chip, chip)
>
> >
>
> > -
>
> > static int gb_pwm_count_operation(struct gb_pwm_chip *pwmc)
>
> > {
>
> >     struct gb_pwm_count_response response;
>
> > --
>
> > 2.34.1
>
>
> Hi Menna,
>
>
Hi Fabio,


> I just saw that today you sent this patch at least three times:
>
>
> https://lore.kernel.org/linux-staging/20230319114155.42148-2-eng.mennamahmoud.mm@gmail.com/
>

This for different file, and the below I sent it with other patch so I 
resend it again.

>
> https://lore.kernel.org/linux-staging/20230319152909.163598-1-eng.mennamahmoud.mm@gmail.com/
>
>
> https://lore.kernel.org/linux-staging/20230319132452.151877-2-eng.mennamahmoud.mm@gmail.com/
>
>
> Why are you doing so?
>

sorry for this.

>
> Please send your patches only once and wait at least a week without 
> any replies before resending. Furthermore, when resending, please 
> explain under the three dashes ("---") why you are doing so. Patches 
> may get lost, but this is not your case for sending them again and 
> again in a single day.
>
got your point.

>
> Is there anything I'm missing?
>
>
> Thanks,
>
>
> Fabio
>
>
>

Thanks,

Menna

