Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7DD1C30
	for <linux-staging@lists.linux.dev>; Sat,  2 Jul 2022 06:09:03 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id fd6so5295554edb.5
        for <linux-staging@lists.linux.dev>; Fri, 01 Jul 2022 23:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=uohFf1DkkWNhAVQnV45ZTdTOfbQegv4GUmhl5weagcI=;
        b=NdAs6H2PwDrMo62QVT4fkndCt+xzIEYZOx7ONqkp/yJeJGhchoBWAxYrybOH/u7+H5
         GrwWyCrCrJ0I2BZDh/IgeVqheViKh6MVVwI2C/M0Q4fmxu4LKHfURCBNIX7YVCCVgKni
         5f2vTsl5lXFHZMEifhnZNYppFMSwPH3KsGsdm9XEBES4kTfEWgsm63Bk4HCKJx1tOLbk
         /pEOdS0FCIFar0u0eWTeEnd4+nFXDfr/KpaCjsh48ap1pWgjrxcMkZsPeVmErmZMPe4L
         IorR/FeCtePoedSJMTF91Gw2VWRokh5XfVraMjciR1DE8mLr8RQyfyn2VDUwJ5xH138R
         z5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=uohFf1DkkWNhAVQnV45ZTdTOfbQegv4GUmhl5weagcI=;
        b=bRVbAzJL4C5QcMZuiSsjxMvy0UgizA+2y4OfrK7iN7452gCTOsufvdxtnHutqMqHMz
         NnNrpOC/UeiIQ1RWXKJrQiPHI11VhLqq5WC0Vf8RK/BEzPzIDs1d3ZWckH8vG9MRueB1
         zdozVahXdziI7BbpzvgBuj0KQGn8LpBjk8JRoBYHiSjvXGtJQx7t03mmRPiarZHD9ta6
         WfdRm4xaDHM7pa9wUasw0K4QLYs470o1ODq2KDoqooL1y8g+SP9d1O9RiJ5BNRXlkMEa
         ++nDDL8AUIUMi0TN4UZOxtIY8LQ41lYksQReBHPSVZ81OhwUAG55y4de11jA+P67e8Dt
         Sa1g==
X-Gm-Message-State: AJIora+NQIX2if8HNNjRQ6uWD4rH9ReL1LIIsaToxwoqfsgSP8x0UNHo
	KlKxbfTRLsvuDgdHti8mImc=
X-Google-Smtp-Source: AGRyM1vkR7mdB+a/hQvZeBsACuqRy2I67xkX6/9BlPXPiqWXm8bs4Vgq1lbQsViroKDS7TFuI+NA2Q==
X-Received: by 2002:a05:6402:4316:b0:437:8d2e:cf2d with SMTP id m22-20020a056402431600b004378d2ecf2dmr23384347edc.229.1656742142404;
        Fri, 01 Jul 2022 23:09:02 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2e:6912:39ab:4063:59d3:a7cd? (p200300c78f2e691239ab406359d3a7cd.dip0.t-ipconnect.de. [2003:c7:8f2e:6912:39ab:4063:59d3:a7cd])
        by smtp.gmail.com with ESMTPSA id d18-20020a05640208d200b00435bfcad6d1sm16317737edz.74.2022.07.01.23.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jul 2022 23:09:02 -0700 (PDT)
Message-ID: <9c7673b3-29ec-8a4d-0571-c869bc60b567@gmail.com>
Date: Sat, 2 Jul 2022 08:09:01 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 3/6] Staging: rtl8192e: Remove unnecessary parentheses
Content-Language: en-US
To: Felix Schlepper <f3sch.git@outlook.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 wjsota@gmail.com
References: <cover.1656667089.git.f3sch.git@outlook.com>
 <0e4e340be3f4c7f35a5381b726b1db5fc6842f10.1656667089.git.f3sch.git@outlook.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <0e4e340be3f4c7f35a5381b726b1db5fc6842f10.1656667089.git.f3sch.git@outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/1/22 11:24, Felix Schlepper wrote:
> This addresses an issue raised by checkpatch.pl:
> 
>       $ ./scripts/checkpatch.pl --terse -f drivers/staging/rtl8192e/rtllib_wx.c
>       Unnecessary parentheses around wrqu->encoding
> 
> Signed-off-by: Felix Schlepper <f3sch.git@outlook.com>
> ---
>   drivers/staging/rtl8192e/rtllib_wx.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtllib_wx.c b/drivers/staging/rtl8192e/rtllib_wx.c
> index 121bf939c6a4..db076e819993 100644
> --- a/drivers/staging/rtl8192e/rtllib_wx.c
> +++ b/drivers/staging/rtl8192e/rtllib_wx.c
> @@ -277,7 +277,7 @@ int rtllib_wx_set_encode(struct rtllib_device *ieee,
>   			 struct iw_request_info *info,
>   			 union iwreq_data *wrqu, char *keybuf)
>   {
> -	struct iw_point *erq = &(wrqu->encoding);
> +	struct iw_point *erq = &wrqu->encoding;
>   	struct net_device *dev = ieee->dev;
>   	struct rtllib_security sec = {
>   		.flags = 0
> @@ -449,7 +449,7 @@ int rtllib_wx_get_encode(struct rtllib_device *ieee,
>   			 struct iw_request_info *info,
>   			 union iwreq_data *wrqu, char *keybuf)
>   {
> -	struct iw_point *erq = &(wrqu->encoding);
> +	struct iw_point *erq = &wrqu->encoding;
>   	int len, key;
>   	struct lib80211_crypt_data *crypt;
>   

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
