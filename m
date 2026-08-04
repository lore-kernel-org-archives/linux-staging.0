Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6134522FDE6
	for <linux-staging@lists.linux.dev>; Tue,  4 Aug 2026 07:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785829809; cv=none; b=eZp8HjoG/43CGlqPWhq8KPHisKE41znyZRDBMXL4ACNuHUfUn5P1CnewStQw8MythTvoDjyqsfYsz7//r69A7WgaEYP3FymdylX44HBidIl90r7MkVDn89Fqr3Y6j6oXY3qboDZwHVsl2cFXLBU43xVzUop9SY+8L4VlfvIlwSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785829809; c=relaxed/simple;
	bh=KW69lvg8TMWXr7DI9skS9q/ZqrV9+YFodEpT4OCc98o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QX+wN34AysXgvuapgpm8ibEEGrUZZTYtFj91cTWcZemg1pqX7xnMvOCClLcr3/H9KyGV69gKraHG5Ym1rPAHdEryWowhU0J894l7Hlu1Z91MOQlNCF92j/cbcTgg4SJxJf/vjpQtf+PCizkcbhhZ0fEpLQVpaJtekmJbRRSUB6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A5y2DpX0; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A5y2DpX0"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cace91f112so48238325ad.0
        for <linux-staging@lists.linux.dev>; Tue, 04 Aug 2026 00:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785829808; x=1786434608; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oSs5ij29ZrMcyZFf2/QKPoy3pslOiUQ8/h4fua66yDk=;
        b=A5y2DpX03E0sttlBbyPuZz9qex0myWPYRIC1TWV1Y9JRzUNbw2FN7nZPmqveId7UKp
         NPUlyOYKsn9TzDv803eLgmHtmhaPzk/xHg62HLyMdERcZgdQeBKjarBCrX0IF8Ue73qi
         uXUdLcaOCLhFzUe/AzVYfzLyxnBWzbAt4DlljOxScbhay3+ZvLC/uAgN58rFMk9VHr12
         3kENoK9s5gpS/DbBjn0fmRoAvzXF+ChHImY/6+eN4iZ5nZHyxkaIWLxZ5rdcG50XROJr
         gZRaXyAuuZ4SZZhbjSSAvt5/Oj9nMudgoCIgQ3KXH9aBdibRfL5doCvZcZPx/9z2FNYX
         H42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785829808; x=1786434608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oSs5ij29ZrMcyZFf2/QKPoy3pslOiUQ8/h4fua66yDk=;
        b=UObRGqilErV1v71CAVvcFEDUfZuhHzeYZhGuBZkr4D8Tvog8dMAwRjPS8YAAi245Ir
         HT8cWgO8msG2/3XQjh/udkohZ8OoFQwWCLGlr+BzKxyRCRVw45F74SJuc07pldhEV44X
         G2QYotYDDPI6kJSuZrjDd6H8qoD838VRAYXKov9y2U3r1OB7jTCDjRgXEGQcFfbsbxsF
         Q/2joEx6pYPMAvsBJ7RgKKZ1Dg1/p7Vq1dLdFPjZoORBVJymFIG/tBfx7FBdDZyokevF
         EqddlAEdqOcDSaoFPXVHRmDrn78NVggL0xRG5L32rjgOo/zLgpV7Nse7WR8syhiraWC9
         19uA==
X-Gm-Message-State: AOJu0YxecfDyS6idlPFENhqcwHrcdJ9IbeCje7d1YBw6eHMzOd9qq5E7
	kpoZwTuUjaRd4Zc+ma1jLz2tT/htvsSk+xmD/COpYoUoTv1c4qKBpvx3
X-Gm-Gg: AR+sD10357Cl3WTqy2PMpzcJVVZg2QyDXy49NK3BBMrjEp4XXrU5h2a1UQ4AhMvVf7s
	pj2AQVNU87DzuCkxWgHvaFq8nZjmfB12s/GFOJcHpxKc5BtFf4wkixkRSg4ilL5mZKgQF0c7Hp4
	DFHLm2boAMzq3sKcfR0mqq5qTuvXbpNzYieqXHI12W4wLO/pbOXhge0IcBCw3gk2M74N8H/tMfu
	IjuRiTIGUrVg78R8GKNO5Q5QFmh5BohAfdOUxRTV3m1h97n7Z80JB2Hk+4jA+0uCFgoDSPEkfpq
	uTMQ0n6+a/i/Bj1MfILBhyd4v8SVRxjt0g8+eYDGh65An1G5e0HJCY7v635QteChgrP661mAU2+
	Hcn5jtQdULqNMktvbHA6rViVjhWCnbdqAA8l4s01N7WccPtBiFRTJQZNr7SRSBsjJa7ZMP8a5F8
	WYdyviXguqdcLGe8e1kvbCS2+pYbJfH68wZWPGAtawOQWCpNrGeSA1MzPT9p/rA9GR9XTEvD+3t
	OCtKS8=
X-Received: by 2002:a17:903:46c6:b0:2c9:a5e9:c26e with SMTP id d9443c01a7336-2d0521ed97emr119765655ad.13.1785829807354;
        Tue, 04 Aug 2026 00:50:07 -0700 (PDT)
Received: from Vicious.localdomain ([103.37.82.147])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7b2sm1444852eec.19.2026.08.04.00.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 00:50:06 -0700 (PDT)
From: Ashmit Kumar <work.ashmitkumar@gmail.com>
To: gregkh@linuxfoundation.org,
	mchehab@kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashmit Kumar <work.ashmitkumar@gmail.com>
Subject: [PATCH v2] staging: media: av7110: remove unnecessary parentheses from return
Date: Tue,  4 Aug 2026 07:49:51 +0000
Message-ID: <20260804074951.14915-1-work.ashmitkumar@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Linux kernel coding style specifies that return is not a function
and therefore parentheses are not required.

Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
---
 drivers/staging/media/av7110/sp8870.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/av7110/sp8870.c b/drivers/staging/media/av7110/sp8870.c
index 29fb4934c03..83c6ee305d6 100644
--- a/drivers/staging/media/av7110/sp8870.c
+++ b/drivers/staging/media/av7110/sp8870.c
@@ -92,7 +92,7 @@ static int sp8870_readreg(struct sp8870_state *state, u16 reg)
 		return -1;
 	}
 
-	return (b1[0] << 8 | b1[1]);
+	return b1[0] << 8 | b1[1];
 }
 
 static int sp8870_firmware_upload(struct sp8870_state *state, const struct firmware *fw)
@@ -167,7 +167,7 @@ static void sp8870_microcontroller_start(struct sp8870_state *state)
 
 static int sp8870_read_data_valid_signal(struct sp8870_state *state)
 {
-	return (sp8870_readreg(state, 0x0D02) > 0);
+	return sp8870_readreg(state, 0x0D02) > 0;
 }
 
 static int configure_reg0xc05(struct dtv_frontend_properties *p, u16 *reg0xc05)
-- 
2.51.0.windows.1

