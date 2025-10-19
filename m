Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E6D2773E3
	for <linux-staging@lists.linux.dev>; Sun, 19 Oct 2025 09:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760867476; cv=none; b=gsNA3Slpx48Y0O6T62+UdwX/E23p3DiJXm1dVBH/Q9wmC2neAOFt8i/yHFedUYkoaNiseUzYSJE6IMxnf1sHuD77McmhhYDsXGdHNlzURD3rbKOhjtUjft2lqVcq9hcX4itBQqgkovTeynpLQ3nOoa/hY2gyB3DACl12F5miCa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760867476; c=relaxed/simple;
	bh=kBMvgP0actkbeMJcb3zto/YkqkPQV2eIq1jIx2LqT/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YBo5iUClSqfDzQLAbUNgM7rH1XODAxh5EGPxg+Jln6cQW+pOGZ3pAkFqLRbH6LfcIRYgVsJ6kPRr4m7bhzuqSHhHDzSXNQAmJV40BJk/1hZ1zdiGGkql+llvAjBiOlVYieadrrqSHwtDUG4RbDwVTsulRLGDU1i7yvVXOdw2KNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fC2PdDsg; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fC2PdDsg"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b40884aeaf4so69037466b.0
        for <linux-staging@lists.linux.dev>; Sun, 19 Oct 2025 02:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760867472; x=1761472272; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cl3Qt/sYm31WN4rF5OOHYkEFgm7/83Ra3YhhSXU60e4=;
        b=fC2PdDsg+XOQPnK+wUOG+sGz6SYNR2Q36JCswnTrEaX4i7o0zWyx3pzYVIKXolWqTM
         7pyrBEmq8ch1Oc795BipTM3W+a1IvzNWUwabj0vU+SeSnqQZUfZx1kdj0nX4fucLRn45
         yZWMxg6G1riE3AMP+xvc0B2Z2jW/aM56k4TEOFue0o/JbaDge6ZEkPH3qm32Fx/0CsrH
         I191vqdhOaSL1s29MK8FOlDmvPBQqBYP23TPA+c6N5CAQN001p/tDvRdxHRtsk1QokmQ
         a48TbLBnKnHZis9I0X1bGdDprxl/FME6vJ86rypxQTJyda3+dS0xXbv5J2m+CkjvAvHJ
         LzGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760867472; x=1761472272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cl3Qt/sYm31WN4rF5OOHYkEFgm7/83Ra3YhhSXU60e4=;
        b=qJJjSGoGU4uJPZeh7Lak4UUaXqawvvUBnKvmksYYQ6UMZV3gILrWvN+oWWgbl3SurW
         RNtoeiWV0RWltGiKOMa0T6Xy1yslNLGELC+olfjj56Zd7CFToOp8mG/zi+OHccTXxS/u
         SyS7ThKSWmyBxtvb0kKZiO0ahSVoVQ6VWMrraZFkJjB00ujUZIYY1FGHBK9GMF8o0dPr
         BqrTD1MM9UuoHL/ZNEKWqw6sy37rbqVDLB87uviB3WVKogNaLlQYfF0EaZT26GCqC3+Y
         H+B/5kpUbdNWmHUQPLJs0cXUL6gDtQy2GWlBIHD+8Dc6NuV/14wLDID9VOF24NA/6dHh
         fT3w==
X-Gm-Message-State: AOJu0YwzSYFONhaQ78NZlvGBDNySa10Vm0gQee9eQXp7iGQnB+gJGFkO
	CxIM/bSvhWD3wZGonJR84aoo0fvetCnIfhF3gvHD8vmdQebC6jyVbpwQ
