Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9FE6D13
	for <linux-staging@lists.linux.dev>; Sun, 15 Aug 2021 08:05:43 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id f5so19101158wrm.13
        for <linux-staging@lists.linux.dev>; Sun, 15 Aug 2021 01:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UrAgzl3jB506c9cAqBKWaFN40W2kC92MoWozjCwPEHQ=;
        b=UWkkTVvu67+osPtAX0iSWeHcPAsWLnequ3aLFWbVL2Vkm/oSYgvxH8ykI4EjnUdjKT
         H9eT0V8DOkGaJowMHEGb5RGW9xQ6bgcTqVMWf0VMe35yWv0lknZ38h0mu7OwAiaiO5T3
         Vr6xs3b37hWUxNohgiMJ/6BpicvXrG9fxe0bJTfxae0BmwH6kHJNRvzR8b8Er//6DC8A
         +Ijfe+XGG/eGWrK8mgAKvoevefgUzGcgis2+Rbe8+CdLJ0Ilofmg5A2gisrbs61W8qE2
         3ENocHUJf6BMB9v8/SQA1aew/MJiE5QmYGkWM9TpMjqWuDVIh3PbfoXidqHqBnoxBGhX
         lbAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UrAgzl3jB506c9cAqBKWaFN40W2kC92MoWozjCwPEHQ=;
        b=tAcOeixG5ogDQ14Fau78cVuCax/BCCaW9XlHmgowI4SEjLb+z8qlQucxuSrHQGJSln
         bAzjDbeA3OiUXg0YgLdjmlZjt4PUudZao4OS1xYNsIMTDTas6j+VskTsEXTRObSoWk1H
         nG15KxPFfWc6eIKklxFFCkCTdROvSjAG8w5a9FB9MhkZSBPbc5ZEl0qTpruCCzKZ8X1R
         EyaFfdhUoTMDNrq/Iz22zMxkLprU25Vz6/PqpqZSYttS0Jo5MVSdaiWWsqfqK0OFuK9L
         57PaBPwD1ivptouh0Fa+Yre1KzyH85NMrr3afXJ/gfYnU/U68AkDT3AfTWHy4nEycQ5w
         9aug==
X-Gm-Message-State: AOAM532Z9shSuimyLL3C7DFGGD8DQtY0343vUWLV64mQuv2eSkV0NSyQ
	yO8D9VWnK2uKaNV29OIYcak=
X-Google-Smtp-Source: ABdhPJzCDz7NBwkMSBhStBGAH5BK185N1SSlwKLdR6RI+Re2hqdjt8MQVMf9SI2uQbcqvs/R+xQM2w==
X-Received: by 2002:adf:fb8f:: with SMTP id a15mr12222669wrr.92.1629014741986;
        Sun, 15 Aug 2021 01:05:41 -0700 (PDT)
Received: from ?IPv6:2a02:8108:96c0:3b88::2571? ([2a02:8108:96c0:3b88::2571])
        by smtp.gmail.com with ESMTPSA id p14sm6533436wmi.42.2021.08.15.01.05.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Aug 2021 01:05:41 -0700 (PDT)
Subject: Re: [PATCH] staging: r8188eu: use common ieee80211 constants
To: Phillip Potter <phil@philpotter.co.uk>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Larry Finger <Larry.Finger@lwfinger.net>, Martin Kaiser <martin@kaiser.cx>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 linux-staging@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210814165518.8672-1-straube.linux@gmail.com>
 <CAA=Fs0kkhzvu134zOpb69Z6WFCCpmcfGLR-4KJeDd3n1d8g-qw@mail.gmail.com>
From: Michael Straube <straube.linux@gmail.com>
Message-ID: <9f13258d-5fa1-aa28-e2e6-14f0721b8eb5@gmail.com>
Date: Sun, 15 Aug 2021 10:04:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAA=Fs0kkhzvu134zOpb69Z6WFCCpmcfGLR-4KJeDd3n1d8g-qw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/14/21 7:36 PM, Phillip Potter wrote:
> 
> Dear Michael,
> 
> Constants seem to be correct values still, nice. That said, the other
> patches that have come through from others before this prevent this
> applying to my copy of staging-testing branch. Assuming Greg takes the
> patches in order, this will therefore need reworking. That said, it
> builds fine for me when applied directly to fresh staging-testing tip
> without the patches that have come in since, so:
> 
> Acked-by: Phillip Potter <phil@philpotter.co.uk>
> 
> By all means apply that Acked-by to v2 if needed. Many thanks.
> 
> Regards,
> Phil
> 

Thanks for the hint Phillip. Sure I can send v2 if needed.

Greg, is this ok as is or should I send v2 rebased on staging-testing
with other pending patches applied?

Michael
