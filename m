Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448F04A21
	for <linux-staging@lists.linux.dev>; Mon, 11 Aug 2025 07:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754897103; cv=none; b=e0GXrMTMYAb6mIfnSDWNWTFvsjXqN3TomjygcwnSC4lyZvJpJ0VaXNaLVz48odlZiyGGCmNm/eJNE12r4c6DUdqjnb6VPgWgiyvRYvmXo4S+HDsfdgbpekx6E7hJHQVJDQeGZ8XTPQn5XLVB9/X2ZuNS05+wwpODBUh/ggDtEhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754897103; c=relaxed/simple;
	bh=e8CyaEUgWJ4j1JnU5yc37WRJh6h/2cyKWFRw7IVPnNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RFJqjvGg4xjlU7qi6Qjg6NaCe23ue9EAAJHOasG+ptrw0U2fUstjh26bBg2sWXoDauMlpQtlRVTzu3ZLakEaW0AysIOOBXW8I9yJX9dJz2KmPCSMCzJQbKDclVrCN6DvLCpPFJpU47NdOsCZl7dKcIgbxD5+ssMvGhoO96XYDnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I4raRP7S; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I4raRP7S"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-459fdc391c6so13808115e9.3
        for <linux-staging@lists.linux.dev>; Mon, 11 Aug 2025 00:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754897101; x=1755501901; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tzGb9ZqG3d+8wQpeXYT28daUSGt2U8W7JC3C7syv45w=;
        b=I4raRP7SuQ8TZ5epdLOVZNU4pxxgTpUZ0WNrhEaiKhNXDy3Ebu6LQoAXCBIvX/OOnk
         BMAxcCRKWXXTwmKMJpoF7J2RHWfFIJMHC7QAGxakGgXG/9g32tJ/hHHd4GtQcKycnmSd
         U/4cxLafZGdbITVtiRv23yYiuXibw9Amhvr00nNypeieNpPaunA1cpBJTMBDulIIE4rJ
         zLYeGoeQ9c/BPtGS7WNd0K+Ddpe/hndhmGdB7HeZJWPnp2eXnF/ZhNR7qOkpXim6AR89
         2S8FGdN8aAlhpNq8hT4hdJT9F47pMc1upf1imHcUL3K0EnYP3VdWn6I9j6AKqeuX6nfH
         wSTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754897101; x=1755501901;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tzGb9ZqG3d+8wQpeXYT28daUSGt2U8W7JC3C7syv45w=;
        b=jjF6DicZqqzOjK04l9WnzqEFkkoFS5xEBuvurBJ65Wyy0B1TVAJCbJ78Ujjoc1gCPl
         P46BCZElBIPMOC/HNFuwwh62X84k/7h9l1xsPgRmElOqKVrWdThdnn869GEyUKWfEBym
         goACrlvfLY9YNsucM8WOBE9kRfgsqXypyLqGLpwtWyTw2NkpNGgTISDhdLXJiA/tA7ho
         ofA9GLqe73o7tzYUMrkcToR1jvRHIT+03XMZCUigiJjTr4FzZvw91FVdWpRbzvfci/u5
         4JAF/DnGrkgeqVfdPrIuUYZ6uUrJSPUPXX+5EdWa8FkPLA/tAKTkqTixuKJvbhn1LSxM
         A0Kg==
X-Forwarded-Encrypted: i=1; AJvYcCUDmGeMDQK/t8e18odFQ57KwCr6uvZ63+wYCUQeMUI2/gJz92C+zfHv0vH/QMSumYQFXuwHJyGBWwoq2YA1@lists.linux.dev
X-Gm-Message-State: AOJu0YwtKbqlp1hi8NCJiBlGhHkcyf18lW7N/p/1FSBl3YopqQ7JhIV4
	kJG6lRoblmoBu8jk1bQrEL5oAKZ3RNzB7KtVpSBE+UoGzRXgZkjrmOVOQbkf+tZPy5w=
X-Gm-Gg: ASbGncugX7gLWaipY/XIPH8jfCDIGSutrr9UQySgy5YmmqSpB54VzakUwYzrhQM0xSA
	gjSuQz3u0EFHa/43IjWj0q+zTGiHqYHHmGB8DdiLafkHOlTLoUu6wh/FsGf4gPm7KLQQdVI12Eg
	NA6DJVnk7qbUT2BfJCnLtsNboZVW4IZPBHjiIKrMK41XSMvLE5HpPnawnA/dEOT9KYaUKuf0sbo
	OIVYLgO1NrDO9gIcsKEZEOecm8e/FdbmVNvu6qoTMpTeYFybPsCr9Q8a1EaChFLJWFcZXLLnLzb
	SAN7QNxQRHqh76FF7vA/wgxwkDttAQiwGW3uu+pGe0SpqtvvKANv0Omrp70NAzVYAAsN1o6SxLw
	chTFjFFKhugr/iaU7KhnSPb5FfMs=
X-Google-Smtp-Source: AGHT+IFKQOtE0NygsopZPxVqufiOBC50hCPIgtqtyYeSPnhubJA/tyvIr2QT/4Gq+3noUbEjQTVGGA==
X-Received: by 2002:a05:600c:3508:b0:459:df48:3b19 with SMTP id 5b1f17b1804b1-459f4f9b87dmr108086235e9.18.1754897100694;
        Mon, 11 Aug 2025 00:25:00 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-459eec47306sm180036005e9.28.2025.08.11.00.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 00:25:00 -0700 (PDT)
Date: Mon, 11 Aug 2025 10:24:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yao-Wen Chang <changyaowen19980629@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/11] staging: rtl8723bs: Rename camelCase variables to
 snake_case
Message-ID: <aJmaycoFLHELApC0@stanley.mountain>
References: <20250811062132.102525-1-changyaowen19980629@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811062132.102525-1-changyaowen19980629@gmail.com>

On Mon, Aug 11, 2025 at 02:21:24PM +0800, Yao-Wen Chang wrote:
> @@ -804,14 +804,14 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
>  {
>  	int ret = _SUCCESS;
>  	u8 *p;
> -	u8 *pHT_caps_ie = NULL;
> -	u8 *pHT_info_ie = NULL;
> +	u8 *p_HT_caps_ie = NULL;
> +	u8 *p_HT_info_ie = NULL;

The letter "p_" stands for pointer here.  We hate that kind of naming
scheme.

regards,
dan carpenter

