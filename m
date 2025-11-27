Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7282DEA87
	for <linux-staging@lists.linux.dev>; Thu, 27 Nov 2025 17:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764263192; cv=none; b=qr0PbELVK3PvJ9g8m85yxbYHE4wt6f1MJEICoIPAv4/7R+jBOzVzZThMFxlJH1gSkJWtOPhZ3hG3rY7k95sOlF/Io7lf+cVPE7yxhB+fU05zbHICOcMxiGJoskZDrJU+Lvk9WjGMnTtz+2ckEJ6+t6vG9rS+pcfpVpb+bttmbmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764263192; c=relaxed/simple;
	bh=BAsPRTaHtCi5CeiW4Of9jHSn6/wypn/eJxc1JvhJ/tI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SrZLEoi7AxI6gKRZIbcPygwONzg/umxhUAY47h9A4HfDdMeLemKNOQgeXraYTIYKf5i34cfDoQAeV4dyu7LHI9RKKecNN8N+BdIXQAAezzFIvEhjD1B7fDmeCI+sS+aH4YRUXbIjHn8NVnkmijifEztfpnW6nHLFrREDkJ9bAO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dn+VvAkY; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dn+VvAkY"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42b2e9ac45aso713202f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 27 Nov 2025 09:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764263187; x=1764867987; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+OE5oMTnGnlJbhPFxwrvT5xdAfGsP+uSOcGdK+1GC8Q=;
        b=Dn+VvAkY8GlLqflXoulc0wXrozX0w5RlHGtzoXXvSntZeIEls1HyfjsTpXuXdUJCZV
         7g+2I4AfXArUqfmskcSuftdJC0lhuAS8khr70oGAQp+JPLjXT6M1IJZFpu2JLGm7W9WX
         rldnvwAXhdcnWXDAV3FYR6Ta8GjHAdChoYeYIt7MvGkf+S041s5Ifh4ww/wNHlnUrlZc
         czEWV4tDMTlvRdAu4meCTSDguDcNW57cAOwOgaclCapvubqcBeE8MBpGTATN6xVGJs2J
         ob0JJTupfzKvMcUwZV4e2S2rH2fm86sDOpi5gF10tEbHBZsvG8AzOa+lUfRMehy+s+r2
         Rnlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764263188; x=1764867988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+OE5oMTnGnlJbhPFxwrvT5xdAfGsP+uSOcGdK+1GC8Q=;
        b=qX3xf13DD6lzzoSyrnTySJtUWzKEb+PjcZ5OU/cf1svDXzpYRpVloNEkOKr7LIzjKz
         uv1qT76WMTxloW1YBB8d8w65m1r/NgRhQzJpwq5tt3mHJ3ApxFPe48YKxj9TQqkk4VKU
         IyIlKDlMJArLDw4hWbkpmAIVcnCdHBMwNReEogrAJ2AazbqPEg/n6zNKZxu9GSUBOL5x
         /oTJtqDA2rScn6hVo+HLY9lI6Fj4L0BWn1ZTH+e9BSeLwoAkHGH1kK1K1BzG1pRk1R7i
         h0DNKD7pExPSvyyLTSnRHHl2rp/5plVtOZroB21ndVXj2lwQmKirH0JqiyVsYf8GDr4f
         uhLw==
X-Forwarded-Encrypted: i=1; AJvYcCWHsPcCnVXJiM3K3Ll+RxqsVkIEBBc63lnk0TP/lSUlNmxe4do9WB3OD3iWtY8bjbI9gNgOljPY1+96kfqa@lists.linux.dev
X-Gm-Message-State: AOJu0YypW1eJnRI66jK183JBgWqkeRBjCnBo8bNqKLo3meYCyDhCiS7y
	qoDaht3scnEHN4xkPUuL5dcf6C+PkKBT5usEpcakgP/m+jmTM9ABf8Kro8nAm5y9/ys=
X-Gm-Gg: ASbGncuRPgkNwNLfEGOu2M8Gtzhrgv9QfJSFh8qBd38MWFfJtfArB8SKgtid4wkK9Qe
	g/BQc6OL6obOiieYv/FNcpqRlxm/aYt5kKnbB6TTStheCsc6pCFdrLWh/gtz3spm/5Af8lupO5G
	D4ocxdZf4PEFiv0R6/SF0cqZG07mMU07g+QDXYHExfIn5nkewX57tsUlpRK7FJLSqKyaJI7ebV2
	EMpseJ/dI5g50tLLeFanFdJO1G0ShpwVB0n08aNvgPJz81s0wmhhmfGA1/na0Dd8dEts82INAOA
	PeALOZx55+QSsIsI/TL16D71hxzpl0OfVGrVW7EuqxUtYfY0NzPbS+4M6nhkxb0wHNr99TcBqYI
	BAeDDmwogyzc6B6tI3sUUXYUr92mZhXt5GcqjxpWWqcXwicfgh5PRtJExUTZXAsEjEk0laXA23i
	odukTMtZ0bS3kK/16G
X-Google-Smtp-Source: AGHT+IElmqwSXM2LD9Zj38iqiRpoNd0Jrn+lBJsy+HnDDx3pWEVsxIwu4rWoR33t2nCilhZqEUdiCA==
X-Received: by 2002:a5d:588b:0:b0:429:c2fb:c268 with SMTP id ffacd0b85a97d-42e0f35bba3mr13000529f8f.56.1764263187474;
        Thu, 27 Nov 2025 09:06:27 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42e1ca40945sm4681712f8f.30.2025.11.27.09.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 09:06:26 -0800 (PST)
Date: Thu, 27 Nov 2025 20:06:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Navaneeth K <knavaneeth786@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, abdun.nihaal@gmail.com
Subject: Re: [PATCH v4] most: core: fix resource leak in
 most_register_interface error paths
Message-ID: <aSiFDhzvuHDyBfJ_@stanley.mountain>
References: <20251127165337.19172-1-knavaneeth786@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127165337.19172-1-knavaneeth786@gmail.com>

On Thu, Nov 27, 2025 at 04:53:37PM +0000, Navaneeth K wrote:
> The function most_register_interface() did not correctly release resources
> if it failed early (before registering the device). In these cases, it
> returned an error code immediately, leaking the memory allocated for the
> interface.
> 
> Fix this by initializing the device early via device_initialize() and
> calling put_device() on all error paths.
> 
> The most_register_interface() is expected to call put_device() on
> error which frees the resources allocated in the caller. The
> put_device() either calls release_mdev() or dim2_release(),
> depending on the caller.
> 
> Switch to using device_add() instead of device_register() to handle
> the split initialization.
> 
> Acked-by: Abdun Nihaal <abdun.nihaal@gmail.com>
> Signed-off-by: Navaneeth K <knavaneeth786@gmail.com>
> ---

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

