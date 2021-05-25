Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22ECD70
	for <linux-staging@lists.linux.dev>; Tue, 25 May 2021 10:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621937284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=neRDn1W0/FRhGmHT4pnXFQhxRlIRY6WFH9hbwXAhzss=;
	b=E7DBuFS8VUCMFgraZVcZHzn1RzT3lcS8GnJoWeVP6FsS8gVJe7gbksSIopcauuXIwyXiVk
	gnQKyUr7lHMPc+ZPyOyRvANf5VVBOxkTwicjnf6Ik+bs0Wb8z663wgD8Y8wLP2BaYdWSQK
	FtjOixDGPR0vR0tLHK5VDLWJ3oVT+6s=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-vqJNI0tNOFemPi34Gmu_nw-1; Tue, 25 May 2021 06:07:57 -0400
X-MC-Unique: vqJNI0tNOFemPi34Gmu_nw-1
Received: by mail-ej1-f69.google.com with SMTP id j16-20020a1709062a10b02903ba544485d0so8604758eje.3
        for <linux-staging@lists.linux.dev>; Tue, 25 May 2021 03:07:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=neRDn1W0/FRhGmHT4pnXFQhxRlIRY6WFH9hbwXAhzss=;
        b=hCQq3mSkybQyD9DLYplDgRyy2du+MSj6zUzfvfujjkHhKgN2ciCSsybR535SrqKSyu
         iJZVEaVnQfpZ4znJxd6WvmHNI30AdSTZEUroxA5kXqlT2vTw2pGgCvB+j/Pb9V33+Z2O
         nnhlmKhJjJ+k0O4atX0c+uo7NTNUQYmaYLalR25sXECS4eO3U+WiUt+fZNqvODdNItj4
         NS2WIsLNw8W2SrZmmr1nAyvyrsR5FUnjz1544xpXt1NTBZwIShyL0u20pCkdFiCCn6Js
         l+MEQ8HZK7+J2CXdkhKGJBAdvWqe1d0EkhJn2TRniugZ0bTZRSPsWL9icsjEvmPMNsjO
         RXNg==
X-Gm-Message-State: AOAM533m1QHWzFDu7eNkLZNvNj07w32UYqemjF63e3HpZ/dWz/5s8FeE
	rhNFDR61A+bnPbitUff3tQsU0+NxHlI3HSuYUnOeacHXbt4pGv/eT2HYSE0eOq3Y1n4XuA7xegk
	UqdSOzitF3+hRPlCD9ellgAHr1A==
X-Received: by 2002:a50:ab52:: with SMTP id t18mr31734294edc.188.1621937276360;
        Tue, 25 May 2021 03:07:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHrL4elARHpBvwVzdshA75SWQXVu0rEVfjkR+v6KsApWjCXJcDV4xGaGp2LgtUiPaViaGk2A==
X-Received: by 2002:a50:ab52:: with SMTP id t18mr31734281edc.188.1621937276198;
        Tue, 25 May 2021 03:07:56 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id y27sm8875899ejf.104.2021.05.25.03.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 03:07:55 -0700 (PDT)
Subject: Re: staging: rtl8723bs: removal of 5G code
To: Fabio Aiuto <fabioaiuto83@gmail.com>, Larry.Finger@lwfinger.net
Cc: gregkh@linuxfoundation.org, johannes@sipsolutions.net,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org
References: <20210520092946.GA1404@agape.jhs>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <8c0c1806-f818-cff0-6925-22ef2b164f77@redhat.com>
Date: Tue, 25 May 2021 12:07:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210520092946.GA1404@agape.jhs>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 5/20/21 11:29 AM, Fabio Aiuto wrote:
> Hi all,
> 
> I'm stick with removal of 5Ghz code from rtl8723bs wireless card driver
> (in staging subsystem).
> 
> I think that this task comprehend deletion of all code managing
> 80Mhz bandwidth and upper bandwidth (160 and 80+80). For the latter
> it's simple, there's quite no code (unused enums and obsolete comments).
> 
> The former seems to be trickier, there are handlers like this:
> 
>         /* 3 Set Reg483 */
>         SubChnlNum = phy_GetSecondaryChnl_8723B(Adapter);
>         rtw_write8(Adapter, REG_DATA_SC_8723B, SubChnlNum);
> 
> phy_GetSecondaryChnl_8723B() contains code like:
> 
>         } else if (pHalData->CurrentChannelBW == CHANNEL_WIDTH_40) {
>                 if (pHalData->nCur40MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_UPPER)
>                         SCSettingOf20 = VHT_DATA_SC_20_UPPER_OF_80MHZ;
>                 else if (pHalData->nCur40MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_LOWER)
>                         SCSettingOf20 = VHT_DATA_SC_20_LOWER_OF_80MHZ;
>         }
> 
> so if we are on a 40M channel some settings involving 80M are made and
> the whole is then written on card registers.

I'm no wifi expert, so I was hoping someone else would respond...

With that said I believe you should keep this else block, this part of the
function seems to select the order of the bonded channels when bonding
multiple 20MHz channels together.

The "if (pHalData->CurrentChannelBW == CHANNEL_WIDTH_80) {}" part can be
removed because on 2.4G only devices 80 MHz width is not supported, but
the 40MHz bit should stay, the constants for the register bits may be named
after the 80MHz option, but I believe these same register bits will impact
the 40Mhz case too.

It might be a good idea to rename the constants to VHT_DATA_SC_20_*_OF_40MHZ
in a separate patch.

Regards,

Hans

