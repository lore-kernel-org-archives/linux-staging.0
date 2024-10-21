Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAFB1E1031
	for <linux-staging@lists.linux.dev>; Mon, 21 Oct 2024 07:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729497284; cv=none; b=NNhss+wweDLJfC72/739ruoIzeKoUzYl3+/Ne/RvfQYB/xfb2Ctkk6su0ZwE4zOdstlTaENiSh7TZMr5UWZTvq5aLqdME68iixCGY9+07uevo/o6UTGh6DTL8OYyIQBkKngks7ce58zYM2Oi5QoJYbdmB7HRQPxdxydCzOXr2ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729497284; c=relaxed/simple;
	bh=2M3nQR1afNYLqLMPQk0dtBRrOKtnyuRy5ongKqPPzus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wn3fTvuQ0+7/MhUGKM5Gz1Zh8gnArArP6YouxNiIsp81DNc1/7YWc1KJ6nGuQu7NckUPeyNHoOrXOeHRQQ/llRjqxAgb0JdhcY0Pdm6pWvmF5TQ2jfo4w6OTZ3m1nsZGP5/gmQRmezpxO6q7XqHnu6QXB8njwRFEzWiwBLSBwBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q/RSjXtD; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q/RSjXtD"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d447de11dso3326736f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 21 Oct 2024 00:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729497280; x=1730102080; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=16KJyk4o73a0Vnw9Z4QFoe9Fy7jTXMvGL6+pdoMfdFE=;
        b=Q/RSjXtDlkngTmyfqxxTrVM7gcwbi79JxhWR8NmwhkwbdSx5oY66+SH8eI9DpShkCX
         FYD8Z76KR1fm3JBBcXLsFjebR+ar9mDR++da5P+G9tRLosyhs4E0QxTX7Upd6z7v+WRH
         7hfqmMt/dZLkwDNnMfr7SKFli42lOJAwEgOwbDrgO4B+xU3KM4mRY0EKdWvogjSx20xB
         fFA/TTdp/4DOIDVuavTREmLNTqdw8DdIODUOEEGC4C2gXe2uEFcqRnnfatsCg79rfvv4
         AuLUTXU/ZM2ANXKHeC0OLhJuIzBBaG2cSqfak5tRCIYxl8LCEBttQuxcmCUrZJEsNsx+
         O/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729497280; x=1730102080;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=16KJyk4o73a0Vnw9Z4QFoe9Fy7jTXMvGL6+pdoMfdFE=;
        b=ut1kCZrh/AD5qpeKc/r10wZo1DCqErfvAh+qwD1aPoScXZ0kzNcQsm5smiHceg2LiJ
         y9al/x6StnqMsM+2sNT0CkUBlu0P341O+GtviTs3BeLVUJbzHfyM4eGYzRfDu/PpwtKw
         4lqPMFL9FrlQmyARHXefRJl1B4O2LBD7PBTCyLZYglhy73bH8nBErwT1UFLXmgPuG+et
         M6gPjnbN3psaWLJz/FdWL/bToYA7vjHByjNF9MI1WcvlA67VsdE0LpATGtEiYAFqlQdP
         y/xGusKqstu5nitV4xjRQN5E3CY5FNg2pcHizsklQ78vzAzgAY0dha5KbLbLxF4QrdnW
         Oe/g==
X-Forwarded-Encrypted: i=1; AJvYcCW6BsmCVIL2PAXRUzHF95cB0YEun8ciIiLcWJNGYl7dOmlYZbye1KLly0Keucgf7EjreXxNVP3F5L0Ed+K+@lists.linux.dev
X-Gm-Message-State: AOJu0YwX+WHL/djdUYRX/txUw4gza55TJIXrci3yv4fwaTISA/sc+pYq
	1rrKtMe9VrRnjD81uXovEgAx0AsyH2djC8t5V8HGdy9TtHgVKy1+G70yvqLMOw4=
X-Google-Smtp-Source: AGHT+IHYQthg/Utg41AKFkOz7nI7k06rwyaEZl0zGIJurUJfUkte/1H3GE7cjOT4qIYUeXgYA0WIkQ==
X-Received: by 2002:a5d:6447:0:b0:37c:cd38:c51e with SMTP id ffacd0b85a97d-37eab4edfebmr5685188f8f.1.1729497280143;
        Mon, 21 Oct 2024 00:54:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a48d51sm3601987f8f.38.2024.10.21.00.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 00:54:39 -0700 (PDT)
Date: Mon, 21 Oct 2024 10:54:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kees Bakker <kees@ijzerbout.nl>
Cc: Dave Penkler <dpenkler@gmail.com>,
	Linux Staging <linux-staging@lists.linux.dev>
Subject: Re: [PATCH] staging: gpib: Add missing check for NULL
Message-ID: <4a049f7e-b852-4b69-bfd7-1a4ce3dccbe8@stanley.mountain>
References: <20241020192243.C6A0F18DA7F@bout3.ijzerbout.nl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241020192243.C6A0F18DA7F@bout3.ijzerbout.nl>

On Sun, Oct 20, 2024 at 09:21:43PM +0200, Kees Bakker wrote:
> This was detected by Coverity, CID 1600787
> 
> Signed-off-by: Kees Bakker <kees@ijzerbout.nl>

This is how your patch looks like in lore.
https://lore.kernel.org/all/20241020192243.C6A0F18DA7F@bout3.ijzerbout.nl/
The subject and the body of the email are far apart.  It's like a book, right?
The title of the book isn't the first sentence of the book.  Feel free to
restate the subject if necessary.  The commit message should really say the
impact of the bug, (how it looks like to the user) and you need a Fixes tag.

> ---
>  drivers/staging/gpib/common/gpib_os.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
> index d5860a0a131f..57ff1ed30dac 100644
> --- a/drivers/staging/gpib/common/gpib_os.c
> +++ b/drivers/staging/gpib/common/gpib_os.c
> @@ -1667,6 +1667,8 @@ static int autospoll_ioctl(gpib_board_t *board, gpib_file_private_t *file_priv,
>  		return -EFAULT;
>  
>  	desc = handle_to_descriptor(file_priv, 0); /* board handle is 0 */
> +	if (!desc)
> +		return -EINVAL;

There is always a board 0 so the check is unnecessary.  This kind of heuristic
tends to have a lot of false positives.  It's better to just ignore static
checkers when they are wrong.

regards,
dan carpenter

