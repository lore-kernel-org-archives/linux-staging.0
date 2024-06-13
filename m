Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F14513B2B4
	for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 20:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718309791; cv=none; b=SuzeTvvbfo5SITJMlUj/ICmVrKZ3v66FJ+LPifHVPxhMDP4sOpL4mmWkluRZoW+MpssKsBCPVDwgi/vbd84UU3sp+8fcI8UHBzwA6yTP+E1EmaxfF4x9GjzCQo8Jd3AXaydo27aiUKgz93jH2/zNDyKYDKs6MBJd7MUx7U+LhXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718309791; c=relaxed/simple;
	bh=zN1UETXXdqrh3WBTxRV+3WqwL49VqCIOmitMRKZXlLU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Gpb87IDbh6bX/L2oizoZ00diJ5123WOI89Q0AFTSFKXqbvBdbQs/DeIPb3l5AechlHkwJUGlwMxWeBO5ZuJCvUl05OU+m90FVMKTo0rNKA7PmPXPBPFZWDfPh8TagXvTTk5kbPTFcaq6VmDqm9BphWk/Y6TAs0hvFiffM+lbh0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=USyP+30H; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="USyP+30H"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4217d451f69so12616685e9.0
        for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 13:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718309788; x=1718914588; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6BG0M0s1xfKWqVwW2SMl3OjEYd7P2vlsk2ol4M6/ryk=;
        b=USyP+30HBKhJTdT96OC+nKV4xTdVV9WuCYCs02EB2QdXCD54YfhlDiR4f4WYftg2ir
         x4gSTO2EUQYr5XTqle7lpBBThRm0zePHeTOGt/LvSzFYbFrBKcB3+VW1Sm3GH2zNUbYD
         N+8US8ni7H4HQGXUf/UqD3Hgt0v6oQIldzNEHTrU0MB9UvOeekcHKdzF93VzsPGzKezd
         g7TWuCRVL7rNCz+mgA0SIMDhT8qY0yM9+9uDbjaXGSpQhaJtKPDiYCqg1AY8pRPbIjZY
         SQHKXkm65sn5A5hNrOhIq7w1l9BboOG8grVSQhAqZOqWZWBqGJj2aP/sdfJjANhpnZdP
         LW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718309788; x=1718914588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6BG0M0s1xfKWqVwW2SMl3OjEYd7P2vlsk2ol4M6/ryk=;
        b=Y3mNkFmp+1izz8cGs2NSHdLj6G5MqaSud5yNDSVQNszjTnudCT0NHvoM0fHFJV6eF/
         XWvlhzSRV2Jui58uzgV+8qdyw7of49M0DhTPTIAQ7LWVP8HMGEK1j21+79KUPljW371x
         jqFMIXOnBbQKd6jwChSjH/zw/TfviiSN0E9rYlPsGwLsgNe6JWbbu6yAjMoi8xd0ZE8t
         +0uLANsawzlMKp5wY3aUJEjrqqKCn2p8JgdQPaX2luXEbt8B53DEhgzChnWqB+Ojga6b
         Lm1T9MW5cQ6Ud7TNR7Gxcl2SJRRRPtaLoavL6fbCFnqz/MeBfn0hjXCXbY8sjKi/4ulZ
         fZEA==
X-Forwarded-Encrypted: i=1; AJvYcCXvC8ULWGZIUuylDqJWkNAyc9gqjx43x+Y4WfY2Ktx2ttL/z1wUxhMj5mljq6NKbUC2E9OzK7fvW7jfh3oTBKZt2FjeOYK/Zu44alF2DA==
X-Gm-Message-State: AOJu0YwalG3hrPerI5PtIOurSUHKc87W9xXm5igfKOGkC55waaVQlCJ/
	kYt46yb575ZAcw2yWB1SKIHOqfULtLjuaRNgdmPu/hYKjPWq5OZQZxFhjU4B8Rc=
X-Google-Smtp-Source: AGHT+IEaJ7Ed8Sv5fg75UJQdq9VXVVTixwx6aZDvrX/K5bOwOehbhYmpJOCoZkoYu25P5zqQRZ6fbg==
X-Received: by 2002:a05:600c:1ca8:b0:421:7198:3d76 with SMTP id 5b1f17b1804b1-4230484eb81mr6933945e9.28.1718309788154;
        Thu, 13 Jun 2024 13:16:28 -0700 (PDT)
Received: from localhost.localdomain ([31.120.167.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874de618sm73817195e9.37.2024.06.13.13.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 13:16:27 -0700 (PDT)
From: Teddy Engel <engel.teddy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Teddy Engel <engel.teddy@gmail.com>
Subject: [PATCH v2 4/5] staging: rtl8192e: Remove unused macro dm_tx_bb_gain_idx_to_amplify
Date: Thu, 13 Jun 2024 21:15:10 +0100
Message-Id: <5ee3df2b02a84e6aeb2d1c4903cb018161d78b1b.1718309120.git.engel.teddy@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1718309120.git.engel.teddy@gmail.com>
References: <cover.1718309120.git.engel.teddy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused macro.

Signed-off-by: Teddy Engel <engel.teddy@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
index 3add5aa933b8..55641f17412b 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
@@ -133,8 +133,6 @@ extern	struct dig_t dm_digtable;
 extern const u32 dm_tx_bb_gain[TX_BB_GAIN_TABLE_LEN];
 extern const u8 dm_cck_tx_bb_gain[CCK_TX_BB_GAIN_TABLE_LEN][8];
 extern const u8 dm_cck_tx_bb_gain_ch14[CCK_TX_BB_GAIN_TABLE_LEN][8];
-/* Maps table index to iq amplify gain (dB, 12 to -24dB) */
-#define dm_tx_bb_gain_idx_to_amplify(idx) (-idx + 12)
 
 /*------------------------Export global variable----------------------------*/
 
-- 
2.39.2

