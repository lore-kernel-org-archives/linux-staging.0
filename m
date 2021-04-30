Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90122F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:57:54 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id y26so3355668eds.4
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vvsMkKSxObWfrYf5zpIINvfbNjNueuFKMoVjdC9Jfxw=;
        b=PP757Ux6hmGGJohllcmZV4WIU8qD7TKi9Egr1sGgp2BLiArIqqogjnquAP4vbZLqzp
         lSJ1OqulIT7kcvftM+b2aXd4kr7XPiSjyWlUpgn7rkvpDQJWtllgwroyRydxHaMkGImR
         1Y8efocIPjqHq0pMMhhhLBCOZ3K4bz5Wh4dronavRqpONC204b4CDBv5tXckm8QIa8nq
         UBM3HQt2O51EUn8M1vZcw/GRVHN85lEMid5OcZBuM0FriYXMqSUC6oYKIhgjhfGjd2WI
         7CFwf9PaCXJH0lH9oMgF5Nup76XvB+yzZOTWZZd1xtx16nkyLku35blfOE3Tx8bCTY8Y
         1zvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vvsMkKSxObWfrYf5zpIINvfbNjNueuFKMoVjdC9Jfxw=;
        b=iwraZ61ty6cMq68kMz2L5xk8/TgNVUw5y8Tkb5MMKyaoC7VYAAhs4T9Lj9xtk9N3dH
         ohIX6z9a8fMgQrPLfBpusGIwtND/wOAQXEwKVcNU7/jqdi1HWc21pMJFLrbxuX7WM8m9
         Rp+Qfu3+dOa/7kPDB4DsqHyjqfY/n9OA/Qp57gsAoeirYSFhIoL0arfXLJh8MQLBZoVL
         DbnriyE03HvnADMcKZjEGQO258xjFyhPCqv7+N0zVMGwuf1OdstyAnehpKlRZ8pqm2Y0
         Wgf/A9GULO6RFY0cM+xatfycvKh48CmxfSQx5Ry9YqN87+K8aKg1Lsli5VTuasnsAQFQ
         QFIA==
X-Gm-Message-State: AOAM530hbLdL3UdY68UC3Y2x1nNv8V8dOVhWymdtLZu73UxpaoYXukTV
	SkHlIj32QDEmj5tK8DV1JYg=
X-Google-Smtp-Source: ABdhPJz493glCKuv5PW8ESieEabKcY+eaWmMcAxo6rX6MzcgNPQ0URu4SFiId55oynIvUaERYfPfPA==
X-Received: by 2002:a05:6402:1516:: with SMTP id f22mr6451941edw.33.1619794673377;
        Fri, 30 Apr 2021 07:57:53 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id g11sm1494983edt.35.2021.04.30.07.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:57:53 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 28/43] staging: rtl8723bs: remove empty #ifdef block
Date: Fri, 30 Apr 2021 16:56:50 +0200
Message-Id: <9a2095cfd69647dd304eb9e059a6aa9aa00694e6.1619794331.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619794331.git.fabioaiuto83@gmail.com>
References: <cover.1619794331.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove empty #ifdef block.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
index 9c9ad29870e2..f2793d5d9a30 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
@@ -112,11 +112,6 @@ extern u32 		GLBtcDbgType[];
 #define CL_SPRINTF	snprintf
 #define CL_PRINTF	DCMD_Printf
 
-/*  The following is for dbgview print */
-#if DBG
-#else
-#endif
-
 struct btc_board_info {
 	/*  The following is some board information */
 	u8 btChipType;
-- 
2.20.1

