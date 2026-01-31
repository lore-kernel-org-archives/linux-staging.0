Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C16340DB9
	for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 13:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769866360; cv=none; b=FdkGdI+XLnSBAuMOPyZsytOV+4OSei1lOzcXxMqdSJBrzfpuHftCz6c66Rl/HVtaeZtVtLHk3F+noQL2B1/WJ0ad+BImjmmDJrSeuDXOYr6hRxjoEnQD8VBzZncoJhG6Q4wS8nPdts8QiSrsIakn1FA4wuFBgxvfOJzSyv+QBeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769866360; c=relaxed/simple;
	bh=5Qna7xFQntgfT5+391jqrKxUenC6SaHjP+B2IdBW2qk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B+pXaTIdvhalz/j+mk4BAE8+ycPpexSzD2bZ61Gyt6z6oQIqR+i/hhABDD93uzMiR75J1Oxj0KMhNR2qv7nxqO2OYxSUR+DtXj7YX/GBRkQKOOHnmLyyTDkYEGYchZhm3+wiZTR37Bz4Ry93l3j9kmFZpdrAmYCnzPk62Vy1aU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JMyZyxzi; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JMyZyxzi"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5029af2b4bcso16579911cf.0
        for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 05:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769866358; x=1770471158; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dd4G6nLfU8JtmEVf7xF4SjaduLJ0GrzUXmTcT244Wbg=;
        b=JMyZyxzi3mdhcHtDS9UV4O3N4s40EObYOgvm/efBvH3AhLvHsKCUzWJn0HLijL4/aQ
         IYZrOs9gLwXR9UPJGrW6EI6hckNpxAUaJTUZO1kZuWQZjpwYqtZVqwmj4lrkuvI/g8S3
         ePI3bXpE52Sm8R89e8bDoA2PF4TlVfUOyCwAF4Rdh6IQ5YC4oIx2AroDcmxGO7VD7grQ
         6lsZ8Li4+ZtHIevnckVrXnkFY+p5CggbBMpNuBhBPsupDzzxD8xY/Bkhe2/Qz9LMT0Rl
         lvSk1Tj9n3437Ro08bnI8d6dI8uXMuF6f8DeCi/wgkqwwGEzeuzm12znA01Zo4vn3mVr
         KsRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769866358; x=1770471158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dd4G6nLfU8JtmEVf7xF4SjaduLJ0GrzUXmTcT244Wbg=;
        b=ZeVh8UTroHRvVdukXGxua8ZL6McpDWdT+38Cc3QIXp365nKjvvlNa76NZ7y68qRP55
         G8dSgcocAGsC0/C3rRNqhSnxME5cRAv3bHiI5sNgiA2uA9KZGxom9iR/g5aZHt8FXpWM
         C+zhnOzvGAwF93WiTWwT12Ng93/84p+9vHKxaXAJpHNBBuSo08Bl8J534EzWEcxt15md
         +eaX4atnaZfyxvr2h4kqX1zrPoH7/vGm8ODrHAbOY/VGij8ZkxiE9YN+9ga5trO60i/3
         xa/x/XeiFyqYyTbV0TbJePJMXayptc7FIJfNpKxRmidZj0TxU3DrC8ipfocOIFI+RfkD
         iURw==
X-Forwarded-Encrypted: i=1; AJvYcCXcUGyM0R3LdgbsWEYF52Hmf//oriHdCIR+A4wIK00kmd9x/7O0YiPnU/KkYbWs8ta/avnCMfAxamPuTycj@lists.linux.dev
X-Gm-Message-State: AOJu0YwHTNFjOlg9Gf4E5E+P2QOCsRBwAmE3TCpEDjXRTkbO29NVygv7
	f3otR9hpxa+dIySifHasyLh3BuMqsUxn3UHJKC2i78b3yyo51E3ySAQs/GncWA==
X-Gm-Gg: AZuq6aLM3Doa7C+mUudgOTUBjAUmyBpTzp0fbF1azLZwFRqcJlB93OMdZ3Ch3E5Nus/
	maeAiX3atBIvV6sn2g7I0PVIa7AIDujjRGEtBg/ixVhCUlpql4ERXaHHVbYLVeJVQ7uWkmb4GSU
	vNbg9z4WrGxw07yTGxKEbQOO/GRiC2t5mXi5BurvIzYPqsEl3R4mg2vwvawZJHL8z7hMJ5wnwCC
	g7x6vF+szYbs6jz80Eg9LICwKZqL0SGcdg6ULdsj0EFqCkAiLYMia4enOuOczdsQDq+7R9NgMPC
	dObB1LLNRpSVhzj2fju8iauPw4T0h9MNu4Fm2F8q0mG4Rzvi8wHq2jNSiiHj9yyS9U6OMa6bFtj
	eSenilR03mZUdXQPws3TMV87Ou3gXIq9tdQho4RftOPZpJ7SGijsg1X7xOAktFWiPqdTYRTb/My
	ziTYjaExkV/Pn3cunHR41z1v7JE4HvncMX
X-Received: by 2002:a05:622a:180d:b0:501:13ce:4e0a with SMTP id d75a77b69052e-505d214ad86mr69768151cf.10.1769866358058;
        Sat, 31 Jan 2026 05:32:38 -0800 (PST)
Received: from localhost ([198.1.209.214])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5033745d7a9sm72011681cf.5.2026.01.31.05.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 05:32:37 -0800 (PST)
From: William Hansen-Baird <william.hansen.baird@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	William Hansen-Baird <william.hansen.baird@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: replace ternary comparison with min_t()
Date: Sat, 31 Jan 2026 08:31:46 -0500
Message-ID: <20260131133146.8174-1-william.hansen.baird@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace ternary comparison for setting copy_len with the min_t() function
from linux/minmax.h.
Change is purely cosmetic, however makes the line
easier to read without having to reason about logic.

---
v2:
Drop unrelated style changes and fix style issues by running checkpatch.
Keep min_t() to make the signedness of the comparison explicit.
(copy_len is an integer, wpa_ie_len is an integer but sizeof yields
size_t)

Signed-off-by: William Hansen-Baird <william.hansen.baird@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 8e41eb61448f..d36f6c3bc9b4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -4,6 +4,7 @@
  * Copyright(c) 2007 - 2012 Realtek Corporation. All rights reserved.
  *
  ******************************************************************************/
+#include <linux/minmax.h>
 #include <drv_types.h>
 #include <rtw_wifi_regd.h>
 #include <hal_btcoex.h>
@@ -1024,7 +1025,7 @@ static unsigned short rtw_parse_assoc_security_ies(struct adapter *padapter,
 			pstat->flags |= WLAN_STA_WPS;
 			copy_len = 0;
 		} else {
-			copy_len = ((wpa_ie_len+2) > sizeof(pstat->wpa_ie)) ? (sizeof(pstat->wpa_ie)):(wpa_ie_len+2);
+			copy_len = min_t(int, sizeof(pstat->wpa_ie), wpa_ie_len + 2);
 		}
 
 
-- 
2.52.0

