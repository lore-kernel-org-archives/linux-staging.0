Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F302A1CA
	for <linux-staging@lists.linux.dev>; Mon, 30 Sep 2024 02:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727663599; cv=none; b=afj5wnwL8GQsbOGjBIlpXkCdycKwsEqVYtbiTMOHDm/nPWr69RfoqsndBhznlMjI9FMlvy4QmTQezB/ghRRDIOD2DS1GeQzcNWciHEKLhnKgyj32y4lQ/ueACQUlqGfZTTjT2UR8L4TqJltP5P/JVE8DyjYSaKazTeQoD/mNOHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727663599; c=relaxed/simple;
	bh=e70E5Y91Jsny0whAyhew+r/g5VGp2qLMl59bQCj571w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=i6o4v+/4LaIM17W3DpJ3+wGvj2bl346rXbr/wC4+TL0je3h3t+HU27klpLvNGaq8GaNiY5Rr5SABSLx6d61dquZ0BM2SzR9Hd9ykl8jA5LgNuZ1nPNcyJlQITYS/osvVifmhymUq2P7cYrecqh98gG04rGuBmJ2VJC6Yhnmjf+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TymjdBeF; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TymjdBeF"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20b4a0940e3so22268845ad.0
        for <linux-staging@lists.linux.dev>; Sun, 29 Sep 2024 19:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727663597; x=1728268397; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TRV/D2yysUbqRudO1eZM7UervZe3Msap6RU661L548E=;
        b=TymjdBeFh7qcWU8mTQBdDbPhw8+Yau4wU3O67ALjurWSKL5aDl69Mwb7CSvW8cLg9A
         T5o2V4FFr5FB5uuwlRxkAVyq99I74JhVUgUf8Qp4XlKbPXLAME0RscFhb9XjmWZSA1fR
         4Cm43IUE49Qy7mSNT61xIXhdh6HMvYSaeJzoVTKpmVAxWiKEZb3+w7wCrmXuLJZa3nXC
         u5cIwrUiKTT8VuRHPRrWa9SVeeRpWhKSgYXRAuF0OeBsS01f1+X0VQeKaTDT2/GA3+Rx
         3pgtrKAV3C9gYBIPaTrFU6joSLIe03mkGoqUuTaj+If8spLZHjI5uFKujpcwRy8vmMdo
         0H/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727663597; x=1728268397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TRV/D2yysUbqRudO1eZM7UervZe3Msap6RU661L548E=;
        b=WBvgHWHuBaj8q7m9VKChGl6Es5ACZ1kSrXZWti49wHNWyi+Qf+RKWXlHolM/VGlBn0
         BMjKuH7OVac1FGG20iRFb8vuVAMY3ahKWtg6ZtHcDMMGXoqPeitFYR+i19VgWyjVvqrb
         6cfDQLlKhgvzHpA94fTVWmCqQYWjZsaP88peF6B2WiVZ0aa+k9LNRfPq98efO+ouCSlZ
         IlKDaIcthoqEX/jy102/gzO6kjFzQqDHf0gmEQIf+ko5Pq9yLvgVr2JYEFAmYXTptwWO
         1pCNflu6DfKjKXy/Ml6c10Bko0VdRgWt36UDtkaW4bDKCojD77wz5LUOswUF/1xRjlf6
         sK5A==
X-Gm-Message-State: AOJu0YyKcDxqYjHPPlLmFSZmv375o0xvci4IZva+xm/XCytWh4ycqXPd
	Dx3DnTudEvlnNVHX7C8/HOF0uqYdWVujHvba8wCazA3OWin7zGkN
X-Google-Smtp-Source: AGHT+IFaTTkpMfIa3pAOQiRSHGes+mnXnVgqsNsCx/5/t+75/M5Nvh0Z+2hujAzCajr+YQeaUPZG3w==
X-Received: by 2002:a17:902:e74b:b0:202:508c:b598 with SMTP id d9443c01a7336-20b37bcfa36mr177554005ad.59.1727663596735;
        Sun, 29 Sep 2024 19:33:16 -0700 (PDT)
Received: from embed-PC.. ([2401:4900:889d:8638:b2f5:89a3:1fb4:f5b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37d60e92sm45487275ad.43.2024.09.29.19.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 19:33:16 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	dan.carpenter@linaro.org
Subject: [PATCH RESEND] staging: octeon: Use new initialization api for tasklet
Date: Mon, 30 Sep 2024 08:03:10 +0530
Message-Id: <20240930023310.397543-1-abhishektamboli9@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the new api DECLARE_TASKLET instead of DECLARE_TASKLET_OLD
introduced in commit 12cc923f1ccc ("tasklet: Introduce new
initialization API").

This change updates the tasklet initialization
process without introducing any functional changes,
ensuring the code aligns with the new API.

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
Changes in v3:
- Rephrased the commit message with the reason for the change.
Changes in v2:
- Fix build errors caused by initial[v1] patch submission.
- Update the cvm_oct_tx_do_cleanup function to accept a
  struct tasklet_struct * argument, required by the new API.
[v1]: https://lore.kernel.org/all/20240912172231.369566-1-abhishektamboli9@gmail.com/
[v2]: https://lore.kernel.org/all/20240913191734.805815-1-abhishektamboli9@gmail.com/

 drivers/staging/octeon/ethernet-tx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-tx.c b/drivers/staging/octeon/ethernet-tx.c
index bbf33b88bb7c..261f8dbdc382 100644
--- a/drivers/staging/octeon/ethernet-tx.c
+++ b/drivers/staging/octeon/ethernet-tx.c
@@ -40,8 +40,8 @@
 #define GET_SKBUFF_QOS(skb) 0
 #endif

-static void cvm_oct_tx_do_cleanup(unsigned long arg);
-static DECLARE_TASKLET_OLD(cvm_oct_tx_cleanup_tasklet, cvm_oct_tx_do_cleanup);
+static void cvm_oct_tx_do_cleanup(struct tasklet_struct *clean);
+static DECLARE_TASKLET(cvm_oct_tx_cleanup_tasklet, cvm_oct_tx_do_cleanup);

 /* Maximum number of SKBs to try to free per xmit packet. */
 #define MAX_SKB_TO_FREE (MAX_OUT_QUEUE_DEPTH * 2)
@@ -670,7 +670,7 @@ void cvm_oct_tx_shutdown_dev(struct net_device *dev)
 	}
 }

-static void cvm_oct_tx_do_cleanup(unsigned long arg)
+static void cvm_oct_tx_do_cleanup(struct tasklet_struct *clean)
 {
 	int port;

--
2.34.1

