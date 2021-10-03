Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410653FED
	for <linux-staging@lists.linux.dev>; Sun,  3 Oct 2021 16:19:23 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id y23so21802798lfb.0
        for <linux-staging@lists.linux.dev>; Sun, 03 Oct 2021 09:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=llNEIxhbTSZcUz/lPANGAqOblDCi/UrFP7kaAKP4keU=;
        b=iMBm8AwapfDJTBhIZYAwPszSAxnzFsOVLZ+j8Uyli8khiCJhULvx8qM7JmI/KKUK2f
         EzP8bV6h8QYSevFDyf0DMcJOT+o48h1b8uJsvRfP1Z76mM9ZXQfZAuNgqMDUNrbXWvm4
         2aUVqbWVeCNfJKNRLLulqkem+/oNsS6RcRXJ10rZr+ZovkXH5Ko3wAPAtts1B6EBRhbK
         I/R3Q+P1toK8ptlGvXGYcXm5aomTnTTJ8sbmWJ2BSdQEtc1+WOqyg2FhYeMwB1/+qqbp
         j2zsgZzWgCzzIUhbScMj6xZjXYKQOFMjK74hnGq7+SxILDl4IguVnHw2+qdw/sfp5YY2
         VVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=llNEIxhbTSZcUz/lPANGAqOblDCi/UrFP7kaAKP4keU=;
        b=A8IpbWDOLKRgYjIzlLJm6iDnkDDEzo9URSFlnHPeaS6d6sN9KcXYiYXlodrYKbt9mZ
         9zSn3hdOjPdjeKSfAijCtmXY7JDvw0LEYfK0f3wgeY5z9cJDml/3GK075VXFCMCstgZz
         cTpgIUMpw+9ohxruzsYaZUp8HPO2JCRsuA8WCXf6V8Yf4S9KncTXmUJwl0StFS4qSpc/
         gP/K2Hg+PqiCSKp5NxOxeWIQk0PgmUNGtcH6VZgnw4xD80z9S9IPSsqETvuKD1uR3CiA
         JzQgx8KsvrJEBmDB6xA2nRHQmeGobnb2HmfqClLTqRWQPOJkSL5yhT7hfygL1ExmOdEp
         5v9w==
X-Gm-Message-State: AOAM530u55e5sQxNXQGLJ+tb2iEbKiU/Se5MqP82pu0Bc9IYCaG0xmdU
	UINfrQk445mnJPNciotRIuM=
X-Google-Smtp-Source: ABdhPJz9BjYRvkt6eRG7+7adWwZUvWuFcpNGUlKEL2xMti3oEMnwTfmWXA6Kv8Fq/UwxgF1mHJRSRg==
X-Received: by 2002:a05:6512:344f:: with SMTP id j15mr4527384lfr.521.1633277961257;
        Sun, 03 Oct 2021 09:19:21 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.235.120])
        by smtp.gmail.com with ESMTPSA id u21sm1292162lju.26.2021.10.03.09.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Oct 2021 09:19:20 -0700 (PDT)
Message-ID: <1bad16dc-e11e-4096-2014-a0eae92686e8@gmail.com>
Date: Sun, 3 Oct 2021 19:19:19 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH] media: atomisp: fix `-Werror=return-type`
Content-Language: en-US
To: Ammar Faizi <ammar.faizi@students.amikom.ac.id>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Bedirhan KURT <windowz414@gnuweeb.org>
References: <20211002231723.29019-1-ammar.faizi@students.amikom.ac.id>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20211002231723.29019-1-ammar.faizi@students.amikom.ac.id>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/3/21 02:17, Ammar Faizi wrote:
> Bedirhan reported build error:
> ```
>    drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c: In function ‘input_system_configure_channel_sensor’:
>    drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:1649:1: error: control reaches end of non-void function [-Werror=return-type]
>     1649 | }
>          | ^
>    cc1: some warnings being treated as errors
>    make[4]: *** [scripts/Makefile.build:277: drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.o] Error 1
>    make[3]: *** [scripts/Makefile.build:540: drivers/staging/media/atomisp] Error 2
>    make[2]: *** [scripts/Makefile.build:540: drivers/staging/media] Error 2
>    make[1]: *** [scripts/Makefile.build:540: drivers/staging] Error 2
>    make: *** [Makefile:1868: drivers] Error 2
> ```
> 
> Commit 264f590899146baa19e0ab5689e55fadbc292333 ("media: atomisp:
> remove useless returns") incorrectly removed a required return results
> in the above build error. Reinstate it.
> 
> Cc: Pavel Skripkin <paskripkin@gmail.com>
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: linux-media@vger.kernel.org
> Cc: linux-staging@lists.linux.dev
> Cc: linux-kernel@vger.kernel.org
> Reported-by: Bedirhan KURT <windowz414@gnuweeb.org>
> Fixes: 264f590899146baa19e0ab5689e55fadbc292333 ("media: atomisp: remove useless returns")
> Signed-off-by: Ammar Faizi <ammar.faizi@students.amikom.ac.id>
> ---
>   .../media/atomisp/pci/hive_isp_css_common/host/input_system.c    | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
> index 8e085dda0c18..1bd917e81743 100644
> --- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
> +++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
> @@ -1646,6 +1646,7 @@ static input_system_err_t input_system_configure_channel_sensor(
>   	default:
>   		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
>   	}
> +	return INPUT_SYSTEM_ERR_NO_ERROR;
>   }
>   
>   // Test flags and set structure.
> 

Hi, Ammar!


Thank you for fixing this, but it's already fixed in linux-next tree. 
See commit 05344a1d2ea7 ("media: atomisp: restore missing 'return' 
statement").

Again, I am sorry for introducing this bug :(




With regards,
Pavel Skripkin
