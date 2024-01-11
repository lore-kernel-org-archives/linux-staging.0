Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B906C14F7C
	for <linux-staging@lists.linux.dev>; Thu, 11 Jan 2024 11:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zkynt+ZG"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3368abe1093so4133178f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 11 Jan 2024 03:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704971314; x=1705576114; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eArl0J9snWFjvLCA1JVy+E9ET+56tJ7DzHvCP0XQ1Wc=;
        b=zkynt+ZGSTXg+DNQuFLJEAccQGUX1z0PhBDGxuXsSqT8U9qkU7uNmYS3Db/sdbIMdA
         jyDRSOpsfIzsiHFEOX+xI5xUikMUYei65CzjuBQuok66gXMDsH7yKang1kSdbmo/O7+I
         wLXzgf2uWdpXjM8ua7RlvpjvlvSXxQbMQq7Tfr8lNPCoT7A3+aPR6Ax3JYKdhY1arF7p
         3yVqp/faCWW8KaXLmVZdUPV3hizyDp3CqwQFrSu5bu9s2HvjJMx4Z7QG/LFtahWfVsHX
         hVJwDRro5oAiU6wJAzktF6k/S+ha6v2dOvh6QgbebPW24ojhzRM1SDDuICM/aI+rrqxy
         oNBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704971314; x=1705576114;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eArl0J9snWFjvLCA1JVy+E9ET+56tJ7DzHvCP0XQ1Wc=;
        b=L16rOnDd3nRO/o4vGupHg0nGAKKBxSs8g+5v2NnDzWv/KQP1lAQxQVDUqtjBPhsU/k
         Rg4fUJjGlPblLHxJt62BYSObsCXaQcMh3+PGrqSs+oFedbI9KZPtABEOq01VUHwuDu8R
         eAul0MvzW7HtbCx57jgYIafSnt4eeHl9Uw2Wehykh5IZNoDpJTf502RpGqkwslWSohVT
         GHaONPcnfItalnAEHuJmyI52sRyU8Nj9PKy9Ru3uRiKksDcfR5ysvfkdEBeZ+a3DhanS
         /kQJjXp5PO+aeGHucaRcTAUrmvfWflZWdtlhCShzkgBtq/i6Kfuxp+epnUDdkiMtCaU+
         4kCg==
X-Gm-Message-State: AOJu0YwrW4XiSuju8WLUwowdLnYKTRcFkVEjgEtDGFT5kSFGAE85DGbD
	0ZgK8L9UzfM491Fp92SdMOnVUkejsASQjQ==
X-Google-Smtp-Source: AGHT+IHfFKoFfGh7YmCJPyTu7SyByoVFSI5Uvj/YzPFv6C8CPJZFRzH7fC/fg07E6Op5W/QrWqaA0w==
X-Received: by 2002:adf:ea8c:0:b0:337:2aa3:ac85 with SMTP id s12-20020adfea8c000000b003372aa3ac85mr486203wrm.117.1704971314057;
        Thu, 11 Jan 2024 03:08:34 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id h12-20020a5d688c000000b0033718210dd3sm929700wru.103.2024.01.11.03.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 03:08:33 -0800 (PST)
Date: Thu, 11 Jan 2024 14:08:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pranav Athreya <pranavsubbu@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Forest Bond <forest@alittletooquiet.net>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vt6655: Remove extra blank lines between code
 blocks
Message-ID: <8988f86a-f850-49a4-b7ac-ae363a7898d4@moroto.mountain>
References: <20240111070652.71717-1-pranavsubbu@gmail.com>
 <2024011144-silica-viral-9e79@gregkh>
 <CAP1Lp88vEZJtd69Njf9uZ5VXypwZ-5vLdBHf2xoLSpqmeyEQiA@mail.gmail.com>
 <CAP1Lp8-CP-uELVam=18oADOEvL_13wXkTyDLHKbjQe1ZyxiG9g@mail.gmail.com>
 <2024011144-sinister-baking-952d@gregkh>
 <CAP1Lp89zshQW_s0eLJjekr5tyc3XLaPnh2VGFrNDHTA7GT51ZQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP1Lp89zshQW_s0eLJjekr5tyc3XLaPnh2VGFrNDHTA7GT51ZQ@mail.gmail.com>

On Thu, Jan 11, 2024 at 03:38:16PM +0530, Pranav Athreya wrote:
> On Thu, Jan 11, 2024 at 2:57 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> > Yes, please read the kernel documentation for how to submit a new
> > version of a patch.
> 
> Reading the docs now and will send the patch right after. My sincere
> apologies for the top posting.

I have a blog about how to send a v2 patch.  (v3 patch now I guess).

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

