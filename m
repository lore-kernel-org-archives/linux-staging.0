Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4C34418F5
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 15:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772207338; cv=none; b=n04nlSRbO6A8n4iIt3IxtufcU35nt18pwvKHydz8wf4vpkQxU/lFRMO0I5dtsAWMuywNG4vg1ipXj/2bkyQcfyE9quPkA7MD08nU2ksF088WmN/11+vEeHk2OsZhzYM4zmsowmrVz8bm2mnA8AuBzj3TQohV3w7H16LEunKvXUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772207338; c=relaxed/simple;
	bh=+t5pLKAzICJY5Sf/WGwIojVUPdyQXnDkGJbuyFGVgsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZGWbNrE4GydsGGy5vOhNc2l4snpSveBbJTbdDD7MqvrOZSyxakMs9bl4YLumrkrJZWphmMdChKXr9z62vvsl3Yez1/t+zFOwGPR3DIvOyNpNR09jetzqTHu6Nruc6GO+9+jcDEHXvYjwSK8+ok6cQl0dCHduwvI0vaEf9GrnlYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hnVXa4R6; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hnVXa4R6"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c70f8ffd162so1046220a12.2
        for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 07:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772207333; x=1772812133; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+t5pLKAzICJY5Sf/WGwIojVUPdyQXnDkGJbuyFGVgsE=;
        b=hnVXa4R6fsutmo0cfO5AKHhgojY5DBny/CtaAWa6Ywb3x/MCzVA0URvQUYHQrKrkVS
         GGMHFFeXQT97M4Uws990o1As9xnoKxUA/2GfPEoDslae7RnvWOi4tto2Cpk6TV0QcHhC
         Nf5N6oAi4+cceEl/Tg/jHwLlZmqDcAnSraz14UY0fh9RG2pYQFC3WyM2PkRRTf4VQSHi
         uedRPodqqKkeXNznXvtTgclyVawXUNKXWsrVB+Oorcw+ia7wfMqyExM4vfSzQGoi/wO8
         D93A7m1zro+s4zFsH/sPZWrc3LhQHYOT9R1MEs1TyX+tzNXYQYl3iY9qXcGB2klR32e8
         jEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772207333; x=1772812133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+t5pLKAzICJY5Sf/WGwIojVUPdyQXnDkGJbuyFGVgsE=;
        b=EGesoWwmCf6si343T4c5ffengiVO8wg3ycodeOAVwDvJ0AtVT2Is6/ZtOjNkI2lyHV
         vzyYg7N/JYBb/KXKv5pxpIkMnZW3luhImMbGHyVzezOOf19svDBR2hRaRj0sEuCPURhb
         uvnxu73nxUQ6YNjGlHS7YZ/0kCdDwjavNeOmFekSrby7LkbwVFm50rnBYnKQQ6+ShiGj
         TVbyKrxnxa/mRcK2/IjYolvOKVROtGqoSQbvz2sFOdsPuf2X9EBgie1VES/sZ/wDm+KT
         lLfl4v/q1Dp7sLKi3e1K20UueiOKVGwYe0HDAe/wS7GqlWzkyMnSLCetzvrToVB6DAbF
         1WpA==
X-Forwarded-Encrypted: i=1; AJvYcCW63aQ0aPev495FwaR7nH6AHGQjDY4ToYCBl9lth2ksAlbn2lNdHAufoF4VOPiLxSvONwVRT88q9qSIrqC4@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1nMjV7jIaEwg0jY7kBTSI2n1hCtvMjr8j6ft2iwjH++2wrSyg
	U8fJ1SN7xwgvKGPFdXEbhQrJB59AZB/wQzwPLZk0YeRwvC29AZgDsj76
X-Gm-Gg: ATEYQzylFZM8+Q299J5PZ9Gs92K832A4PZW3Lii+Ajbqeh2nKV6xe4tGvfX9Ez7D59+
	p4vQIO52Vmhr+hYKzvp1pZ3wXImFkUVMEvxEL4ZIPjTXIiXsCTrZeH5QGBEVqb1Xo/sfTU0WQQ8
	o+8RFxno7S9+8mtHNG6ws4CXKkBV5j2QtcviNZHRYFb7FfJ9dLYApIoUSKgAb/Qgv+nCVAzqlc8
	dRpD17X7hdvK9pfXod5xdKlFIGaeWBLxCrGIRLgE8j+10qpXjt5/qywkOIM24JPSbzz13TlL5yQ
	n/Kz2+p3wRFhQhqq0FKpow2EBlGgp+OAHn1/JAKkL9+Ef2DtoC1fK4Si5h9kMbKFutSDXX8a4XK
	h1XA9dgooOuOVew8nfz4zVrb8A0s2N0gOOdqUD3pqmeDk+EbKJx8+6Bq2hqj5XseGsKtF8/mB2i
	1tngtMqSpKMFAdsJ3QKjMk0bcEHmCscOrUCQ==
X-Received: by 2002:a17:90a:1609:b0:359:f62:96ac with SMTP id 98e67ed59e1d1-35965ce1804mr2282093a91.30.1772207332651;
        Fri, 27 Feb 2026 07:48:52 -0800 (PST)
Received: from fedora ([2409:40e5:117c:c19b:7477:bc4b:e6d7:e5ef])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35912e19c4csm8539504a91.0.2026.02.27.07.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:48:52 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: dan.carpenter@linaro.org
Cc: greybus-dev@lists.linuxfoundation.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: greybus: uart: improve lock comments
Date: Fri, 27 Feb 2026 21:18:39 +0530
Message-ID: <20260227154839.7866-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aaFdxqxEUzZFVIqQ@stanley.mountain>
References: <aaFdxqxEUzZFVIqQ@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the detailed feedback. I'll do a proper audit of the
locking and the disconnect sequence before sending v3 from a fresh tree.

Regards,
Shubham Chakraborty
