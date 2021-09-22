Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE20E72
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 13:21:20 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id u18so11587880lfd.12
        for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 06:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=6arDu0bHKhe+YT1UraMY0MBKwysBZPAsrewYON3ecAQ=;
        b=WjzdbaM+CXMA0teP/YGVvk89FeUFWuAbqAV8nRAin4e3Eb9ONN01Is26Gx6n8Q/s6c
         ZFv0k9lALvY0u9SkBX60mP74hQl2jN4Gu1dMP7fWXHJnvW1FHLCpDi2wxqUjL2PlP44t
         liF+YxmV9KANbC4Jgrw6SFr5pSrbgmyBBXTeiZdtEYAU87qQaFy6jAj1Du6r1i5eP1jA
         qN2JVkpXCQvXNHP9JYgOkJg1XWXL5MR6bhXozG/DoisVT3fdyvgdhjPycq05WvwFp4Tc
         pKP0XZORlFxN0NCB6RPmhze0lekX+5EHMHzhCf+873B83J3GD5e66vEyKWYhAlgMFLTI
         B+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6arDu0bHKhe+YT1UraMY0MBKwysBZPAsrewYON3ecAQ=;
        b=fsMxQkrCeWB747zcrB/WBlCokoPbg1zix5yFRbXcVExYsHATjZ/7o/YqPWgz0ZgKr3
         YeyFGbyCT6/KQPhZB/5I+8Ku/Rats7Yrq/VR6PstMZciq6kBguHrlsw4DMDZi0AMlGBV
         f7sSMTTQXXWbeyo01p+JuADrsbCYUH7hMCcOW5l+S11t/xT5A0mDGw4Ahcf1SA3Y7+/O
         R4xVm6j2U30ag7SE4cVxADbm+GDDrNpDCgRYuq/q4injpYhEpUFYsXMkFsIujFxWDsBc
         1u/nat5G9YDTDhwdIf+hNMh6u3qzrsS5bleP+Rwo6JJxsp+4QmV7MPe5I08NY+Y/SkQm
         KQAg==
X-Gm-Message-State: AOAM530wS4DaM1ue1fy6XnpXmx60nzz7NcNBbHDsb4GiyhIzQedb5FU5
	jlsUfsHIXYdDvrFpIsdZHJc=
X-Google-Smtp-Source: ABdhPJzKMoiib1IP7uFrzIzqrHdxIHI16pju0WUINfy/rVOkyx6qheK25/MW/1hVXwMMv27iUGuXvA==
X-Received: by 2002:ac2:5322:: with SMTP id f2mr15956976lfh.531.1632316867286;
        Wed, 22 Sep 2021 06:21:07 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.67.49])
        by smtp.gmail.com with ESMTPSA id y9sm191715lfl.240.2021.09.22.06.21.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Sep 2021 06:21:06 -0700 (PDT)
Message-ID: <dd99d40d-297e-8d27-dabe-d0e4c633d391@gmail.com>
Date: Wed, 22 Sep 2021 16:21:04 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v9 16/16] staging: r8188eu: remove usb_vendor_req_mutex
Content-Language: en-US
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, David Laight <david.Laight@aculab.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Martin Kaiser <martin@kaiser.cx>
References: <20210921181834.29677-1-fmdefrancesco@gmail.com>
 <20210921181834.29677-17-fmdefrancesco@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20210921181834.29677-17-fmdefrancesco@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/21/21 21:18, Fabio M. De Francesco wrote:
> From: Pavel Skripkin <paskripkin@gmail.com>
> 
> This mutex was used to protect shared buffer for USB requests. Since
> buffer was removed in previous patch we can remove this mutex as well.
> 
> Furthermore, because it was used to serialize the calls to the Core USB
> API, we thoroughly tested the enabling of concurrent firing of USB requests
> without the mutex and found no problems of any kind in common use cases.
> 
> Co-developed-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>

Hi, Greg!

If all is OK with previous 15 patches, please, do not take this one, it 
  causes problems with connection... :)

I don't understand what went wrong after v8, but anyway, this one should 
not be applied for now, since it's broken


Thank you



With regards,
Pavel Skripkin
