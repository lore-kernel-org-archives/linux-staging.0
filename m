Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB091C30
	for <linux-staging@lists.linux.dev>; Sat,  2 Jul 2022 06:11:02 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id sb34so7461788ejc.11
        for <linux-staging@lists.linux.dev>; Fri, 01 Jul 2022 23:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=WLcLw0xITUjwUjMPod9ehdsbnFfCvcc3p69fFrmeleA=;
        b=R2BXbGzo8CWffpo8J2zhcG1q4Sa2HxPMIEpKdD0tBm7w66PWtGysC+jZhBo3anKXyH
         k/OOV644jj/8g2xxxZiNrfEIBHoMwAq0KHvUZ7M5UzJPij/P4cVA3iTgMzgiy4sYqX5P
         fIwcu4PMPGr+kRcfECcDmEYjUdXl/YLdZYmnzBLfJGfjwXV2U9JA/ak2r7UPHLOp9Ahg
         31ZGk5YmyPBXXHZqlo4aTMsuRTkY1DRMHj1ZhGp/XNHxNGD8xKBv8Cg0Dgc8oukANF+7
         AsPXKyRgZifsxExcwj227djGJ5RazDm+Tvh1h4EiJBleIflLpizGf304+Y+KAHVSXJG9
         IUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WLcLw0xITUjwUjMPod9ehdsbnFfCvcc3p69fFrmeleA=;
        b=v03zGSQSqftBF/CCj8zG3JXozy12Cmlar1DXFuDqp97wbD5FCklW+LF2n2d5MS1SMG
         sGxmRHaw9C+vGAQZ2EmkeDCORK2tBYY5scyjym+BofbiMHyCi65+CZx2SvKnK/ALjD8W
         x5/oMcbWwUwloQMM6MrShu3iflMG01oxNqdAAAE0nowN/39bWFCC7jdy0WjU4+ECj3FN
         mTCd1keA9+DRQ6Zx2wx3k7LW9useMtlQRdLbTWC6n3k/Et6GQc/RBrXFswLZCGO6r1DI
         IB9k+xX25smELXZqxjFlITZNkePWqg+JXoqhbN/CF2KBn1XxwnMtfM2iOzV538rzhqcq
         2FoA==
X-Gm-Message-State: AJIora+H5aZfHEYZAEo63I6uvbBHq+owiUwZe2h2kH2O8qm+ZunJjga1
	V8q6CRdsd7IFKygozHpNzpI=
X-Google-Smtp-Source: AGRyM1vjNYgJD12dJZXxdQJHClk950VdnooED+1NVAELCinTqz33A/9Motl6lyYni12S84Z9PIpI3w==
X-Received: by 2002:a17:906:cc5b:b0:72a:9907:30d2 with SMTP id mm27-20020a170906cc5b00b0072a990730d2mr3705807ejb.745.1656742261317;
        Fri, 01 Jul 2022 23:11:01 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2e:6912:39ab:4063:59d3:a7cd? (p200300c78f2e691239ab406359d3a7cd.dip0.t-ipconnect.de. [2003:c7:8f2e:6912:39ab:4063:59d3:a7cd])
        by smtp.gmail.com with ESMTPSA id s3-20020a1709067b8300b0070efa110afcsm11307791ejo.83.2022.07.01.23.11.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jul 2022 23:11:00 -0700 (PDT)
Message-ID: <fb9598ca-abf6-2e3d-01f0-918c0169ca0f@gmail.com>
Date: Sat, 2 Jul 2022 08:11:00 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 5/6] Staging: rtl8192e: Remove unnecessary blank line
Content-Language: en-US
To: Felix Schlepper <f3sch.git@outlook.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 wjsota@gmail.com
References: <cover.1656667089.git.f3sch.git@outlook.com>
 <f3c6bd5c79331e82f006fb2694f791030b07c5ba.1656667089.git.f3sch.git@outlook.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <f3c6bd5c79331e82f006fb2694f791030b07c5ba.1656667089.git.f3sch.git@outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/1/22 11:24, Felix Schlepper wrote:
> This addresses an issue raised by checkpatch.pl:
> 
>       $ ./scripts/checkpatch.pl --terse -f drivers/staging/rtl8192e/rtllib_wx.c
>       CHECK: Blank lines aren't necessary before a close brace '}'
> 
> Signed-off-by: Felix Schlepper <f3sch.git@outlook.com>
> ---
>   drivers/staging/rtl8192e/rtllib_wx.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtllib_wx.c b/drivers/staging/rtl8192e/rtllib_wx.c
> index b949e7234150..6b11908032d7 100644
> --- a/drivers/staging/rtl8192e/rtllib_wx.c
> +++ b/drivers/staging/rtl8192e/rtllib_wx.c
> @@ -601,7 +601,6 @@ int rtllib_wx_set_encode_ext(struct rtllib_device *ieee,
>   			goto done;
>   		}
>   		*crypt = new_crypt;
> -
>   	}
>   
>   	if (ext->key_len > 0 && (*crypt)->ops->set_key &&

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
