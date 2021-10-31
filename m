Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD2168
	for <linux-staging@lists.linux.dev>; Sun, 31 Oct 2021 18:44:01 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id d23so24555401ljj.10
        for <linux-staging@lists.linux.dev>; Sun, 31 Oct 2021 11:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8aTAAkMuUs0RdOXiLwf4tJufUX7GuELy7Kv75supmqg=;
        b=NzO9RbuDXUygHVtFmWZvfzoqrqwUuA4ZL4Nhh6EAP9yK8mx8dDS+mC2iRIe1w/Rld8
         cdOw6sMP7+w7Fl5SHcprEiPsPEc7JadQT+mpuAS0FoFJvyJSCfyymR/UpIBJs43AS4Q0
         bH3iombTNg++WzPjXmJVBVaVAqDbHya2Kdy0eLG/H8f+shW4mHfBBnkzkuDtEZBVhFQU
         cYP/WOZIeTAphqymIpXycWHcTqmaYJ3APT7q44dv9gm+mTcVEFixIej95bZ1Yuv8NkG/
         U73UgmH1yMq2TRUV4tTApyuhhsa+SCf8cEPCbrHi8v9DcOg3143q+frsRv1ddznSoJS+
         s1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8aTAAkMuUs0RdOXiLwf4tJufUX7GuELy7Kv75supmqg=;
        b=gLn9w5cs3/UaU6mfmJvl88yGK1x5mZUM4xdUebGcZMLDJ94cDoun7trhGKx1aTmBj0
         kuagEMT6UHELpQnINkdPeYTSFeTmMgHjxi1bNZK/JDEiCgcOrrLGoWk3dm8p0Zb1rd58
         Q4t1kgW6pjXlyGwjE43Z8ofoPDFmYm4QaULMptyXpeuc4J7garkJteQrk1iNZunCr2It
         UrrwSvVVkoAv2reeu5F0HY6+623JuVSYWZomLUSy/xieoq7KVWF5KlwzGCuRkUhp1L0h
         flEnMF2nXvBvOJMEdt2XGpunFX9TReHqVr8Jbpax40Pz4cUqVh+6BM/gdzqF00zz9sGZ
         6rwg==
X-Gm-Message-State: AOAM5337aBn4+X9cOLxuL2jQV2+X7geVz4i60APlER0Zbka11oDL9pvO
	JxOscCT1OsMmjj/IYZMHj7Q=
X-Google-Smtp-Source: ABdhPJxb7BEnnQRjcvQ1pw4Ug6ET4I1VThcTZvtnIpt3EgCITH57Nuk9wbPJh8Iqghw9kwW6zFJcPw==
X-Received: by 2002:a05:651c:10a:: with SMTP id a10mr12059502ljb.335.1635705839276;
        Sun, 31 Oct 2021 11:43:59 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.235.8])
        by smtp.gmail.com with ESMTPSA id z12sm1213298lfs.101.2021.10.31.11.43.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Oct 2021 11:43:58 -0700 (PDT)
Message-ID: <f26b4aec-c0a1-8c93-b34e-8b1a36ac81b3@gmail.com>
Date: Sun, 31 Oct 2021 21:43:57 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] staging: r8188eu: os_dep: remove the goto statement
Content-Language: en-US
To: Saurav Girepunje <saurav.girepunje@gmail.com>, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, gregkh@linuxfoundation.org, straube.linux@gmail.com,
 martin@kaiser.cx, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
References: <YX7cCtVss2RWOJ/a@Sauravs-MacBook-Air.local>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <YX7cCtVss2RWOJ/a@Sauravs-MacBook-Air.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/21 21:10, Saurav Girepunje wrote:
> Remove the goto statement from rtw_init_drv_sw(). In this function goto
> can be replace by return statement. As on goto label exit, function
> only return it is not performing any cleanup. Avoiding goto will
> improve the function readability.
> 
> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> ---
>   drivers/staging/r8188eu/os_dep/os_intfs.c | 39 +++++++----------------
>   1 file changed, 12 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
> index 1418c9c4916c..4b409479108e 100644
> --- a/drivers/staging/r8188eu/os_dep/os_intfs.c
> +++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
> @@ -480,48 +480,34 @@ u8 rtw_init_drv_sw(struct adapter *padapter)
>   {
>   	u8	ret8 = _SUCCESS;
> 


Btw, this variable can be removed completely then. It's used only for:

ret8 = rtw_init_default_value(padapter);

with your patch applied, but rtw_init_default_value() always returns 
_SUCCESS.


> -exit:
>  	return ret8;
>  }


And just `return _SUCCESS;` here.



With regards,
Pavel Skripkin
