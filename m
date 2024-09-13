Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B07E146581
	for <linux-staging@lists.linux.dev>; Fri, 13 Sep 2024 19:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726255063; cv=none; b=JQkjv0sjdEpRYu3Hrh0bW+ANYYFyMXwK8LJXuAa5a46tZhAx3dmZPPzZLZtgF+GPyL0K/9hZcqBxediOj/KCtswl053OUWEOlj2PTmkHkfKtRTzyPbiPXdwRQ8cAQQFDweNGvJuFSy5nzSN/PJT14xpo1EVPEVd+qg6uDhSI3xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726255063; c=relaxed/simple;
	bh=yWuHN4hOrAHckEToIrtlx40+ngK2VaRLBRCYDXTOO+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=X4lB+nGktpMygAxYHFyM4RKSHP1r004Q8UJVsFLZbeagrobG+gd1RWfQy71UDSgb0T+jmO6aH/KE+tsyV7NOqvtoVAlTGZIyBhWiad2sv4SjSCaR8bn+8tAx3WSIOqPdVepnuaZ8Nfqij54qnzxAZ/xPfwRl42+PJk1IUweQna4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=guxdnpKv; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="guxdnpKv"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2053a0bd0a6so26170585ad.3
        for <linux-staging@lists.linux.dev>; Fri, 13 Sep 2024 12:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726255061; x=1726859861; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9jcIHqWkgAfixknzcAhPYZoyDkQ52gLcOsIWSku0RSo=;
        b=guxdnpKvjOQ2b9lnB+4D2FlnHfqBBd0hnLGcbruu/rVAxYasHh9rDgKIA2AIR67/BJ
         PMs118YqsnBhTqgMqPpeQlfVXjfj0UX/wgFjFbr3LpDt7PHX7NqANIUTRttXNuMdIAP7
         YJkTZKazBqNaASeSlyhOMZXhuZfM5OnfJ4TqlRXcODmvNzY6dzVRm6bVXcOyCKv61O3j
         VUMPnZOD2lZs1kgYB4V0dTJjJvjE+kMlh7uWctqRfZiobDZoIPsiKx0AOE/MBzlK5E60
         lPGaHVlZl+R+6gRxvK0c+F5DCiXGRUVJyDqbkI42GlIi9HQbidW7O40GdKte1wptFa9W
         qe1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726255061; x=1726859861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9jcIHqWkgAfixknzcAhPYZoyDkQ52gLcOsIWSku0RSo=;
        b=eMUEZFUUbNeTZj2Hl2FN8ox570LRqoujTHYw21aDqsbV9cT5ItAhjfdIjzJHT1B1Ky
         HZBrqh4Suctr0C8sxg4hl6xGyNhwon1jX3hzqb1VsUWf801eGeY+uH3plQGfZ7OmKv5G
         KgKYPnLPm1g3eFACGzd8DNIxgKwjxWYMws9UdQXGUph7UucxlNakSEQ4mAQdBV17HdNz
         ymJr4qDKyGwzyq4G5iPfgJ/Qeo9OSvPfkwCddz+z8xNhkhRPC7vZRtE9IECWKGIdB526
         0NWdlfmbHCYBFedIj0xo/uUuhVgkRLAwHAqD4/uNOOHOv6LBMB2F8PmUeUpCfJAok9Ef
         hUgA==
X-Forwarded-Encrypted: i=1; AJvYcCX3R9nc1T438FY1nk+91TzHlXp0nXSiRE5RbAeCO7TRwmOEwzsjk++CqNDzoHopE9DvIMgTNsxkVOeZWbko@lists.linux.dev
X-Gm-Message-State: AOJu0YxVsNDJvA4yewiJ/NYyDJ56vltnVFx2XdprHfKl2d2uw2AbKjgo
	o3SMtNskm9Q8+TvwAIf96u4Q2HnhJ8jBM4j8uMV6gi6wqUOgxYRk
X-Google-Smtp-Source: AGHT+IEefJq989ae2HFQTbfTrintN5mE/N+S5NGfHELvPZ6eTmyNQifeCKgcEqlVYLZymntY9GVheg==
X-Received: by 2002:a17:902:e802:b0:202:2cd5:2095 with SMTP id d9443c01a7336-2076e33e92amr108363275ad.18.1726255061405;
        Fri, 13 Sep 2024 12:17:41 -0700 (PDT)
Received: from embed-PC.. ([106.222.228.214])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076b01b4d7sm30899105ad.295.2024.09.13.12.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 12:17:41 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: gregkh@linuxfoundation.org
Cc: skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: octeon: Use new initialization api for tasklet
Date: Sat, 14 Sep 2024 00:47:34 +0530
Message-Id: <20240913191734.805815-1-abhishektamboli9@gmail.com>
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

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
Changes in v2:
- Fix the build errors
[v1]: https://lore.kernel.org/all/20240912172231.369566-1-abhishektamboli9@gmail.com/

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

