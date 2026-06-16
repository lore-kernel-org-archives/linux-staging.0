Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEEC439010
	for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 11:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781607688; cv=none; b=JAntX7CbUQ0d83W2oH8MC/e++7ySYwMjf/gHYC5G8OSff6mcJiE2tqZOnyHiYPRB9UZnGp6HtoUGY+vl1+EJKgx2b70QDUeaafHn7tGjCms/12jTCMqmPyYby0ky+x3eUFPV+KSAS0dwvHn27mXNjmufuFGlS6AIDG6VA8e7zTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781607688; c=relaxed/simple;
	bh=50F751gF+rXlNIyRBoGhHlcoVou6MOxU7OCNopSBl7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qIDL87qvOlO+JXwDpR6e3F5sSOnHzsCojMO85TgLWkAhxrfHgj8bsdZEg1dQTS5Xqwbld0kRterh7WpO8T7EdNXFbE4lkbFc24w+olUb2ZB87zObJ/ByB64zgzXO5AUaWtdyd4Wuaix6OtVAD8JXrZSDKtUgsGEfG7VglYj99W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sw9k/FAp; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sw9k/FAp"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c8585c51f1fso1944367a12.1
        for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 04:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781607687; x=1782212487; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7WqqUitEfH9e229osynsO1JlKCUb6fQkndIHrjVVsHs=;
        b=Sw9k/FApv2IrrWHR/Nmr02T2B07XJs/aowTY/UjDkqWvPK/hcIqJKaSTXRYCRzpsFk
         Xe2/kEtEYDT3juRkOqUqPpXulM4znmoi0aZK11VneA2wFftHRWwnnYpt3tynE6i/1XhO
         B1FxGV9GIsfdB+IG7u38BNKfZ17QM41Av4bQ8OoV2JDGHQQV+j78HLM7u1RmlmQYBq9I
         iF/ovyd59wFTfCClKHe27kjviRByB73INmbGIqSa9BHy+trtSBeUnvvp5/vKr5pVz0so
         TP8LzIikphDPh/3JnfE9WfTYc5MrJ2y4GvfOtJcDd5krvGb9fjCiMPzm/6JMnUwBq/ca
         ZiiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781607687; x=1782212487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7WqqUitEfH9e229osynsO1JlKCUb6fQkndIHrjVVsHs=;
        b=AaHAQi4rnunmgC02Wnzb0h+oFGWzdcImoNUEfnklyoBntdhJquY+7GbK75qbpwz8e0
         XFzCt1Bro7LX7zbWOEZuojG243aAUJikCOfAGArc0HJn7PzA57SCHN1cdj2YVNLRQ8Wz
         Qc7aX8hf/UZD1+ogaUny43fg9xlRQez3yikEeOHfkzAqFGp78aFPmLgIJvtPLcCiNzZn
         ijp5o4w4IL15n2OkmVlG9YDJdrn95Sex4X9TQkrDhSRZh8a8jdq4VFddkw7a05nByh6t
         ifwpIEJh6cqdJ2xWWRkEIqDyad9JnBubgczabEomS4xlHg5Qfzj8wkAX6SyicYG0kESs
         wN2w==
X-Gm-Message-State: AOJu0YxMoHNhwXQrVSjNvR/HQebhLGvQ9rOfIvOQhRebUo3n1O5VEAdl
	OVbRWMGyr0c/EZSI0qqGhpUwbHsMc6kT0LqvyEJBki1h5wezWaGV6qjEZtdDFXRC
X-Gm-Gg: Acq92OEOrm9JAhjU23o/BFI4kD9YqOG32XCH8xVDtfcYYpw8sXwnqPXmhZyz28QDH25
	luDQqQWt94fUSPJz46AIpGA5zPQUzKgfnyu/X4txh6U4ECRXbGxfmm7PQ6CXzgRE0ygO+d1ws9g
	j1Fgo4+79ORrn7PDS/+V41ximcMYsH9rHFe95R3nJ2U8gf2AF0eXoWhcCcycHswCNfaNCkFlKRI
	P1b9YJ3sYlv2MtNlSItgkfXtlKkLWWTJvRjPb5huiV/71NL6LD30OS0Ew9SBYZzMe6Hp2ZU2zGo
	/anATYmvgXlSacc/jeOuoY2BWU61HeZwLTvB4ZNknTiDBtdcAWEo+MXy9L7gndWmpMPchqddVGu
	2fkh4lj0ep3e40QAuTHVITzPsuuw3wUyTtEBsu/NjbIQeUcDz9tOkQSBy74iC2iJfTNi4ZqAHxn
	YTmoH8kKpQdAFTlwtjvdt2wHU=
X-Received: by 2002:a17:902:c943:b0:2c6:af4b:99a1 with SMTP id d9443c01a7336-2c6af4b9fa3mr404925ad.3.1781607686842;
        Tue, 16 Jun 2026 04:01:26 -0700 (PDT)
Received: from fedora ([103.51.149.90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e52a9sm132561995ad.11.2026.06.16.04.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 04:01:25 -0700 (PDT)
From: Subhrojyoti Bala <subhrojyoti0609@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Subhrojyoti Bala <subhrojyoti0609@gmail.com>
Subject: [PATCH 4/5] staging: rtl8723bs: Fix multi-line comment style in rtw_mlme.h
Date: Tue, 16 Jun 2026 16:30:47 +0530
Message-ID: <20260616110048.45541-5-subhrojyoti0609@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260616110048.45541-1-subhrojyoti0609@gmail.com>
References: <20260616110048.45541-1-subhrojyoti0609@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Block comment was not using * on subsequent lines and had blank
lines inside the comment body. Fix it to comply with kernel
coding style.

No functional change.

Signed-off-by: Subhrojyoti Bala <subhrojyoti0609@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_mlme.h | 33 ++++++++++----------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index dbb523c8a58b..59b12d9daa71 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -67,23 +67,22 @@ enum {
 };
 
 /*
-
-there are several "locks" in mlme_priv,
-since mlme_priv is a shared resource between many threads,
-like ISR/Call-Back functions, the OID handlers, and even timer functions.
-
-Each struct __queue has its own locks, already.
-Other items in mlme_priv are protected by mlme_priv.lock, while items in
-xmit_priv are protected by xmit_priv.lock.
-
-To avoid possible dead lock, any thread trying to modifying mlme_priv
-SHALL not lock up more than one locks at a time!
-
-The only exception is that queue functions which take the __queue.lock
-may be called with the xmit_priv.lock held. In this case the order
-MUST always be first lock xmit_priv.lock and then call any queue functions
-which take __queue.lock.
-*/
+ * There are several "locks" in mlme_priv,
+ * since mlme_priv is a shared resource between many threads,
+ * like ISR/Call-Back functions, the OID handlers, and even timer functions.
+ *
+ * Each struct __queue has its own locks, already.
+ * Other items in mlme_priv are protected by mlme_priv.lock, while items in
+ * xmit_priv are protected by xmit_priv.lock.
+ *
+ * To avoid possible dead lock, any thread trying to modifying mlme_priv
+ * SHALL not lock up more than one locks at a time!
+ *
+ * The only exception is that queue functions which take the __queue.lock
+ * may be called with the xmit_priv.lock held. In this case the order
+ * MUST always be first lock xmit_priv.lock and then call any queue functions
+ * which take __queue.lock.
+ */
 
 struct sitesurvey_ctrl {
 	u64	last_tx_pkts;
-- 
2.54.0

