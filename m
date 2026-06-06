Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339943093B5
	for <linux-staging@lists.linux.dev>; Sat,  6 Jun 2026 10:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780740092; cv=none; b=ZoY1oBJ/6E7Zxm02fQPUMVPtWuBB12h0L2Eo5a0+rX1C84ogPcFWmqbD5d9jsBoEsztWeBL0W+FIP8z2oU2DTCZfaHC2OJPOxEUxVOKat4uE5f/IgXZidmXLg4cWyMcWCkZqrcci6clWsnmk9bPOqkl+Q9L7vwJBn5qoGMMsClM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780740092; c=relaxed/simple;
	bh=guHEDFa2rsm6aDL298zfk3vUhvYea+kgX4Mbo76bW0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CfCO7P0/j4j+b7AjSCubvtTVL4xydoA400nkCB00bIMlfEJlBIjbBBvAFfdRhUZwbt+8o3wJJhUbEDBgJlGCxCtHuUcbDku1TzPwaDhX8AL3Hsu4go6UwCmXc65QnMAtz8pZo9Hivp/w5fQ+pdpaIkppMXFUMbQwqSEl5sZEd04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g0E8QOd0; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0E8QOd0"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490a765d410so28446175e9.1
        for <linux-staging@lists.linux.dev>; Sat, 06 Jun 2026 03:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780740089; x=1781344889; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W1uZ2JiW4gZ0Z6L+R/fOYTQ/AJABctRJmpqhLtiuumQ=;
        b=g0E8QOd0XzDpiqQscbuA1aqB07qFW6hdIkulrmWzH9Maluy9ZhPN/4TpqHqSmbwSqK
         lQOC4SFvznwEG5c3E5yFIZeRgWwgIiov5kld1qJ286OFPsqN/ELxsRXeG6oUFs4ldxFA
         oksUAWM2lW2ZtzSPrNw1a8DUZt3G3FebbtNBm861cVj+/112E08HEaQnfCdeqiIc4czZ
         2Gvu0SkSFstrxYXtPx9bA8FS2b+OHMklYRV20PpoDI/igu2DqZ+F7zbIy+PPqPpH3zQ3
         8wWD33Xm48VY0XNI6wXW4WKLGdVrgdb3AuhOrRh/3Bgf4u9+Xy4g0oXIczE6k/jXfPgd
         WbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780740089; x=1781344889;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W1uZ2JiW4gZ0Z6L+R/fOYTQ/AJABctRJmpqhLtiuumQ=;
        b=gVJaoCLUnpZpJ6AvbQ5/ORTJfC5yxR7LoVJPprZ58JaNI6xpXdAY68+VpnttPOwpsd
         KhDatR5mOgjm20nFsa2ha9+mQA10mObNqOZAenw+hsji94bozPvEFJ3IcXBwb7qZVeHE
         NdfkAJpUf1vWd8BT/sm0k17uMQVTJKU2tXAer7UbNQQEyrbevDDU8knOwCsDeNi3Vxo7
         wMKr6IkxFScLegJXYHmvQtXdagRHhSdZQL9xsHCWKfa+9m4niFPXmhwgOtRD9NXVn2EZ
         zxFEGkB87cpRVrS4jc0HoKaoUCG8WrYnJSz8U0QlkyLxOIAmWG+4qtjaws2C/khJ3500
         ZTqA==
X-Forwarded-Encrypted: i=1; AFNElJ8L9CebpNcZqURelYprQK/iwhnHd51VU4GYlNA44o5kojFoVWhZ5+qJU6fQrei+MphE0bR4Q6NSu8SvqDVA@lists.linux.dev
X-Gm-Message-State: AOJu0YynHNcCnXpWa68VzUOIwAJFJDaHQ5Km1LRPxSVFNlwfI6nKjowo
	7dP3Bh9AqbztI9xrXKV/DDRKbAGhJcwxT2xa2r/FO7G9OouGhiVO8yrQ
X-Gm-Gg: Acq92OFfsOaBJIKgh0uDGlyemtllf1R9Ab6cZOfTzcQeQjV10xTyoPA76CJKtkviLbl
	p5wTFvT8U06FreXd7xoo5VjnLjoEnwUTUuWaTs1gwED1cxHszX2rbpThyPDsQJymVC0KhVAjOO7
	bgZQJuvM5sSzi7y4L7VLm6gtNv6mXtisyWmbQzDeflnAFAEfUr3uU2YZ/XLBjRyq1Eq1CPoo31R
	JTIU8498KAlj8rqJWwcpPjROjBsPRWK3mgRwadGkk9ztw+0+/3MtBES/xLrjJqZPp0EN9LrUHNQ
	+ytmrw9fyk+Tshyb9au10pwDJlykgCyUGB1umFH1Mrj9iZiSYeS/TFFVdbZM6vzumfmvX4ttcZ9
	+FYDVRCcVRqhSzSIgfCgj/QN55pRx/3WaZXjLcsuiI9yyPh/arXlMQ/PC6ZRSN5A+M7mk/gOCt2
	ZI+II1vUxUkWwDhBYO4m1hLzF1PPGbFQ==
X-Received: by 2002:a05:600c:4e45:b0:490:c01a:5f10 with SMTP id 5b1f17b1804b1-490c257f8cdmr121984425e9.15.1780740089546;
        Sat, 06 Jun 2026 03:01:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351d69sm57473786f8f.29.2026.06.06.03.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 03:01:28 -0700 (PDT)
Date: Sat, 6 Jun 2026 13:01:25 +0300
From: Dan Carpenter <error27@gmail.com>
To: Rhys Tumelty <rhys@tumelty.co.uk>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	sakari.ailus@linux.intel.com, andy@kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: atomisp: remove unused macros
Message-ID: <aiPv9TcyxoEFzcTx@stanley.mountain>
References: <20260606092842.179826-1-rhys@tumelty.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260606092842.179826-1-rhys@tumelty.co.uk>

On Sat, Jun 06, 2026 at 10:28:42AM +0100, Rhys Tumelty wrote:
> removed unused macros across the atomisp driver that are defined
> in .c files, but never used, which was flagged as errors in a
> W=2 build, due to -Werror=unused-macros.
> 
> Signed-off-by: Rhys Tumelty <rhys@tumelty.co.uk>
> ---

Please slow down.  Don't resend a patch twice in the same day.
Follow all the v2 rules etc.  I will review this patch when you
resend it (not today hopefully).

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

