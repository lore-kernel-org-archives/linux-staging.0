Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0863BC666
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 15:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776093287; cv=none; b=n3zb2ITQXutokgWHBhMCODzZcHIEbPUNPVsOt5vSJsdpGXUhZFeFl7A+jBYK08MxCGpWWMmBjeW/75QDYrdvINkmmMspvZjj3hDjf1wG08SkbbV3a/V/hAz2tZAYBSEKjoIZPDGG3RV+k5A0s8uyc2tf84ZLoN8MRgPgCDP8MWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776093287; c=relaxed/simple;
	bh=0a7FLaT+rKJyWKihMfOQeHA6kvrx/DJ3RNEgM/L/R/8=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject:
	 In-Reply-To:References; b=VffcQbY34kC5thqn/BGwoWKsf2TrkxoUqmKrnrmiquDk1hg6wDP7xGqzavHkxjyyHmwQPcKVGu1nGLShYcCHjU1x60zBlMlKOpSRUMb9GIntuLgJqqjS+jE723svVs9NAc/3RM0dzjMwkLtV38CLwsLv5cEaJQjLKjMEZr7RnDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EyNuwAnz; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EyNuwAnz"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-670f6ae9c7dso2495787a12.2
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 08:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776093285; x=1776698085; darn=lists.linux.dev;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CUSZ0uE5sG3OR/TMnuAD9TZI+mDUi9S4YXF+OgH+Ebw=;
        b=EyNuwAnz5NQJO7CXVlAa30/m4WUCTCdICl3DEzC7uU12knEqlV2v2ZdJt1pJWkBQ0f
         RbHmdIix6r2xp7bZp/6wT/eD/H3C+DL3jiuTyOfBsb9tXa0+YBCKkbnPS9L+SLMn3N/Y
         7UYfrKXpSKuZBGI6if+Kw36sBh1xiMkNibMrRQuehfgOV+B7d3609FEnRhjWRi0ZD5hP
         qCBE4Rsy2eABNf9zQxaruzoNAJITvaNNvGNpdyWLf+eqxaoPqkEz4fXZy6s4bw7W/iqO
         ATauXdNkl3EfBNjv9qx0dTqrUUkRCZwhrobkj6RcrVjtaFDXqYY27Ud42HFRXWdXPC6c
         zbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776093285; x=1776698085;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CUSZ0uE5sG3OR/TMnuAD9TZI+mDUi9S4YXF+OgH+Ebw=;
        b=g6sWojQb2HNpxx8O0/Lkn09YvMM4UzuVyzGPpeIUssqGrmH8afBIR0YeOdTQ4VmI15
         CIZdcEilKYi4A97hkCqYYPv9l7AmFyEXHKAa0pkw1BO7yg2k7WEGrBpqkK4DJGYhpdNx
         DZJV5s9mRCKEP2LQCdINxvO/LYM/u8wknZZ98swKuU1GmGOIw5I3hlOAZXaR+i2Me/Eu
         gbdvNHYtwxfoEDxny/aWxmMf+QxARvL9MJB+teF9b2u55cjGVHMpkWNq9v10vi8aT+11
         YYLw5zQ0IsuJaxRjd3LKHLAk1O9XIfXOfN/qby+FT0DR1BaWDc5TGbvS+CooMMI/715Q
         89qw==
X-Forwarded-Encrypted: i=1; AFNElJ/CjwAGCZrALOwrVfOSeTCf5YEDLsuJN2VBJ4OsJQ0/yylnC197ZnfEN7GWsl5iOrGpcpbXjqM5qsGnPfxA@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/LTZ9RzsstfDATleeS3PpbWyEBszAHVBgT6ItZ60VX+1ttPlZ
	MorlcuD5iowsRCTNl3J/RDHnJIJbKz+FxiQz149KI8APKkwGbc0E0n/g
X-Gm-Gg: AeBDies0VGZGQi4xi7rwmDc4UfoXYWGR6uBCF6orQG9sDPOQlpkxJn2vXES60IObO3+
	E01eKHXgFhSooQeFWqIE4o5k29KVtEMVjJOZRZsETWd950fCaxZ6McZgiIXMOXKiKgdZb9+fclV
	kc4Ztfu5vsvSzRpOA2FXkSq8H9gSJQBIDPqQVl+EUZzv2ENON9phqbZEd3ysRO8eJ6OCv/Dj/vT
	9x6PhNxDxLKqzF1eKKIip59Q/nuPEzt3xiqMdg4asv2QvkXASXornY82FV0iYLgE2WaPZ9KZuUK
	hZLr9Usfmaag+0SY13els41RztVpMztEr/Yhc42Z6E5MBCChFYVLp7XG04NnWlDds/P771hrmBo
	Lf9BOPfp4fqmqvK8bzdDFScsUahguXPtZNqeKDTzLXvngt1rVf5dAEwz+UVHByu+zAGMuuZpymV
	PaVTi0N6PQT7UzUCQGfag+lAfraOR2kVKS2OrATT94kknvFc59+t5eZ5fT5WM3fOIbKSpLKQq1D
	pZx3VmxGukzFMCmGEFRGeG76DDAXqPJ8F+oLxvuHZWHhsQNu+WMdhQxy6wclw==
X-Received: by 2002:a17:906:bf45:b0:b9c:9dcb:36c6 with SMTP id a640c23a62f3a-b9d729cbbabmr807471166b.47.1776093284710;
        Mon, 13 Apr 2026 08:14:44 -0700 (PDT)
Received: from ahossu.localdomain ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e5c5457sm315054166b.35.2026.04.13.08.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 08:14:44 -0700 (PDT)
Message-ID: <69dd0864.170a0220.27e52e.4042@mx.google.com>
Date: Mon, 13 Apr 2026 08:14:44 -0700 (PDT)
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] staging: nvec: fix unconditional pm_power_off teardown
In-Reply-To: <20260412205057.386856-4-hossu.alexandru@gmail.com>
References: <20260412205057.386856-4-hossu.alexandru@gmail.com>

On Mon, Apr 13, 2026, Dan Carpenter wrote:
> Can you resend as a new thread?  Mixing nvec and ipu7 in one series is
> a bit confusing.
>
> Also you can drop the "nvec_power_handle = NULL;" line.  After we set
> pm_power_off = NULL then nvec_power_off() is no longer reachable so
> there is no real bug.

Fair point, thanks. Resent as a clean [PATCH v2 1/2] + [PATCH v2 2/2]
series covering only the nvec fixes. The nvec_power_handle = NULL line
is dropped in v2.

Alexandru
