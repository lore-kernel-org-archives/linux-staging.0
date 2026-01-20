Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD23376BF8
	for <linux-staging@lists.linux.dev>; Tue, 20 Jan 2026 06:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768891446; cv=none; b=aGnBb3pXHnYLzmijqggs0+yCg8p4rwCEJSJ17e+4jBUlPmplA7CX+KpTAz9zIwvmrfwVGijO6HR9fl0G2G6YrnmDDiKiHyYor4PAvxmMuIZKbhCML5qAxfPMd3a9TvqA4cPhS+eJqwiPepVFyIcY7RY5Bq8kJYVHfEmvvvt0b+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768891446; c=relaxed/simple;
	bh=yt1xi5EIrUoufoZxFacJnmYKuJTTzuhRAzBSlxO259M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AcKTSO5Fh25Yt/bGs7eGM8Q70nrBm+KmtM27oVJ9yIU08sp/Cy6JNW6/XaVBv4BvBHwY25Ox4ygtBFw1QHna87TqHFT8sVxxR+BQl/zXRQYNe2tj9cfE7UiHuhmleGI4k9UVdaMimB94Pl/Ez11Uk3i6GZgu0tTixYcql7mwE4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oPoEOk0N; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oPoEOk0N"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4801d7c72a5so25145245e9.0
        for <linux-staging@lists.linux.dev>; Mon, 19 Jan 2026 22:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768891428; x=1769496228; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1+28hdgWTeM/BUF4rJas7R/CyHaY9BaFKxfVYBPrFxI=;
        b=oPoEOk0Ni87wLxFSQEKhigmVRqMP73237CU047jyYUKPq6/LwsPBPKT30fbCZoKg2k
         wLbKvzO9AWQOQlSKg/YukhjQnbocwBqOi/0ZEo66F+C/NM0blTK8iMvIHm6/duIESdTR
         QO7rfLwFASpeZdVGMFFjdKhjJ2iJE5zwX0bPeyUQj1NaDMbo95IdMJau94HUME6gpSYS
         rvL7vzzTaIjFU+X0qOTmbWpfkNUl5xYzsFUTrfmzqQQCwGsuj+mKw0cjhlHAt8DmDREN
         +OlVX8C0+/DVEMGFyndlFcDYw17SHdI3WpJsIZ5eBq7mHPrIx+wjXyq1IAbdQ6oYpLgC
         kMyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768891428; x=1769496228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1+28hdgWTeM/BUF4rJas7R/CyHaY9BaFKxfVYBPrFxI=;
        b=W6yY/rV1Jytg30AbNyUngxwp6ZrLAWDtYa3zbhJPonUK8iJMPK7rfEgyWUGF8zVBpf
         fiSQLm69RsKtcKuNZ1Jq+KHFlUkjg7r3JQvKMWiyPa9fMLG3wEYHNG7WhpA6yQw3KOlH
         ybmSySJ/UJ9I/yFbZ59s5jFfUDj5h4kAZYafyrUUTnDJ9r5cs9wAjZqvGVDQSdBhsIej
         L37tZvIzBvi+5bTjkWGU5OIn+jjS7+DC2IPdXh/qdKQO+F6o0sREMU37U4SYd1fnknU0
         QJaRtkPlCfyo+Bmvb+eOfVOTIekM/7fY1uWtqBJRHqkaTtK3G0JtMvHoSJhIKb3pvLGs
         ePLg==
X-Forwarded-Encrypted: i=1; AJvYcCWlUQS47l07HHbeBrMCuLukeWRmLQZZieLTrwTrhCnDD11Wdy0tYIb4lZXDhDqmBITX5nLXw+OrhRlnGbfl@lists.linux.dev
X-Gm-Message-State: AOJu0YzRvsHtyWpGM8RhyZM7ND5go/1ONucTE4BKTDGSCUJ/DQGiJpDy
	QiEKFDjJjCmPSWvwGRqip1nvc7HCfAokwwrDowCRJd6HEfTJeuKc4z1RCECu9/z4SRI=
X-Gm-Gg: AY/fxX62eUFy/fQZwqg2gA8ilUFu3RxKj8JuPVRv7cSamgjZUiJwE1MPT2d6715NxJt
	N1xrQnkSc/BtThB4xgaXIKGBZqSAknNtaC/2qyn+qoQ+1N+ciwmibN5rVqJNWRXVfrEUeAu2a8M
	Cm/nwxWTq9Q8mZBKuEgdUyVkhfWQ7LEklF6bywOBQD7c3Bz15maMCOwiptkRvhW8SDq7Yx0YVLv
	oETY1/n3y0XbD/HZcMvXh80GBCUQK/vXCiYOt/wHd30wn9n7kc4ubAZl2ufeEz07E0XCZWcjLnk
	NAhF37t59C1GQQan5Cj1FRHZNvSFY8Yp7GkqSo9AcYd22YRU0XG1qOV12bc6/D31V4FNh5O9SO7
	t+Fk9wh93Ir82RJiPbNMS8O2EwRrxVK40We8N6I3HQHdAFhS5OZTfHTaleNEfQsFdwvqMToBXrc
	N37E2Ny1/uSdLCgR6D
X-Received: by 2002:a05:600c:474d:b0:477:7b16:5f77 with SMTP id 5b1f17b1804b1-4801eab5193mr134721925e9.3.1768891428350;
        Mon, 19 Jan 2026 22:43:48 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f428acd0csm286282275e9.6.2026.01.19.22.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:43:47 -0800 (PST)
Date: Tue, 20 Jan 2026 09:43:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Meeri Kallio <meeri.kallio91@gmail.com>
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging/rtl8723bs: remove unused variable warning
Message-ID: <aW8kIZ3rcLQOaTmI@stanley.mountain>
References: <CAAgJoVE0QejhLyFuQMm8_0TTzOj7O1CM+AKs4TpLJ9YrvJfb4w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAgJoVE0QejhLyFuQMm8_0TTzOj7O1CM+AKs4TpLJ9YrvJfb4w@mail.gmail.com>

What tree are you working off?  It looks like you're accidentally
working off an example tree with deliberate nonsense code.  You're
just supposed to fix the bugs privately as practice about how to do
a git commit, not send the fix upstream.

In time you will look back at this with amusement.  It certainly gave
me a good chuckle.

regards,
dan carpenter
