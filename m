Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87EC4CB45
	for <linux-staging@lists.linux.dev>; Tue, 19 Mar 2024 06:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710829051; cv=none; b=kMooleEIv7tWnOG8Eobg73aykPQ39bPB2FHNNvPLxdmOdz4yd+z9xmLk6nYWmKqF9ozxC7zFQ8ChmWQagolrDH7By6IfWbIgOeAF80SC6dzrLkdxw0Pp4+jglpTNI0gRpcDsb4tiMxCbohBJC/YZrXO5KMB0SULfQJwsrpSMZF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710829051; c=relaxed/simple;
	bh=QQLxq5dEZDeApbmB/Lkx6MXuL7gadJz/3NlJEViXU8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H5ok/HDyf4KtPUffn+tUbd4U3MVVrHWa5sYzn4baeMLNce/WOPGI5z8xTIEyVhtP1N3mlQ1m5sYcx8iRk1HU4uscl+n6RRJOtg1RHs3Cyr++rU23KJHkZ74VqOaoLcVkBfTukEf83zySTCZlqm8QSFpWscWyMTn+V5p754cq2EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UubZbHp7; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UubZbHp7"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-41465082887so1719825e9.2
        for <linux-staging@lists.linux.dev>; Mon, 18 Mar 2024 23:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710829048; x=1711433848; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7NxyLAPBD0uYaEFsJsCLCqoFa7u1wfvFPNUDw78rj08=;
        b=UubZbHp7kGW47u87N/xE4zMZR/hg2iyzgLOlj04i9UWgoW4kJmA5PM05hLnGttLcx8
         SLFL1JCe0CF44yvFCEydfj4nsS7FJUv8gR1gYIciWgWoWFxDjjc3MAVAe5sWKhwEkHBL
         /I6rCRXy4aO+xkARWmRYdbpBGSKkqj4Stt75efcOrZh24jbqJHKokoccV29bWM7QPBJn
         VKgvtNbRpLJYtS67jfAQ8Dx2ioK9RCv96vcEIz6t/RY1J5Wc4B9KOKOoFkYKO1CmzvJf
         Rgn+QXCS5xZb6sqJOI109asr4wFi7a4mYvTU8lV8Ak/XPh6O9U/oADr+GCgOrEL/ZXBx
         sRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710829048; x=1711433848;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NxyLAPBD0uYaEFsJsCLCqoFa7u1wfvFPNUDw78rj08=;
        b=MfA0zd07WOmbRUzrnliqD/gfg55Gl/+PelEg9rYtcbTmKfADD1pgBtG1DY6jBGHNtI
         3SykiPEcM7nf5Fdy5eo56yOAwypW1Tu/61x668FfzhObF7878srO6/GVFL/UhauhKSRU
         N+N58p9ytAskfRJ0Gl3c5EBtHXxchTyRfV34U444Wooq+tJQFozBL5tDCKY19whmi97X
         SaQSRld5a0BwfJskWJlow50aKGNt9i9dRjSEOUjMRznO8LnWUPKjTCwH2bbhAsmntx3Y
         ml6Tf2SWuQHE2c1R1eHIiq+PjY0g+i5UbKUSuqt1GIlKCBiAS1effedY+jjoiwbiUG5P
         3LaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlpOU54JhGtKWwoKGTL8ueXhZLwpLg1qJIchoORncj7whgT01aIGsSSarHjwbNZsW+6+PIqrxm5uL94qRb2l8HlBVUcTi238UbhZcC4A==
X-Gm-Message-State: AOJu0YxJOngEPC1LHZtgIpjnBw34H85x4GzpA6cPK7N8eX47kFaCP00x
	icnt//3o77yjw6CZiTD+TuTCccV3ajzx77Mh8i4Li8PuQnNRfqDzC+bcpBBlEew=
X-Google-Smtp-Source: AGHT+IHxChfQOs9Mp8LF/ggHgGIqPNQKjvXFOMYn+smQajFfFmtbcaa0DsoWP2SsJGfEiulLyAko/w==
X-Received: by 2002:adf:f606:0:b0:33e:cfff:a05d with SMTP id t6-20020adff606000000b0033ecfffa05dmr1111932wrp.59.1710829047915;
        Mon, 18 Mar 2024 23:17:27 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id n8-20020a5d6608000000b0033e45930f35sm11520855wru.6.2024.03.18.23.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 23:17:27 -0700 (PDT)
Date: Tue, 19 Mar 2024 09:17:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ayush Tiwari <ayushtiw0110@gmail.com>
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Subject: Re: [PATCH v6] staging: greybus: Constify gb_audio_module_type
Message-ID: <9ef61ce3-6f14-4292-9364-903bc52c250d@moroto.mountain>
References: <ZfiQsZBrHfImIJfc@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZfiQsZBrHfImIJfc@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>

On Tue, Mar 19, 2024 at 12:36:25AM +0530, Ayush Tiwari wrote:
> Constify static struct kobj_type gb_audio_module_type to prevent
> modification of data shared across many instances and to address the
> checkpatch warning that "gb_audio_module_type" should be const. The
> "gb_audio_module_type" struct is only used in one place:
> err = kobject_init_and_add(&m->kobj, &gb_audio_module_type, NULL, ...
> so checkpatch is correct that it can be made const.
> 
> Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

