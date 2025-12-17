Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAB5358D13
	for <linux-staging@lists.linux.dev>; Wed, 17 Dec 2025 16:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765987217; cv=none; b=gPux3gRL/V0Lbmy9kyDZf7cgUEz5Je1XeTZMLhafEIAXH6w4uk9YSUGw12VBhpwcFVAqwK+nzWJdaowrJOSr2bHVykw/dPBENu6GE58LvrSvZ7V3k0ksAj1iMeIqBlKQ3xj2LFaI68WA5J3Qf93Tkz/D1gRYRr4vONYZ4+5sWlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765987217; c=relaxed/simple;
	bh=fH+JS5TmELysIY2xcaSYIWEw90PNr1cMplwNRB0XNVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RLXQLz/Qro9SPGVdpKFkbA2Q/t5a1AVyc8edCswJe2V9zBUC8r4ljkVkDh+1K18uQBeDSFZbcIZVMRzZ14+a5n+NaFSuOp7iIKWirsxmwnjJEJ525uEkZW4NvHEPsCvxZQYqp3L0MvNTkFCHHyZu4/sdzrEuLbacQxYlA++m29k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cz/q7Y/K; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cz/q7Y/K"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7acd9a03ba9so6774072b3a.1
        for <linux-staging@lists.linux.dev>; Wed, 17 Dec 2025 08:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765987215; x=1766592015; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDoeLCFPMBfxb+K/1kxZw2gcw5hr2QZDGXnEim5/zak=;
        b=cz/q7Y/KtvQV0+FuxuACJDzhlOCjCjQKUL0Ecypd29oe5Q0pN3ultV3yOiIEDymBbC
         UidngUe/+n2TdPQc7rZbsUEXB3tPpYbxICxw0xa69Uhjq1+nb6xSCMcIuVd2Ynk5a5u4
         t1WmeFlU5icfrdMqM1MP880mIJxuYXaloc0+6FMqaxVFhkUjtKxL6ayQwtXAWNmgb1mk
         OnhKNzAMFyH6DXh2SQdIV6HzjAUWGhUYgpz9LOu3THBq1IIWqU5mbDvPqlhV+kawtlDW
         xTAKYW+FGlfwY0BkRwVYXacCSVqYmHvKimbRDhNQ29uCYy7L/VEfd9S9kSHsfnws9ajE
         JplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765987215; x=1766592015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MDoeLCFPMBfxb+K/1kxZw2gcw5hr2QZDGXnEim5/zak=;
        b=vtAeztElYfKs3OOghrcVXQv1UXyy0pLuOn2ICfimS7cce1/CYQzTQzw8M6ALacN5Gl
         lgUcj7vquEp3I7ohr6GkmQFb+CLTjRKtrtZ4YzGrLNgkSDFSfvbFnbQ7oT6OJF1o7+uY
         zM3lcX3kC6s0GRTd+80OVjCsxi4owQnDyH14T9WIMxFpUNMLsewM7V7wuaOf0/f7f769
         vPNvqg6jhd7SHqXeItpR4RWkyGmEX3BJmHU3wrs+UI7QPGgTnxhVzhD5w851+FnZJoDG
         zohzIlyXJlMbKHucdgeEBHAT0qTXLS3AGCYzPgkFO9qEj3ilBZtMJybkVyxoEES9z9sq
         49eQ==
X-Gm-Message-State: AOJu0YyFbVjTw9JLYulqlkl6hFmbKTPT1H0eL3oldHDYqyYngYmi/Gju
	oCPUfDWOVVgUOzLy683wy/YJ0pwcGr0Rlzw6JiFiMep8v6jihWTrwq9p
X-Gm-Gg: AY/fxX7qhoSKbgL5hVplWdg29HOzqd4hKaPved0U7wdkVZOFzO/h2/W0rDsxJqurrL6
	MA8EopBqgF3ofIkjkXAOKBAtVkLE0Tiho8Xlz2XtFzuK7vw4oO7GdpP9yB/WQSn8fKTJIFp6tqP
	Fe42Yn8A8JkblExJRB12wEymFG/FmKC434z1n7J582hl8aCdpN6AAXs2Is8xUsw5ttNFIWZlkRX
	nBcJvy3k7H62pylWREZnuo5AuPfhUgLzfPlVcsJJ0HyAIzKUHH5456d+yWaHPn5YK9nOkOf8Jmi
	zAmU4NEV5l5gsh1UCIqdR2tPHIIIGe31w66dkWsDfDdScBqcc8C32ol/JOeYUgHC+jLK6pO00TO
	MC4P/Xo09Nm7K3uJE2XyNeFoSgWnwy0m+w3CW5gTq3sgoOqeRhlM0n5++fkN7mAcCdEkNm1pHv+
	yrdNxeHZ7Q
X-Google-Smtp-Source: AGHT+IFzNmdDOHYeTw5VgipnMmKoEw4pBUpJokCB4ikQBqFR92XZfhqtIxS0SdetN9OPTgZpa1qgmg==
X-Received: by 2002:a05:6a20:6a28:b0:364:387:8f4e with SMTP id adf61e73a8af0-369ae490337mr19041329637.34.1765987215185;
        Wed, 17 Dec 2025 08:00:15 -0800 (PST)
Received: from ubuntu.. ([211.234.192.122])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c2ad5663dsm19493289a12.17.2025.12.17.08.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:00:14 -0800 (PST)
From: Sanghyeon Lee <sanghae778@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	karanja99erick@gmail.com,
	Sanghyeon Lee <sanghae778@gmail.com>
Subject: [PATCH v4 2/2] staging: rtl8723bs: remove unnecessary else block
Date: Wed, 17 Dec 2025 15:59:44 +0000
Message-ID: <20251217155944.9000-3-sanghae778@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217155944.9000-1-sanghae778@gmail.com>
References: <20251217155944.9000-1-sanghae778@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary else block after return statement in
odm_CfoTracking.c to fix a checkpatch warning.

Signed-off-by: Sanghyeon Lee <sanghae778@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_CfoTracking.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
index 0b70509f553b..166af5f6c9e0 100644
--- a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
+++ b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
@@ -132,8 +132,9 @@ void ODM_CfoTracking(void *pDM_VOID)
 		) {
 			pCfoTrack->largeCFOHit = 1;
 			return;
-		} else
-			pCfoTrack->largeCFOHit = 0;
+		}
+
+		pCfoTrack->largeCFOHit = 0;
 		pCfoTrack->CFO_ave_pre = CFO_ave;
 
 		/* 4 1.4 Dynamic Xtal threshold */
-- 
2.43.0

