Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7FF363C58
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 12:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775131713; cv=none; b=FkKhHxRdMzdn1R0f13EFTTG2qr36JKqEnXqqLvrFCONm6fT9xgRfuxDFuYVMQF2jb1twheEVBS4CbxdCT15Z4owxIcSVMusKGMFfXsqA2eje/tYFKPQGuRUHPY2RSxrd8Wr43K/tt5/GUE3wE7x/np6mCW2yHf4KVzm4m21WrJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775131713; c=relaxed/simple;
	bh=SlH+gm31r/k+1kaj9oO1Ub1WtfcNs3nK9sCq4h9tq/w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r9mQ6/MBz1I6MLhEx25Msb79GM5fqxYZjfE/vrWy5EU+NBabj5+kfiiZEkcMw8cLGXS3VYN+rwfaNWQ7otY/3LXUGhxDkQ40SNRmOQbKNGSTYuoI4daT1knWAKEoCQkDvIEqoQzCAKYsEvCyH5lnqQYshR/FY4wTr+1M3B9hSmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sa3n1FVy; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sa3n1FVy"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-65c0891f4e9so1267080a12.1
        for <linux-staging@lists.linux.dev>; Thu, 02 Apr 2026 05:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775131711; x=1775736511; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nMlG/qitsM5fyos+MK5I7B9yHHX0Siz+mL00S24SaCs=;
        b=sa3n1FVyi7tzRpclmEJ97vxtYdtXT02nC5FB3jmmOUTMIkQ015W1A7pELPvD/bbtcx
         zt0Uuu1scLqTSvFx6vn4sEQHfY+krvD9FyMhffowDVsEuK5TWl745gqv+69O3DKNvMLm
         u48S0+H9m9EzLzjWWkeBGu+GFHxkWQugAC5qHYY+pbRdGT+XWj2m/4WqK7L/3M1KGNRi
         JuPcxvQrgqyd3ps03+HnWpicgdQhntyorYfyREsN5NeyDMMD1f8vOVlAymhYO0e7EeB/
         kb5tMgHWpScWeTQ2AcCk5TRbVpxHgdS/QYUnegC6yY/IebW3lS0A7AFG7w1fw9Szy5hs
         CybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775131711; x=1775736511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMlG/qitsM5fyos+MK5I7B9yHHX0Siz+mL00S24SaCs=;
        b=GQmXRjGuL0vd5NJqDDRx6Wh+9bZv+BCtB/IdgPGTkHnGTEX+bh1krDLl1gsrB5b0XV
         aT2CjfYXh8M3nM6bjwL8YUP0tJ5BqMKCmiiB3n28sXredBLS7EkScWUO6dlp/IoeK40L
         hBlQ8haSZnXlNgoclXqPpxY64llBkRJwDtPX9Mlh7MPKGAX3ubsjlritPMFbd1LuOFL5
         99g90bMV0Aqc8LdnDN1zissQGVsiaMtr/HvOafyPNvtzvk4lFVJcO+bW+hBt2M4mB6g5
         l00bA5NVbqstM/iLdQAxe4cbyARNr3ar3uTL/lNWtVVrY793Yo8zv4X8NXW5hOd8rIie
         z4xA==
X-Forwarded-Encrypted: i=1; AJvYcCX2sp67AfggdF1blvKvsxokEKMFMRQ5RHTaS5PRWFRk3TDU72IEbXoj/5Jveu7h65B8ojpsG99E224FArjQ@lists.linux.dev
X-Gm-Message-State: AOJu0YwI7uXxH9shf4aKX7LVhMMpMBOxKoRZjlFL+I5kTvXqN0jRjwKG
	bX7vsWyG/cZ/eoYnSr52znw1lWaLno7fXvAALVHHfFGTtleMQitmZfFd
X-Gm-Gg: ATEYQzwBiFEOzl4UNBIk67/1Jrc9FarGI9UYVvPi6lf8pOYcl3ukwLp722KQxc3+mvg
	gQY0TawfNjcC6vilYi9smzstZYBz965iT7iLxm0yTqlrrqtdiFeLZdcvWKuKgAgxXw92M2iNKUz
	nJYkO70fHU4SE/ZIY/eS5+4cJr4qV1qAc7VF4omykGMHdNv5AWDuw53BljW7mdzU2fuwPAHh9el
	qeNJH1DzaQA70azqSo1aPsAZ8TepIlVPoCb/oAAUbYxr0iVJrsLxuGBzeqx39oN+mSqNj+5zGDa
	7UgtgaESE05WKanykPNdXCiEXtRSsaGIaDRCzrutsVXT3hAQqENRxZL2pmqTRY7h9xKF8imPEq4
	m/nD8n+lkk7W7njikqJEi3Zwr2SK0aCK4aj2XdFUhrofUrLmH5OK80jdzYVg88f2xaLGTXDslep
	06pznPF8/oc3RLLogxIBFEhEzb67L8SMmKR6m4xCztnNAievagc1krgwcMdEkxs26u95IRM5dhV
	yWK/kXyTsxAJqD6j/+YaOLWQWbPzpTvJzkkL8DSruJ2b5A/3mkbY5QJgkAFRAk56DkijuumEcNr
	AH180Ui4AoxaHEAAmbOK7aPBoZP67F8NoZqx1WL+Tg38DXWXEKOYH6UeP//0H3WnYmxt478HpKm
	vHbDmTCfiWHihMzTK
X-Received: by 2002:a05:6402:2111:b0:66d:d119:11bb with SMTP id 4fb4d7f45d1cf-66dd11913b5mr4322079a12.9.1775131710389;
        Thu, 02 Apr 2026 05:08:30 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-a.c.od237066db22328bb-tp.internal (253.119.12.34.bc.googleusercontent.com. [34.12.119.253])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e06479211sm573615a12.0.2026.04.02.05.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 05:08:30 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	grondon@gmail.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH v2] staging: atomisp: fix alignment in function signature
Date: Thu,  2 Apr 2026 12:08:06 +0000
Message-ID: <20260402120807.1266-1-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix alignment checks in function signatures

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_fops.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index c7aef066f2..c51d04af6c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -96,8 +96,8 @@ static int atomisp_buf_init(struct vb2_buffer *vb)
 }
 
 static int atomisp_q_one_metadata_buffer(struct atomisp_sub_device *asd,
-	enum atomisp_input_stream_id stream_id,
-	enum ia_css_pipe_id css_pipe_id)
+					 enum atomisp_input_stream_id stream_id,
+					 enum ia_css_pipe_id css_pipe_id)
 {
 	struct atomisp_metadata_buf *metadata_buf;
 	enum atomisp_metadata_type md_type = ATOMISP_MAIN_METADATA;
-- 
2.47.3

