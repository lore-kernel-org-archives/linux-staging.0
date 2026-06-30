Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6CF27FD6D
	for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 13:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782826333; cv=none; b=FZjfcGT9RgWMq9vd/hbDuHFZvyvtRo48Qq2qhtdQx1b4VrJcwKqZeYUhjgtLxyvIEB+2sagNbRbmdeOhEG7JCq2WL5rjOqvQ6wbqZYgPwO5lFETArilw3qnD5pJLfXyE9JfKd7yhwdrgtLW/qKfnnjhWOHlwScICf4Ue789wUZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782826333; c=relaxed/simple;
	bh=7bw+O5WLaToHP2tSBli+IIhJTmS788eghpGopgDx+l4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uYZyAgLvIh1h4OcZWcsrN/pAFMAlCcf3F4d+UZzFkX0GgIUHc9rYjbx7ica4PuSUEiimOBJpCZ5vQprr5GAh6FQEaA47XWqKOpos/t0E+GSolFNuu0D0l7ykM3zqD0YL+z1/D4s281jgyqgZU1yN0C7FUT4SoTa7aktM9whODbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b2KPnHnX; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b2KPnHnX"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5bbc6c99b5cso1482083e0c.1
        for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 06:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782826331; x=1783431131; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4FUqC2k9DGG9C47+8sXljTM7/f1XaSgmpyp+bRm68aI=;
        b=b2KPnHnXw0RCvNGgDnIjYi52TapNj2/7I4Az1jjUtRfLl39i9WDHvY/NAs6GvsBWtC
         vM5aNJR+QRmTKep/Gc1gIsiuzynKiZDuZfiTWGCb8f2GYeggbM8SO5jsDwBtaMA833wd
         UWRa+Z8VGRKCa/toZ4xsnSHbhcXRzijTINi/wxp9N5PFDWjE2NxAxzYI0HWwj4PrH7PQ
         6aNw+39hUnxALYuv+VH4G6CZTs7+jCizYfZaSuN2yMEfOF3M8kBGGLRaDbq6rYK9Y+/I
         81BLkAnwRmgQ+s4w0S8Oua/zAHI9xOmK/kUAecH2vjER8Oe5QcUxUeCRkeSESgLBom6r
         1kag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782826331; x=1783431131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4FUqC2k9DGG9C47+8sXljTM7/f1XaSgmpyp+bRm68aI=;
        b=kOASXoY6NWOwDtjSkcOAvidGTOzRjf2zZg0XCfmpfIyk1qFseN7zLOCEhcW9nIEoQb
         G5G0ergX0InBjGND2+90/IGE3lyD2UkBwBz9Gakj1jTj14kobh+q6IezOqcZVmDc86+X
         frvSUpm8hINIwfSLjWI30n+vnd2mxpLvzbPLYLLc32b4N+4QguHOJvnIz7Keroq1k72G
         Xj85C8Vei02RP4DKBEdxTnbCJl4mrvOI3ivRCBlKcXgtfKbg1X3frT2AXzBl5AsJ8GcJ
         YyHlrqlvs6WBYadkKUHHlNq6R/vVwMv+XeShEt1kv9DlJFHfDdq4cSU462bPJWw9Frmc
         mUXg==
X-Forwarded-Encrypted: i=1; AHgh+RrKpmwN+kohVgA8J2P35UfShI80f1o2vwD1z8NQcf2WVYMmYz1Spz2nRzaCR+L382qo7FEOLwzGQ3W+V5v/@lists.linux.dev
X-Gm-Message-State: AOJu0YwMkZgQgLsDGshPiwo7Gxkt1jTj6JyVT9eziabWw7UZ+XdrpR6q
	3Ex9S3oZfTpuDH2XdfVq0JEX9Sjm6/X8AJx5+Gd9c755QAlx5sCsNopq
X-Gm-Gg: AfdE7clOsvddz8A0TPGvng8L5p8UhzXfuC51JHI3C8ZnPvZW+MmoByztHZl4EVsx5gd
	PuPSW5LgQi7NOvj2mLspC6WPRP7DEpVLcdUNyGoGym5VwuxY4R1c2s0/q4qn7QZc8+KNHVtUVFg
	MyGuOlm1JxLDPrdn6P6+C8uSgeC3yuj5Y3ilvEgX6BXUQZUIr82PL5Kxaf81UTImZ7oDtpG6lCt
	xiSkRf8xuHMF7UI/M5KW/9Eo9KGn6ePZmm9GYkyi/YNEFEXxTgXw9oIvAAiagqgAOvzUxFYK9he
	iqfSxL5SRWohTbGbl5qlz5+W1dvktGxgVWLTcDNLOapDzsUDyKkJl67so3MDy0+ywNUXeA90HcK
	Oeqy9qyaqpjb0sMmdjqDMldUFm5Ze8KoHK+1u7j+dcDjziM5dreJqjoEsXJ9FOhIAKXPZMemGrs
	SQq464
X-Received: by 2002:a05:6122:8299:b0:5a2:5c65:850f with SMTP id 71dfb90a1353d-5bdcf5d4cbcmr195881e0c.10.1782826331326;
        Tue, 30 Jun 2026 06:32:11 -0700 (PDT)
Received: from localhost ([74.80.182.83])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bdc1a8d959sm1359638e0c.10.2026.06.30.06.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 06:32:10 -0700 (PDT)
Date: Tue, 30 Jun 2026 16:32:05 +0300
From: Dan Carpenter <error27@gmail.com>
To: "Bohdan D. Marcus" <bohdandmarcus@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	andy@kernel.org, sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: atomisp: fix block comment formatting style
Message-ID: <akPFVbUVbdb7-9j7@stanley.mountain>
References: <20260630132631.25762-1-bohdandmarcus@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630132631.25762-1-bohdandmarcus@gmail.com>

On Tue, Jun 30, 2026 at 04:26:31PM +0300, Bohdan D. Marcus wrote:
> Fix a block comment formatting warning reported by checkpatch.pl in atomisp_cmd.c to conform to the Linux kernel coding style.
> 

Run checkpatch on your patch.

> Signed-off-by: Bohdan D. Marcus <bohdandmarcus@gmail.com>
> ---

There is a specific format for v2 patches.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

But the main thing is to wait a day between resends otherwise it's
overwhelming for reviewers.

regards,
dan carpenter

