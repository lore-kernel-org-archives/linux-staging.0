Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B1E1AAD0
	for <linux-staging@lists.linux.dev>; Tue, 13 Feb 2024 07:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707810415; cv=none; b=dMUanHAveVZobyEJKCtOOc2vNnJmrQs/wI1hRmiyARh2UKhNQmfqrVOO7z+E4Q/6Mxxtd7Q/YwWVdXTZmlCxJIkbyKLXDN+UXJMScxqkb5ilyKO48gzvTobCTKsUMxQIOZxP1MdMEOpSiTnd73tPuJV6TyHjcLQq9L81a8oJMow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707810415; c=relaxed/simple;
	bh=CI7+IRxGYwRZ60wyiLw47yAVg1pJTOWlIhftN4mcqWg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nt8/oJF+iqlzvKl7PUXPf7pG1LVkCyHxyvGKWxwqQYB95qxE/1X/j7I+D6Y4WyyK5IowBh0pYvRfElIdz6tqvPOHVX1YaAIuznv91pzYRuWLWL3OCiGaI0Tmb7yxljWZt/f0Us75UdK06cQFwKtg+dLsHKuYqIO99bYwyJ02Cs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RKd5yqxh; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RKd5yqxh"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3394b892691so2631919f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 12 Feb 2024 23:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707810412; x=1708415212; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lgAC8oAHr33uPCiZyuqvH6IjPqpu++NDN80X3PJhzBM=;
        b=RKd5yqxhW5CKe1mUPmfvUIp5iFV+hj8/qqBfvZ2a+UmQGxwXcRK6V4PtIfRESXesbg
         FgHsDeWAfoDib/L/qrLzUW8NtINa1TSZmT2oeFlGR6QnA/9TGIpEj8+WEu2RhbXbGFTS
         YvUQHVdQLVPL3gIPdFgyGSUDOP0QnCbJJbX585Jd1tFmpq9/ALaAXpT1qZh4FH89W4wE
         SHeVqxzBxlrv/e4GW4T/4RM7OGTBk0eINMDoKRbugH3lJNqsQ/qpGYwYIho8M4Nx1pHF
         Pvrv/oM69xqXpm1SuTbPXINQbxLO8M7sPFmsfuiicIac/SgX9uDHLJZcsfgx4EPYTXto
         1VEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707810412; x=1708415212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lgAC8oAHr33uPCiZyuqvH6IjPqpu++NDN80X3PJhzBM=;
        b=SU+vXOTeyjo0LUa8zOskeeUR0cX2bVfYzWyanFUtmp3sxZYeGmC939JL48qe52j9Ov
         1YbG/AlqovQqxE0plOClIJvxvA67GcG0FgSScqLborSPo8c3sZuZMf/agPayG1ShhIfs
         RgdfHTOIAS8ROZVmJGsXNIWK/JEcLMY7vf24eUkId8TR45iBF09nSF1YLKJlWWCSE3kC
         pSOxZ/O5ZNWE5NRzNzWROF803Z6ezROLzTCbFLBY3i/Qr+5Z9cwILNBDrzWe6bSwKtLq
         k1W3H8UftEfaqwZ+yzkPzOrcdIUQnxNJIf2j5R8HVOUY2B1Op5FFKQb6gAZWvES97syD
         pzsw==
X-Forwarded-Encrypted: i=1; AJvYcCWU+xcN/PbLh82vujRRdqlgoyIpg1UN97ZvUO5m+bcCR7tr+tPxkPg2nr0Rn9UnCCyNLUgGd6jEvlz2BXOH+e+uPKLE5RR00Vtz6C1V5Q==
X-Gm-Message-State: AOJu0YzbzWBEFoCqxTl9SYxl4XPB9els5rx6XMUyhTMu6K9Jp6YFmxmc
	m4lgJZVhbBs5P51HB6YSWPROO1Ng/XPatXq4qDSDbaixTQeQkCry
X-Google-Smtp-Source: AGHT+IEftBHvPo3F+NL6i6w0+3IKs7hng2i277qIsEAtBShKVbdPi0r1QMTUYQFDVrKGQUL07fxJkQ==
X-Received: by 2002:adf:f802:0:b0:33c:d8b2:5be2 with SMTP id s2-20020adff802000000b0033cd8b25be2mr608721wrp.25.1707810412094;
        Mon, 12 Feb 2024 23:46:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXvZ5E+sueX5qBcCQb2ib9jxp0mJyfkLE39pgoEVgK9pJIhfE4ayJwaRsRBqmjC3K6/Y+G+4aQDQi1Psk1h5pB/en79KAU+nfsVgoR8kVDyKogpmngkjkPIoI96b1uNU0LedNQO5aGgqw==
Received: from aaron-macbookpro.. (host-92-14-37-217.as13285.net. [92.14.37.217])
        by smtp.gmail.com with ESMTPSA id bp9-20020a5d5a89000000b0033b4796641asm8894702wrb.22.2024.02.12.23.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 23:46:51 -0800 (PST)
From: Aaron Parfitt <aaronparfitt123@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Aaron Parfitt <aaronparfitt123@gmail.com>
Subject: [PATCH] Staging: rtl8192e: rtl819x_HTProc: Removed braces from single statement block
Date: Tue, 13 Feb 2024 07:46:49 +0000
Message-ID: <20240213074649.18158-1-aaronparfitt123@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed code style issue

Signed-off-by: Aaron Parfitt <aaronparfitt123@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 6d0912f90198..49b882c363bf 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -480,9 +480,9 @@ void ht_on_assoc_rsp(struct rtllib_device *ieee)
 	}
 
 	ht_info->current_mpdu_density = pPeerHTCap->MPDUDensity;
-	if (ht_info->iot_action & HT_IOT_ACT_TX_USE_AMSDU_8K) {
+	if (ht_info->iot_action & HT_IOT_ACT_TX_USE_AMSDU_8K)
 		ht_info->current_ampdu_enable = false;
-	}
+
 	ht_info->cur_rx_reorder_enable = 1;
 
 	if (pPeerHTCap->MCS[0] == 0)
-- 
2.43.0

