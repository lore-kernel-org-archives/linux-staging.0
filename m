Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A993B42F3
	for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 13:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478241; cv=none; b=lKwthcquWpYtjSkSST9mnIyui5p4wcSIaoEKA9dPwtIWgc3MWAWoPWRNsDRiaM7NDXoYeYh0PQcs4FrQkdBcN/bsFkWB7RvbJh0+CvsD6rOxP0WPzVlIRn3CCrVwIEmSDyEfCx0L0KCUN+Q8TnGWwtU/iLOCGmPrG7sYAlk7ygU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478241; c=relaxed/simple;
	bh=PeFihLQ+e3Ey/2XTvIqLp/rsmvNZcxzZ0Nn2aECEjJk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l40VtQ9IT1mp28S8SzZjzP1jf95wG1LGIkRyxV90SrBDo+MnsWuEK1RqKxZGkgc4KXrefkDSCVJWBxmvoCz3Opm6y1+JdgnSazDy7fdr5R/jWTn2N0QGMRH9PCM8+ngqJa/+cnZRN9w83QHcmUDZJLpHABVa6q3VbXyKCuyHDy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gmu6vH3Y; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gmu6vH3Y"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f7db0so51981466b.3
        for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 06:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789478238; x=1790083038; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ky+km9SB+CxkGYQT+Ihg9VmqJMBueSg4hZ23dJAFm7g=;
        b=Gmu6vH3Y1GIim/rwksHHgNDhfWOV8MJfF4LrNlFj4VHxFVSR8EQY6N1U6Tikg6yPoB
         8qbbQZcQEwEo5pHP0Cco1C6OYtktiIPADJUN7kbrt/70oQd3Az3frEQCCGVk6pMywCYg
         FM3RTPMtufBXKCXlq6+x344SUrMvmrOEcWYGD141Psg8YaXeuWvlUmvQLKeKX4gYTGh0
         13C1pfB7nUNaQBTzlMRJBVXLWrUWk4FqMKmIU0q3Y56X9PCs8pbNYVSK4yvSzy0FqCpp
         FXB4DzMBDn9i4gFLwD5Gihhe1ru38cMPe0VB7YpfgRlbcd5g5oVMRJ8zBmQ343Blf0uQ
         aJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789478238; x=1790083038;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ky+km9SB+CxkGYQT+Ihg9VmqJMBueSg4hZ23dJAFm7g=;
        b=1vX3koKEZ8Y57KzFsJXEi2bjaFRydysaz0WklnE3sTgkxB0FzWBCLfo74yySBnQo1v
         Qp06n2ujLz+1w/2zjn/T7xMRn+RbUgmraEABDUROm2asfV0qLYLF6S8pwx4IaIyidQEI
         zU6bkYwUH+EmCQKQjy/zzKl2yOQVmLa8iGB1aKB1VHcwQO3i8Z4gdfFD7fFnWpWoEesc
         pxhxQmw8Y1r7zxOt8L56kVZ/tEG/3y1c2jkrqhuP6nFkWa3ajS7k5bZh0CeK3JPN4Wrr
         0omA5jw4hVXHpXz2VAD5FoUYU5xn5s90FSLJTBxxnpeAi4gjqKqPiAjfFyQFn3OP+vON
         f/VQ==
X-Forwarded-Encrypted: i=1; AKwUvBwg01eZST6ZicNumcWWZIypEpHvk6qAHbn8NDIe6UnB9O0dGACy5a4FEOoaIII3/MSM/8ePjUleU52tfsJ/@lists.linux.dev
X-Gm-Message-State: AFuF++lzv2JjkfL0SUyb8xo2gO6fv1Frtc+Ixa0B8ofelpCKkNxuQCGE
	PxNGT5GrkFqrVhSw4P6NFK1TcNjLfYEptBN1hHKWFc3z3e5rFF4VBY/d
