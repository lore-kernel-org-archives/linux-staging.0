Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBD235BDAA
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 19:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775070503; cv=none; b=qFzP6X2wS/CpdeCG56jqxqeQnl78mbDzMik7oWsHFDF+cOMLd5Nst00GZ3UfHnoBWtsZ+iwuSqHW2Y+to3wEa6W6TFUfJw0fsnkFqjzn5Afv0pC/8dYFKCi+Cjpsyc2PN898e3zjKrhbsRmOfooJrPTsdMRTV1V2L8rsvthhSlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775070503; c=relaxed/simple;
	bh=+3sH8qUFv2thlhAZ+6nRbHu83zPYYcA7mz/SWssqE7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y6zMB+C6+Zajv3GuBJpBwdesv5dqckuBILeGINL/+5nWw6GHckcmNa3WOcAgxlmwFGEDlc0AcnsV52JJLi1FtlgqqVOJABRKGCpPYpSCaV3GUiWniY/9vQqBsLjBg+R6zjzGoTZ9JNzxLrYDe2C0rf2QrccEv7O9BjoAzvFLDp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pHtmN3D4; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pHtmN3D4"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-386b553c70eso1454481fa.0
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 12:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775070500; x=1775675300; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K8WtVHWaEUDUFYFOmsl64QeiRy9wtaiD3xxrhySt8VQ=;
        b=pHtmN3D4WFlPR+hV7/99zeH01p6JF2/S+EyaqZ/PLaeeF2TP4BIdjU9kBI+nFQcpQX
         EtP+7TKjp8aoyra561tyuMRLexPQkwtq/e9jzj2yMWXAPUfZQ4rYHNyiqVYTrw70GCXx
         qMV26SWzy/hDleJc9SsUqKKmBSiGT2cz8tt3uIhceI/LWI6KJrx1a3rIqCBQQyCa15No
         rgtEB9XHf8BAuMg+8rfaGSGyNEMhR7YD3qFLhbbZvHoMzbBzsoVa6M9GWg0svCvjFbED
         ZN68mwHXxVLYvt0C4Q2cZyHyLOqdqjVSJoYSKbDEF8tqdb/VebqTDqCo8HHoFjF8SfN7
         R1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775070500; x=1775675300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K8WtVHWaEUDUFYFOmsl64QeiRy9wtaiD3xxrhySt8VQ=;
        b=Z32O1iAxETuH6Z6FSozRre75iwHP3/yEM1H9BDe+XFRFmE110UhEanKE8j7Yf6CZ+4
         7TTKeWhQMHaEDk88LQqasarUJ1hkLVt/GDfkM5dhHtUCK6H36GvcHB++MWJyEVURziC2
         8Y1gb4Ow1BsGOiLVV+xpZ88IfcsnGMw6zje41C1Qebt7vJijtLx6oQC1Lp8v0my8s0g1
         GzKTo2RxIMnZJgf2K9Jcjjy7kVgiv99o9zJ4Hp56v640uZCw7FRtijtiqSnQjoGEKYfe
         NPf9E7e7+sRw6l38HMLCLBZQX2LtdjFywFj93jbT3T+Ioi+XBZPtxq6gM5H3I8Iy11IF
         SoQA==
X-Gm-Message-State: AOJu0YzvmGE2/fHQB3+9JSxJCC3akHyYNl0Uo5MJbO7zKOFPj2a/KGWT
	mPaB1O9JfSvtIblO2eoXTPmtZ8fJqF3HWSQSCJYyWZ3N7S4erGiV71Sy
X-Gm-Gg: ATEYQzw5mKpxO04ACrgQ9N5ZE7KEQlbhhPQCkvs75O3ewE6drOatv1066q/U20/NLCk
	zl+7C4y5t+G36+SgEPoaDBqzVe9wnKOkPL8afjfcwT7L1S3rQ1oNiCa0JgR+8l0ve7Ml5VpuH+Z
	Bteoobu5vtcSEzkZ6NkShDpQ6RVFm0aYwZq8gNfKqt+vziuVBQ4y9kMhVwS8jAyavZw8AHGurkt
	2z5qRVkAI3AYTH1xY+O/ddwjipw3GUulNymxArma3CaLARqF2glVV/vqmpG2mKHP+L9XJUSLkP0
	tOgXUZ5tvjyG95A9rkLYmnt5r4YM7iQeP2Fwa2HmZZfmFfiCweEIL2DMLqlBPmYbPkO5fIAXYHz
	N+JXE+WlYnJQHJwdC6qHmtvdKKXDC1I5g1Kf2z6NXT3sDMxdpgvmNAPZUN9Hm4MEr1Wt6Vk4Eeo
	v5LRQuGGK63VBZIFb6BlvxAv6MXQIGeiOSo2zqjj0=
X-Received: by 2002:a05:6512:a89:b0:5a2:bd34:269 with SMTP id 2adb3069b0e04-5a2c1f2ee18mr2015059e87.36.1775070499614;
        Wed, 01 Apr 2026 12:08:19 -0700 (PDT)
Received: from localhost ([2a02:aa1:115f:85c8:99af:b9fd:7f92:d8b4])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c9cf42sm144368e87.33.2026.04.01.12.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 12:08:19 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH v4 1/7] staging: rtl8723bs: rename global function Efuse_CalculateWordCnts
Date: Wed,  1 Apr 2026 21:08:08 +0200
Message-ID: <20260401190814.216333-2-linus.probert@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401190814.216333-1-linus.probert@gmail.com>
References: <20260401190814.216333-1-linus.probert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renames the function Efuse_CalculateWordCnts to
rtw_efuse_calculate_word_counts in order to conform to linux code style.

Discovered with checkpatch.pl tool.

Signed-off-by: Linus Probert <linus.probert@gmail.com>
---
v4: No change

 drivers/staging/rtl8723bs/core/rtw_efuse.c        | 2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 4 ++--
 drivers/staging/rtl8723bs/include/rtw_efuse.h     | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 099320e4eb50..7fb0c4ad7583 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -10,7 +10,7 @@
 
 /*  11/16/2008 MH Add description. Get current efuse area enabled word!!. */
 u8
-Efuse_CalculateWordCnts(u8 word_en)
+rtw_efuse_calculate_word_counts(u8 word_en)
 {
 	u8 word_cnts = 0;
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index e794fe3caf9d..652127af736d 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -687,7 +687,7 @@ static void hal_ReadEFuse_WiFi(
 				addr += 2;
 			}
 		} else {
-			eFuse_Addr += Efuse_CalculateWordCnts(wden)*2;
+			eFuse_Addr += rtw_efuse_calculate_word_counts(wden)*2;
 		}
 	}
 
@@ -779,7 +779,7 @@ static void hal_ReadEFuse_BT(
 					addr += 2;
 				}
 			} else {
-				eFuse_Addr += Efuse_CalculateWordCnts(wden)*2;
+				eFuse_Addr += rtw_efuse_calculate_word_counts(wden)*2;
 			}
 		}
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/staging/rtl8723bs/include/rtw_efuse.h
index 191ffdf593d4..df430c9fd25b 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -68,7 +68,7 @@ struct efuse_hal {
 	u8 fakeBTEfuseModifiedMap[EFUSE_BT_MAX_MAP_LEN];
 };
 
-u8 Efuse_CalculateWordCnts(u8 word_en);
+u8 rtw_efuse_calculate_word_counts(u8 word_en);
 u8 efuse_OneByteRead(struct adapter *padapter, u16 addr, u8 *data);
 
 u8 EFUSE_Read1Byte(struct adapter *padapter, u16 Address);
-- 
2.53.0

