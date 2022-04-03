Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6427C
	for <linux-staging@lists.linux.dev>; Sun,  3 Apr 2022 12:14:22 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id p15so14631957ejc.7
        for <linux-staging@lists.linux.dev>; Sun, 03 Apr 2022 05:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=qglcsoM2Fho7Dk85XWKMBB8jz/JatTseCQx1G8rPXYw=;
        b=Es/ROWpqvIeaQFC2S730hGopo726Jc77/JIfyPyezax5/kHNN/5yLAVtb67xqtPrxw
         DKH3fpvO/Od6gv1fj+OAE7ad0WUGDLjX1GcMblJOOh1Brbr1Ecrvp0dJ8AXRXOXQp3sd
         N6AHqTsbEX0//Wtga2agcrPRAlYd0HiDdihvRUKuVw1XOEUKdTpG2wWYM84zOa9S56fI
         apx78cfMCHn5cdOgL5pZHohrqRN7wiy5Bo8UFcbZSTkgURlmdOAQWKd3oVmbzCK8R3bP
         111ztmDolDvRgqjswqWt+almaCrsROdiXzXONAqBXAd3WLpkFMSXx9Egj1GsznIdbGLT
         6lww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qglcsoM2Fho7Dk85XWKMBB8jz/JatTseCQx1G8rPXYw=;
        b=m8T5h/Os98B4SuNGdanAMNsCs+xKJoxpXVZ2MxRWhWYIAr2IvwujH60RopA8QDx7sN
         gHxpcR4QmGXhTkClOvoDYIrm1mo/w4Ep1E0ClQKAkKVYRCQJa/qPPi1gLT6GXF+3KoE9
         ONefC25jTne+EecmcZbofdnz2j/BwGTk+GtoJ366dMovdRomFdir5md+T62ZKwE009Xs
         bQ9ugWHJoSi48IKPl46jdlGhAY0epHOLgaFVeNDmqQrtkXUkq4XTVHpYd0fWjrztjbrR
         GH1qEo4dGnvTQanoreIOAl8in/00WBCvzSgoc1mYXdiGaLPQ5LPRC/Gxx6TY0n+cEOlo
         tjNw==
X-Gm-Message-State: AOAM532Gw7v4/BIoo/nU/YZ7NL9oSVH+Nhl36f9wu+qMc2JAp4JgyYbu
	eQSgVP3KUeEjMVj+Vf3crog=
X-Google-Smtp-Source: ABdhPJyClDCQpBerYT11UHE5FcWiHNho6NKGMcBQuUVLs5FD+eC1TPxra3ME5EnRjcZKzwthwXh2yA==
X-Received: by 2002:a17:907:60d3:b0:6db:8b59:1564 with SMTP id hv19-20020a17090760d300b006db8b591564mr6837459ejc.228.1648988060750;
        Sun, 03 Apr 2022 05:14:20 -0700 (PDT)
Received: from [192.168.0.253] (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id nb6-20020a1709071c8600b006e02910f818sm3245154ejc.157.2022.04.03.05.14.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Apr 2022 05:14:20 -0700 (PDT)
Message-ID: <46a63481-d2e8-6c9d-b00d-a0e384e3f2af@gmail.com>
Date: Sun, 3 Apr 2022 14:14:19 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: staging: r8188eu: how to handle nested mutex under spinlock
Content-Language: en-US
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <356c24cf-625b-eea2-2c04-ce132d881cac@gmail.com>
 <bf1137fa-5051-a834-0c1f-042c5a8074a3@gmail.com>
 <3fb13fee-a605-7f2e-81ad-45148082a733@gmail.com> <1817830.CQOukoFCf9@leap>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <1817830.CQOukoFCf9@leap>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/3/22 13:56, Fabio M. De Francesco wrote:
> On domenica 3 aprile 2022 13:48:31 CEST Pavel Skripkin wrote:
>> Hi Michael,
>>
>> msleep() cannot be called in atomic context:
>>
>> drivers/staging/r8188eu/core/rtw_pwrctrl.c:379
>>
>>    	if (pwrpriv->ps_processing) {
>>    		while (pwrpriv->ps_processing && rtw_get_passing_time_ms(start) <= 3000)
>>    			msleep(10);
>>    	}

Ah, just another issue...

> 
> I wanted to use mdelay() (allowed under spinlocks because it does not
> sleep) but Dan said to leave it as it is. You might easily find this
> discussion on this list. I cannot remember why Dan was against replacing
> msleep() with mdelay(). Please try to find that thread.
> 

I'll take a breath and look further into it later. Seems a solution like
the one Larry mentioned is reasonable here.

Thank you both,
Michael
