Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793048231;
	b=ZD0lGm7f3gIMFjjre10tDy91WbkUJ5EUQE0DhQ4H70p9AJh2KVUvGzHhf5tP98iVnx4y
	 h67d469xd3a8CGfHmeyHWuwMbWazjeqMqDvk26Kp2ztS+kTYqUaAoq2m+xk2Q8MsE/Mfr
	 mR8xL1OE6u+hAgNlTgoiUzZk8xYxYlpNYIs015KzDnN3Dk6HDDDLjCyNm04KGuhPKqEwW
	 dFKHf0cfvfKbIRuB8OdzWVoLYXJ/mcWplPHjAJUcCP3bV6S/CWm7wlvoRei0Gx5Gqii1I
	 m9Wju8PfbFGMLImhHYZ1j4KCw09dEk8gysw+0E5BmPGvK1a83jXrJgKsKA//1JFT3AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793048231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=V67+FxKk3y5OO2gy++J87FLYTX6VlhstikqZH6vOo0g=;
	b=IW+W1/cK3wl31My31awLxhPOollFblCfBhAiQnQWSFXIihWcPu0I182uQ+7K9OyeBWkx
	 0OdkA6a1PRMQi/VIwDtduV3+WZgppqIMKK96we5XH5XYe5hZwIK55In9IntEkun33Wi7J
	 QX/x8ucpq5ltd3Jw35vVvNSuD1DdLXWSabFyJDhmMUrOw7lwuRy6fp7M0qHWj1z+tvvCr
	 Bm/MNCUP1xmNgckCcPAu47QL0aEs0b9wOml2ebgVb8LZLDLOdQxqCIGT++/EADIeFlDLn
	 rc+/YHOPNNwnCKhvmwxCDwFQCU3S21JR/Sp7sr2Yax3Uz1IBfaPppVUFJm/2QkQo/0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kq1LcRvr;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC054606A31A
	for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 20:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC054606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kq1LcRvr
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so16256095e9.0
        for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 13:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793048229; x=1793653029; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V67+FxKk3y5OO2gy++J87FLYTX6VlhstikqZH6vOo0g=;
        b=kq1LcRvr3Pmc0a+/yODrm4LgWEI1mUF6R2Kg1SJV9X8vzDlpvqeT/KNZAbwBesCGcF
         P0UdhYRzuRSiwA0kC5ZMMXH/e9I/I98ugW9qf1mBaiBFaIZk8PKQBzIU/UA4gtgrNj0f
         A6cQPKq5eN2qBxG5Cny1Jeat4AqbZysEswqIPz8EUh0aZzXrA2zBIQzL8wVfVWE3SktQ
         odgxF7MpMPmSQn91Ti8DFmzsYNkwyb7x58CuyAPp8Co/pEX1FH9MlD52Z+jWqVJifZzA
         qxT+MmMX2wclxygYSyL0Iua/9o2IV1VRV3OdtQzEqAlqcoJMs2OeQIyeMd1/7lQlNdHE
         0NSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793048229; x=1793653029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V67+FxKk3y5OO2gy++J87FLYTX6VlhstikqZH6vOo0g=;
        b=bntO/gPCXH79dyGh1noXCUwYn5r03Etzs2nBhKU94emFxvZFlBCH8q+1MHq9YBGMZS
         4xKfVdOQ8Nvm4R2Ug45r5mcgmUYZQwwAEcqVpbuWmSK44zZOf3EO7df/fNWWyhMriSgM
         ot3l0FT22fJ+sCaqDk0ghF4/JPpE/Gg4NNvScl5DHTJ9CrfZdKotkWhqF5jXRG4hoYv+
         vYaO4bKpos/ZCG4l3qS/3sPXzfegYAVCXWZ2COkM0MAgq/sTuA6OmvZ9tvqS29yoA+5n
         ZZHmu9gaH+Pr4jCu41vZh1Lyi7XiBGGwZBg8lrthMmEnLuVwvgvQIE8pWeuKkj3m5xe0
         6pnA==
X-Gm-Message-State: AFq9FYJwcQYLuptExaVjbUGMxQTEJN1qIMW2YF1402vjDInAAmzNFCgE
	q8G0wqN86RuaGncq1CLdehPMdD+eID2ApH2SXCtcaJTi5z3s83o8n7rA
X-Gm-Gg: AYBFou1OJlmxdJxdVBdUC4y7Oh/kamuABGoRRvPsvkrlL9+MnkOO5+pS7IshtC9qSnv
	+4aRb6FvSeA4P/Mi11lTPqy37LTspn7ksbNw6pMVvulNoE+AJLyjPUAe8mX1bHbDPYIFobvN6h9
	RqTC1Qmpk/KltZXVJ7duKf1iqiBH/WYuRovx/w+/aRHJsyRetuXYRigSCa9W1ldUonyFHx071Q0
	XXp93YqwtLgfwDeBxzVtph2QdStAL4d9fY5SGqLqHZNqjgSclPi5hDaQ2U+B+64yyGy6Q0zfE7Z
	6JuDawOVy+cSD+2yz2pOyAjHiUZ2suBeCx1+kdg1FzwuqRvpE/XMdUMRIh8XJG3hyKCEYKc0hrS
	yotPiRzSS4+HtFZVw546KI6K4H7D6/Vd5/L/z2RwmtXEg2gBrQeT6+ToTlyJ7e7q27XLdYsVVoO
	MLN7Mvov8iXrcNogBoZ8KfOWIC6EBg2N+Sgu87gvKbvFtvPCeMArSRbJHcnpZFN/3Zmy+vVDowg
	+y3PzW/USTwBllaQ5A2bWJhJTPE3mZcyrAU20yUZHOstNzpJtq8JZ9yJ0RXmhMWsLQWgHi19vS1
	Fw==
X-Received: by 2002:a05:600c:4e87:b0:4a2:1867:10e8 with SMTP id 5b1f17b1804b1-4a35aca7643mr165038545e9.25.1793048229307;
        Mon, 26 Oct 2026 13:57:09 -0700 (PDT)
Received: from pop-os.. ([87.248.177.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a029332sm193725085e9.4.2026.10.26.13.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:57:08 -0700 (PDT)
From: Albu Victor-Marian <albu.victor.m@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>,
	Albu Victor-Marian <albu.victor.m@gmail.com>
Subject: [PATCH 0/3] staging: rtl8723bs: checkpatch cleanup in ieee80211 files
Date: Mon, 26 Oct 2026 22:56:56 +0200
Message-ID: <20261026205659.181065-1-albu.victor.m@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up style issues identified by checkpatch.pl in
rtw_ieee80211.c and ieee80211.h.

Patch 1 converts some rate and mode check macros to static inline functions.
Patch 2 uses BIT() macro where checkpatch requests for it.
Patch 3 fixes line length, alignment and a CamelCase name.

No functional change is intended.
Compile tested only. 

Albu Victor-Marian (3):
  staging: rtl8723bs: convert rate and mode check macros to inline
  staging: rtl8723bs: use BIT() macro for bit definitions
  staging: rtl8723bs: fix spacing and line length in ieee80211 files

 .../staging/rtl8723bs/core/rtw_ieee80211.c    |  92 ++++++-----
 drivers/staging/rtl8723bs/include/ieee80211.h | 147 ++++++++++--------
 2 files changed, 132 insertions(+), 107 deletions(-)

-- 
2.43.0

