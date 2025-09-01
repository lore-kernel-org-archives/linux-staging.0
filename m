Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDB178F5D
	for <linux-staging@lists.linux.dev>; Mon,  1 Sep 2025 10:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756723869; cv=none; b=nncR52NyQyXVgeqPe/KM1C7yFxlcDgXz0UAdnSXv0pC+kd7vvQxodw0TMWG+OWi4y9uaUWCbvkGLIC/968RTUrSKhOVnmxcIMqmKHztwWBvymm/oV5J83OkYzGrGaJ8XWXoSYDGuTHu8H2em8N4aLEE4T0p2obgu0LNs4zwJAEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756723869; c=relaxed/simple;
	bh=c3AWq2+aRE6uJyjTcxkkvR1nFxFlag6Rj997piwPcZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gkqgq3EVjheUdqFsnY0G3fcAuneYE0B3RnDMOA2Z5TFN8G57ZilXPjfCVgr96LOB6b1Xi1kIx/OKoHHCVUalTw3OpBxE2OQ39rPqnjy4mrQ2mrn25QHA1yMyl8umOF3JNNpRlUrwc6U246xJgTmlqasBqNQ7OuflrX61iEM6K18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ofZEHO3p; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ofZEHO3p"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3ce772ce0dbso2753602f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 01 Sep 2025 03:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756723865; x=1757328665; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wOpFznUBHcwhp4Aa+t8/Mwg69Xfy6GS/mz3K6gMcmbM=;
        b=ofZEHO3p0IK9eX+axJ/p6Cz4USmr3cGeDgInilC8r1MvHq0N9YtbqowrQRAG5yVyGW
         fm3HakkyqytLo73fTHHYkeymkTaQ65wwW0+0w3vHvVV3tAVAjVtl4Wb9uwh1dBftNTpY
         H+WosOCH1Qmfcnqq7mdAWr1SyapIVj4/g/G0d790xOexeJsBZMdxWxZ/iMXEqF07y83B
         fiFak0aObCZPx+FvQ3XisjetqbV544L2b4jkocCwy4T8yzN0KJtBInelJ4p2hndYHOAz
         Mb+i2Lv7Xftjz9ltPEsrAyyjQxazKE9Pby+jPNaoNSrN84Bs/NGM30pQVbRAYhy7ZFEP
         yKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756723865; x=1757328665;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wOpFznUBHcwhp4Aa+t8/Mwg69Xfy6GS/mz3K6gMcmbM=;
        b=eMIXErA6W2hFL50td2aZtAf5JaL9iPZuQBplSGzaeIIEG6cGM7IMy0E+b5dfQ4K+24
         CXBhnJVnXOcCObNj5aSorlBxuL9vHFqncSWcu+jKLcrlepSMYaPWBRjlm/e6+ZwbQaZj
         Kw+TG0oelMoCn97mJzYmjHTxjgVAYrnO7nlF+t5Efm0q2sm46dU0meKs0c3GoTW6M+mo
         NdCpBzeGYu0swZiHuxBw1WomVyPQgIiY0xHxFa5sx21HI2oaA6mcRKLTxZUYcirXSaiz
         D4KzOP0zClEqJp5kxSfAdhn856CmvurJ+uGeC8AccT6VNdIKY24QiC2aZY+KvGEmjFNs
         ODYg==
X-Forwarded-Encrypted: i=1; AJvYcCWvyj1dHhjHNT5ruST1COPKUzT6V9Oj99jB1qnKs69cTw89CKfVmLFkbBMuo2VkxV6lMJZaIHDnN/FyOBm7@lists.linux.dev
X-Gm-Message-State: AOJu0YxeDlEAZ2lf+JMZz7tfZFrCibAKvI7eD3Tp4Mauk3FaLNEq9wgm
	AJefza2z+olFP0i50NOe2FgnrNb3MKbHwxdTZrlxbZ6UbJoe2tyuWWYdhGOZF+zBHRk=
