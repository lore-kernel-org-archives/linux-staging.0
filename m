Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DDC31B11E
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 06:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777358418; cv=pass; b=ouo+L8hhQrnl+FN6pq23ZBvRuXLw/TB2v2VIG+XLw+Qw1G8jNCfTS/F3P7jQwePrevof9gnx0oOTwgOChF/JdzvkTggisybsYXA0jNWw+CfbJpvcALbpr6OFjmrPT4Bt1KwxH7BVhhVhRh11JWYm9qlSD4YOcRqjyy/l3MsaDp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777358418; c=relaxed/simple;
	bh=gUBFQUuLT4y62lDpZYid+HnWFExZpyMrTEA6w3nkPbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BHtVE1aemQRtTDogOGPuuJqfS4OBWJXxti+0o95PjJ2MtXpKLHFY9ID6VQabiDrsoBQeDR2VIsqYT+SVgHbL2WwWpqzmW1u5LpdeL5B/XmaNJJIlYwTL28wTH7Vef9wG9PtHnCVzVVwTY9FVxxcdUABke3Tz61444R6AqZVWta4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BmnEWafX; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BmnEWafX"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so100581185e9.0
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 23:40:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777358415; cv=none;
        d=google.com; s=arc-20240605;
        b=lvd5NTioIIJr16rZ8xu8azOAkC39GXMkAhsUESX5gostItqu3nR3ZEk4tofmGMZhUK
         /SGJN9dNIN/AMMCTXu1XY4wgDm2mpf9xyFBGw3QkPpCwJp+EJAFlfyLu2AxUp+N6rD00
         jRRFw7tOVZYJBDcNlPmjefSDmz1o4ViEopy5yTMycEOGCe6NCRY31Mh6fxOh6apd1N4p
         qUkgsEddC2ug0oOvdd1c4K8bVlRwB/sK67xg73jvN9gsYQhJZgzLPtYsuOPqRFJngm4U
         Dxt0JV3ET4WwRWLzN3uar1BFlhuNKlnHSsgpcxwMK4WNIOx2JtjIotR3X1dZpSl8K/JO
         h1Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sQDM9G+P27zm1fzEyXP86Vz/k6eZe258soPmp3d5UvY=;
        fh=uvXTu5ItoA0e9TpDEqZqB9ITwX+Hp0sO0Xf5mRd7VMo=;
        b=eqT1BXgHytHpvt3eegNxhSYSMfvwTO4MDuIBPxx9FoJOLhBqI6n0NB+cwGmwIcxOaL
         sMqnFFXY1OgJavRyWAAeOmRhfGwdA7iEekRbxNNxaiEP95/a7dX4js+VNo2oa7t8uekQ
         hAHk+ey52Tp/TPAulYzLvOqq3k0zase7gD5tu04hqIMiixHJUpTl5DapUQNvTfwTe0wx
         3JDejKXFk249Rar3hsChlX341+B/h5MgZisAriTvCzQv2yhNWOMDqSePvVscx/zTq3cr
         NPE2kvWb3XbeZp/Qwd6Upxp4PxkZN+MdjBV1Bt9Csq8BwF5CRoYdZQjeBCI24q5e529r
         jxPQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777358415; x=1777963215; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sQDM9G+P27zm1fzEyXP86Vz/k6eZe258soPmp3d5UvY=;
        b=BmnEWafX8942K5iRNJp7fT4BX+rr41g0oZlWxCR+iThCGsoZcnLLrfa8k5u+rSpYzb
         QiIwgFkkW9zDfmtkORmUPNMt3/1Q77vKchPY9tdM7EK67YxYK5NBaM7gbdOuZ6UswtI/
         h3pLCDA9hk2sWtvOrOURbYI4mx7cPiUvFBoHvTLgJpzM0uhkNdqYsMn0tvB7I8mKHYQz
         vxqaUAFI0U5MMOF9mXY5IcrfiSTd36Rq+QKwK77Qo9baORUIHqK1SaamaAgLDIBfSKLc
         c9bHXOmY1UKm6HIWdsdcjj8rcViMnol0K0Tl7wvBpgfBkwSQGgrTlPvFfp6oYiCsYYXY
         +r4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777358415; x=1777963215;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQDM9G+P27zm1fzEyXP86Vz/k6eZe258soPmp3d5UvY=;
        b=mXMrH6anKtCM5NlChyA2WbCsC6erymD0dnTzXlQ/+xyqcwB00lfCWSQ6KgkvQX71J6
         WvS1i5fXHF/boA+5GCZbzmJVQGLHNklNGfUK8oOsQvjiceRmwySXfPIpcLP5WzYdSWcQ
         +xct+EfiXt3Vgtq415Ttm3n9CWA0B+jI79sX58Fm4rPg013i3sKEwGcfgIUTGvPeYnOh
         zZL1+pFFmiuxT2p6ZypXPatmYMSjrtXQ7Z68kkmHg6N6tFRScRCfaCzrAozgFbTtkksV
         xgJDH55Qg/ggN6fA/KRrJdhYexwk6CVUaXcqNMDv47gcpsTl9PGf9OBNaDz39Dvmcchf
         Nf3Q==
