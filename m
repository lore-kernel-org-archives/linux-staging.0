Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABBB3B38AF
	for <linux-staging@lists.linux.dev>; Tue,  7 Jul 2026 07:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783409782; cv=none; b=lr8bvkIcP7SKLpdUldwNeBQxB3xMDaBY/1AM98AmmbL7QKiSciBhKQ//DlCZC9ul9hRVKf+0ms5k0KPl9WWkyVnkb0B+sPK5O7cdevmO9Gb6hPJhUsLYDzsy5f0h+kBOJt4ydnjItZJna0Ba3HrhhkPBefKnXCRy+FtxVFYGsWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783409782; c=relaxed/simple;
	bh=DSEChP9kAsmk2HrXfSdbcWaNkWfX3idepBBcxxyGuF8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Un+6DXTbE4i9Jyovz7xl1rwzV4GKQENBD3+BCH6Ja1EgSM0de0jBckSd9qNmZhoXYujyATsYnk2KEABecLKQSMxR8OBFTcq6VcPyac9usTn60wJ46BmU8enGuP9HE/A1T+InT58F7w7/pmqCR3xWrIfFFMF7yxkQnlnCI2dHmm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KHWHP9SA; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KHWHP9SA"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-69532288224so6890659a12.0
        for <linux-staging@lists.linux.dev>; Tue, 07 Jul 2026 00:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783409778; x=1784014578; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K6AeqTPAcZ4JrA+Qd1cNlOBTaQ+fwvnS/cXYGctMis0=;
        b=KHWHP9SAb0rnZf43ULhZ0JCaLiuAxypuPGoxm1k9JF/HM+oNxC/gd1FXHdsKjI4Dnf
         22I2VSKNm6URJjNq85/sssQNwaxKQzurmaFp8LlUfqYrkl4d8puGE4eVGaOQbKbnKIEP
         bPP6zfnzwkyNWeiMYu+Fdr6TqDEUD828sYmYM+VVy7XiagHhr9a9Issf8EHmaUCqEyHl
         Jw8Tk+lPWAekSbucJ0KTiBTDp5yweCockiuCSfeUueqIluW0uXraSLzfU5ezTPfDZNth
         SFDe6rjR2vvHNnIrOrVw1Rss9agiXHfeLyqnut1U96owO2lgf1z4umc6Pq8dCsDPJ4Qh
         theg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783409778; x=1784014578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6AeqTPAcZ4JrA+Qd1cNlOBTaQ+fwvnS/cXYGctMis0=;
        b=hsx/u3HKxNeb1ylt+w3yzOXIdItMMJZm0S0W1hLKdwggJ7/c0ZVqGGTjrMrQxb+C77
         Ry4i+8Ti+EX9zHZPSRcCISqMR0eP/Qm8VtLyBTr9mUXVgsQkKsOTAsUT4TXkHClBA2bF
         ZslqOH5SqoS5G0bxQOvq3ODNhkSN1W858S0JnK3xaCdntQLXJHxpdFwKl2CXQc8akhSZ
         f5gYTTEfiHX7gP/xi/6Ux7SO5F6w6prqF39bqlaxQh4GgQSse8C1hBsgiq+5riYbDoxw
         rKKJdFYOSEfvH3khXl39f3ky9lv2zv1cYpWZjcTHmtk82Y2xpLixMY2WAKGriseG6F8W
         93Mg==
X-Forwarded-Encrypted: i=1; AHgh+RoDpqfjlZN5B6PevB1szbHMnH7ngMulVCMRcxFd+rFsUoCCc9PBAYD/uQx7iqO3U8GIry1YoKEtqKuSuOsw@lists.linux.dev
X-Gm-Message-State: AOJu0YxUKCKW9TUrA41gJUJDIK7vJuLhqcP6Y5sepNTMsle/MVQHN2fz
	eM5EPajm/SXGQlWmy/42Asmi8e2eQWGPMDk39hM5+57hEmeWEBtgLgmI
X-Gm-Gg: AfdE7cmMeSkBo9Dm9SgnNwpQlPU6Rb7g6qViSPH2fVbCus79zjvKP232GtXPmrvdrJU
	7EFVExMtydMcNrKwZXdF/kZS7cdT6oUbIprvYDP/Mz+YrnCbElEyr/kNc2AqSTzQi5fqdHNq8Nc
	s/xCAk53vDpbwUHULaYdDqr9qxYmi6c6DcyOd2QfeYh6twlgVkGWOcTM3oxLzRpfvnaOmyB6hsA
	cX8f+riLbY48V92H4cazA21P/kZB4cT4KrESiBtqxiq6p7mZc1IlJHKWFNJpFeN+qCCw7/pmGNw
	V96zUmjUW8yUOK8dDqd4u48EFuJFro2DZe84/pkkJeAUP0PLTkBcmEJUqxtE5YzpuOXpBPd7ja9
	4ClfCxw7KvSi8h8Vry5qeJ62YcPLLOlZcTrKtlEDW3OkwKD9DcMQptyKF/2aoySIgloK5XD5PQz
	ho1cOs2wfrxWWMGuJ/
X-Received: by 2002:a05:6402:5406:b0:699:6d24:e298 with SMTP id 4fb4d7f45d1cf-69a8564e926mr2104511a12.8.1783409778033;
        Tue, 07 Jul 2026 00:36:18 -0700 (PDT)
Received: from fedora ([156.203.68.153])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4588sm5515780a12.7.2026.07.07.00.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:36:17 -0700 (PDT)
From: Ziad Ali <zalshemy9@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Ziad Ali <zalshemy9@gmail.com>
Subject: [PATCH] staging: atomisp: fix typo in atomisp_tables.h
Date: Tue,  7 Jul 2026 10:36:04 +0300
Message-ID: <20260707073604.11463-1-zalshemy9@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ziad Ali <zalshemy9@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_tables.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_tables.h b/drivers/staging/media/atomisp/pci/atomisp_tables.h
index 33e6079aa..59730ce32 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_tables.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_tables.h
@@ -93,7 +93,7 @@ static struct ia_css_macc_table skin_high_macc_table = {
 	}
 };
 
-/*Blue enhencement image effect table*/
+/*Blue enhancement image effect table*/
 static struct ia_css_macc_table blue_macc_table = {
 	.data = {
 		9728, -3072, 0, 8192,
@@ -115,7 +115,7 @@ static struct ia_css_macc_table blue_macc_table = {
 	}
 };
 
-/*Green enhencement image effect table*/
+/*Green enhancement image effect table*/
 static struct ia_css_macc_table green_macc_table = {
 	.data = {
 		8192, 0, 0, 8192,
-- 
2.55.0

