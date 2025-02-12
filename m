Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228121F8BCA
	for <linux-staging@lists.linux.dev>; Wed, 12 Feb 2025 07:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739344075; cv=none; b=RdxHBA0TPbmNwRYL86Wp/TJDF0c2nRYT9lThPvyn3f4SnUsjo6P/XyPEA7FmI6u7ayRWklTR0hkpkciTRoquRKpoE0ocgNnB0R9uCpDkDBJqwYr/dOqXLUlLrY1bbvdWs6NwkYMjvyBHAaHBCqVVTXZPBh75O3yn9bC3X0krJAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739344075; c=relaxed/simple;
	bh=dkRYyiNHgbX4E6o4jZE7sY+B/pqUL1x5kYNpWL116yE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dulcd45AgfhDe/s2R9YXC+PlLU2vwtgxM17X62FYlxK7JtToqBA8qdLePNlgjHix6Zv1p7dEa00Gf+8t4PKpz/rS15Sh36d9iRIxoP5h9vUShC6neEvwMHbfA+ht8JJSHxBNnv5CncyOqYIKVnzBLJMsboH8bd/INjHWPe3oJxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VC067Iz7; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VC067Iz7"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5dccaaca646so1056763a12.0
        for <linux-staging@lists.linux.dev>; Tue, 11 Feb 2025 23:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739344072; x=1739948872; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6vdw5JAh/EXyOI+v6B5L7CVRs51CFfVUUaX686Jwf6M=;
        b=VC067Iz7iizUENFnH/IObt9EUzYSdHqjWX/a9Cg/0dhx7NTKXF+9KdSc2G3HRC/MKi
         f+iu8N+hhaRPlG/xsHXOpQb5eigFwA/9aGwgVPJdUvFkhOXqeOCVA/27+O9a3Fy4FzS0
         4IRWM3xb3jWeytoyufBmVmj9WXzkh/7S1ZD79x5sEdAHzUJVED0H534IjvkPowZWtlz4
         hvyEC4UMfYvAA9vaSL5e2TYDtLV9Uqs6Q1BGV6cIRH7wn7ZWAbgD69uoyhkRT3glyOc+
         H9wDDZE1yk/BLpmsmtTtrRt6gmekkJfTXR5yxQtgKFf3/mvSN4RZ5fKZtgfcaHlmH8+/
         1sqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739344072; x=1739948872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vdw5JAh/EXyOI+v6B5L7CVRs51CFfVUUaX686Jwf6M=;
        b=QLbK5OKS5hCd/vXVVYkiuv6X12B9KqcEzUPQ6gLmwCVaiJ6QC4pN56xMrVTr3jPhza
         6NVhGxvr0lmAaHquSFjgD5hYJM6I8qk8YoVpmW8nCIetnWpl31BZay8/VHoZY3UY4Y9e
         84mVng87t5tvCVcK9F7a0HrBfq2gn+wyhfQe3YP9D6e8+APfWCzvH5XAHGaPCN7lzRa1
         xHndxxl8g42DczO7aKI33Shla3hQyHNTjVBLSuUMV2mTT/2hPkk8VSfr3IvRwr7L7flZ
         +YETx+z7MGGxUmCv1VsukXc0FGqJOrKXyQzImqsZE4ngMi9Qr/BLqkX3Tx5WDw8izzjn
         kVtg==
X-Forwarded-Encrypted: i=1; AJvYcCUFS+OOWRc6LSC+hyuN7NCFFmvbh/BVFtYnr39YQIlbUCxFtEQ1oXZ7Lp4feYCUyvv5ZoWifh1EnOs0xseg@lists.linux.dev
X-Gm-Message-State: AOJu0YzmwW3n4FCNvWGE6VcVsX9k9ADQdlEGYZ1J8JwiOiCmtHDqp5Nm
	yQVGbCZ2pjkuvNs2Wtcn8FLF4uw8zgrKExo8urhcy5VZofcE8idWx1C+f9lXhY8=
X-Gm-Gg: ASbGnct8d+Hej9WYGuvPUngGATNN7vbZ3IVdFwaHC2E/vbgUolgRL36dtyZH9GezOv/
	CIHTagB8s0gUUFBaiWL65xUdEj2OmYj8aQGeutExKvRMWrLdYefZFoOBBLv82uf5iLvnBuN6v0x
	+wGmytOycOqCQDIUitsrTsAdVfNoCxhLjcxuBY/Zp6sAfxOQGbE2fVpkLkh+bWVRs8mSWEIiYyP
	eVZR0cc96aQOajHixmnPJQM5tN5+oWCbNqlLmtwCYAxL83qAQmrgKV9dYW5mF50r0MBQpky2oct
	RAkXTEpk1SHfcGcNi6+n
X-Google-Smtp-Source: AGHT+IFgfEsk45w4BbHfHihrHNRv5cyQh7wnujELnD449C9j+IMucFgzuOEVQz03tIYly8IZgxS/Wg==
X-Received: by 2002:a05:6402:3481:b0:5de:5e08:babd with SMTP id 4fb4d7f45d1cf-5de9b9b7230mr5460876a12.11.1739344072391;
        Tue, 11 Feb 2025 23:07:52 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5de6d3c6785sm6421368a12.55.2025.02.11.23.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 23:07:52 -0800 (PST)
Date: Wed, 12 Feb 2025 10:07:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Cc: gregkh@linuxfoundation.org, dpenkler@gmail.com,
	~lkcamp/patches@lists.sr.ht, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: gpib: fix style at nec7210_t1_delay
 definition
Message-ID: <a8da3395-e383-48d2-8c1e-fa70874ad551@stanley.mountain>
References: <20250212024247.176572-1-rodrigo.gobbi.7@gmail.com>
 <20250212024247.176572-3-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212024247.176572-3-rodrigo.gobbi.7@gmail.com>

On Tue, Feb 11, 2025 at 11:35:37PM -0300, Rodrigo Gobbi wrote:
> due a change of the return type of t1_delay function, checkpatch
> was triggering a style error.
> 
> Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>

This should be folded into the previous patch.  Generally we avoid
introducing checkpatch warnings and then fixing them later.  Sometimes
that ignoring checkpatch and then fixing it later can make the review
easier if a patch is really massive but this change is only medium sized.

regards,
dan carpenter


