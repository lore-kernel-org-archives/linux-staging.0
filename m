Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FD023C5
	for <linux-staging@lists.linux.dev>; Mon, 23 Oct 2023 14:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ftWvu/FH"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40806e40fccso24835865e9.2
        for <linux-staging@lists.linux.dev>; Mon, 23 Oct 2023 07:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698071918; x=1698676718; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNn1aaJeu1yyg5wO46KFtgTpMoh9VTl9ulxPnt4sQ9c=;
        b=ftWvu/FHNESxInq7Kmf+ILG2w8lUk6O8bFImQUNpR3bBc4kmnf+hWiXxhsDI99tsyp
         3hpcZGUb0CN4IRQIhDO2OABpXzfkkCvk4Ter0nIX3cOlpB+esFtCJNMFIv1p4hZGaVjQ
         YsiMl4IxsW6d1UF9cZfCXFSq/OjKfQsx8PZxMOnrv9cPZVQn9YFwNfv1o801BbuWpgC+
         zbf9zpPl0TfBtXG6yey0S0mgLYIW5xw8DtzJEK1g0KjrmGagde38lZsHT32tiGMQOI3B
         C1cWTAqqMhLOFx2EYhqtsWrzlwp6mRGeAZvIvr6h80eCKqsOVNVr0jSZNa/bd3Au5tJ+
         URCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698071918; x=1698676718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNn1aaJeu1yyg5wO46KFtgTpMoh9VTl9ulxPnt4sQ9c=;
        b=c33RwygeLnqfIqbT2L/+TvdztkJKez38c9UUrh7ncDMwiAwhSJR9LdcWeC1v3MXGyS
         hEXNb2zPey203LfiflojDqQE8fMTre3FmBZp3rBj/nz/IM/+hvlvUmh8qQ1XMq0i63Os
         /SjQz667z/Sw+T0S4CgLWjyDRzsD/SISjT5COCQSHQ2ldydmCtWoJDeEN+V0/6hJJUKf
         emH/RI2nUMXL+X+b6VzIUCudbTpfxUTfIQlycKs1A/6RqRlZvnQ5gsfVMjYTpPzGbMgT
         EU4V7WYiFOQy3V4uN/ckeTs24rvlPYPjRr6COdb3xp+qVWbdnlyMLGiTOlSZivQgl/hX
         Ow7A==
X-Gm-Message-State: AOJu0YyQliAko/JbpUnPGno1HikCWmkmSm+4TBb/ZOES89hht/CGvK81
	UHhMF8srl4iK8nPq9ZfNJWMjug==
X-Google-Smtp-Source: AGHT+IHgNA5GjnmfwcE23ZTiMz6DgKpkB0flr2r5pzEKcf+VOXnYdbZdl7B4dn0ZsPakyM77WN9j2A==
X-Received: by 2002:a05:600c:1c9a:b0:408:492a:8f3 with SMTP id k26-20020a05600c1c9a00b00408492a08f3mr7321814wms.5.1698071918367;
        Mon, 23 Oct 2023 07:38:38 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q12-20020a05600c2e4c00b0040648217f4fsm14272293wmf.39.2023.10.23.07.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 07:38:38 -0700 (PDT)
Date: Mon, 23 Oct 2023 17:38:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jonathan Bergh <bergh.jonathan@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: octeon: Fix warnings due to introduction of
 new typedefs
Message-ID: <2c27380b-03c2-40e2-928a-21f28376b8bc@kadam.mountain>
References: <20231021000340.56889-1-bergh.jonathan@gmail.com>
 <20231021000340.56889-2-bergh.jonathan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231021000340.56889-2-bergh.jonathan@gmail.com>

On Sat, Oct 21, 2023 at 02:03:39AM +0200, Jonathan Bergh wrote:
> Removed typedefs for various structs and enums and then make the
> requisite changes in the inline functions defined later in the same
> file.
> 
> Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>
> ---
>  drivers/staging/octeon/octeon-stubs.h | 48 +++++++++++++--------------

These octeon stubs are just so that it can be compile tested on x86.

The real code is in arch/ somewhere.  It's Cavium stuff.  If you change
this without changing the arch/ code you're going to break the actual
user.

regards,
dan carpenter

