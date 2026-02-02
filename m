Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA3513B7AE
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 12:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770035882; cv=none; b=o8WTv0zib45puCZw34yHab/FatMAD5HaLxchmJyi7dnJEPqBkYDTjb5vDhqUgjNXAbcg379I7Zcgtuk+HM5M0bt6lUB6wYeJSm4rs14rtGz3DaN8zk1yxfVyPbYPt082NMprU1ekWxnkggE4U/7Em5Wtyt96xAXfe1QP+AMAmLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770035882; c=relaxed/simple;
	bh=HSwUMLd/yGlgvyHaC89kDSvldD/ESaUAptFVPplMvuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HI0Dw6aVWsqobA07y93gvFtb7RgRpQ9egH7Ed3iFcyuk3KQJqkL1/TY4ah52kK2iASfbfXHK+gUyGILZk8mXWjLLDZOfBzZRrU6VyXO76US+cPYg9o6R/lvZQ9TYn2xnuTp3aaU/8ExILnrB3LqPTujz4zfYEotYIVB6dCDjGYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=APHqpSmE; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="APHqpSmE"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so46832405e9.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 04:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770035879; x=1770640679; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ahzBrJO/CVxOcxCAQecOtV25I5HBHbVnY0Gz3c1/ekc=;
        b=APHqpSmEJLvmgVxidcs06XgQG3Gb++f1xIKEdKiiocsWfUYe9i25HJy+CtMDPc0O50
         Npof42FU1JAJvqm0ajIYVgHfMoK/LbNeMa81PUQLoN+AI+aqoObKCz2LyKGZ5c0mELtH
         aohWNhbXmsYCH4cr1MIVbp3VMJvDvoLjs0CTvgAvGXyZ63mOeHmwG2u/gYB0aD+x/xVq
         iKLI0zX33FT//oGzPJRMS/fa3FP67ZT9vz0BJXVDpxq6oSPOTOkYvqZeO73kVhSr+TVR
         FYWUOnwTyvGyRGTDjPQDrrpVLX7LyPadDt8FG71p3T6SCnS9EU40K4+tHo+/OaBRM3q4
         J8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770035879; x=1770640679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ahzBrJO/CVxOcxCAQecOtV25I5HBHbVnY0Gz3c1/ekc=;
        b=IeVX8GKn1wQGM5vbint/wYLU1EnbYdJTHe26TdKe72tTrtHb6e0oGJlxzZT4Uvs6pO
         B5NGPxsBzTevQu1iiaSl2D3uyIESURuxDowKrU/uZteXmmwjr0DcJmMzMPYLRnFLcdWf
         L9MiKSB3lU83vtrIdXDuHm2kE7VuNsu+/r7xukeIYYt6FlrluBMoiGVlNujyzZWNNNZn
         qw5MX+gmHJVI/eszEqvZSFVQhF2x7RB8A65uvHIW2AvjB0OKi0/qdW0XHHTEp5yuO9g8
         ej5cmUDAg8TVm2J/GgqPL+QDmgHOWJuSnkcunYe6GEoCtGf+hykCZ7w3mXZxlV/Sygbi
         777A==
X-Forwarded-Encrypted: i=1; AJvYcCUopM7HDNMgQxNIVVCA4i/sjiivonQGTvr+Lwn+2UZEo9TJvbOhOJk4dbxlFiQS4VJOK69XUrzxJY1228CH@lists.linux.dev
X-Gm-Message-State: AOJu0YwqHcv+ceHAdntoeun+lNLP9Dk45ITL9ZJRhsYUnpxlRe4rYkeb
	mkBL2IOJP8dKWLSxktTX8d2jGcfOVDUdKIY1ba8ukS8xzBlbVQPl/x5Z78U2bVKoO04=
X-Gm-Gg: AZuq6aJpyan3rH4CYQChO3j/sTPhUTJKvTHharcWxJ3s+btO2TZzf6YcOvlRLJ9oPZO
	FdO4gdFYMGbb9pon4OB6YxXwC3fxge5UqMFmASxctNxUqCv6j0C+9qUyhzFQeH45QP0CAdOXr6M
	VZifU4ixsUCi9DPocP/YVDwTeqWZEwx/c+2ifUPjiTD/z0ihxBVkuEp2rfVKTtw179IJSXBhbp2
	i76TDfT0axo2RtZDUQxmwv/zizypWvcCnOsoMV9GvK2g0MMmMOIQJbcbPiU2ceDG/GK6AfD0tTH
	Hn5jFm2P8OE4SrP/xJjeoARaPhQqOap0HZOb/oWz/zxtmWiHzCEy8MuoWWMB8osv5hnzNWZ21Nv
	j4gzNV27uIZA0wH9Z1N7m/dno8IDCjaYy2+/4aM57+xwgCA6e7RVz8wUkt0JSc/Pmr5nk1O5HNS
	Xkcn41ZXuxdOLLaKkAWhZrEzzzBV0=
X-Received: by 2002:a05:600c:c16d:b0:477:63b5:7148 with SMTP id 5b1f17b1804b1-482db44d22dmr160338675e9.6.1770035878982;
        Mon, 02 Feb 2026 04:37:58 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cdeafffsm369948375e9.7.2026.02.02.04.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 04:37:58 -0800 (PST)
Date: Mon, 2 Feb 2026 15:37:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
Cc: gregkh@linuxfoundation.org, ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] staging: axis-fifo: refactor device tree parsing
Message-ID: <aYCaoph9RMvM5azb@stanley.mountain>
References: <20260202122317.13821-1-gustavopiazdasilva2102@gmail.com>
 <20260202122317.13821-3-gustavopiazdasilva2102@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202122317.13821-3-gustavopiazdasilva2102@gmail.com>

On Mon, Feb 02, 2026 at 09:23:17AM -0300, Gustavo Piaz da Silva wrote:
> @@ -700,4 +673,4 @@ module_exit(axis_fifo_exit);
>  
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("Jacob Feder <jacobsfeder@gmail.com>");
> -MODULE_DESCRIPTION("Xilinx AXI-Stream FIFO IP core driver");
> +MODULE_DESCRIPTION("Xilinx AXI-Stream FIFO IP core driver");
> \ No newline at end of file

I guess you accidentally deleted the newline?

regards,
dan carpenter

