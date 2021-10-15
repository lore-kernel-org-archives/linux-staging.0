Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1DF2C82
	for <linux-staging@lists.linux.dev>; Fri, 15 Oct 2021 07:55:24 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id k7so24791242wrd.13
        for <linux-staging@lists.linux.dev>; Fri, 15 Oct 2021 00:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Az2xgl/hqgMdBeapdM+S02nJjvIpkUB+Xfp9egegKmk=;
        b=TuBAsa+PAiwlc3R6RMz71TDggPdL0gRU5iOxKDpcj9fsaFxF2sRxBrAu2tYSkRCWvE
         5thcX96h3Clsr9aGJMh6aIappjnXdXiCY/Cq4SF2cXuAHnzryElDFUfkJTTGtNbPWfyM
         ANYPILq8tFctt3YyII9vgcPzUeLbag+Bsu40crrmha/MIODxphP2L78VlsE57UOUNkEU
         mcMl1truMLyyrf2fTXSN2uQ1Ny9r70sUaACikT5WvHyCHiyv3LT3J+p57Pdu7YLuDKMI
         9kgMeANUW0MkC9szJdDJSfsEvGlQ96Au95kb82A7/WkrIkLpMywsMCtnap3nskRK4rat
         QwhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Az2xgl/hqgMdBeapdM+S02nJjvIpkUB+Xfp9egegKmk=;
        b=i/eyzb6sKEvpxM915NfyDGyrAhQPU1i3LOUZP49DGYyeChbNj65ZL8JBRMzt0wDSob
         uqqOYUpZ2thIlrrkCBRcy5coSdrw0JwRG2PfLJvnX5aAdvK7T4gT7BhJo84WzB6e9FL3
         bIDUzKJFNknExWmwJPzoY4a+uopvVCb7n5TSZU8yDmzqrpBlLqJpBNcnx59dss6IjRWP
         /UuXb8STTd8WQzbyJThv2bSs0VVnwxoBToie9t7pdn8Q0yVVV+BByPMc2RXtyO3CLvog
         SlIQaopBfcOt8N2hv4Qp5ixEljRvBt9jZ+hIRUTL0UHA6+eSYnI+s4TfBZdXkhJ6io9L
         8iSg==
X-Gm-Message-State: AOAM530dpTHAODW1ZwZ4DddfhIiM9EcFgbgGVY0xNczIYUrHBgqFEw+x
	+iNZGjqnAcZP2ZPj00KABOY=
X-Google-Smtp-Source: ABdhPJxv7R034R/SUDdZKI6hxGD+U1s9d3IXvIGVHhT9qiWfdnY/JRWE1BwLNYF5dZaGUqkL8lSYuA==
X-Received: by 2002:adf:a48f:: with SMTP id g15mr12003376wrb.259.1634284522895;
        Fri, 15 Oct 2021 00:55:22 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::40c9? ([2a02:8108:96c0:3b88::40c9])
        by smtp.gmail.com with ESMTPSA id p12sm849530wrr.67.2021.10.15.00.55.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Oct 2021 00:55:22 -0700 (PDT)
Message-ID: <6c637ef5-79dd-5503-d445-e7a768f528a6@gmail.com>
Date: Fri, 15 Oct 2021 09:55:21 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH] staging: r8188eu: remove MSG_88E calls from
 hal/usb_halinit.c
Content-Language: en-US
To: Phillip Potter <phil@philpotter.co.uk>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, martin@kaiser.cx,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20211015000233.842-1-phil@philpotter.co.uk>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20211015000233.842-1-phil@philpotter.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/21 02:02, Phillip Potter wrote:
> Remove both MSG_88E calls from hal/usb_halinit.c, as these calls serve
> no purpose other than to print the name of the function they are in
> (_ReadAdapterInfo8188EU) on entry and on exit, with a timing of the
> function, which is better accomplished by other means. Also remove
> the jiffies assignment at the start of the function, as it is no
> longer used.
> 
> Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> ---
>   drivers/staging/r8188eu/hal/usb_halinit.c | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
> index f6db5b05e6e7..abbd107ad3c1 100644
> --- a/drivers/staging/r8188eu/hal/usb_halinit.c
> +++ b/drivers/staging/r8188eu/hal/usb_halinit.c
> @@ -1073,15 +1073,9 @@ static void _ReadRFType(struct adapter *Adapter)
>   
>   static int _ReadAdapterInfo8188EU(struct adapter *Adapter)
>   {
> -	u32 start = jiffies;
> -
> -	MSG_88E("====> %s\n", __func__);
> -
>   	_ReadRFType(Adapter);/* rf_chip -> _InitRFType() */
>   	_ReadPROMContent(Adapter);
>   
> -	MSG_88E("<==== %s in %d ms\n", __func__, rtw_get_passing_time_ms(start));
> -
>   	return _SUCCESS;
>   }
>   
> 

Looks good to me.

Acked-by: Michael Straube <straube.linux@gmail.com>

Thanks,
Michael
