Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FDA31B130
	for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 01:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775785346; cv=none; b=h3WzvzksabyTWJyE/3QoMVd2oZckByFY5CWgyJB2PnQDGUdmOVZflFlXGWy6KfrgS+U5ovG8Ub8rlPMawywgbNqbfmJW3JRkQgN95y6bnTlGadUEducn1SHoBvkxmhYBNOwQZFjv0LM6nWZWdJqVlgkvR/8nAX0m0QMLEtU3LyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775785346; c=relaxed/simple;
	bh=3xP5EyJLkOfXKTGztrhbpNE9dS4On/jtrHAoyvmFiqc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ClabWqjPZc/kZ+92gmZPFDGfAkaErB9TE7b09b7Sx8s1qgKbR3M9BGWu74curJrqV33KBtdxuQ9lMTbPOcW10BeMyRxnc9GlueaknjbwoILnocJykqGFa3oPyN3ZpdlQb4Te+7MnOR76AweJVrtfRe59URN3TuKRn8rPTnFakMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1aSzon7; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1aSzon7"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82d03827316so710074b3a.0
        for <linux-staging@lists.linux.dev>; Thu, 09 Apr 2026 18:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775785344; x=1776390144; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JdvoMI9EzEj9moESgBPqdEgVflW0dhq4owR9kCN1Wsk=;
        b=k1aSzon7FD1+wvJH1OZgzrcD5cdlKuysrYT3d5upO6uZmgXWd+HOfTGFFQVDte8LAC
         THQjBhfYd6ho6eE6QyatCxgvC9OwbD6GRaNdxxU0xuMbAqb4b+bIIWplu+bzoZIqAxxq
         ndMj8K1Ns7bzDTTs8hxtaPSIWKdmUkGviyxx2U0wA/AL2YIizhBcj2yaaFS9FwusZmjf
         IxDlEIgnWn4/ItozKiqkVM+Dkh/P4NQ8X/iXeMnDD9U0xNx4Q+7vwF9DZvK6QyH2wZeW
         C9UDY2cUy1qvAQzIu53a6af7uI6DbgI7C4/EIGYjMLpt+87PfhCSysWouqqAs56Vis/5
         iS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775785344; x=1776390144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JdvoMI9EzEj9moESgBPqdEgVflW0dhq4owR9kCN1Wsk=;
        b=agxTiy+2tQA0zV/AsMri0RPHHmms+6RZ3vsWFoP7MHCkUWUdDFs6EVFlDe08WR41V3
         7tjujzbKnpM4j+OzVHwkl/xX3G1ZXeneK5mCttdq3JnjfwwRlwvXXxe4+CVFceC8oATf
         SjluYPDWC5WpJR8ZlnFCcGfZdAVmm7ql1fXR1eZBCPYI3sn37eJrrFV9lukGW5oMV7Yc
         yenMSA9o+CCGKZo8YvuGOTOX4VhQDTa6oiP1Kzhc5iXiItz+eUrn+fkpjC1azOWrlETt
         xDbWdovMMKIXrM41vnFTM5GcN9uaTV+TjT957AAzTDQ32JRGVM50vEdKPxyFITwscqs0
         HVuw==
X-Gm-Message-State: AOJu0YzDihQSR5PkYjrMwCGwFyN9psAigPl5WGA+8SpYbMIiG2oSodx+
	CCejso2hWVVxRzCBknrHJR5mV7/p58jAVwl1WVZw7bnKmeIyv4c+CPTt
X-Gm-Gg: AeBDiesP8xDqqifk9RetnxMcXLYU94k9ftxdSkB/GV6stiAoPoTmSVgYLLLOl2TA5Ot
	fMcmrH2gOMJqR+FKERk9cEquruHabia66wbhRo79g8O4yC67tQMqhrorvUMFSHURWrUp9FasB5Z
	HVoObbRarKgJSJsf2l6/+gs2ZJN2E8MJLVA3az9m69OzQ88FEdw8T+lU5aJ8rJvxGRIlFJxKj3J
	vkJ0rCDjp82FrMgj6ZY756TEanyIr6f150BBcAengsaouJkNvD1c9O/XInys7/dmBxV0pgRrrhm
	Ssr1GZvn/85d+vRwVdgCvM0nJGjJ03X1CY+3MEau2uRNiGDGZ8uTe7cEaUdiHTXzTB/HpifrHwk
	s4SpdWO7EPSb0LvePn4oM9DBAelcEe0DZV5qYX6UTckY8EGoP7Gk3zKsRtMqGyzqzh7mjVfen0o
	4axAiRR6DLxadF3bpKgMsGYy4AYoEZxes9FVPjAawDgKTwvjtT6X6VhuMr2XkqMHlE
X-Received: by 2002:a05:6a00:2e08:b0:82c:c390:ad77 with SMTP id d2e1a72fcca58-82dd8a1dbb5mr4994957b3a.7.1775785344474;
        Thu, 09 Apr 2026 18:42:24 -0700 (PDT)
Received: from localhost (as040201.dynamic.ppp.asahi-net.or.jp. [150.9.40.201])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-82f0c35194asm955761b3a.20.2026.04.09.18.42.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 18:42:24 -0700 (PDT)
From: osjin83@gmail.com
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	osjin83@gmail.com
Subject: [PATCH v3 0/4] staging: rtl8723bs: coding style cleanups for rtl8723b_phycfg.c
Date: Fri, 10 Apr 2026 10:42:10 +0900
Message-ID: <20260410014214.10684-1-osjin83@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jinemon Tama <osjin83@gmail.com>

Changes in v3:
- Moved operator spacing fix for rtw_write8() go to Patch 1.
- Patch 3 now only performs the line-wrapping for that specific line.

Jinemon Tama (4):
  staging: rtl8723bs: fix spacing around operators in rtl8723b_phycfg.c
  staging: rtl8723bs: remove space after type cast
  staging: rtl8723bs: wrap long lines in rtl8723b_phycfg.c
  staging: rtl8723bs: remove unnecessary blank lines in
    rtl8723b_phycfg.c

 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   | 65 ++++++++-----------
 1 file changed, 26 insertions(+), 39 deletions(-)

-- 
2.53.0

