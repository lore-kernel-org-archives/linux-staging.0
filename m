Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F5E14281
	for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 12:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sWBSU/zz"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40572aeb6d0so20877755e9.1
        for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 05:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697199167; x=1697803967; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ommulkgo6kT/ecNae2/W+LpZutQGK9Ntv8cEwiwSQYM=;
        b=sWBSU/zzwd2sVIh2FI5bbDUVG7KZcpYfkv6P1u/3IJ4mbLstLgCXtOIbcFZCO/vaWm
         BhFq0ptxBXhHzrSqTqvsDoSyU2rsJsjD2/Y5rZgXQvcTelZFGKl6mUx/OA6Hq01T0N9M
         hkbcvkzhBfexLVudpmAoJYLbJlbY8BbZ9oSTOJ3fRzXO4W6ucKGwMVW762H7yoxZPhmk
         YlBJ9LmZ29KkkVwTIKwZXN6gjFm61naGlmnNpTaJX3H0QZaxtW7inqvXxNmbiL1VJDXq
         sMTVzXfNq3gPwLgsfR4ZeWJpnubClKcc1vMl4a1BJ5/ty8W5r4DntZiM73mOaK1fi8C2
         aB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697199167; x=1697803967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ommulkgo6kT/ecNae2/W+LpZutQGK9Ntv8cEwiwSQYM=;
        b=LyMlJuC+MgULelyinh9CByVhMFlleAoBNDGR7G7WD7vQvUjii3GUR3QcV/nzAet99R
         FT00i6MSvDOPTC3XTx1mmG9Qkv8EreyDUuIfu9EEGNska71Z2Bl9J1piAmMO4x2U7LOm
         HXru0nQxW98bqPATYjp5riYULw/NbYx0dDEKn7HMUQ9gwV8TOlk9mJxqX+6ryQk1Rx2w
         sLUCX5jZUuTp1JwileETere7XQvgRbEpFxW5UgLuqtG4/l5yrLYgozAEHx/HZIxr8OlU
         76wKg9B7r0y5duhPztVXpiSwr/1Oxm+4SGgatXGsAxS+ih23Kjlp/TA6AmEao4o8TcJK
         7rcg==
X-Gm-Message-State: AOJu0YxuWpI/t5t0AlmV8KMNn30JSlCnJsh+vUNn0YTNx3Sq1FxTFwp6
	XcZoF5hdlVriW/PRby/6p2UJfA==
X-Google-Smtp-Source: AGHT+IGGOPZWWwiRVHRk5yzraMQzyDHn0Hvvv7JodPr2iDjHtiNDH11qdqY3ba27geC5ZqN9VJdrGA==
X-Received: by 2002:a05:600c:2146:b0:401:daf2:2735 with SMTP id v6-20020a05600c214600b00401daf22735mr22563494wml.31.1697199167422;
        Fri, 13 Oct 2023 05:12:47 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n8-20020a7bcbc8000000b00405c7591b09sm2399240wmi.35.2023.10.13.05.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 05:12:47 -0700 (PDT)
Date: Fri, 13 Oct 2023 14:19:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Calvince Otieno <calvncce@gmail.com>
Cc: outreachy@lists.linux.dev, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Luke Koch <lu.ale.koch@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Simon Horman <horms@kernel.org>, linux-staging@lists.linux.dev
Subject: Re: [PATCH v6] staging: wlan-ng: replace strncpy() with strscpy()
Message-ID: <ce6c3d81-d75d-40e7-a6df-7abd4e8250a5@kadam.mountain>
References: <ZSkm34Sy/n2yxBqi@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSkm34Sy/n2yxBqi@lab-ubuntu>

On Fri, Oct 13, 2023 at 02:15:43PM +0300, Calvince Otieno wrote:
> Checkpatch suggests the use of strscpy() instead of strncpy().
> The advantages are that it always adds a NUL terminator and it prevents
> a read overflow if the src string is not properly terminated. One
> potential disadvantage is that it doesn't zero pad the string like
> strncpy() does.
> In this code, strscpy() and strncpy() are equivalent and it does not
> affect runtime behavior. The string is zeroed on the line before
> using memset(). The resulting string was always NUL terminated and
> PRISM2_USB_FWFILE is string literal "prism2_ru.fw" so it's NUL
> terminated.
> However, even though using strscpy() does not fix any bugs, it's
> still nicer and makes checkpatch happy.
> 
> Signed-off-by: Calvince Otieno <calvncce@gmail.com>
> ---

It's still white space damaged and can't apply.  :/  Try save the email
and do `cat raw_email.txt | patch -p1`.

regards,
dan carpenter

