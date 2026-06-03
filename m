Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3459B382291
	for <linux-staging@lists.linux.dev>; Wed,  3 Jun 2026 09:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780478088; cv=none; b=jkM+tKGRNRuUL0KOAtPRcE1xQ59eX1sAAGK+zgh5jtz25XDunDgRIYaGCFX+/pH8657Gzu8/yjTj2eWlRMlcZk2S6ow4FxzE+YE5hyiaHJfE5NonWdTjyrDo0Lrwh8nq0soFja9fIG1jQqOEpYhBknbxS2pDXbYQAYfE1cQGa+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780478088; c=relaxed/simple;
	bh=+uDq8VPscBmK3snFlyMDIqmZ5b8CUGVu/6VueXCt+5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pYSrlIzZx0XxWo3xIZc5TwFAOkMdjdbLTmcvxUxWaDqoZ+uTzQe2EkxixSI2JZo0FiJwfkBQaG4zdAe/kmuDp51bR4hZcMPMEybcl8KteyDV14M7wcwCZg/El3w1wWAC9GugB5hg1oDeYGbHBfstgbY+1HT6nrK6JE9ZLdt5DFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R3HJm8D0; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R3HJm8D0"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36baec934b6so257738a91.0
        for <linux-staging@lists.linux.dev>; Wed, 03 Jun 2026 02:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780478084; x=1781082884; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QJbpoi9SSEU9zoK0PYzMvv95hRMB7OxFfHZ7WQQSo7U=;
        b=R3HJm8D08IhxsTJ7CRys1n1bZsfg76I25ugMbZ/9EEznUHZwOwHcJQo7oLoddLbUCN
         WYbcHGntmToEYmyRP7BRRXRvH5JK0X58Pqr0bWQYl4o0hhEhkVvf2BhzDsS/0aB6op5v
         zqFT4rDPHGg46IV7clQ27WUJ+VQS+l/BVSQ+GIa69wIB3NG3f80WnAO8mO+aqhrcuzJo
         I70PWezRytQxsilOOtUySKERC0NEViTMiOy7B4QsD7880jwph4YORQKg77JVxP9YC0US
         puOVY1TXQo44Sn3OSwmym0/M5si32Zn5jgQgJg2apfUdpuUF+Zb/2mY/HOaEo4dPf6+J
         RMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780478084; x=1781082884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJbpoi9SSEU9zoK0PYzMvv95hRMB7OxFfHZ7WQQSo7U=;
        b=LuCgUS22G7y1ElMPKDlWt+ptLPdOPPclMZPesse1RgqGO7zB8wNB5YhUFv2oEekeFL
         JfOUvjY9gFYEpwYYT4+NoD7z6D6r5wO/Lt/C+MYpgSJ7YA/03rCMbFVd17H4M40SivTw
         jWnl7RfHt6pHZzkhiTEdC/z2lI7ptMjuocA2cVr81Zq+5zdF3ccsnSznFUyYhKaHJL3x
         9nHwhAeaBfSJn/9wfViuvTC+hguweDg5YIXlHrRlpv+7X9cKAVyAx6zpelddXuiDEBNR
         PnhyJHFu//E9JWnXoMs1kcZlB64WVXzDiv16lyA8cDw5HvoKoMEVB4a9KHnmrT+1qoHK
         nyqg==
X-Gm-Message-State: AOJu0YwRvJCqaHoNrbpbPT/B12Cjv2ojK5VoDCS0GGki/vXw3WYy6K1W
	j8qciQh6xVDWrGQEejmyEKWO9+UpdzejJJ6PtXCsomBbhdMa9O1/q8k3
X-Gm-Gg: Acq92OF21Fci9BMGrCxw7DVWmj9hhQvCW8ZXKGenPMOVYmCXuae5SVOk/O8Hxpc3UlW
	jaitiXR0JjzcUDDa90y2cd31dVaQXv7ERf0tI4Bp0W1Pf72p+aYLjXAZ7LgP/QLlbZV65IcmoTS
	KEcNZY9kKggpJf3rAojAogmlkzBQJQtpRTPiP718LoX7ziK9qlukpfNknsWjrVZL7PxLw6W87aE
	A0vveSD8lM0Hw3GrOmqZXOqqcLd05+S0yU0K/SMgmQjfXi6d7V/nGEeNmAAGVRaWZrTvl+RT8J+
	+XEy1cjntyNy/PCFc0Rpmq+1E8MpwjLZ74V+94HMSTNvdoKV9vjQx5EFKzpVf8drvoyjISvmFQd
	LmdFhYB52c1aeJl0CZKATu87u76fEQ+ppe7Agk6tIlhX7PYP3hp4dQ8NdPTnfOBrMFPj//2aLs2
	OkGFBDd+shCVQyrLahWxQWqoJTVi/CH8xpR3smBgnsHg==
X-Received: by 2002:a17:90b:48c1:b0:36b:877c:42e5 with SMTP id 98e67ed59e1d1-36e3b811af3mr2168642a91.17.1780478084211;
        Wed, 03 Jun 2026 02:14:44 -0700 (PDT)
Received: from jeevaanandh.. ([223.187.120.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd91820e6sm5651096a91.1.2026.06.03.02.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 02:14:43 -0700 (PDT)
From: Jeeva Anandh <anandhjeeva215@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jeeva Anandh <anandhjeeva215@gmail.com>
Subject: [PATCH] staging: rtl8723bs: simplify NULL pointer checks in rtw_recv.h
Date: Wed,  3 Jun 2026 09:14:11 +0000
Message-ID: <20260603091411.21482-1-anandhjeeva215@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace explicit NULL pointer comparisons with idiomatic
pointer checks to improve readability and follow kernel style.

Signed-off-by: Jeeva Anandh <anandhjeeva215@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_recv.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_recv.h b/drivers/staging/rtl8723bs/include/rtw_recv.h
index 8e45871f07f0..9c32d480a20a 100644
--- a/drivers/staging/rtl8723bs/include/rtw_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtw_recv.h
@@ -349,7 +349,7 @@ s32  rtw_recv_entry(union recv_frame *precv_frame);
 static inline u8 *get_rxmem(union recv_frame *precvframe)
 {
 	/* always return rx_head... */
-	if (precvframe == NULL)
+	if (!precvframe)
 		return NULL;
 
 	return precvframe->u.hdr.rx_head;
@@ -362,7 +362,7 @@ static inline u8 *recvframe_pull(union recv_frame *precvframe, signed int sz)
 	/* used for extract sz bytes from rx_data, update rx_data and return the updated rx_data to the caller */
 
 
-	if (precvframe == NULL)
+	if (!precvframe)
 		return NULL;
 
 
@@ -387,7 +387,7 @@ static inline u8 *recvframe_put(union recv_frame *precvframe, signed int sz)
 	/* after putting, rx_tail must be still larger than rx_end. */
 	unsigned char *prev_rx_tail;
 
-	if (precvframe == NULL)
+	if (!precvframe)
 		return NULL;
 
 	prev_rx_tail = precvframe->u.hdr.rx_tail;
@@ -414,7 +414,7 @@ static inline u8 *recvframe_pull_tail(union recv_frame *precvframe, signed int s
 	/* used for extract sz bytes from rx_end, update rx_end and return the updated rx_end to the caller */
 	/* after pulling, rx_end must be still larger than rx_data. */
 
-	if (precvframe == NULL)
+	if (!precvframe)
 		return NULL;
 
 	precvframe->u.hdr.rx_tail -= sz;
-- 
2.43.0

