Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029BA22A1D4
	for <linux-staging@lists.linux.dev>; Sun, 31 May 2026 00:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780188121; cv=none; b=PVhR/cDGlWexbGyKvZrcz5O4kk5pHgQ4ww/HVIJQ3lCQkvn24xcrApxQGLipy+p6o7dRfWIKRfmRwYJiNmOIdNTyWaFPzWOrV0xvPBa3MsvDnuyJsiJ/HX/Ylh/xcpTvMt2ZIiZ3k+wypkDlRTgafBHXYZA6JT0QUSgIg30aTsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780188121; c=relaxed/simple;
	bh=GZYVNHagnaCm73nFVaiYvzBk1v5za0B9q2fvi7Z4joU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WmTur6k2LVFahsY86UYjygRBUPzOqZtJIH3Hs1+Uq2xMC/qEHCFZb9w6SoBNIpJtVuca8ClRNII/71CRPax6TT58kQ0CcPqdXuANHwqU5xJy/XY222dzjGYtj8HNkGZyK0wFNZoypamAPVfLNKw0llCzKVv/Ep99Ap9E9+hW1cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZjAsQSvg; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZjAsQSvg"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7e2f345692cso158937b3.0
        for <linux-staging@lists.linux.dev>; Sat, 30 May 2026 17:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780188119; x=1780792919; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Le60swkXOEkoYWNJprkd/sVJbZOFRR8CzqEYEnag63Y=;
        b=ZjAsQSvgfVEu1nhSthbCXnTPn17Oh0rrsVZ/Xb3nhDL/810ojrOLegHQQ1SGGM5l5m
         HwnDa/QjmuXqYrAuCp4O9RvJXKPIYBxtWy0AnbGw3lwx0PGUAsjQd/zF/olBEMx0LsUH
         h3iCvjhqkX0kurxWXO9XAE2S9V0m4PC0Izi/M+g/YASSQaCalo84CAwUKYr8vu0XKVia
         kSujs8g3aLWW+YHJz8At1mP0/57BoiBIYe74gohMrz8NMqleFOP6S2hvvXRAsGmiu8wP
         owwtSEOvzKrQ4Lri0IqY1ULX37C+OlmjOnI68+SPScGjgzE1QQjsuNixohyDghNFILSj
         1XQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780188119; x=1780792919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Le60swkXOEkoYWNJprkd/sVJbZOFRR8CzqEYEnag63Y=;
        b=D2ftg0WOCVEANHRhhFbwKV+sDVzt8qCdv23R3oeu1vClvWdCP4GJxuOna7Ss8qomgb
         kM52owMnjpcB5o7rvbEGXmPqBpZ/wJseS4+pPFCKGCBdl1/NHc7OdduZYmluIFx32awp
         vSTBXgp2kx3vetQFijXMDFkd17dbFYkuXU58SM80ymcyzA/4PnqWFrLQdAf7FsPi6TAa
         QurFxCN64XfrE2saCTvqV7pG89rjhNMIg1GcVL9eLkvBRMFUBLpHFg8oSlT7Gggw7w4o
         RTrCcV/tQDjYig6zkCe+6wvQUT/Hh/N7yr1c5kKSB1ZHiruh+r6TKi8SplL9ctJDhql/
         bB0Q==
X-Gm-Message-State: AOJu0YyMXXu2W4KEKVOaSINjTASBvqYCLMgL2nVo7n0XQ3NcryP6Gtj7
	TQPMIf7mqDNBxBIFp6wef44XkKyJhZZZ6u5PkVYB0KDVCfgJuZyxayBn
X-Gm-Gg: Acq92OHDxLQylxaHB7VB6IQrRUMExiaTi+pbJ6KJLrQt02IpocOCRVjTXhw6uDQyHTS
	tXW0TljEmhgYFek1jGyoFOolP3lahpuT45hTJ7WrpQW856JNzxu1UK2dVlMsT7W1mIxAJwVCd2j
	JWmIu+5z8N7R+DavVSLCp8C2+SkCJiek7Hkbq5BjHWn3+BQ+3IJ1D0adU2UYnK+fCyDRnXo7IBV
	SedY9mwoSIz9JkA4tsaztgXiKyqzXWECTErtouIEJaWyxirq03Yw0ItS1wAWNulgrr++TWbpgxR
	OlkELja3s24t6hnhZjKfPiChKWnfbDTiYflDhxSSof2QPX/UqbUoJvCRUazG7N6IOPuNuBfWGUt
	MzPKDjmmzJ8jpepaBEuK8rVn5iqbffD/B6E8QzEHzKN1h/zvNGEGMHr1P8+kQqrDsNTJ0sMMmOS
	qU/tYe6mTi80Wx5X16/8CVNTxjrr4=
X-Received: by 2002:a05:690c:6610:b0:7db:92a3:39af with SMTP id 00721157ae682-7e05fcb3ef9mr29327657b3.8.1780188118949;
        Sat, 30 May 2026 17:41:58 -0700 (PDT)
Received: from fedora ([2607:fb90:e338:5c46:8233:57c:93ba:72e0])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7e17c9add60sm15546327b3.46.2026.05.30.17.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 17:41:58 -0700 (PDT)
From: Ben O'Bryan <obryanbw@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ben O'Bryan <obryanbw@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove redundant parentheses
Date: Sat, 30 May 2026 19:41:03 -0500
Message-ID: <20260531004140.99743-1-obryanbw@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant parentheses around type checks
and align conditional lines to improve readability

Signed-off-by: Ben O'Bryan <obryanbw@gmail.com>
---

This is my first patch to the kernel so please let me know if
I've done anything wrong.

This patch is mostly for me to verify my environment. Assuming
everything goes smoothly, I hope to continue to contribute
more formatting patches as I get more comfortable contributing.

 drivers/staging/rtl8723bs/core/rtw_xmit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 444966c0de7f..cc38c0c950bb 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -2476,9 +2476,9 @@ struct xmit_buf *dequeue_pending_xmitbuf_under_survey(struct xmit_priv *pxmitpri
 
 			type = GetFrameSubType(pxmitbuf->pbuf + TXDESC_OFFSET);
 
-			if ((type == WIFI_PROBEREQ) ||
-				(type == WIFI_DATA_NULL) ||
-				(type == WIFI_QOS_DATA_NULL)) {
+			if (type == WIFI_PROBEREQ ||
+			    type == WIFI_DATA_NULL ||
+			    type == WIFI_QOS_DATA_NULL) {
 				list_del_init(&pxmitbuf->list);
 				break;
 			}
-- 
2.52.0

