Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8CD3D9DC4
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 14:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775745716; cv=none; b=rjg9ZAJ4PgdZiPfe61/5i+oD7MGKLIYCVF37L+4KYFP754LAItf+HW5Pcd3sc48akgfDdwEVdPp1csjGkGb/eChiOG6J1fTMooV1MAhhEPepE4qHuv4gNbGvkvBgHIMhm/sZiUnY/lNP3khmPupzulsulVMMsSwOWsCxG2e/pAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775745716; c=relaxed/simple;
	bh=+vHcx9lI7yya0W7s1XmjAsO9BEU7Hgjmcx7FM3fwsWw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h6xZFXkX1Bgc9pYtfDEmLQp5slg4ENpCXBIlTXeA8WubedNZqPpjvuA2wxPkj6aMQPupT+hCfMp/EBQD+hNNhhy4Ch1KZzNmW9Hm2ZPs5m7HdtUDtZLPkbPLo1UT4GMvph+38fCOk+uvGPDi4rhJCZ6I1TuRdBzQOwzwmvYwQIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L3s48wfI; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L3s48wfI"
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-1271257ae53so8021860c88.1
        for <linux-staging@lists.linux.dev>; Thu, 09 Apr 2026 07:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775745714; x=1776350514; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ynn/Tv7vt536YLRzFScHBlkRRyfwxHMbDNUUOzExOGQ=;
        b=L3s48wfIFdCR1pUk+MD67o/9l9Dcg3TiEG7ZtEokhC8LU8QUMka7V4NO87a+TzKmz1
         qqedvO8k5EMQfYniTYi3A+DZeb0lkAgFXS2fdWkI6lf5OcW/Rrpr1O2AGbJHDdlPE2iO
         11BYC10X5qk2Wg6ufDLRIAN7u93SQAKO9rm0pwmlMbvJvw/S5o6y1ygdDzeje5PbbDeu
         Pj9Vco0ioiWA/RtdXmb2R/4WNoyyQRUCZdc70MC+flUusmM8mBJcF478+5INbruNF+V5
         evLgUWUlKHdylxU5dv3IubhU/zBCJ1gxOlxo2yUvH6vPD1BYS1MNddfkvXkPn0HFr/Cg
         ZANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775745714; x=1776350514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ynn/Tv7vt536YLRzFScHBlkRRyfwxHMbDNUUOzExOGQ=;
        b=Rx9CyGteWHbUhvg/ikXWx56NK4fLkqYjG1IV0sVp+tPUd2eJIts72qD9prlGeCer2X
         ubIuZ6DpmQt9SDgHnunfjc0qhc1NyQBLRcEXzEF0BAv5/aT+/tCOmB7bZzDqOTs5ukcg
         pJh8SKzmh6cfCqjeixxEDYxExkWDSQFY34lmasYIE5SGAiiKO+XP+Jxdg4QK5GlgfX3d
         eybWnonrvbJFOti0hTqB63pa1ifWGSENc2qoDlxZa054S6c4owIe8/v+Wazb9MeRwLX0
         3Bik6qyC2+gwjfMjAqItwyaIdEqj++uAE3nZWcX9siTnlzzYbHcaWPpIvQ/PA/y90PvX
         k5kA==
X-Forwarded-Encrypted: i=1; AJvYcCUBY9EvLI4Fu3mTcc3XQiKRsB8ByKPR9tqKpfZgeIssjj17yQhPqgcx3RLrP2xtr7+gZzWdIgEoy5fXXAxp@lists.linux.dev
X-Gm-Message-State: AOJu0YylWkoNcCwoiudOjN3E02Zq8gmE/7AI2jYBOzIEph/8+Oxn+wsF
	iXfG046EZVBbTPBu7/nWxyPFKGcsLe7Rzz1HiLR4WjQ6J+SBBlqVE6tkkLFWFRZW
X-Gm-Gg: AeBDieuQSxL4phZIh6hQja1YbJJeBgmmlkiuDObTsH6yfQDF9uxfobTvrjb9uCFLIUe
	ac1t+37LXHbNiw8gknyrYzl+TWPtt0T5bfsPPf8YCGeIJA1PeTQ1PC8DzGkeNnruRb8+vN3yvzy
	4njbNs7ksSYmKy8vCAunGXUi/0fXsfqfGWN5hC1ha5H+M5euLfQ+VOI5EyDmNDDWjZnD355jIPq
	4Cg5ShEVd/NWTOUyhQqy/D/GlcEXV8GniUwLCzhT3vxNGPkrD8rurOuCLQNhqHSohxO4mgiS7Z5
	16sWSpQthVP1YMnd/Izftdr/QB5fPk+gkCEJfN7IrPXwKRu//T+EuAyDQev2s4e7iQaxiTwgmjN
	ULKD9GO3p9CoDpAHgWPQbn7GhOsDO3yJalgtzIVV7wbm4gGwiNOmCYYoyhnnR4+v+MivdBvF2Ex
	aOVbtkRH/xgYq48rzu8nejjDdoH2EOU7JKYj8CpGjF3xx63T9UsPS4YYkemjItYelIDQ==
X-Received: by 2002:a05:7022:ec17:b0:128:ccb7:7fa3 with SMTP id a92af1059eb24-12bfb76edb5mr13072445c88.34.1775745713994;
        Thu, 09 Apr 2026 07:41:53 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c07a8703esm20363284c88.8.2026.04.09.07.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 07:41:52 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH 1/2] staging: sm750fb: return -ETIMEDOUT on timeout in de_wait functions
Date: Thu,  9 Apr 2026 14:41:18 +0000
Message-Id: <20260409144119.21500-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260409144119.21500-1-dennylin0707@gmail.com>
References: <20260409144119.21500-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hw_sm750le_de_wait() and hw_sm750_de_wait() functions return -1
when a timeout occurs. Replace these with -ETIMEDOUT to use a proper
errno value and better describe the error condition.

All callers check the return value as non-zero, so this change does
not alter existing behavior.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/sm750fb/sm750_hw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index a2798d428663..3809401baa3a 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -502,7 +502,7 @@ int hw_sm750le_de_wait(void)
 			return 0;
 	}
 	/* timeout error */
-	return -1;
+	return -ETIMEDOUT;
 }
 
 int hw_sm750_de_wait(void)
@@ -520,7 +520,7 @@ int hw_sm750_de_wait(void)
 			return 0;
 	}
 	/* timeout error */
-	return -1;
+	return -ETIMEDOUT;
 }
 
 int hw_sm750_pan_display(struct lynxfb_crtc *crtc,
-- 
2.34.1

