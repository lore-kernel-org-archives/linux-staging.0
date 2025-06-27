Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A698C293B4F
	for <linux-staging@lists.linux.dev>; Fri, 27 Jun 2025 17:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751045723; cv=none; b=DJ9tMJjeXvPOUXmf39z+3IcqMBognMxiQTpWbpF2HuTBVdt1OP+XYiFWukICDkiRWjL9xGQpJyx8EGhG9fmuSVKZsvlCslA2yc/n51slI0/kSLc6ZNTU11ycC4qAOgyomSYLrYkSVUFKPHTlMH2yIyFM9p+/fmLakwp87ZeLgw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751045723; c=relaxed/simple;
	bh=OOACCwPSww+nakVoXLJXnwuALHZbONvPwuZkfSXf220=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SddYRyIea68T7QeSmp7EzqdzUrLR//zOpHaz62hwUssgMGFnTHSmQmQ3Ai+Wr980nMDYFGu+QIgcpqVSo8o/ta2K5HsgVmUDiAp/uZTQ73bNwWyVQCEe5GxMwmldb74pMFgP8PkcII3OQUE98ovqnsksTIs+z+30zKTu0mizXAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aa7FkBvj; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aa7FkBvj"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-40b32b6af9eso768023b6e.1
        for <linux-staging@lists.linux.dev>; Fri, 27 Jun 2025 10:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751045720; x=1751650520; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9kg2kWtBf4IBcW3c+iSCFB6Ml1Oao6RTyx5C3qf0IPM=;
        b=aa7FkBvjIkT+5JP3KRYWEQjToePYTjlw786Dx4ZWzh0c5aFrz5PKp/OigAABLaUs0J
         5wobPA+quoKsQFx6gi6sO5MDhFKyDc3SkLhTVwFBLIybDsD071P5En5UuN0n16ZRjZpK
         q3Ma07rH5gwq76qciTIAHHba7H2YHgybZUrfX0tU1HJAptVNbquSLEVLPvpjZcznQvDT
         P7m2SNsb9pD0tV4+TVHPMFwSRAOyhgxIl5/6vy046XlFl/S/Hc9M+iqm61qBrIVhnv6r
         IPKicLNfo5UPOZsFZFBjKEUmslY14o4fj0T9oQ3Wbt+A1Ug3b2Ke/yVDvwX4Pl8IbAsB
         smHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751045720; x=1751650520;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9kg2kWtBf4IBcW3c+iSCFB6Ml1Oao6RTyx5C3qf0IPM=;
        b=CAG8IgbqBCk8BE0lVGTpNxeBFlJMm5fewb2TCh8PTOM3BR3WU50b5k/+EsF4jF8uaX
         UW0xmihq5rwPmM70N5cWPEfSoio/N5tii1zJ4yU8pSpPeGKj/SR3uW1afgwqOJlFmVMj
         Zv82yYU7Mch+RkcWp/e+xa148hRatvTFoAzl8stt8WAIWW5oP0sfkwHrM7HZIkNI43+z
         Mq8TDYMYEjrr+apPgWaz0LTJhlF3v3tY9Rx0gR4L1PyAjVplFK/POOoUjcPwFTkgyJ7+
         zep2iBKolGq00gVBkNi40vvVsEPh8AKAY+3CeKWNOOL4/jKm0JWN07d/+yft51F8EmgP
         Q0wQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4PVwckS38SWko21z49niOdUqDwmRhOVz5Q5jlQHo9MAiO6St7ieHiaImby2gnp/eSsX62Ks5oCZgePKDP@lists.linux.dev
X-Gm-Message-State: AOJu0YzytNqDYsuhMZtsAGZQGvmS1CAYwaabU0kE5KzuWTgVSLieDCDj
	3LF3gqHrQXLGDI8D8WOD1Wf/R3RBTyZ4vp3m3+8SCmF9+9NkonhByOQSsv1obdw8TEE=
X-Gm-Gg: ASbGncvpS6x8k/onpP3C9N1acFqjTCdMGRdHOD3MGR5WF/qzSwtcBTpOekNFhVKtmUz
	rj+gRAeosj5pKr0MXOp1NFBzg5YqoysB12ZAIoKNXV1CRM94wAYjob6Sahm+u3wTbTkdP5Z+Dp+
	M/9CXsApyc9153VL4snsYCRip3wsMJ3112V1XwGINHOmBnmZ4APn28YgF60mHz5MzQmIq5ABcbt
	JjcVupmZugVaT2y9sGjwrzUxDZeOfgN5gF4vsc+4XrLbr6ZiHHBT4y1sLflUqNBNOeYDHnerjHc
	7i65lYOKKysGnS0gi4nV6CRHnEPFk/6VC9O1wLpPfddciqsFD0AMfEBtJ1ANJ/anW9yAGg==
X-Google-Smtp-Source: AGHT+IFf5eWy1kO/K6jVYD16XsJwEx0QOq1FyauR/umecLHRc0ZN+z3ZkHsKlonhP8bD8EpUmoiswg==
X-Received: by 2002:a05:6808:2f11:b0:403:56f4:8780 with SMTP id 5614622812f47-40b33d7a583mr3749189b6e.9.1751045719766;
        Fri, 27 Jun 2025 10:35:19 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:f3a4:7b11:3bf4:5d7b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b3240548csm429800b6e.28.2025.06.27.10.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 10:35:19 -0700 (PDT)
Date: Fri, 27 Jun 2025 20:35:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Manish Kumar <manish1588@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: make g_fbmode[] a read-only pointer
 array
Message-ID: <c8f5f917-8412-408d-9dd9-6635af8825a7@suswa.mountain>
References: <20250627173120.7639-1-manish1588@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627173120.7639-1-manish1588@gmail.com>

On Fri, Jun 27, 2025 at 11:01:20PM +0530, Manish Kumar wrote:
> This fixes a checkpatch warning by changing the declaration of g_fbmode[]
> from 'static const char *' to 'static const char * const', making both the
> string contents and the array elements read-only.
> 
> Signed-off-by: Manish Kumar <manish1588@gmail.com>

This breaks the build.  Now we can't change the pointer to anythine else
except NULL.

regards,
dan carpenter

