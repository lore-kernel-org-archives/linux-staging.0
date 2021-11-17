Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8437268
	for <linux-staging@lists.linux.dev>; Wed, 17 Nov 2021 19:39:55 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id w6-20020a9d77c6000000b0055e804fa524so6625478otl.3
        for <linux-staging@lists.linux.dev>; Wed, 17 Nov 2021 11:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=E2QZlILzBSeM0cYX3n8Y3hryfEsuJ9WmW86A58RfpMg=;
        b=nVyjPYlpxtawbLxLERNzRUCRzrM3/R5u0ePEt+SpExdUzduZNlsl5M1ySau1/irMuf
         eeOOq5bpcka8/o8oKfXiz3zE6ZXFuFPfRdY2/z0+ttdqC5dea2+Q3Io6Kt3zHLMt94+g
         WnbYzO5i2TPf5ypWbhF65BBvd+//XUGqYb4OctzEnJlPfYGrNy1pN7cFj6dwbGPdOjBL
         gTwS2GgLodv6xGu3Rq4mGxjUaJF6hH3wSotM5eMk+wlluRPM86/doEcqwaVd66zDNAVE
         0S7JHyHPbeJWEr4DWyYeTeXePwA+w7UR3frDwDQkhW21cMrvQlYoY96P/pQDOdUOnVpe
         DymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=E2QZlILzBSeM0cYX3n8Y3hryfEsuJ9WmW86A58RfpMg=;
        b=T6CGT9lqYDJV7ubQZynv7sqsIqPLxLp6ZyvTDFpLjoJdtDPkyCBLnTC//4ZfMgL4FX
         wKmqW1fOKYMwBnM3+vY6C6Edozk7LpF/PVVuExY65wLQ7iEQs9YTiWr9M7JYmCIZsEQ8
         H1y3br5o3/yz+GKzu7MzaLxHxiZ0PngUYg3M9j/w99VD308WhHyTa1yHKeYBdHa36rxS
         steTGoobD02uhRX6G6J688OZSB94oOAodiiICgLRb7XZ81391kWPMFVzNJn0SD4bIiuF
         ArzzID1AD+SsJFqaS3PqQrLQov6Mmwe1rDA2iDefOvDmOOXuTrtMMTuqvQQ7oyG12cGz
         Z8AQ==
X-Gm-Message-State: AOAM533OfbWmOiPF/DPJm6AEwhP4lvtICBgVTR8o2VjMjGHXHm+caBaO
	NgUl1ez1oiYBPR5zf4YInD0=
X-Google-Smtp-Source: ABdhPJwFDGuRI0UJCXmlk7vCa2Iv3dcbFQx+NJuVAAd9hvQR8bae4W+lWKWJkMo74PBkTXdRNjYalg==
X-Received: by 2002:a9d:560c:: with SMTP id e12mr15897075oti.160.1637177994330;
        Wed, 17 Nov 2021 11:39:54 -0800 (PST)
Received: from [192.168.1.103] (cpe-24-31-246-181.kc.res.rr.com. [24.31.246.181])
        by smtp.gmail.com with ESMTPSA id v9sm159728oth.62.2021.11.17.11.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Nov 2021 11:39:53 -0800 (PST)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <2fef704b-abc1-9ab6-bd65-ca7b410bdd7b@lwfinger.net>
Date: Wed, 17 Nov 2021 13:39:52 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: r8188eu and cfg80211
Content-Language: en-US
To: Zameer Manji <zmanji@gmail.com>, linux-staging@lists.linux.dev,
 gregkh@linuxfoundation.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Phillip Potter <phil@philpotter.co.uk>, Martin Kaiser <martin@kaiser.cx>,
 Pavel Skripkin <paskripkin@gmail.com>
References: <CABtXzjQ=8KcNM2uMRnd7dTxGvMKscdc_cbEnTuuqrcnfuh_dUA@mail.gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <CABtXzjQ=8KcNM2uMRnd7dTxGvMKscdc_cbEnTuuqrcnfuh_dUA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/21 10:30, Zameer Manji wrote:
> Hello,
> 
> I have been looking at the r8188eu driver code and although there is a stub
> header "ioctl_cfg80211.h" for the cfg80211 implementation there isn't any other
> code related to it. I noticed that both Larry's tree [0] and another
> tree [1] have full
> cfg80211 implementations for this driver.
> 
> Would it be possible to import one of these implementations into the
> staging tree?
> Migrating the driver from wext to cfg80211 is a requirement to get the
> driver out of
> staging and would probably make the driver more useful to users.
> 
> [0]: https://github.com/lwfinger/rtl8188eu/blob/v5.2.2.4/ioctl_cfg80211.c
> [1]: https://github.com/aircrack-ng/rtl8188eus/blob/v5.3.9/os_dep/linux/ioctl_cfg80211.c

I have been working on doing the exact migration that you want; however, it is 
not trivial. I am not sure when I will finish.

Larry

