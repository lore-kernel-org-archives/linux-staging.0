Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F188918E20
	for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 21:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752872826; cv=none; b=riKEtnXoqVszAKMGIvvIosS9M2Ms8re/QzR93tiYL7n8v/FaA4f6PdWl+zZi9MoK75PXg5NLVoJDB9XcC4y5DGAx0VdpoCLUxWtcUFT1Nmx6qPRF0z4RlQMH6YloLyMNW4zt6aZUaGOTHfEHRhfJZCUtp1fefcgPfjZIeMCeUpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752872826; c=relaxed/simple;
	bh=5TwKigiH08MXi3g8F9YV0r2S2yH4dRD08h/ffr23QEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rtGkK2ztbRiDi4IlPHUyEkWy8g47mThO/hq9WgFhEHJKTOypOo0pJHsBB6XGnJe1s2jg0P9evwN6DkkzoycdsJ60MfcdOHpJOlVfVP1KUR/4qCz/rPMA0oT/EmyjpQsF3ZpH6FpKGuu0qI12kKsPceT69l7ueWwngR2ANSE/9hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CPjCRPva; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CPjCRPva"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-72c14138668so1039875a34.2
        for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 14:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752872824; x=1753477624; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IDq7oOQ52kdbaZwGEtTLrjH3q1ZZE7Dja6w1bzcer4A=;
        b=CPjCRPvalLCf1uvZLFdlS5bLm/UL1liiN9DVOejdkCcbynV8LujiU+tMmayN5W+v5a
         Vs/WBgyj3+fFojDShnNRjb+u5J1clY5zx8QHSPtctw9PZ37Cv8m2JrNm1o6dJxpLJVvP
         TZUZzTFk9Pj+4iPPmkXjDSXYGCer7KSDhx/d31E9Py54KnBtldBVZx7t7331cizBdoUX
         eIJXlBjwS8teYpDKMRbRJ6WMRgPQX11FDvNMQei6311ccDQckEiJ48OMog1DbnYjePbU
         q6K1GF3a+qxlPbMEDiaph5scIRUHJPfcD0YeUqyREvSLAZEXquzKxWJIg9UMKM4HNE0G
         P3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752872824; x=1753477624;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IDq7oOQ52kdbaZwGEtTLrjH3q1ZZE7Dja6w1bzcer4A=;
        b=WnDORL9qULbFZeJqYvqDfJV7Q3GKhSuSHCxVPHTUm4Ogks6pw+qsuU6gLooPY+anyA
         FD1A7/UONDs4Tuwd2uPtaXyUATwOOTurZwCGDMN2ahfeGO/yOuxktnTASS/Ipsvtpfgx
         jaBxvU/5Bir9tAR11aUUhipLlZCwBU+lZn36/08lo/KpBGwXzfh7FYHN5I9KQiUsN4cx
         hVFNp+lp38jvKbiQDhL4ze3Tfo1xe8ccfBIuHQQYBmRAXkCPAOI0X4LhBlVNRVzsSVNI
         JpYZAEcdvxxeq9pHE2WLegBiuvlyo6MJMI5aE7x6HiZdPwAHwkHzEuWj4Ujjyzplr35L
         YXCg==
X-Forwarded-Encrypted: i=1; AJvYcCWiyGfRKbOrSyqWtwQLyp1yNIiJ0Lby70Nib7CeKgGoimLkJKQ1T3py3n8NXXcuYdfkcCUJCiBH8R53p+Yh@lists.linux.dev
X-Gm-Message-State: AOJu0Yzx1Jnupmmu0KENgQ8qLnCLQZyPhOjPyqhGC/bTASuEdWZs7MrR
	O6J5h9ePZlTWuTx0G/SDWaTVz6bGsvo3vXrDJotNPhoCK3LGfWA9t6JK8x+6qFL3UaIX188tPev
	omCrF
X-Gm-Gg: ASbGnctXAxZ5+ajh3CYP/3sd3Iv3p4QzMwIPx36luwS8NhcC8mDBUzjTJdrSI3Y5nZo
	z1R0EyhbqTr+mWLs2WzwXCIqD8KK+4nZfg8FU5TuxtUtsY8enB5cHRmAmRxJ/DaqF76cGOhs467
	h7635d9Gi4zw0Klkm4STRmQAv2w4vCMOxMqvXht8cXcDUFVfBNmu2RPg0/cqPhwhUu+wGxeVMlf
	HiT+ulCY8sSsjE0Fcwy+P+GELbK9S8eCOtyMFvMLeUDvtGgFLCIqDwrzT6nMt9AxF+I5qitzg1F
	FnlHHO1nNhBvN4nkJzTcoLZ4PPra+1JCrUucG8D/0Wapzl4jeSFhz2aUCGK75/rzMNrM5D4oNM0
	huq3TCMMA8kXuUsrF5jIiLd3q6zLLlA==
X-Google-Smtp-Source: AGHT+IEj/fNcFQQTUD8tJFDiwFrmLtonsc1w1R/cHms01UPIzSBjuIHwW08BPvsQyp9RY0wnRv1veQ==
X-Received: by 2002:a05:6808:2e45:b0:41e:a422:390 with SMTP id 5614622812f47-41f99941b7amr2869684b6e.38.1752872823962;
        Fri, 18 Jul 2025 14:07:03 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:e5d3:a824:1a57:fcaf])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-41fd10c22a3sm698017b6e.8.2025.07.18.14.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 14:07:03 -0700 (PDT)
Date: Sat, 19 Jul 2025 00:07:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ignacio =?iso-8859-1?Q?Pe=F1a?= <ignacio.pena87@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: sm750fb: make fixId array static const char
 * const
Message-ID: <01f7bfc2-284a-479b-b73e-40907dfba387@suswa.mountain>
References: <aHqvUrXtxwf_k9sI@MacBook-Pro-de-Ignacio.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aHqvUrXtxwf_k9sI@MacBook-Pro-de-Ignacio.local>

On Fri, Jul 18, 2025 at 04:32:18PM -0400, Ignacio Peña wrote:
> Fix checkpatch warning for the fixId array only:
> "WARNING: static const char * array should probably be
>  static const char * const"
> 
> The g_fbmode array cannot be made const as it is modified at runtime
> in lynxfb_setup() and lynx_alloc().
> 
> Signed-off-by: Ignacio Peña <ignacio.pena87@gmail.com>
> ---
> v2: Only change fixId array. The g_fbmode array is modified at
>     runtime (lines 786, 788, 949, 953) and cannot be const.

There you go.  That works.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

