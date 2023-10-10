Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4A07F0
	for <linux-staging@lists.linux.dev>; Tue, 10 Oct 2023 02:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="TQ4GdvRj"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-79faf4210b2so198717439f.2
        for <linux-staging@lists.linux.dev>; Mon, 09 Oct 2023 19:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1696903275; x=1697508075; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n8W5jicDuFfCto5Rz0a13pdOEWWZtFkes7WHBt5JLjo=;
        b=TQ4GdvRjfKqSk9fxAyQuX+U/plpUSvAONUp+F65fLP/Ll43P2SoZ5gUbbbirc4exdu
         Ck2JN7x9ELIyDuJv1lWEnO+aeKCricGV7mQRHdzRs+UHV9eCD2L2etbcQw066RnKdAcI
         pxyW6QbUSO8KAhn1P1mIJEUum+Fq0FHjxr4hQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696903275; x=1697508075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n8W5jicDuFfCto5Rz0a13pdOEWWZtFkes7WHBt5JLjo=;
        b=SqTJ5VmlpXxKKRq6Jx8qRMEJFqtDt57sR9UzLLxTRfpc9qEsE1CcV3KUonJA51YRxO
         lsk+c6yWlycdBdqJ2qNMa7f/K0Aj59WsoSLJ1VDV5dmG/Bs31qbERn1NXkbiuc5l3V6C
         7Q5Sova0XRVBdaAyZJPD8/Q5WKmdzL6zNiZbd90nDPv2SWvXYiMh4wOpgIa/0oXyfh2L
         sOWIiRIIizVyqW9O8pXxmeLySzfsUwmznnwoNPwIDjWXlN/4BtbnQ54hkt2WJuxE24Ev
         EsEfCNZ9A2if+6SCjh1l+AF+19lmIoanznYcP6gmO/TkBLV1csUPZJYUGUu/9gOgaJsb
         9Fqw==
X-Gm-Message-State: AOJu0YxN9slxdNSe2FTfAbkW99XrRDhDR8RiWm50RYRGE5TCR52JpytF
	/eLQAvw0+IwT6//ZptksKcyRXw==
X-Google-Smtp-Source: AGHT+IFxEbsxiAkqgad1NR+N5qEc+xJnzBRXuoUOorumGMCjl3dh8xe9qk/x6WqhsQZNVSqcE/TbYw==
X-Received: by 2002:a05:6e02:1d1a:b0:351:b22:af5c with SMTP id i26-20020a056e021d1a00b003510b22af5cmr19923893ila.32.1696903275665;
        Mon, 09 Oct 2023 19:01:15 -0700 (PDT)
Received: from [10.211.55.3] (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id l17-20020a922811000000b003513b7613f3sm3247512ilf.3.2023.10.09.19.01.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 19:01:15 -0700 (PDT)
Message-ID: <42a24a62-8dba-452c-b460-61ee06171d74@ieee.org>
Date: Mon, 9 Oct 2023 21:01:13 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] staging: greybus: Add __counted_by for struct
 apr_rx_buf and use struct_size()
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <ZSR2O6zGyT/VX6ve@work>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <ZSR2O6zGyT/VX6ve@work>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/23 4:52 PM, Gustavo A. R. Silva wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
> array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> While there, use struct_size() helper, instead of the open-coded
> version, to calculate the size for the allocation of the whole
> flexible structure, including of course, the flexible-array member.
> 
> This code was found with the help of Coccinelle, and audited and
> fixed manually.

Looks good to me, and I like the use of struct_size().

Reviewed-by: Alex Elder <elder@linaro.org>

> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>   drivers/staging/greybus/raw.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
> index a00978c8e1d2..b9c6eff7cdc1 100644
> --- a/drivers/staging/greybus/raw.c
> +++ b/drivers/staging/greybus/raw.c
> @@ -29,7 +29,7 @@ struct gb_raw {
>   struct raw_data {
>   	struct list_head entry;
>   	u32 len;
> -	u8 data[];
> +	u8 data[] __counted_by(len);
>   };
>   
>   static const struct class raw_class = {
> @@ -73,7 +73,7 @@ static int receive_data(struct gb_raw *raw, u32 len, u8 *data)
>   		goto exit;
>   	}
>   
> -	raw_data = kmalloc(sizeof(*raw_data) + len, GFP_KERNEL);
> +	raw_data = kmalloc(struct_size(raw_data, data, len), GFP_KERNEL);
>   	if (!raw_data) {
>   		retval = -ENOMEM;
>   		goto exit;

