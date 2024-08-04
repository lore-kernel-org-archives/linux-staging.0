Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723A125779
	for <linux-staging@lists.linux.dev>; Sun,  4 Aug 2024 11:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722771198; cv=none; b=SJJwwPT9+bgZXTMj9Kw9dLJnhX9u/5tiAfIgDNDb7wFqjMQKNACPeY7X6pz17e03NppZLetvDGryD6vLS+Q2G8Ersln8va6pWQKTLyrL+JI/gFEwKpwTO8YpBs2Op/19oxpuACiWK7IKB8ToXZ/hV/ojRpN5Ecr778HK1qelcv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722771198; c=relaxed/simple;
	bh=A+IcJ+HJKIakiMn7+45tLRQklFu1qPuZEJp5irnmr1w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RtWknV4pyewMPOghMjCJhnBNEXKXEjS9CgGAsDNA1oHf7tohIie5odJwdFE3PbaTweGlEd6YXJbiYSThUPVPuLielXvPWHWCFWMQwvRZUov0G1aEDXTOLAbPs3bep/+kVljFZ9zbR2UnSkQ1sEsxRIf/4ysTOX5Iuw3W52RjpiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BTcnzKj3; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BTcnzKj3"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-70942ebcc29so6092884a34.0
        for <linux-staging@lists.linux.dev>; Sun, 04 Aug 2024 04:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722771196; x=1723375996; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5sdUw1gMmBexUN/QuH28jagZEeLpDRY7juKOS4D3OAU=;
        b=BTcnzKj3gcb8Rs/Z04LMuzKndWixe4SZYFEvt6/eGUEvTh4Z4WH/pcM8CTN7QrTZcR
         6sU8DdZ12NQrZJJfR5fbMbTU1SvJdx0qqWw53IH6Bjp8Ax2MA7rsXLdmfxBaAk5JXD9T
         6I6SnKI4N9Ywy+KjGb9Tsd4lPEhvb1oNAk3lejZbI07UiHh+lwWFinjNif1SxJ5mPyST
         Q8YNWgc88S0duOZ8BkDf4N8feEjk3bUASUFfGGOPQEmND3O966qNmqg3ccHi4ckIkEVo
         BmtMkgZsb+zImiVihwiW+NNJQq5HsFhv0U/eAF91jfYiIRNH4W9RuGPPfLfk+lDFdAD0
         2jlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722771196; x=1723375996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5sdUw1gMmBexUN/QuH28jagZEeLpDRY7juKOS4D3OAU=;
        b=aRl4fllWMUewXVu7TQSkxNC+ELCh2aClGEECP3XrosBqrYuZFLSxnQhZz1uroneVLr
         JPSdLVppMUOICENVz6vi+4xY06cdUeAfIYwilrkhCuWntt65YrN30AhuLdaJiHGsA4O3
         XhLSVnfoPoX32SBYxwvmpq2LKjY/gr5hC6ETC1tG3BNTcz/tS8bTYrJYEMkGobRJelQh
         FEIiu94K70aRFHtUM5x18r1fDCPreR3VCVfKJdUh93YqNRhew5GdS9+UJSbEle8YuCyi
         GS9vi0mJtuLOVjV4tolB+o+J01jadC0DP3LdJg43Z754zw5dCqgoV+jRKt4qUbJ2rneR
         JCrA==
X-Gm-Message-State: AOJu0Yz+foeUH9E8VvZWD+cRjnCwLuEJlGxURHBgyNXWiS8hYS4gDnlD
	m6IHbJ4miA1E8YlsRBmGmMLYbH4Hi6k/vLnirlxSmzd67FevxBq+
X-Google-Smtp-Source: AGHT+IHJ9lBg/o7obPLJaYOie3oDG4dhPJu4D3RWn38vLXJEjpCzpYfl0GwzRxvSo3+epvtwdL4xAA==
X-Received: by 2002:a05:6830:6e05:b0:703:63d3:9ef7 with SMTP id 46e09a7af769-709b322e163mr16768079a34.14.1722771196377;
        Sun, 04 Aug 2024 04:33:16 -0700 (PDT)
Received: from VSUS.11svbebsuybebf4lhlhk4eftnc.syx.internal.cloudapp.net ([20.39.190.147])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ed2d0aasm3820600b3a.206.2024.08.04.04.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 04:33:15 -0700 (PDT)
From: jiwonaid0@gmail.com
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jiwonaid0@gmail.com
Subject: [PATCH net-next v2] staging: rtl8723bs: Delete unnecessary braces for single statement blocks in xmit_linux.c
Date: Sun,  4 Aug 2024 11:32:49 +0000
Message-ID: <20240804113249.10257-1-jiwonaid0@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jiwon Kim <jiwonaid0@gmail.com>

Delete braces {} for single statement blocks to shorten code.

Signed-off-by: Jiwon Kim <jiwonaid0@gmail.com>
---
v2: Fix commit message
---
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index 1eeabfffd6d2..e0736707a211 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -144,9 +144,8 @@ static int rtw_mlcst2unicst(struct adapter *padapter, struct sk_buff *skb)
 		psta = list_entry(plist, struct sta_info, asoc_list);
 
 		stainfo_offset = rtw_stainfo_offset(pstapriv, psta);
-		if (stainfo_offset_valid(stainfo_offset)) {
+		if (stainfo_offset_valid(stainfo_offset))
 			chk_alive_list[chk_alive_num++] = stainfo_offset;
-		}
 	}
 	spin_unlock_bh(&pstapriv->asoc_list_lock);
 
-- 
2.43.0

