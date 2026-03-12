Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA1939151C
	for <linux-staging@lists.linux.dev>; Thu, 12 Mar 2026 16:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773333861; cv=none; b=D9df3QNRQZOG4gH6vMMrjW+raXn1O/y0kDLWkL7X12Ht4B4smQ+7cjOqfFg7Vwwbo4NYzxQSCXaWSzxGwOFWGqFWJlCdjzHWrS42YqopB5v7ZVHBq8E+o0IKY2C7uNexH7Watv3QSf0QFCt/SrBP3krJcYPAKUQ+IbdCidYBOJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773333861; c=relaxed/simple;
	bh=Y4SKU/iNeT7tv31qlyUJxRuJgDhCa4LCJ6VRhDYipFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q0sQTk7P5Fba0mvwLO5/G6QH9S2AuBbGbkqK6R46Ey14VwicyIBq84FXLI4uatFZp5U7tH2dE4d49tl8e3F3Dunahi+CKnamNiMeJbDfBVXSJ2Ogpsan0e+35fnAWA9BYBR3Us5RALKiaZsJHkX4Yodqo6ynTXjzbr//tYVaof4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z7PiRx2Q; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z7PiRx2Q"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-48534e9076fso10769975e9.0
        for <linux-staging@lists.linux.dev>; Thu, 12 Mar 2026 09:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773333859; x=1773938659; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TijEi12T39A9lphPrrPHX4bU+XdkN8pkRQwCEBh/Zis=;
        b=Z7PiRx2Q5+Fxl6/qSKSLxhnyJDDhgVXbe10o3o3vl0IFW1haqsfjrvbH6QMGVjnRGX
         WuN3AAtttzwuPkrgVkdU1bgIwH9IL9MwFHr70lnGT1ovUSy4Kd5fr0CYWrI1hHA7426m
         mA7CNBKQeD+ueMkDum2Q0dvnnui318iUuzigHDe5rSojssIcW8stv16SoGVlap8WRhva
         ERBSNYvRAOQzpKycLKn7sGi8ijpewsbCNp1f1heX9H5mGfnsSC16lfOPwNUyYX4pygAb
         7+uBmWAJDNUhPSzJaUuQQEkHPr6a/VBKJ6gXdC50se7xjwvZSeU3yxq4/0GusLY+Y7ML
         p4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773333859; x=1773938659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TijEi12T39A9lphPrrPHX4bU+XdkN8pkRQwCEBh/Zis=;
        b=NNdZ45bSRMiW4vCedWBNeDtXd8EkMm/BTxzCjGMnNL3u5GzXao17Maxe7BVsR2ltvH
         GG1ipFB0deDSggX0fW+RDhMKJD14S5AayB/Phg7/IAIVUp9d+0LYre26jLPgyV+KfBzj
         oweS56Wn1ZtGotmQpGh9AJVQ+aKwvok4sHts8hX2kqfcDPfqrwnA2lahFIArY54h4KV9
         6I1voc+z12oLnS4S9szWbfuDM3g6kNSQyumIMtP2C7ehNzCJy0GfwYuwSEwmlyp66nIn
         317yW0IT8FD1fPl4U9dXskb6FU2/PzWikxBORRKsPgoLh+2Q9ZdhLTK60WNuvp5PbU8d
         mBMg==
X-Forwarded-Encrypted: i=1; AJvYcCX2neqSogYz1jIWneKiKb++ZWVS2qLvHrYr+nvr3HrYVfMW6g/Pmi3D2rvS9ErIP+0EYouzQAhicxQNNY8b@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2MC+hvVFFbYs2I/5k5JqixX7Hh6XdEeLYMH31c5h0Z+tZDSi4
	qpZjJsUlK24oVl7JoMR2l6CdR/peLods/Z5YMtLEx42lWXmlj3lxjcpY
X-Gm-Gg: ATEYQzwMjUeKPGmhrRziwkCOXNQlo6sHqNyKqxijFgy7h2U4m+Nu+ozIw6+r3vPUNKQ
	SF7MkYEIuE0Z+svWaoPMO4XIiFArxJCO63AAIkcIRJtbatGUakFGGW3K6INAv7Mg3ID52HXvFZq
	nOrT9xKf2b766t2HrjLcwkyOe1n3lambA5skcogyqVZ+p1gLWxPAfKOKGT54cvFiNUDTEMYcI++
	XYmPhMZusEE8txO1SexQ4yGXjahWqeUjQ9tVFFwFJZNnrGXkZoG8U28Te+2Lgxa97ZyCIhAvrLB
	Tz7UL/kb3hBzqqLQz9Jy/srvRkz7k2pQhGALiQzsrf8SeJOEtulgeg+ho1JvjZArY/lMY/UhAwp
	bxTy+i2rK0JEPuYSh652C/G2vWNVHcSfQihFq/kLKEmJU2IeRmSb+SEjXQ3WwQqDUqstxzIRVSb
	6P4Vk7NBCWGicdbyeUdjMBburgfAKJUrkKd732H6B3
X-Received: by 2002:a05:600c:1d0e:b0:480:2521:4d92 with SMTP id 5b1f17b1804b1-4854b10f2b3mr124513115e9.24.1773333858631;
        Thu, 12 Mar 2026 09:44:18 -0700 (PDT)
Received: from DESKTOP-BTQF5RC.localdomain ([85.110.79.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aa73dasm691109075e9.2.2026.03.12.09.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 09:44:18 -0700 (PDT)
From: =?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
To: gregkh@linuxfoundation.org
Cc: b9788213@gmail.com,
	ethantidmore06@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: Simplify error handling
Date: Thu, 12 Mar 2026 19:43:52 +0300
Message-ID: <20260312164351.2295-2-b9788213@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026031232-mushy-demeanor-299c@gregkh>
References: <2026031232-mushy-demeanor-299c@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ok, i will try to fix it in v2. Is it better to use a different subject 
like 'Improve error handling' rather than 'Simplify'?

Thanks,
Bera
