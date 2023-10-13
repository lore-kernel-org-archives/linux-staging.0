Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B0710950
	for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 08:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R830uhRR"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-406619b53caso19697895e9.1
        for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 01:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697186350; x=1697791150; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qdwDG1vEaBdbFUB+whbPTpmPJ6lJzSaWGwO7+4KqPYE=;
        b=R830uhRRAvtR2cE2D06Jy7qiR/p+rVhjStMPbMIY3L+LHOvIP4C4YDHYjswIUdaY1G
         25kyUGW+0dS6JK5oFPQ0zJRGbQvaE9zhDU2fuRioC3wDD85yihOWgnpVUCqnmauRJqbx
         RL0HCOSCyPW2HdraknMGULpEur4jMXss1ulEriJFkup7Hi8+GNf3d3fbcj5EFAE6N6Ek
         hKDx3oC3md4s+CUhQAMRhmGBg6BbepLjXSUS6pedWae1taxGwehkciCtMTgIpDC4quGr
         oYNfrqyjy9M7ULZt+ATpp3ljrGVU0ccshgB/ZIXmaCjE9uRJNuDY2VM2l3SFLQg/Lov0
         KMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697186350; x=1697791150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qdwDG1vEaBdbFUB+whbPTpmPJ6lJzSaWGwO7+4KqPYE=;
        b=DmaGarNNHG6T1Y+JpkbaLMfsR2yOtHf5QhnlwS810ecXZ01y+24ec6XOJm+804PI/o
         3YSHKKu/+AeqgX0wP52vk0FoFicgt0u2mG5J0k0/lB+ehkelrSTt2kxrMjDNxZ1V4+dz
         E8kgml3uW4lawYFkPSMc7e9bEWnoluFts23jDmPCpUXqzjL98GApPP2hcC/qDgx3b21E
         wYrIedjm5dTNB2v87D9fX252oBbeIef57iHzYLDRII/EBsxL1uFzxCwjM4VU0PQ+J4yk
         l7I93K0mIlgth7Vfoqe38PinYpdgohw+EVMhB+AcCFKFliUO/wP4FIoQNQAwpoNNdlWm
         /4ZQ==
X-Gm-Message-State: AOJu0YxFmmNCBo02hzhRDrT72j86rzOd5+T/ZeRTPNMvHuLAoOjBvXI7
	j+XzN6Ahd24zVW/MH/eBZrlxzw==
X-Google-Smtp-Source: AGHT+IFpVpEtTclVCUangy6zX9KZjNxgy07inPEmD50g49TR1PiZoKifFM25RtoWuG8BSTEDS/n5Mw==
X-Received: by 2002:a05:600c:21d1:b0:405:3ae6:2413 with SMTP id x17-20020a05600c21d100b004053ae62413mr23348145wmj.25.1697186349795;
        Fri, 13 Oct 2023 01:39:09 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n25-20020a1c7219000000b003fe1c332810sm1901966wmc.33.2023.10.13.01.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 01:39:09 -0700 (PDT)
Date: Fri, 13 Oct 2023 11:39:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Calvince Otieno <calvncce@gmail.com>
Cc: outreachy@lists.linux.dev, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Archana <craechal@gmail.com>, Dan Carpenter <error27@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging/wlan-ng: remove strcpy() use in favor of
 strscpy()
Message-ID: <ece235b1-b3b3-4803-8462-793e7c950f32@kadam.mountain>
References: <ZSf8VcH8JQ+L+Z/r@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSf8VcH8JQ+L+Z/r@lab-ubuntu>

On Thu, Oct 12, 2023 at 05:01:57PM +0300, Calvince Otieno wrote:
> In response to the suggestion by Dan Carpenter on the initial patch,
> this patch provides a correct usage of the strscpy() in place of the
> current strcpy() implementation.
> 
> strscpy() copies characters from the source buffer to the destination
> buffer until one of the following conditions is met:
> 	- null-terminator ('\0') is encountered in the source string.
> 	- specified maximum length of the destination buffer is reached.
> 	- source buffer is exhausted.
> Example:
> 	char dest[11];
> 	const char *PRISM2_USB_FWFILE = "prism2_ru.fw";
> 	strscpy(dest, PRISM2_USB_FWFILE, sizeof(dest));
> 
> 	In this case, strscpy copies the first 10 characters of src into dest
> 	and add a null-terminator. dest will then contain "prism2_ru.f" with
> 	proper null-termination.
> 
> Since the specified length of the dest buffer is not derived from the
> dest buffer itself and rather form plug length (s3plug[i].len),
> replacing strcpy() with strscpy() is a better option because it will
> ensures that the destination string is always properly terminated.

Ok, the original code also ensured that the destination string was NUL
terminated.

Here is what I want this commit message to look like:
===
Checkpatch encourages everyone to use strscpy() instead of strncpy().
The advantages are that it always adds a NUL terminator and it prevents
a read overflow if the src string is not properly terminated.  One
potential disadvantage is that it doesn't zero pad the string like
strncpy() does.

In this code, strscpy() and strncpy() are equivalent and it does not
affect runtime behavior.  The string is zeroed on the line before
using memset().  The resulting string was always NUL terminated and
PRISM2_USB_FWFILE is string literal "prism2_ru.fw" so it's NUL
terminated.

However, even though using strscpy() does not fix any bugs, it's
still nicer and makes checkpatch happy.
===

> 
> Signed-off-by: Calvince Otieno <calvncce@gmail.com>
> ---

v2:  Update the commit message.  Remove the " - 1" from the strcpy().

regards,
dan carpenter