X-Forwarded-Encrypted: i=1; AFNElJ8lUdeFAIyF4KnWqBWhkImh2EXC/hIAOFt1GXh50XtX3ztdwLa9WA5KfiE2xEWfG3p6EeZiGo7e4/do1Ozo@lists.linux.dev
X-Gm-Message-State: AOJu0Yxh4LP04MH60MC09ofg4j1l1ReCAtpTNwQDiO3YFoJeKKeAa71L
	ZgeKTC8YEragnwBn52/23CDkj3+2qKbz2ntuPY3wnlz4MuXocxz8bk2mZOB439gwS1rCOQyijpw
	VKLWllCKrSWKhGIkDG1+C8/kgT4DQmjE=
X-Gm-Gg: AeBDievyFsYIpGVSoIJBK+EV+6pzBCv7rFrOzCYt+aDRLlGU+HLnxfKW1GeLXBGj6ND
	wZF6ldRctrQ93nVEao3LI3iCwOI39HaaqjX9sC0SWgMjLLJJ4zB6f09mvXAsDqyUaXZt6kL/y3g
	W5CTpRdPsbX7RWXfroHYhoAS3gp4MPnKYKvbhzx/bYQieMhUaxjE/tSdNBdS05e2lC6JfxH2LMs
	HHAeMAt5YTbS+vIZ/lRbMFGqxWBfc8jdt8iF+098Pli64lR402p5Cv4Jt2y9TrHw8KhxOe92N8e
	TIUZGvfhsQxaF24iya/1yflrgK4A2K/50uI0vIHRBElf+ARAgnNQov1dd5mnlK/QVRPvp9qc+it
	qp5TFrI2ytZT6YG0S6+nP+QHfenfIpDqtiMMVdBz5nwr4h173byykz/b7wpsuoTUJBvYGCzsayR
	mRbkOFbpKa2AYz5pyGXdcu9ZQCdoM=
X-Received: by 2002:a05:600c:138f:b0:488:bfc3:efc with SMTP id
 5b1f17b1804b1-48a779a8d25mr26523955e9.0.1777358415126; Mon, 27 Apr 2026
 23:40:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260419183623.86587-1-joshua.crofts1@gmail.com>
In-Reply-To: <20260419183623.86587-1-joshua.crofts1@gmail.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Tue, 28 Apr 2026 08:40:03 +0200
X-Gm-Features: AVHnY4L2NiVXIOgdtYJpO5cYLUPDu5sKaIeGgysnFzBPdESdr-oC-_btwBQ33ao
Message-ID: <CALoEA-wOZTTC3byrcOjhFORQbmJQFWiROtsnxScpfuA8PYMVig@mail.gmail.com>
Subject: Re: [PATCH v7] iio: frequency: ad9832: simplify bitwise math
To: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, 
	gregkh@linuxfoundation.org
Cc: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 19 Apr 2026 at 20:36, Joshua Crofts <joshua.crofts1@gmail.com> wrote:
>
> Refactor the ad9832_calc_freqreg by removing the redundant u64 casts
> and 1L bitwise left shift and replacing the multiplication by a bit
> shift, as multiplying integers by a power of two is identical to a
> bitwise left shift.

FYI.

-- 
Kind regards

CJD