X-Gm-Gg: ASbGncsX9K4zzRJxdRpxhgUmorG+IXl3TmvYVgzaDyYB1m/L59+qHHiaH6TZjDlq9+9
	ZBlOIbh6bdyDPb6tAOP0D8eV4pxMLjZR6vIGu5rCY3W0vrfTd7Md0uPZ0cST8AdInO8YAi33PL4
	U54ocB67qGb/p580rcoMK4iui8DDgdn4Gi825nxBGHccxVlNk4xKh7NY13jC9JMpO2vmWmmCFQ0
	yzPskJWFDMN5hkeGo8hQeE5tubHATa0Ice8l24Br3bNHx2zj46vXvxkkfpNi2TXC3lQUkJT08Oj
	rg1zFvjXP2flB3OQ7aarvPuOF/lh3nuLy3Bp+3usTgFN+l3ibXl1EhHK7xIBmleNCL7Zb0w0N+m
	LP7Bs+GT/+cefabMZYete0dvor9w=
X-Google-Smtp-Source: AGHT+IHHuD3FBRfv5Nxn4YsvqK/oKdbA0bdrkOdxRnh4/fqC0X90je6gaBStTovt5jXxCQ/QupdLWQ==
X-Received: by 2002:a05:6000:4022:b0:3d8:1f1b:9c9f with SMTP id ffacd0b85a97d-3d81f1b9fcemr1107840f8f.55.1756723864751;
        Mon, 01 Sep 2025 03:51:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b7e7ef7cfsm151725455e9.6.2025.09.01.03.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 03:51:04 -0700 (PDT)
Date: Mon, 1 Sep 2025 13:51:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: gregkh@linuxfoundation.org, aleksander.lobakin@intel.com,
	sergio.paracuellos@gmail.com, pabeni@redhat.com,
	abhishektamboli9@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: octeon: use fixed-width integer types
Message-ID: <aLV6lF2gutK24RtV@stanley.mountain>
References: <20250829200107.132443-1-osama.abdelkader@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829200107.132443-1-osama.abdelkader@gmail.com>

On Fri, Aug 29, 2025 at 10:01:07PM +0200, Osama Abdelkader wrote:
> The kernel coding style prefers fixed-width integer types defined in
> <linux/types.h> (u8, u16, u32, u64, etc.) over the C99 stdint.h types
> (e.g. uint64_t).
> 
> Replace uint64_t with u64, uint32_t with u32, uint16_t with u16
> uint8_t with u8 in octeon-stubs.h.
> 
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> ---
>  drivers/staging/octeon/octeon-stubs.h | 1745 +++++++++++++------------
>  1 file changed, 873 insertions(+), 872 deletions(-)
> 
> diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
> index 44cced319c11..ff6509b28cdd 100644
> --- a/drivers/staging/octeon/octeon-stubs.h
> +++ b/drivers/staging/octeon/octeon-stubs.h
> @@ -43,144 +43,144 @@
>  #define CVMX_POW_WQ_INT_PC		0
>  
>  union cvmx_pip_wqe_word2 {
> -	uint64_t u64;
> +	u64 u64;

This was already done upstream so the patch doesn't apply.

The point of the octeon-stubs.h file is it allows us to compile test
a bunch of code which is specific to Octeon.  The real code lives
in arch/mips/include/asm/octeon/cvmx-wqe.h.  These files have diverged
quite a bit, unfortunately.  But I guess everything still builds...
I don't know if it's really useful to cleanup this fake code while
leaving the real code as-is.


> @@ -1380,12 +1380,13 @@ static inline union cvmx_gmxx_rxx_rx_inbnd cvmx_spi4000_check_speed(int interfac
>  	return r;
>  }
>  
> -static inline void cvmx_pko_send_packet_prepare(uint64_t port, uint64_t queue,
> +static inline void cvmx_pko_send_packet_prepare(u64 port, u64 queue,
>  						cvmx_pko_lock_t use_locking)
>  { }
>  
> -static inline cvmx_pko_status_t cvmx_pko_send_packet_finish(uint64_t port,
> -		uint64_t queue, union cvmx_pko_command_word0 pko_command,
> +static inline cvmx_pko_status_t cvmx_pko_send_packet_finish(u64 port,
> +							    u64 queue,
> +								union cvmx_pko_command_word0 cmd,
>  		union cvmx_buf_ptr packet, cvmx_pko_lock_t use_locking)

This is messed up now.  Just leave the indenting as it was and fix it in
another change if you want to.

regards,
dan carpenter

