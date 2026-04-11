Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F1121D00A
	for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 14:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775916069; cv=none; b=RpZfrjzha4ihPhXQUga1AzR5DUCvRaD/AOQ7EYu6CmfAc43ZXVg2MsalE/vA6rhkq69IzvylokdqO3+v5KUhKjzmK1lMXIaiY7jXIfEOtQV1tMWdcfowWzIBkyGHYQjBcY2gDHGcMuC7ipuJOl5VjS4qR5OvOjJRbEQkko8OriU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775916069; c=relaxed/simple;
	bh=bRggQusfsP8ARoca8fSIQkMbx/v48QP93L6U+qX6K4M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RkrDAxQQNj1bI+NHQ8MGKBhvWI4c0jX1eQWbZ6YSSGi6wlwRb+Lv50h3AwdLJjiZT46B4GyH6AzfaFQumyJEj6C1gq/xYIEIjtNu5NznWEetxvxOcpSLzcpD9ADXX4filCaznU8e/ABuB9Q4pB7rdMjqe7WMedLdWaC9LlSpFgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pFzoNrLu; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pFzoNrLu"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82735a41920so1040549b3a.2
        for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 07:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775916068; x=1776520868; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VL7rjfcZ2WSKs9LOYGYJ/rM1tEVZ/V20e+rMckrNDqg=;
        b=pFzoNrLuNQznBQiG77rjYVtP4fbVtAUbecAmlmBiJducco1FYHQ8bnEDg8g982VxZ1
         rWRBAWkrE0EMPdPf7WsbZXhywxAzhopgGT4JlklC4WpjQb2dqFu1T4eaflnEk7Lk1be3
         kbtk1/22LiepdpG2+u3jYFrfkAAwLvn9YqSyUq8kOO7mHmHzUSmkHjav2Vaj+ZrcHHKq
         MrBJIGQGpR/0vUsEt/lVyc0XNXGG1igOONOnelZzzEKFl5/AAm7AVdjmxZG7pl8FPrsL
         C9RVTrh9PI1zbhgJIuXoTQbAUV9WBYhNbYO+/B0AM1nuiFZTNwrxCvu+AjNyZtxfYF2B
         XbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775916068; x=1776520868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VL7rjfcZ2WSKs9LOYGYJ/rM1tEVZ/V20e+rMckrNDqg=;
        b=d4WiRraDnjtbt7p32Fpgt12mlM9WpVG/HMBjz+OaeNAGGyakLqECXbqaBK8ngm3Nb8
         adWXZ9ONHKFticXdayJPx3+q6hX9CHusOyt2v54WAeyH2+KinXf3NkSMK66kcLedVBRP
         GOgfl2uI+RDHJbDIIR47Tle1ozxdHqpD6Hzv4e8OPkc+dAZAlt9jT35/fsfFZtjTuNx3
         ejv9k7SZL11y5YT1MipX3Tpcqnuab3+kz17Q+pz/7m2w45sfnSaL4SehRBkcWgWxJ6di
         gRE14hqNqaY6mc2FOVX2bPsTPg/VGzUEv30xcIAAepM24RV8ptEb6e5DhyMLSSNSJ6h1
         9pbg==
X-Forwarded-Encrypted: i=1; AJvYcCVPrNLhsW+7Mx525CZMq1jBSXdU6Vw5Ue5zAJVsX+wklM7xTB+eJSllLZ3eo+yV91H1HVUToCdBCVq9YgoL@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+4J5XTnQXD3+V4MErxe2nfpZmFHOTFxxGii77v8lI9DrJ4fPf
	LGdvqCZLY0Pk5f/G2DNuKkQwKJfL7vxetjDxdO+6/6JiJGWGMlP0e64j
X-Gm-Gg: AeBDiesM0LN+itHOVeVEyNa6aziueMFVN1A9CensniyWRkSuLD3JJ0jApOKv2NnNrlR
	ZDxNbsgRSSqYVp7T2fc2WT3ucvYYMVR6iep8IMyBFR1HbhY+1OjOE34nEroPCeyn4j7RTK1UD/W
	625K/uEyeFcyNT9g8nIV60xQhYtxXk6CYTRM+Zht/p3QNyhao8YlFuHWJNB64jOLEnu2ENFCCl1
	br5KMpJz/aDdjjzPHbQ1SQc4YDUZ9ZY/btlXZOEEOyrJRs069QgRILTugpu5gpYqMO5JQS1IXZ4
	0uW86okqzEYzcLDdIHxbLKFsql2u/Kbmx6fCjXqZWcMtuQyWUYwo95CoIeWLRmzv3ddNDKNBinX
	iEPbTQ1mTSy0QHeveVDp+aXDyCFm/GGJCSnKsetdp+YTNkK2QBGz+fzncLO5Bpbs6bBMnpZykQO
	efgYl103RJ3k8GhlUsjRTp0mQqWIRRl21uczlc9qE/dGdzwYmlNg4rxdP2HgJPLobEA8t1mv8kx
	ZmNvna4GTteGPknpwbQ1QU=
X-Received: by 2002:a05:6a00:10d1:b0:82a:6de8:fa50 with SMTP id d2e1a72fcca58-82f0c1ff27emr7921533b3a.18.1775916067832;
        Sat, 11 Apr 2026 07:01:07 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.113.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c311a06sm6712533b3a.10.2026.04.11.07.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:01:07 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Subject: [PATCH] staging: nvec: Fix block comment formatting
Date: Sat, 11 Apr 2026 19:27:42 +0530
Message-ID: <20260411140038.5041-1-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PLace the closing */ of block comments on a separate line
to follow the coding style.

No functional changes.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
 drivers/staging/nvec/nvec.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e9af66a08448..4799510d2d12 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -659,8 +659,10 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 			nvec_tx_set(nvec);
 			to_send = nvec->tx->data[0];
 			nvec->tx->pos = 1;
-			/* delay ACK due to AP20 HW Bug
-			   do not replace by usleep_range */
+			/*
+			 * delay ACK due to AP20 HW Bug
+			 * do not replace by usleep_range.
+			 */
 			udelay(33);
 		} else if (status == (I2C_SL_IRQ)) {
 			nvec->rx->data[1] = received;
-- 
2.43.0

