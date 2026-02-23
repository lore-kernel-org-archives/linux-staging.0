Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCEC20B22
	for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 07:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771830580; cv=none; b=lCyZfdN5H2TmDJdhz+ZDjIfAZv+skGpkoiqffojqbmn8IGRskiTp8jrDBJY5AE6Ditg/S8Osobdh37zwZkVE67EJUPrqgnjuDWWcWeHLPZjsDL9/sAwDttxOjSm5RnM7YatAztHb3U4uHiJG4aVkT9tjk3ht8UFr7zTKr2GspqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771830580; c=relaxed/simple;
	bh=Iqtz2g3HzJhL00/YHzVQ3GOD3dwKrWISarTZCm7g9wY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ur0ebX1bhMpgCRzgSQgTBUx6H+ARv7U9US66OMxqhlmwH0oEKgusYglIp/i1e4CpiQjTUvMGldJzHEt18CkrhMrunqnK+AJWRdXZZPm2cub9PTIty25XUWHN0sWFBODU5aW+3WcptdPx4zb4qs27SPU5M2VK2gyuIfDVEXmPCS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vRNfb7QZ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vRNfb7QZ"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-435f177a8f7so3949785f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 22 Feb 2026 23:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771830577; x=1772435377; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H1wsuPiTOwW7PjkIjhH7GAbpoYbf9yyFH8CBGPXDy/Y=;
        b=vRNfb7QZmCGIerjifpLG3zJFRV/bXW6iPdR1O8jnmRS/mlDCQhY51sPsh2aZWKDecz
         +OPMlI905Ftc8Iw+zKa6rQ9Jmw2Ws8L7VH/A672ml7Ch3ZOVrECH5ZcgQ6AA10LP7CkT
         pbcrZewf9zjWbcroguLchFgywXNAl1Sjw76OBLcAPYF0VmZ5sIqiBNU0hHmev639KmMK
         0L8LaXmT8rc75nMPLJJK1d8OlIg9xV4V4ze33eqgXd1UOsINfBfTpH7Ghri/uLI3a6of
         AdojCpmE0hwQeGYpN1lnNrzV5kCLLi9XqxlkiuohNh75qeuHmXiffIc4XKiLssXgZBGw
         uqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771830577; x=1772435377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H1wsuPiTOwW7PjkIjhH7GAbpoYbf9yyFH8CBGPXDy/Y=;
        b=VqOvQ27I1k9Yf2PAELjtUSMo15OLHhwqhMSDIfqNsqjDd2rgNFy1HV8FEtRRF23lN0
         F8oLwanyhPT6jDnSkHvjGZoDVbXzC27M1U/9t+Da+QvlPPlFWbhIqgh49nvcl6CZjm8J
         Voodhh7BPqGuUMwSvhA+uGBvoxRoweEH1lNBGcN9o7gWXF/+MW5BVwzgeQBCbXI9Qgnx
         Ppmx9GijdfhzOE4yoWm4byG0NMxBz21lyeCGodntRh8Df4pCxNqBU9jcU4rDQppnsYJt
         R6XF4tvesxe2BLQ0QLn/dL5jMm/NAVYsnO2K195GcWq7XGjLRaTw+3n2kKzzM6UVUE28
         9MNw==
X-Forwarded-Encrypted: i=1; AJvYcCXpUQaBdYFR7WTuPdptkdhhbmTc/tbB+jQLd6/Uny6P8anKluPEq1sqkFANg0/8EARH6/CGvhmJQRHILDO+@lists.linux.dev
X-Gm-Message-State: AOJu0YzJT3IFjmF2YJRjLMc8J2VR/EVovoNhCN1xATn3mvrEUPIxi49a
	yoZBnVCCkKRwzzJcPwFRiPdBZINqaZ4NP7q0WXlbZ3AXKiJk6m4kAIhDY+q397nsafo=
