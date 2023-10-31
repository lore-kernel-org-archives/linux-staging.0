Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87AE5672
	for <linux-staging@lists.linux.dev>; Tue, 31 Oct 2023 04:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KTF4Kalt"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40906fc54fdso40893475e9.0
        for <linux-staging@lists.linux.dev>; Mon, 30 Oct 2023 21:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698725596; x=1699330396; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JWzjKL8EVaea5V4HLaN3vFp8o2Efb8rSuCQYLqGhPNM=;
        b=KTF4Kaltr2aoB+iguQDGxUMFKH0412njSQyhJr6RgrRcisbKE1BVMU1mnNz82BOTKe
         tCBqjwLoEPPjiduiqLrbvxN62Lq7bTFxfcQCguqNDgaXwiTIMGJ81OU9vNQ0IUtXPkmb
         fQCu2cT3M7hqF3IbXCBMLFO6MN14FgG9M6kBx297SR4Yxhk9M/x+GrZy6dq/dZJR7q59
         N9l9n8DaVaK1Gp0Wz63F9YhDKcTd0bxZF9NA88wUB2s68yKEpb620F4pMMsx1S58ZxQ+
         DqbJJZLudalmohn3AVfUTsFR4++FFmbCFP1s6wcq1Bbfw4nR+UnawsMePwYG3q8HZJVF
         U7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698725596; x=1699330396;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWzjKL8EVaea5V4HLaN3vFp8o2Efb8rSuCQYLqGhPNM=;
        b=lNbpr32Qlyd8J7kZ4c4A+XV5kkMJLjIP4PZ3Rcf9q15kB1UBzM5o0kAl2vMvqUTN1l
         cNXWISV3YGrDulp1Kd0rFhj2G1voCCZwjl+xSeacl/mb65dW9mfPtdJam+hQrtGx+Otb
         8IMtlh30xIMSqW5JrZv4fraWW0ViLARVQZEJx/7/m61iGQdddCNhbw2gdJSWgdFoBxo1
         mqSqIzO3y2aQHdt26ke/q+MAA3Z7BDfXZI9/9yMtAG80pd5eOi6EaCmuBPfoGNd9T6v3
         IRUw1A5lPhKm76vctnf+4nsXV6riRWNtJSqPtcZzB2P0pFp8X+luyTjX7b7M7CQQLxGf
         sbJQ==
X-Gm-Message-State: AOJu0Yxix3ubFg0FwpAard6J3a1eCOt4xSxP//BEutk8O9/7AuOYxwWR
	d2TiPHzX3HClw7A4XqlFkBj16w==
X-Google-Smtp-Source: AGHT+IEPDxyOOgvptCIl3Y4Jak1XAQ25YdaQBYIEe+oAxOQClDi6eyZMDdGcKmIP/s9FKFQJNYn1og==
X-Received: by 2002:a05:600c:458f:b0:408:3ac4:dc3f with SMTP id r15-20020a05600c458f00b004083ac4dc3fmr10053328wmo.29.1698725595302;
        Mon, 30 Oct 2023 21:13:15 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 16-20020a05600c229000b0040596352951sm549895wmf.5.2023.10.30.21.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 21:13:14 -0700 (PDT)
Date: Tue, 31 Oct 2023 07:13:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nancy Nyambura <nicymimz@gmail.com>
Cc: nicydaniels@gmail.com, outreachy@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] Staging: rts5208: Replace strncpy() with strscpy()
Message-ID: <191cf6e2-6a46-4813-a0c4-c86bcf9bd0b2@kadam.mountain>
References: <20231030142751.49913-1-nicymimz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231030142751.49913-1-nicymimz@gmail.com>

On Mon, Oct 30, 2023 at 05:27:47PM +0300, Nancy Nyambura wrote:
> Warning found by checkpath.pl
> I replaced strncpy with strscpy because strscpy is suitable when the
> destination buffer is NUL-terminated, which is often the case when
> copying strings. Strscpy ensures that the destination buffer is
> properly NUL-terminated without padding.

The same is basically true for strncpy()...  In olden days strncpy()
was the only "safe" function we had so we used it exactly how we use
strscpy() today except we manually added a NUL terminator to the end.

	new = kzalloc(len + 1, GFP_KERNEL);
	strncpy(new, old, len);

> In the code, the objective is to copy a string (inquiry_string) to the
> buf buffer, and it's likely that the buf buffer is NUL-terminated
> since it is handling a string. Strscpy_pad is used when you have
> afixed-size buffer, and you want to copy a string into it while
> ensuring the remaining space is padded with a specific character
> (like '\0') hence not appropriate for this context.
> 

You need to run your patches through checkpatch.

"it's likely that the buf buffer is NUL-terminated since it is handling
a string."  That's not analysis.  That's just guessing.  Take what time
you need and do the analysis.

"Strscpy_pad is used when you have afixed-size buffer, and you want to
copy a string into it while ensuring the remaining space is padded with
a specific character (like '\0') hence not appropriate for this context."

It's not "like '\0'" it's specifically '\0'...  This explains what
strscpy_pad() does.  We all know what it does.  No need to explain that.
However this doesn't explain *why* it's not appropriate.

1) Look at buf.  How big is it?  What data is stored in buf before we do
   the strncpy().
2) Look at inquiry_string.  Where does it come from?  Is it NUL
   terminated?  How long is it?
3) Look at sendbytes.  What length is it?  Is it longer than the size of
   buf + 8?  Is it longer than the size of inquiry_string?
4) What do we do with buf after the strncpy()?  Does the surrounding
   code assume that it is NUL terminated?  Do we copy the code to the
   user?

Once you know the answers to all these questions, then figure out which
of the questions matter in this context.  Re-write the commit message
with the relevant information.

I'm going to give you a hint here.

	rtsx_stor_set_xfer_buf(buf, scsi_bufflen(srb), srb);

This function copies "buf" to the user.

regards,
dan carpenter

