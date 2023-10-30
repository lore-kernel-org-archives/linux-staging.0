Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8263615E93
	for <linux-staging@lists.linux.dev>; Mon, 30 Oct 2023 12:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AGDNFSeA"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2c50ec238aeso61257801fa.0
        for <linux-staging@lists.linux.dev>; Mon, 30 Oct 2023 05:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698668943; x=1699273743; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7UKpbwqL+ANoEjbCv4Z4RqT2pwQ+PiCS3uUt13ox2/Y=;
        b=AGDNFSeASBA4C/DCuZ6E15vSxg7RipabR3JLdFPLvLMA80Jb07e653nGBOWx4MZCj0
         7xo11kZNo7N3OLUtVEWvTnLUzaaYpCl1zk5/CJk1I62KpGBvjfH0ERRu0wOaHUnSQBE6
         Acv/VDngYgND5ulpW/TRtfkKwQHn/46OZ3oO+IUIiaZQx18NQGNo5lN24kbEi3LUA3OX
         I4wnfqzbqzLg7dDYTCaKR4PKn5yIN8vMMtTkG8Oaebei0KOqKbUTj4id4fevhNhtEO7m
         6QS3qTvzWPk+RTuCTNLC5vxWZQ3HlDTvyAfC4rCcO24Znm9wT03Z/6ZKtheodDN3fJA6
         2JGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698668943; x=1699273743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UKpbwqL+ANoEjbCv4Z4RqT2pwQ+PiCS3uUt13ox2/Y=;
        b=Z8WdME8lCmMmp811CI5ttVocQTIP0LKsQ4LqYxlGTPKDMll/K1GUsW3sAbj/pv+fNm
         oACezUe1ld7eERMDMARY5m8P+u8NvgDx4q5wwZMgOCdqyH4Va1EP71icHLVCIbic7ZZb
         gSrjQd3k3aOrz9ivntL+R3TuE+vMSuqYeJGNND1rKSSCUL+2VfUmvkwiOEp8G9a1G/As
         20ck5j1i1RteiRK0vsSDjg+E3LOh9wbT5SAQLfYZ27g2ni1n09L03mAIv8gKB/UBmbDm
         +oXN3B3ikXcQ/Yc/KW6eFX/VLtKsB8eyOYMKbncveCU0RAvZ64vnmLVTcwMNkkB3IYrD
         qzJA==
X-Gm-Message-State: AOJu0YxokS1OYG3fRpgOo06H05iAyaKW2444rzZkSldN9G1MOmb6HltV
	9wd5idRGcomsUffDz1jlFaAggA==
X-Google-Smtp-Source: AGHT+IF33MHrB2gXQa3cyGUqHxSS7zkJJvW+X68u76LoqvgseSpCsTceucKyGh6krUBFt7XCUh8FGA==
X-Received: by 2002:a2e:9dd9:0:b0:2c5:2475:f848 with SMTP id x25-20020a2e9dd9000000b002c52475f848mr7781734ljj.15.1698668943524;
        Mon, 30 Oct 2023 05:29:03 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id s13-20020a05600c45cd00b004083bc9ac90sm9184188wmo.24.2023.10.30.05.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 05:29:02 -0700 (PDT)
Date: Mon, 30 Oct 2023 15:29:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nancy Nyambura <nicymimz@gmail.com>
Cc: nicydaniels@gmail.com, outreachy@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] Staging: rts5208: Replace strncpy() with strscpy()
Message-ID: <9e125b7a-673a-4c69-8216-f8c519e5ae1c@kadam.mountain>
References: <20231030115939.48985-1-nicymimz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231030115939.48985-1-nicymimz@gmail.com>

On Mon, Oct 30, 2023 at 02:59:34PM +0300, Nancy Nyambura wrote:
> warning found by checkpatch.pl script.I replaced the usage of strncpy()
> with strscpy() in the code(line 524) for the buf buffer to improve
> string copying.This is appropriate since strscpy() is used when you want
> to copy a NUL-terminated string and the destination buffer requires
> trailing NUL-padding.
> 
> Signed-off-by: Nancy Nyambura <nicymimz@gmail.com>
> ---
> Changes in v2:
>   - Make the commit message more clearer.

Hi Nancy,

Your commit message does not explain why you used strscpy() instead of
strscpy_pad().  I have written a blog that might be helpful.

https://staticthinking.wordpress.com/2023/10/30/strcpy-strncpy-strlcpy-and-strscpy/

regards,
dan carpenter