X-Gm-Gg: AYBFou1rTaW8Nw1uEefLVvq8dVsrJaHqJ7z3U91Ead5o3W1eQfFp8lN9wB8d9OovP26
	bVQbiTUFOBNq1Zykd0WVtX2hLgJ3jx4DgfahMId3q6q+U7pAyqpiJRzq4y+bMH9NwNH+0Agyq1e
	Z6hPK8hgQatICvWLc+dv8EI0v4L4keVk/rsiNqG+U2SudbXZ1DYDRdCqN359yRcpZAaE7f/+ro3
	ilpDE2QIimQs1BZzZJsDMImzztIeLHjr2tlAdfF6z1g3tanT/xZclPsLBblvomLDjglbli7Wrqh
	aI/EXWqau6ubYxOYKzlf4mWEBK5usVNn4hv8Ojcem4tHBavRmLqPaKflHVJy5Vh2zM7Od2ygsrd
	K8ucB2cB7xHXveontTeucZT86hnUqi66rRjCNYQy7uzYGatxT/tilCvevG/2DLdfHrNdy0lNr/w
	GheUtwp5qGfOQXx80/TFBgwm2epds+GrI7mPihyux7fppc+90ARydV/ZuhELlqOFDWKXF0/Xy+T
	fOdYznggJXY+YJjFXkWSeWsbfCIQrvErz/Za8OyoJ9ZcvEJi4lEDKvWdwE+2fj1EtXZMjskmkoB
	U/bQ6t6EgYnGqGSbL3YtP6P8XEZJBIMCFiCuY49yOnKeXjeZvBVISUp50pUkcslM3TMeL8Ovcqb
	y/6HEQFjHNbApkwZ8SbZ/o1/iK0uXulUoFYPsQXjMj85lLtkFRA2zfXHG5C7LlRgUgBg/SKenkN
	+g1JCv
X-Received: by 2002:a17:907:9702:b0:c29:41e1:c918 with SMTP id a640c23a62f3a-c29d7717ca5mr96666966b.1.1789478237989;
        Tue, 15 Sep 2026 06:17:17 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296608dc91sm589042266b.39.2026.09.15.06.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:17:17 -0700 (PDT)
Date: Tue, 15 Sep 2026 15:17:16 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: jic23@kernel.org, gregkh@linuxfoundation.org, nuno.sa@analog.com,
 Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org,
 linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/3] staging: iio: adc: ad7816: Fix SPI operations
 race condition and DMA safety
Message-ID: <20260915151716.000011c9@gmail.com>
In-Reply-To: <20260915075939.18180-1-abdelnasserhussein11@gmail.com>
References: <20260915075939.18180-1-abdelnasserhussein11@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Sep 2026 10:59:36 +0300
Abdelnasser Hussein <abdelnasserhussein11@gmail.com> wrote:

> This series addresses separate issues in the ad7816 driver regarding
> race conditions and DMA safety across all SPI operations.
> 
> Changes in v7:
> 
>     Patch 2: Moved the mutex to the top of the ad7816_chip_info struct
>     (right after the pointers) to prevent struct padding/holes, as
>     pointed out by Andy Shevchenko. Also expanded the mutex to serialize
>     ad7816_spi_write() to prevent race conditions.
> 
>     Patch 3: Dropped the dedicated rx_buf. Switched all spi_write() and
>     spi_read() calls to use spi_write_then_read(..., NULL, 0) to safely
>     handle DMA using an internal bounce buffer, avoiding cacheline sharing,
>     as guided by Jonathan Cameron.
> 
> Changes in v6:
> 
>     Separated the alphabetical sorting of include headers into a dedicated
>     precursor patch (Patch 1).
> 
>     Kept the mutex addition strictly focused on serializing the read
>     operations without modifying the sizeof() argument (Patch 2).
> 
>     Moved the sizeof() argument fix to the DMA-safe buffer patch where
>     it logically belongs (Patch 3).
> 
> Changes in v5:
> 
>     Split the changes into separate patches for bisectability.
> 
>     Replaced stack buffer with a dedicated rx_buf aligned with
>     IIO_DMA_MINALIGN.
> 
> Abdelnasser Hussein (3):
>   staging: iio: adc: ad7816: Sort headers alphabetically
>   staging: iio: adc: ad7816: Serialize SPI operations
>   staging: iio: adc: ad7816: Fix DMA safety issues in SPI transfers
> 
>  drivers/staging/iio/adc/ad7816.c | 29 ++++++++++++++++++++---------
>  1 file changed, 20 insertions(+), 9 deletions(-)
> 

For the whole series:

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
