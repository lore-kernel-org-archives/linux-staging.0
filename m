Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5226D84039
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 12:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770035688; cv=none; b=ao8VxpnxP4wPtvyEE8lwbbzUh3F4Flzn5Nl6nSteEr2IrQNZPThyz1kSsQ7fOPof+olcmtsik0DUPdDAyUBeSYwNEB7mrCQaIG20jjXrPrGtUF1Smm2wPTx4aSEmgSuBz0bM37KS4bTegfC47yefH5xN93XfZag0h2RkrtShWIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770035688; c=relaxed/simple;
	bh=wImFP5XYBfaKDqfVSVcA7SqRcgDRUvU8owpiplbygLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EQ1f+Q9DcvqwxQHKrVuYGvbOx1dsWlGGIc8iuImU9Rmd+9+7Eymejjjj9XrkXJJGbLvgwzlhE/m8wuG64LXX0h6YNyaa2sC/wRqB+hHQvKo2p6xsJFy/g07oQioUYdMaAXMyePnjYDLxc8zzQhDwROlhFY5VLFcxwKo66RhagNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nG97eivr; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nG97eivr"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4806f9e61f9so22189935e9.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 04:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770035686; x=1770640486; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+raluRmEaLEejacNI+yWBm3MENSLFrfT3hK5/ij5HFs=;
        b=nG97eivrpk87KQSyPhRap1f64B0aUc45PzS6mYXpngXt2b0JbiHztW5zhb1VQ+6oCA
         jKtQQPRiCxquvwikaSyqqF1NJlqmDHUNYvF6aw2ea/kKtR8cDypZyoRKN7zxdauyrPQ/
         GWzZpR6ZVFgDNDh+T6ro31A4f+dP34B0zBaDIWFjYganqUq/blYojsQqhVKq2rjergJV
         HR3lwGFusyRONo30t9vtb7LFKm0G2gto4NTp50+bnTGnaCO4TE5QUKQMDxfbTca0Ggke
         UAxTYdYINP6qqaPap/C6kjjR3j4iG+KVVezWPRnTLKKMpCiRiv+dvSqUif3Icmr5UlY1
         5o4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770035686; x=1770640486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+raluRmEaLEejacNI+yWBm3MENSLFrfT3hK5/ij5HFs=;
        b=JEM8ymMqC2UpeoOJI6I8GwsvnU1eFT4HiFD2dT9vc4f7iDMbzsUjn37g60h0prDtsD
         CahZQmzbfM1LQVKVkoRDnLgEzoNKkz+lAYTcfutNtcWMILOvTY5sHiP8UpGGCsnF8RMG
         ggWsjZZuwE29IXrGUMCUjAiKU27pLjNS6Koe6ZnDCICDjJstfzeE9QhT7yLNlCW3F2SL
         zoKpRtWMBlr+hiP+ix2gy5heoz3YYZYr2hAaOIG2cZL0PHKhLu4OZfLh0dymG9bD3OT7
         fiZdTJyJr8e5E4fF7f13b4qO2n+DNRpKNOrfAIXxhP9bgtFJi8BQezu0DscSqU9ZgFmQ
         zoKg==
X-Forwarded-Encrypted: i=1; AJvYcCWL/sLtLUTgRvQeLSxJ6SuGeHeogSnr7hWdwrBuNq15PehJQjlPDXkiPrbqhlQz6ca9Ukn4k8+XH9+YBhKh@lists.linux.dev
X-Gm-Message-State: AOJu0YyWJ3iSSunsIDi9b7Et1iH31WXSILm0HdzexZCxoPSrmh1cpq6Y
	8EFVpIRqrjM2PlsqW6MvSflouDOcSE2tX8eDUtQyA/sl5Q0KyN38sOqJhb+FhMNhAIU=
X-Gm-Gg: AZuq6aLKWY045NAAukugnsSQ/1V6pnQyozUguF8fhfk5TdzFL7augDNAgMcLF7z7CDL
	lqpRFy6T8eZsVGFNhO7VZoB9eXMUZvmUt+1IgIH923tGV04Bco42FvkdN2KsJF3GyjSco/Ycy9p
	QNuVt9HIQc4H63DJRvrVttUR6abKUKvL0hQUqdoSfr4CkxY/cKhl2bateWQyRcxJLapVmPwb5bs
	gDx18862yGtyiMO4NtJ8AE4Ce46Lva19fooPYmTnjBGmpMIQDb89W8YreBtSnTK0MREet8vA4YE
	9/fW7/Peg6W1cHk46h3y3EX5VJTJ5AJ649NSv24CMU8iPwb03w0kFXHd2zCm5NTGVGs8Y3eXAtT
	bxKLEruLwMVtHiVlvX4405itxuBLdSLkB3SXUvaXXsmgcUulNWRxp5/9ALaiNuQwMUZHCtM3naM
	kOUQ2t7fLjP9Uc6WL81IPbKvZmS5M=
X-Received: by 2002:a05:600c:350c:b0:47f:8c05:786b with SMTP id 5b1f17b1804b1-482db48d476mr137228685e9.28.1770035685677;
        Mon, 02 Feb 2026 04:34:45 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce58sm42550695f8f.20.2026.02.02.04.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 04:34:45 -0800 (PST)
Date: Mon, 2 Feb 2026 15:34:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: make _action_public_str const
Message-ID: <aYCZ4auMqAx734Hg@stanley.mountain>
References: <20260202100849.133313-2-giorgitchankvetadze1997@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202100849.133313-2-giorgitchankvetadze1997@gmail.com>

On Mon, Feb 02, 2026 at 02:08:50PM +0400, Giorgi Tchankvetadze wrote:
> The _action_public_str array is never modified at runtime and serves as a lookup table.
> Mark it 'static const char * const' to allow the compiler to put it in the
> read-only data section.
> 
> This fixes a checkpatch warning:
> WARNING: static const char * array should probably be static const char * const
> Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
> ---

Add a blank line before the Signed-off-by line.

regards,
dan carpenter