X-Gm-Gg: ASbGncvy4rdOhY0UrDfql0rnCK45mqlDnJgFrMlKPdDallBOu4GDPyNKUTP49BEHVve
	npCPlv1tQecRd9vikYvyu09J65nWoxwrVqZv2821iIaNzQ3X8aR6KYy//0G/nWrRsGKwifv+E/B
	FBCfWpiU131NBXXSD05Kj7rniAT2BXASrf2leboS146s220+1dU4/hbKCBTVqsTiT9i+CukU7dt
	BrWbVvwzTTRwKlUJXS7kOnh4RAQ/TAiu1OvD8grLiL57aBbs/K9SLDcazTq8zIy8l64Y1HwnMr6
	GQG25kHFgYQTUw+8qQ38yrqtKCKVecXG0OHsfV4bYevCRWHEfgUf87VTmKcrLwas60C0TpJlHET
	V6gjVm/nUDbj2IkHOOssokVJ/DRru39kbtiUrsZ5n09ZdX7NkoD2Bdr3TtVOK/hZSoY9ocnqhKE
	NdkBHKA4GC/Etbqu80eTWj/yA/e+fVpHhK3viF9qVX/SePv6vKjzM6tw==
X-Google-Smtp-Source: AGHT+IHUpP4DLSY233dfczm/oVDqJEO0ht2lmdlvw9y+CTCknrdIKTcl2u2GgLkWGZWgGlg2n8NvEA==
X-Received: by 2002:a17:907:9708:b0:b04:2d89:5d3a with SMTP id a640c23a62f3a-b6475505d94mr601951366b.7.1760867471789;
        Sun, 19 Oct 2025 02:51:11 -0700 (PDT)
Received: from fridge ([176.216.135.252])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da25d4sm467365466b.9.2025.10.19.02.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 02:51:11 -0700 (PDT)
From: Emre Cecanpunar <emreleno@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Emre Cecanpunar <emreleno@gmail.com>
Subject: [PATCH v2] staging: nvec: remove NVEC_PS2_DEBUG and dead debug macro
Date: Sun, 19 Oct 2025 12:50:57 +0300
Message-ID: <20251019095057.5684-1-emreleno@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NVEC_PS2_DEBUG macro and NVEC_PHD() are unused and only add clutter.
Remove them completely.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Signed-off-by: Emre Cecanpunar <emreleno@gmail.com>
---
v1 -> v2:
 Remove the unused `else if (msg[1] != 2)` block that referenced NVEC_PHD()

 drivers/staging/nvec/nvec_ps2.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/staging/nvec/nvec_ps2.c b/drivers/staging/nvec/nvec_ps2.c
index 575233fa1677..2db57795ea2f 100644
--- a/drivers/staging/nvec/nvec_ps2.c
+++ b/drivers/staging/nvec/nvec_ps2.c
@@ -23,14 +23,6 @@
 #define DISABLE_MOUSE	0xf5
 #define PSMOUSE_RST	0xff
 
-#ifdef NVEC_PS2_DEBUG
-#define NVEC_PHD(str, buf, len) \
-	print_hex_dump(KERN_DEBUG, str, DUMP_PREFIX_NONE, \
-			16, 1, buf, len, false)
-#else
-#define NVEC_PHD(str, buf, len) do { } while (0)
-#endif
-
 enum ps2_subcmds {
 	SEND_COMMAND = 1,
 	RECEIVE_N,
@@ -70,18 +62,14 @@ static int nvec_ps2_notifier(struct notifier_block *nb,
 	case NVEC_PS2_EVT:
 		for (i = 0; i < msg[1]; i++)
 			serio_interrupt(ps2_dev.ser_dev, msg[2 + i], 0);
-		NVEC_PHD("ps/2 mouse event: ", &msg[2], msg[1]);
 		return NOTIFY_STOP;
 
 	case NVEC_PS2:
 		if (msg[2] == 1) {
 			for (i = 0; i < (msg[1] - 2); i++)
 				serio_interrupt(ps2_dev.ser_dev, msg[i + 4], 0);
-			NVEC_PHD("ps/2 mouse reply: ", &msg[4], msg[1] - 2);
 		}
 
-		else if (msg[1] != 2) /* !ack */
-			NVEC_PHD("unhandled mouse event: ", msg, msg[1] + 2);
 		return NOTIFY_STOP;
 	}
 
-- 
2.51.1.dirty

