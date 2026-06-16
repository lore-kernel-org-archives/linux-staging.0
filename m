Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32654508F2
	for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 16:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781627348; cv=none; b=nhFoh/nTDGm5sXji1dQVujnfApHuShkMmwV4Bn/dEpfGNzYYtF6GGvliXvIeyxPnbh3shPId6E0lppngH1bGl0IlLyQHawCAatOQX0apLGiIOUwGPjbHwAIbUsWVkD7u8BxyzD2BN7w3h/+QjUev6Nbv5Zr6HzcntwG4iLFzgu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781627348; c=relaxed/simple;
	bh=eIMO6SgDQy8k6Y9Wc+abuZ28DjMg1dh69GWsH055cVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CrDrG41Hieb8dxGenXmb9S+vtjnPc4GL6WSVZAMDfn5KJrd+NSXOFN13QPeyzx+BAsVk9Er6S/mKsBah9pq/6W5m1+q5s+PbjTjKNLbcAdBDbiDlAigbVTksm42TqVp1bHGCn8Sb01T1yMI74DUQSaQegEcR0NgmCP/pKjOQ+wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=onws8BVE; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="onws8BVE"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45eeba68948so3538668f8f.1
        for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 09:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781627346; x=1782232146; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eIMO6SgDQy8k6Y9Wc+abuZ28DjMg1dh69GWsH055cVQ=;
        b=onws8BVE4NGIj60w/9uYM3MN2PnWdmE6mZH+dSjTRosF/wsI7ekXv+ZUPI7zhTuguO
         bAOk1wNz0lKG302lXHdq7ARX9pYZa9/B2DyS0np/+AK3U6WPelA9ncsMVLLtQvAiSLhA
         0EZVQcFFYtMVboVBxcFmSFJ3oj9oQGKxeyexktaqXShP7MPCWL5WGYQiklSv8pZDB4NI
         lSp6ltT5jDc9NI2MHBx05RIA88uz3D36Bu+WqnA1GihMV+wTpwIBQvfF0fxCWpI+ojIy
         QSOZCO59nKCSUKm0d/Vwp8Ga/f26UHnyE6R7lKgNFsjcujVFOGfyKvMlABIWHzFVunv+
         cavg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781627346; x=1782232146;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eIMO6SgDQy8k6Y9Wc+abuZ28DjMg1dh69GWsH055cVQ=;
        b=o910cz45lHFKvkV0KLOpOAXPZbC+9n9T6zZWI3Vl6WhyWA4jDQML+RNf4IVwJMh7Wk
         i/282WERv0M+kqE+d04Gu5xbMIkED8glYzY4neLgJciQq5wgQivQi5hDITlYcH1Z40of
         jt75TiTFb7L2fTztVO7MFKgcGq5IQOpnX5J+5FHYWReIcDZj7AL6zrp8bKh7xbN3PQTk
         vMVfULUdAWN7DaMCHwfPpJN6Gi5U6knst8mAjWQm032G51Sd6Hk+9I3VVTdUvIzmP0Ql
         KVRmU7LB0XE1Hc6KA9erHerutbBCKxHSNKcqbyo3bowJLgSRvjjQmTmZxYOBp8lJmtF1
         YQzg==
X-Forwarded-Encrypted: i=1; AFNElJ8du/B69/3x+tjL9ncN5hNVIkoqosdFbKmUB9M1s9iEqQfJyLoWrJqyZ4N+GKbRkSqJTwCCDG4Z77MwOVZP@lists.linux.dev
X-Gm-Message-State: AOJu0YwROPGFKTbC+IM5JNXmkFqIs7DYZm8jDfrf8tHSe52uWLG6KxDV
	nkMp8+1m04TMGKe5wOvHZx+QI+wgs4orafIVQzXyMtE8YKfJF1HJ0LwT
X-Gm-Gg: Acq92OHdVatKygoseCCRYNnseFx1WZkiXB9jTVYM6RkhkJlbgcIa9PI1qzDHznlOBGA
	XwqHj8Q1Bm/kAI2PVQioV7+daTbhfEskgPrj1P0+iAvkvlJynmcLTWd/cjqPHTL6KYroMyB2XBh
	L5IKjEODSJsQvBGZSqoS6N2jkiWBF1g+zSimqCdGXMEi+XwN7pO6HDc8ylY9ZM/932QHLWYC34H
	rBes7fdNmDpomUKU0qvRq8tq3QnS3A5h6k/IZJXxv+dOMBBBlQt0RKEOFRME1P7/cI5s8NUZUVx
	jLZfXrCYdBpT8ewZci2Isz++OHokAK7/FbS27MxFX9FQGofPg1ltGCoylRrV/f11rCKrmlkOUqb
	JS+raG/Pqmj8YXg89A/ev3bB7PhYGyiQccQyZoWSFEZiLnaAy/2HFoJ+konhZfFR2iaAQZOtzTJ
	DTdOHSX1k0N2CLNjlM4nqpNe+YNdL3XaHntGqdCIjGaqW4dTBdE/r1Td6z2CrY+nrOutp5BcldU
	Q==
X-Received: by 2002:a05:6000:b8b:b0:45e:742c:f195 with SMTP id ffacd0b85a97d-4623692f5eemr315539f8f.12.1781627345990;
        Tue, 16 Jun 2026 09:29:05 -0700 (PDT)
Received: from fedora ([196.77.26.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f3dcsm43180505f8f.13.2026.06.16.09.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 09:29:05 -0700 (PDT)
Date: Tue, 16 Jun 2026 17:29:04 +0100
From: Jad Keskes <inasj268@gmail.com>
To: inasj268@gmail.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: replace beacon timing magic numbers
 with named constants
Message-ID: <ajF50N_RW88mhF48@fedora>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Ping. Any chance this can be picked up?
