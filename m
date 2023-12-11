Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440031F612
	for <linux-staging@lists.linux.dev>; Mon, 11 Dec 2023 08:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u3HsURcw"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-54c70c70952so5875718a12.3
        for <linux-staging@lists.linux.dev>; Mon, 11 Dec 2023 00:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702283834; x=1702888634; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kk+v7bJA+s+/z+dyrix6s2ZzCkywqqH7xeqGtoowJ4M=;
        b=u3HsURcwsHTdmhE7s2p24wUJSpu9MlnOjjmjqK9YXVg6oVnMY9J/IN2I+DiNz0RLdz
         GxXCT8gSZnXRGjbcM2Q8SwChL147Oqzbr1zNCBusRp4+AjIzubUmSvS5DdAIvsXbVCuE
         3JzCdADFwWRN6WclQj24ut5LlVjwig/kQYhmazX8f2c/Wu+JeDLmrpTQRDLeBUw8eRgc
         WqQz+0vjIWYDFrGnBzb3ePYIQaa+rxbey2cslmGg2hUgfFg7s5LxljY5BpB48vRBp9NI
         F4Q/SS2tfnsdnkKsaoT0zvrfoE8hO9isEKTCXyfBn0Kf7YCNsKYLqpZNv4F0Qg5HLn7W
         YgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702283834; x=1702888634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kk+v7bJA+s+/z+dyrix6s2ZzCkywqqH7xeqGtoowJ4M=;
        b=SaYq+tMiCXvU2phwfwuWWdu2SoO0k+I8ceQmjx43cIotZdYq/bHa5AwMjkiQIZPPfM
         dfOJg90o7oDiE/YwikDnpiiEz/dM7842x60w83B1FBWd6JJyxHze0l6cwRwdWAaO0Jij
         aCENZ7DU+q0ZJReLJemeTAh2rQUtMIpX3EyQq3Cvo09TLrEzTOtT/aPeRtBpwqntsc6Y
         jvcuwkBKoUs00HtDGmr7KfiBrCBDcNseJ16GO3GuSMlTMsbjtWenHOErdJiK3fJg1uLo
         +9FJWvSewY9DYN9sxsug34aeM6A86C7TlZbmEgC0j7BN7nferNdJedMEjPXxXkmYF+S3
         bHOw==
X-Gm-Message-State: AOJu0YwoEtolOtdpJULkO2/c96YcrFPXfr1QVD8TN0sDIRr0T8fMnJgr
	2mjpC7cBdAti51NEdb17n2z5Lltj4mvZCv5ujOM=
X-Google-Smtp-Source: AGHT+IEG5JSQm2KSmEMgLYIgzL0giz5RVNFyFtSLxep3//eMRo4F2TpSWWxGmz03vJPdf0dsfXEe5Q==
X-Received: by 2002:a17:907:94d4:b0:a1a:8399:e12d with SMTP id dn20-20020a17090794d400b00a1a8399e12dmr1373966ejc.64.1702283834471;
        Mon, 11 Dec 2023 00:37:14 -0800 (PST)
Received: from localhost (hf89.n1.ips.mtn.co.ug. [41.210.143.137])
        by smtp.gmail.com with ESMTPSA id tx17-20020a1709078e9100b00a1b75e0e061sm4496930ejc.130.2023.12.11.00.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 00:37:13 -0800 (PST)
Date: Mon, 11 Dec 2023 11:37:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tree Davies <tdavies@darkphysics.net>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com, anjan@momi.ca,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] Staging: rtl8192e: Remove variable bFirstSeg
Message-ID: <2cdb678d-b784-411e-8913-eb7666e08ccc@suswa.mountain>
References: <20231210193705.2131807-1-tdavies@darkphysics.net>
 <20231210193705.2131807-2-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231210193705.2131807-2-tdavies@darkphysics.net>

On Sun, Dec 10, 2023 at 11:37:02AM -0800, Tree Davies wrote:
> Remove variable bFirstSeg as it is defined but never used.
> 
> Signed-off-by: Tree Davies <tdavies@darkphysics.net>
> ---
>  drivers/staging/rtl8192e/rtllib.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
> index 0a8c44e497f5..c0a24826cd3b 100644
> --- a/drivers/staging/rtl8192e/rtllib.h
> +++ b/drivers/staging/rtl8192e/rtllib.h
> @@ -103,7 +103,6 @@ struct cb_desc {
>  	/* Tx Desc Related flags (8-9) */
>  	u8 bLastIniPkt:1;
>  	u8 bCmdOrInit:1;
> -	u8 bFirstSeg:1;
>  	u8 bLastSeg:1;
>  	u8 bEncrypt:1;
>  	u8 tx_dis_rate_fallback:1;

I don't think you can remove these.  They're part of the protocol for
talking to the firmware.

regards,
dan carpenter

