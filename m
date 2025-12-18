Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781BD34CFC4
	for <linux-staging@lists.linux.dev>; Thu, 18 Dec 2025 15:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766070999; cv=none; b=hzFMysxlfZ02UGUOstj6Xm3Ibsmzf1v1dNVUpc3r78EvsWYYHCLjvEXdJUcnXZhEloTRRD5wnOlsCFoJNKw0gNgPFV8wMAuXImns4MKaKcNq04qUcK3mr0tO7mjHfRln+CSXbf12/AzTS+lWMQ9OUD6xhecdhkuUDvi/ayM6tC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766070999; c=relaxed/simple;
	bh=ffSKSXXWSRpI3xx9H/itO7rvifidsrztH8orFHjfVHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C3DGMrlCmTgQE4ONavv8+Aorhksyz0CiPwRLmmUEnyOd01LRLOKzoqeD10PRIriTs1Bs+AuNVc023jHdXSgISBzpkfHyL7Zwou+ObUzn9DshZAbDbMoYNKWSYqEQpQuMBaMYTUp8YTyc79x/rbzir6RqQ4LHGZJrdlgom3CX7u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZobZLfvx; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZobZLfvx"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7f0da2dfeaeso814067b3a.1
        for <linux-staging@lists.linux.dev>; Thu, 18 Dec 2025 07:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766070995; x=1766675795; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V4YgC8/woMPQ+Xj9m7PS+PcfWejcCQtxAUQpAaE4ZbE=;
        b=ZobZLfvxPnbqTzLVTkt9s3y7outCC2RfXZFUmWzEG2Dc6EO+HvcYFe+FC+rxejhrQm
         +UTyXtB8QYKHjGCMaqLgx8wf84S1p1A+fCe0f/uVRa8zc1FC5sBJqLK2WJwhcrfKf37Z
         SWRm0em2O6ZobC84QL67dTSK6bZi/OzTX6gtS6eVOzgvBMRqCZQx6mrw7BTbR3eNCYTN
         epSFGwCHlQk8caw9MI8nKXsnKSpVkiruIw34ERtwimX397NDymC1NVVEXHwkrwkJbOiT
         hCpr+XKhI9D6a854kDza9DMGI935QMSGzcKKjJd6jt6Lg5ymW/t0DTUjoeWyp7ILNIVm
         rYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766070995; x=1766675795;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V4YgC8/woMPQ+Xj9m7PS+PcfWejcCQtxAUQpAaE4ZbE=;
        b=n1ZMEkf9Fe9o+oV3DE0aol+Vlp5RQ2wi4k/4F1kk9u3Mv08o9BILNTjN1/Ef44rsHS
         nzPnAssETDbn1GxKWZKI7OfcBJM68CMtXGfq5fHC3dYsJTfTzxyZLtMnnLCv5AdSu9qF
         Rs0j0oXQ2aSNOPoL8UVyzb8e0ZJRdWi6EN075+BEjEYxuDpWFM5kz4A/OFKs+QCh3zFn
         TvxfpN4EqcWeky/sxbaSN4bbUCjXYup226ucmeZvbMLaenTHxqv17B/Z6tTxI3nCm5aH
         ikB8xP0DTAfgKfWJdYy2Wx7TErkE25b465qXjZuXIHZI77R3wQ/fwgxaoSj7kSk87cEC
         /MUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSMIukJubzxUyNb+rdUD5CfAtGSvufMQUnznMke5kNcpgYyJ2FO+j7tNllaZ6RFD+PfOebDpdijJoGqJLY@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9rJ+z0gHUMAu++Wc+Le/8cHeFj5gL0A9+lCAUOjOf6Etz8SpT
	M818J3/SduC9kUAKNlZ1qbJfdx/9+2os4G8YPRerchCPKzOgIVBahPBk
