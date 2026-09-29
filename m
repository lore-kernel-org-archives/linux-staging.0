Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD5D3CDBD3
	for <linux-staging@lists.linux.dev>; Tue, 29 Sep 2026 09:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790673788; cv=none; b=X1Xcu2bT1Zw2k27lwvST36jRg5ApGJwr6pn5AIcA4cErghScWAGTXwxR9Vbh4jDiO82wa3alP6YY/eSng7QRj50DKOr9CxcJx7TbcncomdngLIQHQ44b0cw4wHkNiErjelmUc1l4NplezowCWUb2/i7uGD21GMjEPb5fOhTGwck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790673788; c=relaxed/simple;
	bh=Yvv4offk/A3nngbeY4OC0TNI33ABSFCQo9LNH+QTLbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SbG6ZYOtOt3sZ/OIKmdsmbCAFSKxQ+RVgXMJQZDejipBJPrO5P9Az9QRjpy5FV8WcL6LyLJHHcovocPxKA9kLTB8sTMi6gzeFN5mrNNGSvyWI7Xve6qHNk+UNrp386b0p6IYgixrUNVOpAPPWWfLRY8AoI1WfXWRHeROJ41tinY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qxNOdQeI; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qxNOdQeI"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8e6ec4dd4so2996042e87.1
        for <linux-staging@lists.linux.dev>; Tue, 29 Sep 2026 02:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790673779; x=1791278579; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yvv4offk/A3nngbeY4OC0TNI33ABSFCQo9LNH+QTLbc=;
        b=qxNOdQeICY9gwnDSH902HklwWLe42An4Hpk59I1Cd7sWR4Ognggaqc554NIFWYnPIe
         937Du4+TPfhoMOEPsqGt26cGpiniAlkA64BRHhIhr16glqlThX4i7lMWszvJUWKkFjr3
         dsCZy6b/Aj9dLmpB8Lg/MCajtvAY350V7xNfHFKQh0jajIg7jz/jiK9AJt3R8Unau0Qg
         mS9dxTCEwonlZ2k1E4yhMlLIe9jzShgxUsRRPqeXYwl4vweN/615zR82gtOn6Zsxh8Kr
         3FzyG7LJDj+wIKeDCxuUjGqZAlHbvubi5hfGHAX3uZQoi0yvxYNW5R0srYBfnG9039SJ
         KmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790673779; x=1791278579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yvv4offk/A3nngbeY4OC0TNI33ABSFCQo9LNH+QTLbc=;
        b=qooSXvZVuGjlFZfGYsEwUVTtgwy5Kk4XpTcsfS4qp6qbQXVpu9sydqO9Tl2HKz/YKl
         49w8szHklgOndilLsKqn1Idze8uPM+6Yh7qjAVtWPUKqTuBXrwICnaKXhIREQl7eKoMw
         7BZENobSgW8PY6Je7hjwy1wXQgP355wJaoaHXJkWg34N+qPfO/KGTzBHcVFf9ZxS5rKJ
         R3KcDzxI6LA3ema08iDXmo0bsLPIr6biB0VDT8iZd9PeA9lsMH/cO+/HDZakBBs8uQM2
         XEWV1coRYPyZh03pACEW3rolYLqj9b3h39swJvYknLUEH//daD93SHVimOYqsuBIHFoz
         8pTA==
X-Forwarded-Encrypted: i=1; AKwUvBx1Bp/SqQokz+9kO2PwjouhosJ4tgwGCZCj8N7pqy4iy13GUjF2Ad0skYROCSwSuYjEP0w3qVf/gzRwWdxl@lists.linux.dev
X-Gm-Message-State: AFq9FYIAKUYQuCo2GN2sDYNIGiioJaPmU+o79br6IF6Rmks4KnC2bySz
	3oOOMyc+QVIxKDXpQdeDDnhrsFfY8JLDwsgSk4sitralEdjlzSDkebql
X-Gm-Gg: AYBFou1vXBi8PXxZlWnz4HKqsH5fyG6RF6qybBxsl2paOWGqvD8vSl/a4nkufSjbIPa
	lBsjl+fTEA1OvhfDvuusf05EPuZtQCKplaPIatRrZaj9DAgwogV9zTG8s1QXO7EQSLe75mzF1m/
	In5FZTk8I5Fbsa1U6urJSBWpmHCIzzi4SJe8/APKrbj1kUNaI2aHCBBixy4NgBlVq2MllwYexVi
	WYbGoqK8+JVRdOazOXghAusTAFu4RI9De0vGnscMqmi7KwNlsKnkHvehIlN0pVVHvD1vZLKxbV2
	mzz8w0upDTc3vv/yp03LPntDGkXygpv165p+hhQCY7T60qOZ1jwk1e38bbJSCg8D3PjutqSJXFk
	F/4z8hA7/Y3d4CXzG08KqljcV1XI0XbZf1ltYLNcSu6uJbshEUAU/fcS7k4gmQCJX0Y0QhF6azt
	hI6N9FDLdGYf/MQ4Gh+QCHmZIpka1Kko0H67ejUFgJtd4KbzfkzqXRsY1T9YKvs3+YC820e8mQ4
	N450NL4t28=
X-Received: by 2002:a05:6512:3096:b0:5b8:ef88:d56b with SMTP id 2adb3069b0e04-5b8ef88d614mr3358193e87.18.1790673778535;
        Tue, 29 Sep 2026 02:22:58 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([169.40.47.10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9d826f9fbsm1262160e87.12.2026.09.29.02.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:22:58 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com,
	dan.scally@ideasonboard.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	pm@petermarshall.ca,
	Ruslan Koreev <koreev.r@gmail.com>
Subject: Re: [PATCH 4/4] media: staging/ipu7: Add monochrome pixel formats
Date: Tue, 29 Sep 2026 12:22:38 +0300
Message-ID: <20260929092238.1765758-1-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <arY2CULvwXGyVvH_@kekkonen.localdomain>
References: <arY2CULvwXGyVvH_@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sakari,

On Fri, Sep 25, 2026 at 11:51:21AM +0300, Sakari Ailus wrote:
> Can you try doing this with the ipu6 driver instead? We're about to drop
> the ipu7 staging driver after some smallish number of kernel releases.

I wasn't aware the ipu6 driver had grown IPU7 support, my base was
7.3-rc5. Tested now on next-20260924 with the ipu6 driver and patches
1-3, the vd55g1 one reworked as you suggested: the sensor probes,
ipu-bridge connects both cameras, libcamera streams Y8 804x704 at 58 fps
from the VD55G1, and Y10 and Y10P stream with plain V4L2. So this patch
is not needed there; I'll drop it in v2.

Ruslan
