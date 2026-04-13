Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FC239020C
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 22:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776120458; cv=none; b=BqjhJioMmK1oT85fQ3j3k1zYWIVWxUHdnKWE46YMDdL5sBW+YZVBpRUtYrJa02istHrvkVEqVxIkFXm4Dv3OcIA34GNCtoBjEISzGfGAxO6Vzu18SdvQv08nJsPhl/SuggKZ55oF0X0PGOb4PZfG2pGbMNva4pOWA80FK8MgavA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776120458; c=relaxed/simple;
	bh=ACgtE3DNDU18q7f2WlklUYJbqpHzMMP6EfrXK30lJ6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dbz5H6HYvE/WhWuTme7DYaCYbcbIQ/lGCEQ3LgvYwwy3LpP3F3GsXKauID8xJ1Zywj1XaMhx3jAcU4EDJrxaNae+1+/JlCljOu5rSLztgfPQEpQtCCYJbw+txDMQLpDn+ttnQ597u/2ZXhXvAtFeghSedU9VA4Jt7B+yn30Qodo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BDMMOSmc; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BDMMOSmc"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b24fcc2b5dso33197585ad.1
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 15:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776120457; x=1776725257; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UArCSXZ8K1nXz6ksfRoxQeYdssK+xD+n6+hukH0wKpw=;
        b=BDMMOSmcLpYLKLUJeENcGyVD66mxcqeIAhFGa+gAg2ttJKyw10Ql9AUqj2CPSiaIpv
         fUa88pSOo4cvNaFx/gB4NLukKImkQqLUALC+snRpd17mhnd4b8AqPzEpsNWGrQUJ8mYi
         yFYasdqso1LNeFBwYi/hExSLtw4trwUSJMK+EvBA21ZlAX3vYUxy159or8dar7Y/FzXu
         fgNMzAWHJ8xQrtjIy5oZ6Qn4MYTAxee4p17+MFX7T0cWMOeRk+Rrjs3qitdBRqj9ctPe
         Xjye2XZ/hyiWhGKU1D700qMfi5tngCPJ+azkPDKS7AjtlZFkyOMsd+gRBsLcdWV36j2h
         DmvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776120457; x=1776725257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UArCSXZ8K1nXz6ksfRoxQeYdssK+xD+n6+hukH0wKpw=;
        b=A5oSRhI25JxCICHf/7teycGAG7IU6Otw97cdQzzdq70ahcEMHp4TpIb5x1ZlJKCjXf
         xJg0JEi/IZiRBP9Bu2WGluEe86CfdXxH811+AL8B8BL7MpUhLy6IfFtPJAxI6cqNiKmH
         HgaMeRTeXd8NcaRZINXisQg99XROlZ+WnrH4maIRRytNwX5Pjciq7qzyCDai6abmpvKH
         WNeHvcgt/8vcpiUphsGPonlpjgqpiTpInfqBK4D1JpUJZ781yHCs0tBUqcgAsanj3QR+
         j/t50BycyDzsZ/wTOHm10dpOP0L/8mc8aKNskrw3UQ9ak81LPIO4ucDVNGihQA4EyoAR
         34aw==
X-Forwarded-Encrypted: i=1; AFNElJ9uq5HSNcm0wxnoRDEVZ2XyG7ZI/9GCgbj7uFkpKHax3UZse3NaWOVbTpR8saaPXIyOkQ+FLqZach7FJA9v@lists.linux.dev
X-Gm-Message-State: AOJu0YyxRvTCrE1Y0XnY+VtvBrcaEAqObXQFQ7M9MgC7gKijjA9jw4WT
	NdGXae2JirVPZk5yzVwoAQ2DwQnzrWWz6T2B2jEQwEUH72mNmPAcpS5o
X-Gm-Gg: AeBDievLjP7QUua45pY25wrmIWqWePFh/KDNGp8rviULc3aUbitHL7vOLQckaAtcGEa
	9Ho1jCVrZ70tRDbG/PfDOyJfF9A29s92Zo78dG7jHo0xbNu7EB2lvujpOvPlecxXo11L0SnPitI
	Fm0tjgmi1m76ghBpvfemrpDIE7yH3YzpjOgEer3nXH+kpB/UVDqhtC/c6JTfPmB6li2lCfMTNdn
	7Q+jFXu6FTvwlqluq2yAXwleFEwtkWcJ2v/JX1mi1lm6HgoyqqIstH4Fda/Z1X/AqaRYqU2BxjP
	mKzqdojyiYD9yMU5EBAaB4eC4tdWBUQ0FOgiU03SrKHGAjFi8iav9/ncGwuXkCVX0t9b2uAw+ef
	XOGyjt/XfMwXwM48COqIyW37/L9yI8fmYuYEZngCq7qjqANRLEfXrnWr/Z3uMJkCdy/wJ2xZGn6
	yytux1se87gvS4e8OrxsnKhxI9eLbrwGnjztRuaYQptQl86tMsybF51+8EqLwFHkyhbVZqJGXDa
	Ss6f9Rf7/FtKn61LlOEiQM=
X-Received: by 2002:a17:903:48c:b0:2b0:afb4:7d41 with SMTP id d9443c01a7336-2b2d5978f64mr104546785ad.10.1776120456888;
        Mon, 13 Apr 2026 15:47:36 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.118.203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b45e949464sm57522495ad.24.2026.04.13.15.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 15:47:36 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: gregkh@linuxfoundation.org,
	--to=ethantidmore06@gmail.com
Cc: nayana.mariyappa@gmail.com,
	s9430939@naver.com,
	andriy.shevchenko@intel.com,
	kees@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: os_dep: avoid NULL pointer dereference in rtw_cbuf_alloc
Date: Tue, 14 Apr 2026 04:14:17 +0530
Message-ID: <20260413224417.5674-2-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DHSBOBFQ3HZK.39HN9XAYE4BT1@gmail.com>
References: <DHSBOBFQ3HZK.39HN9XAYE4BT1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The return value of kzalloc_flex() is used without
ensuring that the allocation succeeded, and the
pointer is dereferenced unconditionally.

Guard the access to the allocated structure to
avoid a potential NULL pointer dereference if the
allocation fails.

Fixes: 980cd426a25747daf8ed25e2a1904b2d26ffbb3d ("staging: rtl8723bs: replace rtw_zmalloc() with kzalloc()")

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
changes in v2:
-Fixed spelling mistakes(dereference, potential)
-Added Fixes tag
---
 drivers/staging/rtl8723bs/os_dep/osdep_service.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index 7959daeabc6f..4cfdf7c62344 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -194,7 +194,8 @@ struct rtw_cbuf *rtw_cbuf_alloc(u32 size)
 	struct rtw_cbuf *cbuf;
 
 	cbuf = kzalloc_flex(*cbuf, bufs, size);
-	cbuf->size = size;
+	if (cbuf)
+		cbuf->size = size;
 
 	return cbuf;
 }
-- 
2.43.0