X-Gm-Gg: AZuq6aK2uoA5MBFtf/7CJsmdwP9/V/AYja6JLuF2NSuSXck5QtGGE1JnMkLrLT5LZ8K
	Wpjn4kEnJnmyX2hGxA4nO2ocXb6jMoxEEApDPEUHbjJl1eaLYkRUwZ6fnKpMrXukWfiDxLXptfV
	UhgCCGM6LyiZVgL0AAk6nS77iyxPVKNBkuCeNC84rIjCKPhfCklFzwdVIdU03kqj5dxIp/XGsUj
	ugsF+MwEgCR3W646Bh5kztMmtFUuq+kG3hp5jR943ri263OI7xPlB51Az8UVTWm/UXqsNmF0D3q
	iCV/YXc/+gXumxtMxs3ssVVDzLsoEsj5jT5aEEvfsbGaJKgtzTr/xUTENRdTfZYK6fpQhSpwqG6
	70zl89D6I8w0kD1adYjrclAzA1VSTWn8wVKocJ7Rd0LCQYpi6Hjf3EMYNURtMkg==
X-Received: by 2002:a5d:5c84:0:b0:437:6d8c:c08b with SMTP id ffacd0b85a97d-4396f17fc6fmr12479096f8f.49.1771830575135;
        Sun, 22 Feb 2026 23:09:35 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00db8sm16849488f8f.12.2026.02.22.23.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 23:09:34 -0800 (PST)
Date: Mon, 23 Feb 2026 10:09:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Cc: Priit Laes <plaes@plaes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Archit Anant <architanant5@gmail.com>,
	Minu Jin <s9430939@naver.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Yuvraj Singh Chauhan <ysinghcin@gmail.com>,
	JJ Strnad <strnad.jj@gmail.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	William Hansen-Baird <william.hansen.baird@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
	Navaneeth K <knavaneeth786@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Zhuoheng Li <lizhuoheng@kylinos.cn>,
	Michael Huang <tehsiu.huang@gmail.com>,
	Nino Zhang <ninozhang001@gmail.com>, Ingo Molnar <mingo@kernel.org>,
	=?iso-8859-1?Q?Rog=E9rio?= Fernandes Pereira <rfp2005@gmail.com>,
	Diksha Kumari <dikshakdevgan@gmail.com>,
	yingche <zxcv2569763104@gmail.com>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Karthikey D Kadati <karthikey3608@gmail.com>,
	Akiyoshi Kurita <weibu@redadmin.org>,
	Erick Karanja <karanja99erick@gmail.com>,
	SeungJu Cheon <suunj1331@gmail.com>,
	Sun Jian <sun.jian.kdev@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/11] staging: stl8723bs: Use common round_up macro
Message-ID: <aZv9K1It5Q-J5Iaw@stanley.mountain>
References: <20260221190628.50273-1-plaes@plaes.org>
 <20260221190628.50273-2-plaes@plaes.org>
 <517df668-cc9d-4a9a-92cb-04aa80069a56@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <517df668-cc9d-4a9a-92cb-04aa80069a56@gmail.com>

On Sat, Feb 21, 2026 at 03:41:27PM -0400, Vivek BalachandharTN wrote:
> Subject has a typo. Please correct it.
> 
> How did you test this? The driver code appears largely AI-generated unless
> it has been validated on actual hardware, such as Pine64 Wi-Fi module or
> another board compatible with rtl8723bs considering these changes are not
> just indentation based.
> 

The patch doesn't introduce any bugs.

#define _RND(sz, r) ((((sz)+((r)-1))/(r))*(r))

This is the canonical way to implement a round up macro.  It's how
roundup() is implemented in the kernel.

The patch uses round_up() instead which is a faster version but it only
works for power of 2 rounds.  psdio->block_transfer_len is 512 so it's
fine.  I probably would prefer to use roundup() for that even though
round_up() works as well.

We maybe should create a static checker rule to warn about using
round_up() for non-power of 2 values:

KTODO: create a Smatch rule to use roundup() instead of round_up()
       for user supplied values, or non-power of 2.

regards,
dan carpenter

