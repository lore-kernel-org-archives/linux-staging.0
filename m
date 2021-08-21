Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0483FC0
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 12:17:25 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id u14so1002862ejf.13
        for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 05:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hoslJBGY7Wq9eGv0P0Mpj18WdRS2dVibv0AROTPUnAQ=;
        b=ba+v2lWmAj5GG75JfqVyf4abFtHoJ0k0nzGOoXQGdQO0D6uHEEYYn/R6CF4zkoyqb5
         IVhWAd+8UqhOPksFmO9M587ChnFiemI5P4VV3YInL0svOnhxaScIIGBErhOzsOPbgkxC
         RB5jxZGnV3fGPhg5wX20xRu/qQlYOwkPuqzhuCMIBdj8Gj5lVZwKmd+fSrIPBX9DClUk
         H/tpCUkf/5NNrp7IeNcqx1TFtTKkLM0TscNweb8NXi4hkWrt2KPDalIp6I+u9jV3/SK8
         wCqf17Ehuo+YZsOwmv9r9SBlRFu4MJOa3bc1YtCueVNAaMMVQaJRWOAaOg9rP/sb887J
         DymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hoslJBGY7Wq9eGv0P0Mpj18WdRS2dVibv0AROTPUnAQ=;
        b=CSFenqLLFZP84BDXYm2wjELlh7jIna8NLcYEUiBnH51y6s6QY1qbSmdWUVUiSxInFS
         h8etVlE8/J2bmDS/GQJyI74IBrnS8JI8tsqE1ZwHFwSvUdkGYrIYls14LkEU9/JqhAom
         pkXuShRDZhIT/w/eTrgDBzgH6uBz3rCVf+Ud3FlcHa+V7E2vw18sLHSkq2xmXsfCeLmH
         cSDWJSpSaP/Pp1SGdd8sgqF0fAX6e+uoohRNX9LZzy5Ssl1byns0LNs3uTqYKc2lWvZ/
         4l75ZZ4b9G858KzBK1LuPZ/rDdGwwpFwNr5AF8ns1JGij0AWy6C0cIMUYoklbcCmHkHH
         bG+A==
X-Gm-Message-State: AOAM532dQaglZ+LRXMoyCObQo0UmuHaMew19k+k1E8+QN8ElqxaTY8Cq
	OnEDAL2R97uQjjkUQ8adkgc=
X-Google-Smtp-Source: ABdhPJwaBp8nr1weuUv0dEOI478tNSvI8O54QglZET8VkqZqz6svchdCyCy+ZpojaUEowNk2d17SlA==
X-Received: by 2002:a17:906:3486:: with SMTP id g6mr26577524ejb.71.1629548244068;
        Sat, 21 Aug 2021 05:17:24 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id r6sm5324255edq.20.2021.08.21.05.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Aug 2021 05:17:23 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org, Phillip Potter <phil@philpotter.co.uk>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, martin@kaiser.cx, straube.linux@gmail.com, Larry.Finger@lwfinger.net
Subject: Re: [PATCH v2] staging: r8188eu: change declaration of Efuse_Read1ByteFromFakeContent
Date: Sat, 21 Aug 2021 14:17:22 +0200
Message-ID: <2360857.63PHMDANz2@localhost.localdomain>
In-Reply-To: <20210821105615.6307-1-phil@philpotter.co.uk>
References: <20210821105615.6307-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday, August 21, 2021 12:56:15 PM CEST Phillip Potter wrote:
> Remove forward declaration of Efuse_Read1ByteFromFakeContent function
> from core/rtw_efuse.c, as the function is defined in full directly
> after this and therefore this forward declaration is redundant.
> 
> In addition, convert the storage class of the function to static, as the
> function is only used with rtw_efuse.c, and tidy up the signature
> alignment.
> 
> Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> ---
> 
> V1: Removed forward declaration.
> V2: Takes account of feedback from Michael Straube and Fabio M. De
>     Francesco to make storage class of the function static.

Thanks!

Acked-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

Cheers,

Fabio


