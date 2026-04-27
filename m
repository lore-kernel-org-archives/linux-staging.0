Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AE43DCD99
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 17:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777311548; cv=none; b=qhuV18Ld8TUS9mvmXUKRlPTfCCvXutTlRaXvTMI95zzmkOdRqzdswBBfZeFRgJievXz+4xyqYTphQifK27lZo2+vbU3HjxqIOq7GFyjgn9dBCG3P6zac2xG2iMngCtLjqjTyjeVll4noJOQMQ9MkJy1Surh9KHnZAWqaXriLKGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777311548; c=relaxed/simple;
	bh=xAF0VjozgXq0byj8ofVgSG3uhD3PxvCb3+cJTbw7zl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d9iXpSAzjl39s0MUZyNMQ4zCOqJ81v+7QUyoRiXSJacIebYxfR+tcA4WNetRuA7e/g7xrkS3m3tPo/xaB/tSWGSERPByuhjc2Tx71+nJrUdhkQvEfFfIDqKKCb2+F5hMJher8GBOXPbQQFRY0pT9F621oeXMBaVjEuxX4UJadrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kKGIyF6E; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kKGIyF6E"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38e936caafeso106436611fa.2
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 10:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777311545; x=1777916345; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ocwAVKBTczbIIAakAqBCna44Z1Jdwc4+bjHCHTBwg4w=;
        b=kKGIyF6EY3x0S0KRDlJcWrEjLqipTz42GxNgEG/DvM1Oi7ymq+rMhFeGPq1kS/+97w
         vCcihu4AXmduS5AgKsMzqXJA8uwmLhdJTMlBYR1PZ+2MXaSiv1/F63CTI8CpZUrDEB9l
         gprYvAkgPhIMnAWeH1MhcoZ+25+NHm6V+Ox/3jKOs7gDMnqDfRbJe4mGyYzBm8TeG85D
         St+LL5qG5v1x0EsFpibrV70VthpJXoyw6xteDtioyhj0/UvS/YCFjIv0T3np7qLRsTyp
         GkIZ0fmsS3IbepLHjLuNuDJZ6gvrguWAktZQxRk1W1MJG/KLHXa9qbtkZtXkuIRHqTpw
         o5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311545; x=1777916345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ocwAVKBTczbIIAakAqBCna44Z1Jdwc4+bjHCHTBwg4w=;
        b=N+KGAhc/C/bGxO2gd75iU5/9nrm4eUE3VdVZKDknZOXscwlSnZMc/huUbcdi0oXjJr
         KMfkQ10gzTz7XQHCVttZ58jdxGK7zKDbkBZEctijqO7scekrgPCIdt7FZzgbO1FT96H1
         G/J6QoqdLk4nIidUk/dU1pUd0iKIXJTDm5H7b4Z+UC+Meuo9BKN+eeb6AfaEfwT8azCs
         V5xMHT14gIMxgopY/0rvZiLFY5M4AYb0XRTSKtquhD1vuf7PbJr4N8nhr8rV4DPGio/Y
         0pLyoghHwwSkkyhpl58xrst+Jy8rrH6Rh7Gen+OArTznwPM1fRjMQ7nhv059ypWuwi3v
         +nSw==
X-Gm-Message-State: AOJu0YwM4I9QZ+AgiZv2xIe2obx5QMxQz28VLGStSDSEH8Oiuu8zwQXF
	leg+BMgQwQKRQH6+MGUa5Z4qFCbQuy/jpafGKS/9bK8CCOzUexTD41vH2AnPzyyeh58=
X-Gm-Gg: AeBDiet9JjYki/UY13R9u02J4hDkoHSWdZ/6ieIf4FqwpqDMHEaTMH+/ggMlx2GWqCA
	R6iXWBj3NiGlQ5DzXlIw1/N3SZw6FugKP461N1543ZL580UbHYs1pTVXRtRZOpOG0k6dHClzYbF
	5R9J4kRoPhQ97KrJ2pfy7+jC5n3+ZPxMLH3b+MKEsJ5nZj91tXCAqs4uxoSr6o0FOPtKERJUseK
	QQrSDhN5Xw3Oejg5+NA3vzFBwQbIOErqRNhBUIhLipKz6a075os/wpoAdMpfnF1EfJBfMPJrZXL
	/Dz5EuFe02z46a8swv9G6O+9WNg1jbANINnzRDoT7wbLkcYet8R3mqEbpHNUXCHNw3tlXV9Cjou
	PL9Z18YF9t8DI6WXMuIASiC4p6YyBHiBLz8Wkyg7PT9ofzzU8ff3siu8v9jJDQmvE4eU3PMvgPk
	9Dyi0ELLCAkDBCcDngIyTcPFyPlG1V+hosiG0OyzwUuFhJFTBxM0r/UGyJkq8JkfiwQAaQz/xAs
	H9kMqb5MvQ=
X-Received: by 2002:a05:6512:2209:b0:5a4:176c:99ab with SMTP id 2adb3069b0e04-5a745e39017mr69921e87.4.1777311544691;
        Mon, 27 Apr 2026 10:39:04 -0700 (PDT)
Received: from localhost (c188-150-77-196.bredband.tele2.se. [188.150.77.196])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7d80sm8307810e87.68.2026.04.27.10.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:39:04 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH 2/8] staging: rtl8723bs: add function definition arg names to rtw_btcoex.h
Date: Mon, 27 Apr 2026 19:38:51 +0200
Message-ID: <20260427173857.585742-3-linus.probert@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427173857.585742-1-linus.probert@gmail.com>
References: <20260427173857.585742-1-linus.probert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds function definition argument names to rtw_btcoex.h in order to
conform to kernel code style. This eliminates warnings generated by
checkpatch.pl.

In all cases it's the 'struct adapter *' argument which has been given
the name 'padapter'. This matches the names used in the implementations
of these functions.

Signed-off-by: Linus Probert <linus.probert@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_btcoex.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_btcoex.h b/drivers/staging/rtl8723bs/include/rtw_btcoex.h
index 5554118bbe36..df939b20867b 100644
--- a/drivers/staging/rtl8723bs/include/rtw_btcoex.h
+++ b/drivers/staging/rtl8723bs/include/rtw_btcoex.h
@@ -14,14 +14,14 @@
 #define	PACKET_ARP				2
 #define	PACKET_EAPOL			3
 
-void rtw_btcoex_MediaStatusNotify(struct adapter *, u8 mediaStatus);
-void rtw_btcoex_HaltNotify(struct adapter *);
+void rtw_btcoex_MediaStatusNotify(struct adapter *padapter, u8 mediaStatus);
+void rtw_btcoex_HaltNotify(struct adapter *padapter);
 
 /*  ================================================== */
 /*  Below Functions are called by BT-Coex */
 /*  ================================================== */
-void rtw_btcoex_RejectApAggregatedPacket(struct adapter *, u8 enable);
-void rtw_btcoex_LPS_Enter(struct adapter *);
-void rtw_btcoex_LPS_Leave(struct adapter *);
+void rtw_btcoex_RejectApAggregatedPacket(struct adapter *padapter, u8 enable);
+void rtw_btcoex_LPS_Enter(struct adapter *padapter);
+void rtw_btcoex_LPS_Leave(struct adapter *padapter);
 
 #endif /*  __RTW_BTCOEX_H__ */
-- 
2.54.0

