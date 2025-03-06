Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D3A539A
	for <linux-staging@lists.linux.dev>; Thu,  6 Mar 2025 00:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741220157; cv=none; b=GihvzbKlf4zb5e4eulTPxML6G8QUExp8PAGSUbM0qW5+7sBJoonHy4IsAUA/7j2IKCq3+AE8qzTT+Y2BrTir/nG0J+jNO+xhPocNMwEyLRMKJW/EqR1En6Ms3W8jYMu+k+zw2puDF0N7W7a48OWqquhFWCUnjYAYHModOc+y14o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741220157; c=relaxed/simple;
	bh=favXHBjW2XqGOaXq1mR0Rb2UpGKt6GW39kYnwTEyA+o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NFHyypLsYquoQrwnDMrsdRRLMci2+A5z6m5rrLfFVgtW+4Kj62KjQD264ALza0I9O+fjrYokqtbPI71u9/TbzSLh2kk50C4szTXNAEToe7rP9xM9PYcTvzJ7x8zo+4D4dFuxMKtjCrA2/Y8CPx7pqxhZv6/t6Fimr92iClzp+vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gj0Her+R; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gj0Her+R"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2234bec7192so888795ad.2
        for <linux-staging@lists.linux.dev>; Wed, 05 Mar 2025 16:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741220156; x=1741824956; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=favXHBjW2XqGOaXq1mR0Rb2UpGKt6GW39kYnwTEyA+o=;
        b=gj0Her+R0ZkV6aWT8jFQSs2WWQMEyN1dvI3bblryxZBJr8rxh1yaXe01XMviggTezV
         1IK1wqiXDsV5Mwu9ZT33Ys9bnNjswTK7PuE82f1X+C786HfYxAc0MqWQf7xxkzYkMEoz
         sworblFNow2de7b4U0MMmAEs+wDABjrCAVKeIJR92Crp69dwbqOKSHn+CTMHupNK9KIu
         kNJoyj7ukHPsCJ8bJab4GcoXL6M2PsM0lTIFk5Nk/MsWF5pxSx0P5j76IUTCeW1hPqsn
         eLBmDjLjKi26HZ3oSRf4M5Mvna0gjPM4hwXeurWTVa3GoZL6qour1XQBZmGgna/Nq+RW
         7Nbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741220156; x=1741824956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=favXHBjW2XqGOaXq1mR0Rb2UpGKt6GW39kYnwTEyA+o=;
        b=SRw7dg4Rx5gAsd0ynJRX7QgbemssYQUPNCiLpejmKrp4ydktgpNgjMmWKi5STD7Fnj
         0sc/v9zmoIgTo5HqxvM33EQiWOIZPSN1IioWi4meIN53Vh9V4afaFM/C/RthdD6QOiqR
         KsQLVWvTtxkOx+E4pbVir0kJoYNyq9rP5RR5nkMY68XwjOiFSz7+qu1aVqIjv014X8SO
         czlhASS29ENf5VQsxnTNwnDm1n0pvCu7YqwKUx9K4JzkrajVCQOeY6e9awQHoWDOPcqm
         u6BGJGNUM9aURQ0hv7OUWtd51Ry1bx71SVPmsnR1Rqqi1w1VDRwLMFWBrQ01ReENwOZ5
         m82Q==
X-Forwarded-Encrypted: i=1; AJvYcCX7shuKiC4O18NboMwoT4lb/PRYFx8M6TqTExYXXtDQiow7ju87qH12Ewqs3Et7/Map1e1WH2MqgcgoYP2E@lists.linux.dev
X-Gm-Message-State: AOJu0YxHnhmoplyqrRand3ZxH6H+fkuW+mPd1K5baVrYd1Xv7YhfrEC1
	y59cBtj9k/0l/OKfNpkAJ7bLPBlwaaHHUqJzRgnXupX5URbEZvR8
X-Gm-Gg: ASbGncsk0m2eKQER2P/ZqSalXrttTDHqqjeTsJOLJUxO00dNUsEmq66w5tJMYrv89SM
	hgLZPqHLdTfaaRGNXij4Fip9UKK1ggFU2i1VUcTv5GMxomau7Gs9WPF5th++JPNAkcCLuIP63Nl
	2xCkDMtwPcvhTeYYL66/JUhh0EFh6PmKnCZd2l8qy8HCd0nkK5X6aO1i6yLYaRDYp/dZY1z7Jx4
	dGfflaLzNH9LOVOCfWQYx3j8sAA90o0qIqZ79xexlAg5eK+cdWtoxt6f0YWuUrnqeeVywFqxd4m
	Q77M212aOPOtUgE1D0yo3msUkofq+l9zSvH12cLN3xNEcUtwfX93NR4gHsrq1zK0Ydk=
X-Google-Smtp-Source: AGHT+IH0KfutgjAyQ57rGNBxxUkmDhrjevQ3H0lmsRe1Jaub+nCdx0wlT3TR/LNg6JGp9CtdqBt+Nw==
X-Received: by 2002:a05:6a00:1995:b0:736:73ad:365b with SMTP id d2e1a72fcca58-73682bf0da3mr7851367b3a.14.1741220155668;
        Wed, 05 Mar 2025 16:15:55 -0800 (PST)
Received: from danascape.tail34aafc.ts.net ([2402:e280:218d:2e5:857:3077:7768:d8a9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73698243f21sm46067b3a.52.2025.03.05.16.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 16:15:55 -0800 (PST)
From: Saalim Quadri <danascape@gmail.com>
To: jic23@kernel.org
Cc: 21cnbao@gmail.com,
	Michael.Hennerich@analog.com,
	conor+dt@kernel.org,
	danascape@gmail.com,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	krzk+dt@kernel.org,
	lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	robh@kernel.org
Subject: Re: [PATCH v2] dt-bindings: iio: accel: add binding documentation for ADIS16203
Date: Thu,  6 Mar 2025 05:45:50 +0530
Message-Id: <20250306001550.1555151-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304143918.733d6cca@jic23-huawei>
References: <20250304143918.733d6cca@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apologies, it was a mistake on my end, I had wrong dependencies
installed which passed the dt-bindings check on my end when I tried to verify.

Sincerely,
Saalim Quadri
