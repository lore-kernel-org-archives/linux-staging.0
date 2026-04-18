Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B525C632
	for <linux-staging@lists.linux.dev>; Sat, 18 Apr 2026 07:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776497174; cv=none; b=I/O7ZAuHvdnBV3MYZq17NJAQwr/48zhgTBmfk/PdJYIk4HsKPY/kMjKaPgFz8DuFCCP8loTq5Un9e+FiAuGJbMsnauybWlUCIfJNyrGdWCSoteS94yZQxx2T4RxGIHs6o5LroKlK9tdbSRkARHpHbeoqC+toWoj/8v+aCBCNQM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776497174; c=relaxed/simple;
	bh=NfBO74AWzsORexJezbldg0Bpla0pHuFV2AP5imYCS6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c/ujCEYr4cSJl0315SexVthGbz3oB64KjlWOuTUyWrW+Yh2tNsDH6685dWreYEH62kl/06Bq/GM6BiIQ//ayUyAN0JIWb8pVDJd2I+ti1M8qMvA9WYyKtMMsv3tMmOTXWxY5os3opiGPB7ZBt/DieM7O2oeJsjdPj0ucIIgEAAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M4b7m6hz; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4b7m6hz"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488b0046078so13199455e9.1
        for <linux-staging@lists.linux.dev>; Sat, 18 Apr 2026 00:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776497171; x=1777101971; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RMJY5sJFMFRVZoxP4MSEGf9jQstn+5lnWoe32mr/X0w=;
        b=M4b7m6hzCWaX3m8OsAkNwJlL8C5S7ukzH5sORFMtqPnvL3Q6Ix5W7ussfWwBWoM5JW
         XU/5kCMwME6BKxDLxUY6MUlvaoxJgZ1Fm4kzE7YEhX8ufxYVwOFrzRZrezvxacnj7Rmp
         6JqBf8s7ag9z+LHKEYxGzlGhdyva/k3roa2FHZSyT61ADD/xFtfVmlODuaCZdwa6Wtsw
         7Izsk52VFq8JE1okkD4Owq68ZEm98xfynxFa4+y284WdrIErkzi3JL8bM4nSlJnB+fNa
         5QcCh6s0BR8+YFM8TZ8XAx/ZHyK1FI5oBTe09GdeMoHOE60I2gt/ZVsoMwNOdIz2PKZx
         M3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776497171; x=1777101971;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RMJY5sJFMFRVZoxP4MSEGf9jQstn+5lnWoe32mr/X0w=;
        b=f2CiBjBi5qvz/+AyJLGHRx40c7BLmRpsTN0lzrJ+qGbv634XvDWE2rxHoOUpkfNqI4
         vBOvCpV8qYd9aiE08/fbPf+2W+a3DgVE2bYclA6gURPo2Vu3Ov12svQk35q4r8/SsCXo
         GBaHguUYflsdpR24ZjuvNJS7Ds7U9JzeDAbcIPXc5Ew2NJCn3tmNdYoHV8Qd8jkYU5Nj
         nHcccIuvgq3/gg0R149h2VIy+dLWcEukTQF/3ihyi43B28yK+LP+yFVJsmXlCbKH37o0
         kCWMt9NVIaA7j6g+Z8Qn7KvQe8B11gPFgillwOlmBt2S3r/s3Iqlbjy3epz2Y+FL3yot
         Jx4Q==
X-Forwarded-Encrypted: i=1; AFNElJ+LNfm9sAal381qzrmoXsbj1Mil7LZ+HQor3ZvxcjJwvKWju3OoGqLSj4zXMtVQdB3yPS4cYZ4UsEHZgnAh@lists.linux.dev
X-Gm-Message-State: AOJu0YyEzfl8kassZJE+DquyTmxDq6/n2G7jUL3t9qO6cMi/naAkbKVn
	kR6BjGzQ2m0Kqdd0vDOJH6oDSDgMTtM44DSSUG1f5knZLrCVP2xwkV3w
X-Gm-Gg: AeBDieszaQgSVUwN+G30v13aS9mUqD6CbkSknF0aRDX4FBe6NOqfBFdxtJgrwB47jKu
	1UoX8VGueLGqlYqGCp84WUrxgzUX+PixjCqEssAcpm0PGxdc9MiY9k0mLzXLBqEP47DC83o4dWJ
	Z5V+JU1e+GAlAR2XhgAjWF1bS7BCoRLVTwfuGLppBjEfYUs4Clzq/fIYhJSxsSRzNlZAhHqzmXO
	OmuxWQXX6KBKQL0sRKj7AZgM83x96Li8eyCqWdMHqVLjsqXBAS6UK4/YdVUE8CVkOdXQW1sUzEM
	Ds1VW7CmDFJ3dAC+dLbMpA72hVWw0GbjQmVpPRKKn4KutWxr/s8AxbasP5ILXz0yvrPEDGx4ntX
	f3dC1F+qRSz0cFbj2nS/mczpHAnADiIuMdvyyKPQHkFSfa3KYoRuqiYU1p71Wwm6khsW5e8va2u
	01W/qlaYiMpmtzyCaZVYrEPugy6EZYoQ==
X-Received: by 2002:a05:600c:a318:b0:488:a2ac:a340 with SMTP id 5b1f17b1804b1-488fb7579demr62981685e9.12.1776497171022;
        Sat, 18 Apr 2026 00:26:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4d525sm9959884f8f.31.2026.04.18.00.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 00:26:10 -0700 (PDT)
Date: Sat, 18 Apr 2026 10:26:05 +0300
From: Dan Carpenter <error27@gmail.com>
To: Maxwell Doose <m32285159@gmail.com>
Cc: tsbogend@alpha.franken.de, gregkh@linuxfoundation.org, len.bao@gmx.us,
	yoelvisoliveros@gmail.com, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] staging: octeon: remove SPI, POW, PKO, and Helper
 typedef enums
Message-ID: <aeMyDXlMrLTY9EgE@stanley.mountain>
References: <20260417231908.45323-2-m32285159@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417231908.45323-2-m32285159@gmail.com>

On Fri, Apr 17, 2026 at 06:19:09PM -0500, Maxwell Doose wrote:
> This patch removes custom typedef enums and replaces them with standard
> enums to address the "General code review and cleanup" task in TODO.
> 
> The following enums are affected:
> 
> - cvmx_spi_mode_t (now enum cvmx_spi_mode)
> - cvmx_helper_interface_mode_t (now enum cvmx_helper_interface_mode_e)
> - cvmx_pow_wait_t (now enum cvmx_pow_wait)
> - cvmx_pko_lock_t (now enum cvmx_pko_lock)
> - cvmx_pko_status_t (now enum cvmx_pko_status)
> 
> This patch aligns the octeon codebase more closely with the Linux kernel
> code style, and will address the "cleanup" task in TODO.
> 
> Signed-off-by: Maxwell Doose <m32285159@gmail.com>
> ---
> v2:
>  - Appended "_e" to enum cvmx_helper_interface_mode to prevent namespace
>    collisions with a struct of the same name
>  - Fixed errors that were indirect results of the namespace collisions
> 
> v3:
>  - Fixed function return type in cvmx_helper_interface_get_mode

We're still not going to accept the _e on the end of
cvmx_helper_interface_mode_e.  Try figure out a better solution to
having two types with the same name.

regards,
dan carpenter