X-Gm-Gg: AY/fxX5r1zoC6KF+aULDcSbO/Kk2TbSK6lYYkAOnn8F/EMdK81oeStL6ADxOv/2Ar8L
	LvuCVuZ/4z8N4lTbpEpap8SjEfhuFWKzIJG0d9mJvSmnnNvIBuXQSz/J1JCEfedvsI0xIHXO77K
	g1cgF991UMbh05q9UOS7UaAqu37Ve9Zxj9L5uvZv/Y2RUabKPsbXq0JPyXKXctbptmi2xicW6l+
	7E6uQiatsZquDxY8rJEgAUGkQZMEmbWOYZ99eMkaMH8kB5ZSo5fn9HSdm/kXqnJGsO9kqAnwqi6
	vMBKNlMvAN4TP4LvRmicN+byA2FYwsIlYoOsefC2AVwxkFICEfwLzsCAxXyQRLMbsVQ2Iz/0y4C
	0w1EFlg0x8RVv1ftqlseC6egBP864Wr20vzVrvEWsAFh0mmvStutavj3xB/e4zjI10hctZDoBsr
	FRL19lwIAgI6OiT8RYWo9hTM/AWHiD4dyBTmgMkSegdlvVwpBlMgHRJSzs2DHg2yP50RRGALAJG
	LikggrCYdVnLlcvnzla3Au2eE9k+6F4233qLipHs+jFyHleb45clZG0ZejScC4ZtV/D
X-Google-Smtp-Source: AGHT+IEFIRglE5Bb+2e+0uum5FO1qaZ3iQ7LMvzkffpqPwvsjCl32isCjpg6y5tRTxoVDhkYEOmzfg==
X-Received: by 2002:a05:7022:1b0c:b0:11b:ceee:a49f with SMTP id a92af1059eb24-11f349a17bdmr15451076c88.8.1766070994721;
        Thu, 18 Dec 2025 07:16:34 -0800 (PST)
Received: from localhost ([181.191.143.42])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12061f5412esm9195941c88.6.2025.12.18.07.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 07:16:34 -0800 (PST)
Date: Thu, 18 Dec 2025 12:16:32 -0300
From: Tomas Borquez <tomasborquez13@gmail.com>
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/5] staging: iio: ad9832: convert to guard(mutex)
Message-ID: <aUQa0IBuE7EITq9G@Lewboski.localdomain>
References: <20251215190806.11003-1-tomasborquez13@gmail.com>
 <20251215190806.11003-3-tomasborquez13@gmail.com>
 <aUQQ3YnaZau2RO2d@debian-BULLSEYE-live-builder-AMD64>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUQQ3YnaZau2RO2d@debian-BULLSEYE-live-builder-AMD64>

On Thu, Dec 18, 2025 at 11:34:05AM -0300, Marcelo Schmitt wrote:
> On 12/15, Tomas Borquez wrote:
...
> > -	mutex_lock(&st->lock);
> > +	guard(mutex)(&st->lock);
> >  	switch ((u32)this_attr->address) {
> >  	case AD9832_FREQ0HM:
> >  	case AD9832_FREQ1HM:
> > @@ -203,22 +205,18 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
> >  		ret = spi_sync(st->spi, &st->msg);
> >  		break;
> >  	case AD9832_FREQ_SYM:
> > -		if (val == 1 || val == 0) {
> > -			st->ctrl_fp &= ~AD9832_FREQ;
> > -			st->ctrl_fp |= FIELD_PREP(AD9832_FREQ, val ? 1 : 0);
> > -		} else {
> > -			ret = -EINVAL;
> > -			break;
> > -		}
> > +		if (val != 1 && val != 0)
> > +			return -EINVAL;
> > +
> > +		st->ctrl_fp &= ~AD9832_FREQ;
> > +		st->ctrl_fp |= FIELD_PREP(AD9832_FREQ, val ? 1 : 0);
> >  		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_FPSELECT) |
> >  						  st->ctrl_fp);
> >  		ret = spi_sync(st->spi, &st->msg);
> >  		break;
> Since we now have the mutex unlock handled by guard, why not returning directly
> from each case?
> E.g.
> 	case AD9832_FREQ1HM:
> -		ret = ad9832_write_frequency(st, this_attr->address, val);
> -		break;
> +		return ad9832_write_frequency(st, this_attr->address, val);
> I think the last return (outside the default clause) won't be needed anymore.
Wouldn't work because we need to return len too, so it would be more like:

 case AD9832_FREQ1HM:
		 ret = ad9832_write_frequency(st, this_attr->address, val);
+    return ret ?: len;

Which is a bit more repetitive than just returning at the end ret ?: len,
but lemme know what you think.

>
> And, since you are touching the lock, you may also update to use
> devm_mutex_init() (that would probably be best appreciated as a separate patch).

Yup, sounds good :)

Tomas
