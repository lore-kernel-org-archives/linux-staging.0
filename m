Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C4A3B47E0
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 09:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774863321; cv=none; b=EhYiLYWSc7p47FrhHQI+48uNXiSoOWIh4MglRZ9Io5KICYnUgZb9KxCC+op1Z5R/ZR/lkXt2WCjuQUYIDq0QOYQW81mrTEeWziCtDBmB299XVhSOFFOjrOcJLFvjrQa2FlczyROb5rMBMP/vqtAa4DVTFJ22uulcgibjrZSTA0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774863321; c=relaxed/simple;
	bh=oqL8KTAVeI89MSUR/JDMV5gcYvqcwOuXTzWifCo5Goc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=THLSuy0xxT7W4pjWBa4RSYj7iPer/vpiGbsM60e6TTuVKLoZsUrEp0etm64W6SNqOZ9UtziYKxCLqkpRy+Th5mnjcIu3pyKhgLZ38w4S1009ju4f6K84gvZ6cBkVBcu9xyir94Zf2sH0gaqxXabxxSRoM1jh61baKG4EqhudLUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C4dEaeH/; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C4dEaeH/"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38ad12fb595so44069011fa.0
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 02:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774863317; x=1775468117; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2CeYbJA2Y2YytuXwRpPBoi6eaTAmSPql9/G5DPRWijE=;
        b=C4dEaeH/5Xi68AQswuIcOrEUE2cgt1zyNC6bIrWzo8U5Soui1b8hyBA3GdnM33uMS3
         //OHR3OE/y9ua9nHBShX+yejVOKchgpfpl9yOLWWPvERRsj3rCsMgAASuxF6i/nM8xpQ
         VXIHpC0bjGUQLChsfQ6mqNpMkJO888+k36RptCnzfzU19rclB6h8D3yY5MNc+j9hhCUd
         HQmjhZDdtrVdV2fcuMIEeeZwsA+RianaKEWJaO91VYjWudpdEeN/CD1ZiV7HLl5vyhsQ
         5/yPGXAKtyj5eFQ7tbHfTwwDqdlrmKK2zCjMla/L1jJcs0oqMlMTN2dI0h6yaqWsHDWg
         AxkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863317; x=1775468117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2CeYbJA2Y2YytuXwRpPBoi6eaTAmSPql9/G5DPRWijE=;
        b=hmxtvqv9h8c5D6WOriB19cnchsg5Pvjom0bOqLHYaX7JelVpBnl+5C6bsHfDPKZkCn
         0jNrxdblZo7ZYjiohIJnZwd/cdk8S4XLYM1N3RRgPcgL6+1TRLZKvMsfJivENU9JDTwt
         +fx8c8YCt4vC2GJfku8pLxmu99/1Hf/HlhnqPqJFN4bGu5glm0MNoGBnXOI9Zo6m6+mu
         5zJlaSQX0pemSSrq0HqoNh7HYz62Z+nvxPPhHgG9h8Tn61iKPUoaEwCE5pA0nQBY/4bB
         bNKttcijpwfGZlSLDI0YXzQHuQQVN10XNNICjSqp8cz5uDSlO2H9EeO6OCOFqjE7rubq
         eb5g==
X-Forwarded-Encrypted: i=1; AJvYcCVeOIf44jZYttGb+gl3elamw9auqkqDlRPEcwYZ+4v8e8vA5Y/WbY4rRYaE5g/BijkgvT9irS9X8fKHvzoj@lists.linux.dev
X-Gm-Message-State: AOJu0YwM6EHD0wSCvoT0KlDNus4kYVXnFK93I6WWbEsR4ikcheQuIgf+
	qsGMbnGYt+E/cC59cSsFEPSWdmfrwUz0qvLLrBBe6ZIkwhggDOOpVlPn
X-Gm-Gg: ATEYQzxXqTGDdCdWXuKcLdSVrPbhlqpMZclfgtdvi+4f0s1ptQfPWki6WzWc5PMUez7
	Xlot+Fjnt8E5iQtlXPPz29XTg1x/ylwsNolH2Wqk9MW6f9dpKUa5gS/Nl+yl2qPzS7AlDgVViXo
	wvlZjQGdfTIgiMPolijxqES4mKl0Y9jeb1WSs4AOqydCGS0n2Z1K2Q/ZbihQ7QKoBqrkg5ip9be
	Cw41MG0ggAhz+WPlwlrp4ALSEvh9L53VCWHXWIVJxkv8VQ+9M031JX04QVxtczkTy5zEZ2Y6ChK
	xoqQF1yE/ozFM76dyYHoNuiV+lM9QenHMz156b13YthmFKlU5antx5anjGoEbwVNmy4l2hcXYqR
	yvhX/wrdzz2ATI6p0KxzQW3eOX65YTC+0cMjI36tUukxXr6DO4NKq2RAKH09hRQc3f4npjrLFc5
	MpTDtPPJz1XpY4arNIbHQ8+uL2uPE4mA==
X-Received: by 2002:a05:651c:1b12:b0:38b:f0f0:e39b with SMTP id 38308e7fff4ca-38c75c5ef7emr39088441fa.10.1774863316974;
        Mon, 30 Mar 2026 02:35:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c836d463bsm15395231fa.4.2026.03.30.02.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:35:16 -0700 (PDT)
Date: Mon, 30 Mar 2026 12:35:13 +0300
From: Dan Carpenter <error27@gmail.com>
To: Mashiro Chen <mashiro.chen@mailbox.org>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] staging: rtl8723bs: fix logic bug in WRITEEF4BYTE
 macro
Message-ID: <acl-tVy1PJX3XBuR@stanley.mountain>
References: <20260328142709.330401-1-mashiro.chen@mailbox.org>
 <20260328142709.330401-2-mashiro.chen@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328142709.330401-2-mashiro.chen@mailbox.org>

On Sat, Mar 28, 2026 at 10:27:06PM +0800, Mashiro Chen wrote:
> The WRITEEF4BYTE macro incorrectly used EF2BYTE for
> 4-byte memory writes. Fix it to use EF4BYTE instead.
> 
> Signed-off-by: Mashiro Chen <mashiro.chen@mailbox.org>
> ---
>  drivers/staging/rtl8723bs/include/basic_types.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/basic_types.h b/drivers/staging/rtl8723bs/include/basic_types.h
> index 8adb95f9f..99b12c724 100644
> --- a/drivers/staging/rtl8723bs/include/basic_types.h
> +++ b/drivers/staging/rtl8723bs/include/basic_types.h
> @@ -64,7 +64,7 @@
>  
>  #define WRITEEF4BYTE(_ptr, _val)			\


This macro is never used so just delete it instead.

regards,
dan carpenter

>  	do {						\
> -		(*((u32 *)(_ptr))) = EF2BYTE(_val);	\
> +		(*((u32 *)(_ptr))) = EF4BYTE(_val);	\
>  	} while (0)
>  
>  /*
> -- 
> 2.53.0
> 
