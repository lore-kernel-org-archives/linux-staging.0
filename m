Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2E61991C9
	for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 12:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722343130; cv=none; b=uy4WrbwuIYD7lyi+4eLlFxgPls0nrvfMb91Eyqyc8THRhYBD9ti02lvy9gVz4cnEJvcUemDMW+lbuWdaGR96chlPUn4Z4f7XvTIZ1Sw4nyV2chCrliTADU+heveEbmJv/VpUoWr4Xit1T7hXf0Kfbk2OQROxhY6LAXIfwWC7L2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722343130; c=relaxed/simple;
	bh=scfzS0K0VaYL1XByFe1MCrgJqGcJUkxVr2FuHOjIQh8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Psi/iVbOwPoaGrSOFlUJDn34us2+Y2yHdTms+4G/UJk5IfQj6uutNsYM849Gf346kcNSZ+XdqdTTzwpUZ8R6jVlW7PRyRoml+2C7getkx8iNvLwNJ1Ie4JZOSrgo8QvUCV/zMlhv217zSbNJ6SKzcwJqYhVcvyxZPuFZQKBe2lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GH+KgNrU; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GH+KgNrU"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1fc6ee64512so28936075ad.0
        for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 05:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722343129; x=1722947929; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OXzR6gxYVqwUfoPPIjjw4WoNbj2GDAwK/nIZ01IJrvI=;
        b=GH+KgNrUu3X9OtE3gR1wKPJMLRxqHz1m62n2i1MwQsKnHaQCipLG/JQg0EvhQc2vDg
         dvnvXfHzDMun947mvSqt7Zmh1H3eHab5JbVfjieg1Z6SktBF59kUJ+PC6NO+b+M8rijo
         Cx58Zq1RuFZJ8AH/+m5j+cInkO6QxNKZwqpQlpppQGYp/6PwdiNsnqCXgA99V1tT3RDc
         TyxARxYNqO6VzFeTx43E6RGfEVE9aXsqrk908ad/98ySeKemODQJsWv7gW0mrSWJWLH4
         i96WorYK0Rq8NJRurxv310c0BDHXfnyosMlOfCVjpim7uj+Y8T0JknvyyRB3PDbXhcBU
         77ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722343129; x=1722947929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OXzR6gxYVqwUfoPPIjjw4WoNbj2GDAwK/nIZ01IJrvI=;
        b=A3kFSf4RfpNWVqAdmwzJf6+nIsfmk+1wgJWbi1T0FFF942MlCZbUfuyxwYJurL9lsx
         M2AqRFAWb6WA471tv95gQjxEgGUEWXa92i+o1JGIrw/Zm2mgZE+sFd04ONvOryqqiMpq
         Hj46QnOLkxsX98CPRmHbDTdp5P67rcmXqiogTrB3NZc4Bf+lGSGFmXsJrov9nWNEvLX+
         phaeL+EF+9/uLi+RfCMUkgTzbvNDnMVBbwIrkh+elgU9qG2gqBxajqC7v7AZC2hEHBo1
         f2e/iSt0K97I4smq/vOBcKLNOnZ+Il8ap1VHmVIfIoKoMttYL+SVhy2803uqSwz3mOPD
         SVhg==
X-Forwarded-Encrypted: i=1; AJvYcCWKqsz6pE+BG8lp38d5VDh0/UrnpAt2oJhQ9o4kbX/OxjSj85nKQtODZ9Z6VbOyhHfIh1LVycdSTjQr3E7VTDHdrW1hI0pccGAuzjhPjg==
X-Gm-Message-State: AOJu0YxsNuKoxTr2boFx96j22wOaOwAPoLyqgkB8TxbExW6QtLba/ASM
	Lq2iI24002TUYzJw//Zq+85KumZ5bFBttV+++nHlRyZTqDggs42sBgVsmdgI
X-Google-Smtp-Source: AGHT+IGpg4llAy6pM/N8Vx3JTRndVzPaI10cX2cZwlz6kJDnN+2KRVmAKdhoAZ4FK5shGeCXTTduew==
X-Received: by 2002:a17:902:e80d:b0:1fd:a412:5dff with SMTP id d9443c01a7336-1ff048e4db4mr109497115ad.43.1722343128495;
        Tue, 30 Jul 2024 05:38:48 -0700 (PDT)
Received: from localhost.localdomain ([211.171.34.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7ce7e4asm101081865ad.83.2024.07.30.05.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 05:38:48 -0700 (PDT)
From: Kartik Kulkarni <kartik.koolks@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	akari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: ~lkcamp/patches@lists.sr.ht,
	helen.koike@collabora.com,
	kartik.koolks@gmail.com
Subject: [PATCH] staging: atomisp: bnr: fix trailing statement
Date: Tue, 30 Jul 2024 12:38:42 +0000
Message-Id: <20240730123842.37487-1-kartik.koolks@gmail.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch error trailing statements should be on next line in
ia_css_bnr.host.c:48.
---
Newbie to contributing to kernel code
---

Signed-off-by: Kartik Kulkarni <kartik.koolks@gmail.com>
---
 .../atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c      | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c
index 457a004e1..b75cfd309 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c
@@ -45,7 +45,8 @@ ia_css_bnr_dump(
     const struct sh_css_isp_bnr_params *bnr,
     unsigned int level)
 {
-	if (!bnr) return;
+	if (!bnr)
+		return;
 	ia_css_debug_dtrace(level, "Bayer Noise Reduction:\n");
 	ia_css_debug_dtrace(level, "\t%-32s = %d\n",
 			    "bnr_gain_all", bnr->gain_all);
-- 
2.20.1

