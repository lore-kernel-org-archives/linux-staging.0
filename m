Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA783B583C
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 09:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774863337; cv=none; b=PONMZD91nB78JAWySiG/mPrMQfwxEIpFAKNOcQJ03OaNVU7Z77GhglDnOoXe3C2iUYy1NYmH29ZMDI0AVCZbCHVyMQNk9uo+4cWpw2xt6S6xD1b1MLvTNu8znY3M+GsYMPlZSntvXHyiButNvbFjyHAAc1p44kgjc97sLXInX7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774863337; c=relaxed/simple;
	bh=/THPjhtsCKvwzT/E0Ctzftz6Mn22zZmXPK0LI6tBVz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dsl5iQrLLjl7+Nbya34px8+1UyEkfguMUpcLasuOcxJdzqBeT8i3jh1v4Klq0dB4gZyHZf1AAekwUMLyEj3kYaL78ZErPy5fXMswYMwq7EoQp9G0LjcRM9H2WnjFfII/o50ylZ5omCBuIPP6/QpV/AxPYm9Q4Nsnh0joCTprmfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bC0Ck+9T; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bC0Ck+9T"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b982518b73fso680383366b.1
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 02:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774863335; x=1775468135; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T8icbgd+Gvc605wy+mpl63d77z2nXysg0+vXcRUSsPs=;
        b=bC0Ck+9TBjg9iS+oO1sAzgF5JJIfl0rBFzSpxXB7zGM/KMRKSg5gF556ixouWSPkg8
         2Tza8yX5VFC+Z/aW36OM9DVxM6ar3N/e0jtBc0qeotvwjqnk1TE52EqZV12qkgVgs95A
         oaPk0npelXBaOS8oimDGJk4gZEm6QDUlO9eFfvZsvPfIX9E7/ia7zkcLAD8ntTZTXx/R
         7NOx0JnqVWvSbEtcGUiEwH4nG8roi75HUoc+BWEsz2m/UPhU1r1PzisdP+YNlnynjdyV
         l4SWv3o7GzoU8849VitCmLKqutU5EKzUrGYaDTRGh4gvjcz7eh+SUONj/Aqehw4ZEXpX
         i4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863335; x=1775468135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T8icbgd+Gvc605wy+mpl63d77z2nXysg0+vXcRUSsPs=;
        b=l784a3HS71J3K6DWHEh/u0wHHhwUgReIPFOVl8cuka86r8VRHB0yIbHAZ+qoZ8/1Cz
         ytBnaUQN3PBhasK855/cjNBC+JsTlaquFeMT/hU5atb8jI273A1hcQgDHNv1BrtvH8Kg
         1aN0Q3QSyKSYPcoR5Lxa31t9ozh+4ywgitf0oXsTwaRz7+yL0owpIf7kmPmRsvZ9Av91
         cYpg5Nptvev838IhJNnZmKIwqUdUb/X7Uo/N2rpuGew1zHsRJqNUSPfrJPMCkfg42QSn
         Ls5Ae4fj8u2m/JmqFhuA7MRsos3pmnnV4/pv/oxRW0qajib5qG2jSC+JXNGtht4g8Ivx
         vs/g==
X-Gm-Message-State: AOJu0YzYxPjImrKRlphI5g1S51KxPj7KvXR5Z/OdeLWxpJ4svcOOQfVR
	5SFVmMX2Ly98PgeFuricxoD0jBK6q3J9PTDETlhX72WcwKia8vhxiYUi
X-Gm-Gg: ATEYQzw3F8oMuNW1kc4rMwaOJB3pSqXVj0YzfLZ+bNoVTRPB7SrRbk6ZVN40J+a0YY1
	m0F7Td31WEHRAGttUR8azhYiV8w1EDAlWOBNDuv6e1tpx61kL0OjTTdwSc8dfJ7hCRy7FFV2Us6
	TodQ6tQ5640Idu/7tGOaKmgPQcwnTl8Z5xDMxjeStqg76a+lbXkNrpHXKr1mNHOvRD3LCJe/oyl
	UHoXZhThvAFjppES1qjDqxDFQBOd0sKrTTVC5RO1FlUDtFJFJZHo3r/LUnUWppGATutG4BZMXcW
	X7rBvUh19NJiiz/i+o6QoVS9GPBYCo+/9KvewRkv+1CwSbS65M97saIIQZzFnXumUgvW7BibCYA
	xH+XWBbalG9dvHQbBmcUsZe7wodWuaVsFrdhEUdWwsfEs6HeJCl0GDrl2oOuwQiiL4cx61iEbCZ
	HUUmgkIT2Hh6JHWhITW4/1Gf6IHZoGrg==
X-Received: by 2002:a17:907:93c2:b0:b9b:1f3e:fa56 with SMTP id a640c23a62f3a-b9b5094c45fmr423164866b.45.1774863334604;
        Mon, 30 Mar 2026 02:35:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1a65c2sm268002966b.34.2026.03.30.02.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:35:34 -0700 (PDT)
Date: Mon, 30 Mar 2026 12:35:30 +0300
From: Dan Carpenter <error27@gmail.com>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: linux-staging@lists.linux.dev, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] media: atomisp: fix potential NULL pointer
 dereference in configure_isp_from_args()
Message-ID: <acopy6nyxSb16J8N@stanley.mountain>
References: <20260328192721.255493-1-azpijr@gmail.com>
 <20260328192721.255493-2-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328192721.255493-2-azpijr@gmail.com>

On Sat, Mar 28, 2026 at 08:21:37PM +0100, Jose A. Perez de Azpillaga wrote:
> The function configure_isp_from_args() incorrectly dereferences
> args->delay_frames[0] to configure cropping without checking if the
> pointer is valid. However, as noted in a FIXME comment later in the
> same function, delay_frames can be NULL in certain pipeline
> configurations.

The comment comes later in the function and it says "FIXME:
args->delay_frames can be NULL here".  "args->delay_frames" is
different from "args->delay_frames[0]".  Obviously
args->delay_frames can't actually be NULL there since we
dereference it here so the comment is wrong.

If the correct response to the FIXME were just to add a NULL
check then the original author probably would have done that.

regards,
dan carpenter

