Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFC63FC0
	for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 14:39:54 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id s3so38051543ljp.11
        for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 07:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=re6lK/BP08XNQ6PSp6D93sz/YFIqzRCqeE2m1nUD7G8=;
        b=LVNcDkVCUlLh59P7dmrsVLCxUgSd2XP+QT5UM8O45zlyF4SBhVEprBFhI2Sz7vHbjB
         89n1zWnTbKK2YglQscfg0g2SLjvMT8i0AHgupKhz4TC65lQd52Dw7EKAlnwfZCu/mAak
         VSeFpZ0jHUr2YsuV5d1whQHOTxeR9Uey1KyH5QJKbeNk58at4SkrCDoGR7xcA9fypHho
         PsrhGo47eiwaz/oZafjlxtt3P2nUs3QinGoopeMzjt4XAFhy1NB6hlRw4jeLw8rUne3W
         tmUe90P80fbE9UzQ/h0yMG9pe28HmQAM8fV2iAGMYdlb1wqWK0OxAfHlbCVPPsEpJ31a
         lQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=re6lK/BP08XNQ6PSp6D93sz/YFIqzRCqeE2m1nUD7G8=;
        b=DAG5KvoXw3jteSOTwFlpr2UAoZ+iWOZh3u/0TMuWavvIqQELzQLBmLe7E8t1Tp+k8j
         VRol08csGNm2QoWl6+U90TIwod99sXRRcl+Zf/3uwVcx3sAh9LZy2HE+XkUxGDyTztHa
         0sArggq+67wPveRSQ6YxNDXdU+EIqLfHKuUSNl60vPChVKy0yaFr7UezcQSsfIamTWKU
         i4EWSx7IsmhX6ylk0j76koMwQjrmXp/O/VMu1nfqxDI/pkSMDA7YuvgS5ceqEjqGS+PG
         E6nCUrKqpmvREiLDitnji+4R2liKrnL74y6wkySuC1N87uzVds5Hz2UNCDrandZk8rG2
         +vlQ==
X-Gm-Message-State: AOAM531tVR+ZpDOdzZbelo9b+ZMBDFJsIztxARXmEEmXFntwQjiWFvOh
	eN71FfBHCIH1FVuEP1FzMwM=
X-Google-Smtp-Source: ABdhPJxhoEVInXFt0CDNX0OaTxp32rAF2ntzq6G/vNmdhnRIftD9BrlVvKF/U9/BI2IpTKiPCT/NyA==
X-Received: by 2002:a2e:a811:: with SMTP id l17mr30650238ljq.456.1629815992620;
        Tue, 24 Aug 2021 07:39:52 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id v2sm1778139lfg.112.2021.08.24.07.39.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Aug 2021 07:39:52 -0700 (PDT)
Subject: Re: [PATCH 2/2] staging: r8188eu: Make some clean-ups in
 usbctrl_vendorreq()
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <20210824142823.16845-1-fmdefrancesco@gmail.com>
 <20210824142823.16845-3-fmdefrancesco@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <27c7e4ef-06a8-2f0c-d388-1a64e7d4a735@gmail.com>
Date: Tue, 24 Aug 2021 17:39:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210824142823.16845-3-fmdefrancesco@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/24/21 5:28 PM, Fabio M. De Francesco wrote:
> After replacing usb_control_msg() with the new usb_control_msg_recv() and
> usb_control_msg_send() API of USB Core, remove camelcase from the pIo_buf
> variable that is passed as argument to the new API and remove the initial
> 'p' (that probably stands for "pointer") from the same pIo_buf and from
> the pintfhdl and pdata arguments of usbctrl_vendorreq().
> 
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
>   drivers/staging/r8188eu/hal/usb_ops_linux.c | 22 ++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
> 

I cannot apply this one on top of the first one:

error: patch failed: drivers/staging/r8188eu/hal/usb_ops_linux.c:33
error: drivers/staging/r8188eu/hal/usb_ops_linux.c: patch does not apply




With regards,
Pavel Skripkin
