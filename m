Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E767419311
	for <linux-staging@lists.linux.dev>; Mon, 20 Jul 2026 12:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784551551; cv=none; b=M0YXkEMQTNXymJd4kbp2JXQOVQPvcn1jCCKBI5IAUxss3sG6GB9XSgf/FV1E2BpZ9OUHt+1ZMP5nySjAvw2NCUQ8EVq13/3GZ5+rve9R3N9F6wZ4R6bbiomBbNch8ErEqt8tVeblOQ/u8vjwMObX3hxMZ3/RwMHzo/dlgAenuMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784551551; c=relaxed/simple;
	bh=f7SxfWzF1fN0w3gyJOmgUEtdP746z/UYWdkK6CjOYKo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GffWDw9cybW7BPbv2i/KWHnkBM/6wVeMiv8+jmMecl+Whe0QbMgkToAQ9l9mHTPLjRcFB1rrxW+NddqXj/pynVR5EH+Z0c0ohHpB+awXUJYslJ/X7h3Ahj/EHQW3ghta3Jwf5yGHtjlI73lbsFsK25Ge/g0GY2NO1UnZm9Vz7LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EPyj7iHR; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EPyj7iHR"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49557167508so15824785e9.1
        for <linux-staging@lists.linux.dev>; Mon, 20 Jul 2026 05:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784551548; x=1785156348; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G059Vfi4FiJm+taGWU/NmTetjcpY38AT3/hHXbg+mt4=;
        b=EPyj7iHRkBnXBkFcV3OKw3+d8eUDhxqCWOcmQ3gy60CQxoD9dVgjDlPW9r7Xrv0Zpe
         kvR3E2IDcYO5SLvMHp16tWm4879fyKOlxlvlj+BwBtGqiF2iV8y4J4PE7ElwucFz9DZi
         hjl3Xd6sJFOFKdvcdUVyLnPGBKnODHZ4ItU/hlapOl7VBHul2xJXq8sHgygij4rzun2q
         cQsG7EoZnlQz9jOZTrD9kfQg+K8NxGs7HRLCBZduW2/5Nlgr32AK6ZQ1EYaa/VpTPzcl
         lWDhWRLRJxgWNJohe+5aYiZAOgoMoKZLByH5NdFYBeTj2xvalTkT0bEO2w7RWyr9aFJZ
         G+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784551548; x=1785156348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G059Vfi4FiJm+taGWU/NmTetjcpY38AT3/hHXbg+mt4=;
        b=hRFxnxDcHsHABlrUj+v52UTBWK40L6toYnnk2L4U/xNdnhGbNHVMCHmwsdizAKoN/Z
         JQhjTDmvajh+xeQX1uxzZaElOKXv7Gq4FqFchYkrIS8zzMTpwIhbd2B9zZUqKMIAo0HY
         yOn5cb2uYFDfV0uKBhIg8K656IQAO5Udvuj7Dmn6CE2/M2RiaBMdwRNP697aQTlMJ1Iw
         m6nc+p+wk7Yxbb4Z+8x6idITxvkzinPMBvYCxCBZdr3X1Bw7YUo9Ein0eTTIvOYSQawi
         5GvW5ohZgcQl830x7kZH0TabfMOfTwNCponvg5lsvurlP52S8Wm7hh1Zhw7iYfo9vJpQ
         jgLQ==
X-Gm-Message-State: AOJu0Yy/UYm1o8dT+3Mc2ZN/59juuQkF8NavrbPxzX3bo7JiuZBpNX8Y
	cMjpqpfMfUb3NTjmqk2vh2jZzzDRdI73S/QIVq5JTyAQWYIcDK78w5o1DjH44xgF
X-Gm-Gg: AfdE7cl7z3b9r2LoNMJOSdL1QxWE9vjurcA551Nitmj/YRW+c3QB9x2AZ/V9qsyZMqq
	gxUA9QLPRHGp4U2R+Fe1yaWbhYfQWzXrZY6Ysdi4GoJl3GzXllmz0BWFhsAb1PdTaMg6BWiveLu
	aCIuCZW4e/3ki4FSviaDcVzp0HotYZG65B/XUq4QI00t5yGfMywidKDE7bs53Isy9NIhKpIsIe0
	QMjLWg1XMRDMKfsfmAzE939D8qTy1F3ra4w04+7Hs+LkOX0aqPzPI1CVDCxHu84D8c1YTzvWrRJ
	TB8LyWzwgF4NAOfHLagTdd77GvJRLQKQo9ok4TLfPObeTiu/sY4S51NpCyZMKK9qp+vWuHCM7AL
	ExYjO8/xy31jt4JXpyRC5g01XfUURntfdMcWlphjde18d2gsVglhs8sMrdi0EG4Tq24yvfTOKSY
	agvq9bjNepo1srXSZdrbw0FSB+ZpYZOkc3le0CIxkzo44MW2W1
X-Received: by 2002:a05:600c:4755:b0:493:c2cc:aecb with SMTP id 5b1f17b1804b1-4954a51590fmr169141295e9.38.1784551548017;
        Mon, 20 Jul 2026 05:45:48 -0700 (PDT)
Received: from XPS-15-9560 (80-15-70-17.ftth.fr.orangecustomers.net. [80.15.70.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549c96fecsm327264115e9.11.2026.07.20.05.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 05:45:47 -0700 (PDT)
From: Olivier Tanoh <olivier.tanoh19@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Olivier Tanoh <olivier.tanoh19@gmail.com>
Subject: [PATCH 0/3] staging: rtl8723bs: fix coding style issues (CamelCase)
Date: Mon, 20 Jul 2026 14:45:41 +0200
Message-Id: <20260720124544.63457-1-olivier.tanoh19@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series resolves several checkpatch.pl warnings regarding the
use of CamelCase variables and functions inside the rtl8723bs driver.

Olivier Tanoh (3):
  staging: rtl8723bs: rename mBratesOS to avoid CamelCase
  staging: rtl8723bs: rename Save_DM_Func_Flag  functions to avoid
    CamelCase
  staging: rtl8723bs: rename Restore_DM_Func_Flag functions to avoid
    CamelCase

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    |  6 +++---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c   | 10 +++++-----
 drivers/staging/rtl8723bs/hal/hal_com.c          |  6 +++---
 drivers/staging/rtl8723bs/include/hal_com.h      |  2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h |  6 +++---
 5 files changed, 15 insertions(+), 15 deletions(-)

-- 
2.34.1

