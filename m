Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACB13C5526
	for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 08:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512097; cv=none; b=LHXJSX5CuMw22BKxYfdggh0pbKtcfQlNiIbPD1wb8Qv+ojWyQ0PsKy1+fu7gkLjqfWaryMUTFgU+AZggDXVL31EZDOmdLx8mj076rs2OJ2lqePTB2jhiv8TzEZF95OJARo4YC2J2bDXq7XOOF2AJaGrbtYAXn5OdXiNQXM1RPOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512097; c=relaxed/simple;
	bh=CvJqICItmWNRxLBGTRoH61d4+b1K3CxtLl3YPXxep0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bv6gJuhpkThigKs9H8HIifMeHTnuB+DAP0L7UIyf/p/J4jPMnEnkd6FvhPRHH1JzcvDCiN9fSSmDwogA+bGvtdgwvlBrNidG9JakjUvjmzqNPLxfi3k2AGE6P3btlGt6khI3LGs3cbfsUNmKjPC6F6XUygguzgBE4F4WFl1t2f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=spQyeqbb; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="spQyeqbb"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8ce9d444173so39922756d6.2
        for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 01:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781512094; x=1782116894; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tir3PhG7109xyLgXfCIGMlh+Pgvmtus6HbD0nSt36r0=;
        b=spQyeqbba9+bkrxle5cKDcGu3OQ+EwWmNwnQQ2VgClmkA80J8OV727a3HcgjoZaT6k
         tM3NSdA0WowMRwxTkHa8ppprBc/bSnJCUNS/TGUFVjfUABNYq8rYgi7OHt6/JsyNYgYH
         lCbZEaYuQ5WYza3QB+i+yjPM+mV29H6xgM1t0zpK0y0fZ7J+5ErkvhP0K/2SK++llpyX
         P60MBzjANwZyAlOYv62GulMxSw/dRGgE6aqnlipemTvfYW+BhkUCq8aGrHfioqC3ehqN
         fKl9SDZIzifPOezmpFBs9h2tuzUkyxLG5XkLUTi6vyelQPsAglrnTtUKEJAA6w5LUPNO
         nQig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512094; x=1782116894;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tir3PhG7109xyLgXfCIGMlh+Pgvmtus6HbD0nSt36r0=;
        b=DQUK2ISdNWaNH2YjsvBVsp9eubnm6+rHef9aE2RTBPr0lfCHo8vvyOcr9OaAo4qtLj
         XmmhmEiZnXUqdXxEhQO3JZ4wt8jvbD+6rWESeHoViFeLuzud4If2C6FAerXpPAlpmKw/
         PKUJ+IKl1AJfOo2K0Vaq5Cu5F/+L7F7ayLIdJXm8r/mSBGMMWTG2y3H1EfcH38ohMudc
         zAAcddUdaRlV56kB4t18CxWxiEmb1f/sd/3/kowYlBHwc7+pzwRzSZ7T5B5YEoKju/I2
         vLyWgByGnlgVUuCDvXK+OxszEXeWl5MxKw66zTT9uZqTib1NI27dp64aE46ReOjcFsAS
         8pdw==
X-Forwarded-Encrypted: i=1; AFNElJ//vPaeFz4ystF+0dNmRj4ZEf81/eG9I5HovQ3bDegyPL/tphm9A8BrRCroGQ9HbccrNxlPbQkJrDhHvBdQ@lists.linux.dev
X-Gm-Message-State: AOJu0YxEACmndrUNsutB8rrNIa/gz7DOAe4goNW58fvkchfRj9z7102Z
	b2qXZ8ZkbqV5kRLadD9t2IF3ub7XHM2C1kYZ1hpN20kILLwyz6TCkYnD
X-Gm-Gg: Acq92OFNimjQ+lyiiRQsGtT5C0+UxZ8RsVk9h5vHV1zUP53kyfrO2ZgFnP/ZL+ThACr
	2dpkziYRwaNILHal848rRWP/wsgeY8QvpMHX9vyLdO5Yenf2KlKdBqIalmrNpdkavvREpfk8hq+
	HJ1FcBYwItL3aBALb9lZhA21/hOXJ9nB4VX/dQ7Ep2zVekDXbKc/j+H6hWesiuQgv5J3wqUNYR9
	1MVFqPpLMm+RBhJNT7wVPw7ntKRSKMKyDvvFZfknJiKpW4NvCpXMoBukr1ihoKO4wrM7WY5TThG
	SNbnXn0V5lPBsnhJQFJUm72v31uG6OZeVXMQKyqBQi6pwyOcl/RZQQnExzCKvqjv2yMDDqfxsmH
	ZN6Vgf1nV4eoNDbalu4CZ3dwnQcMyrR8cJ/LIT6KrRNTCU1gHOcaCGP4ngkvLvAVJWmg/YrMXnx
	OIlBLmCSeUkKW785uG
X-Received: by 2002:a05:6214:268d:b0:8cc:ebc0:6ec6 with SMTP id 6a1803df08f44-8d32d761395mr232948526d6.20.1781512094171;
        Mon, 15 Jun 2026 01:28:14 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d30522cbeasm107738856d6.44.2026.06.15.01.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:28:13 -0700 (PDT)
Date: Mon, 15 Jun 2026 11:28:07 +0300
From: Dan Carpenter <error27@gmail.com>
To: Moksh Panicker <mokshpanicker.7@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	dan.carpenter@linaro.org
Subject: Re: [PATCH v2] staging: rtl8723bs: Fix missing spaces around
 operators
Message-ID: <ai-3l6vysB7sOnEJ@stanley.mountain>
References: <20260615082538.12007-1-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615082538.12007-1-mokshpanicker.7@gmail.com>

On Mon, Jun 15, 2026 at 08:25:38AM +0000, Moksh Panicker wrote:
> Add missing spaces around arithmetic and bitwise operators ('+', '-',
> '&') in the rtl8723bs staging driver across multiple files. These were
> flagged by checkpatch.pl with:
> 
> CHECK: spaces preferred around that 'X' (ctx:VxV)
> 
> Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
> ---

Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

