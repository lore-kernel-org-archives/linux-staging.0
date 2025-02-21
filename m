Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91781F1506
	for <linux-staging@lists.linux.dev>; Fri, 21 Feb 2025 16:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740155700; cv=none; b=BZcwikdRGkxFAkwBx82aFowM+vDYs+mtwO2DbvgTbiqNNWewF6zO7Q5cUlcbjUFCmKPs9SyUUby9pn4g6B1v4mT6F3hBknbEuEs7Whx399br4kGSTRfsqeKx7Vm7lXNRBi9jEHf0Ulhnw1bNiYVEiD89P72KOBoL5RU8pBv/1uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740155700; c=relaxed/simple;
	bh=QfyKjw4MDCgZaOxGfN2uwVxtfrJyJLTRioCkL2n1c34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JBeT9aumpAGehGjSyFwy2HvWCwNsKUbKiwGt6kvJmrnwTteRLa1DoyMJyxGYtwWjmTGsBsW30Kj9tTQOMrHMYqUPGM/fIne7HXOprrMHIiitZSR9B+sv+pLp5sNS2pWhJZacn3FuDGcPSdcM5DUBcOHvxfgN6f/QSO/pPt4v0dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HdDUVO7I; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HdDUVO7I"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-22185cddbffso54389075ad.1
        for <linux-staging@lists.linux.dev>; Fri, 21 Feb 2025 08:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740155698; x=1740760498; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=55B5QwxESijKOi7V8xRhvFTRJ/sEBfufvBcf3pQsyzE=;
        b=HdDUVO7IE6TZjAnvXc5rWIB4LvnMdqviBH8iPpcpR6la2nQzcNQpypHMu2OAFZV4VC
         Ck/oP0+URTT8GrkpUdHpWivx+ujuwcnpA0ix0KocoN+eCUdJ5ZCc1yimXkEwsobxtpS2
         5s9dd20Ii9If14yOzaoUfDdUN1VXse8BaicLaLzoiTUDyvdGMMV/Pxg38uQ1gi0BQDt7
         oK96dZGCSFkdHhbjmhyy/CBvcNiZXkEtb6ZIp2/Ke8btV12Y2SrL0OyslFSBTP4mxXfZ
         LV5r68cKDDLOwC0YoDIGDJI352FFOxiM3XOJLxa32ldawOqogDyD4E2yAJB9gHe/n1HI
         QCug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740155698; x=1740760498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=55B5QwxESijKOi7V8xRhvFTRJ/sEBfufvBcf3pQsyzE=;
        b=hCMxFK6i9CiEvpgk+XAisCZM5tEqsBnoHtdcZypgtzZfc4cimrChDn43memu1LCKro
         gEl3ShheG0Y4lJRcHp/LonTNZ8IEv4aYnzeJ+VwPZVzqSjp2V35sBhWX4oZ8hNUMZPqN
         YkbIXhOce8I/zNSJEjxwFoWvsRYxEtszlHf05NMm+We12qdbDzLy/Lkp/uJ+gO+hjlD0
         eAojOchG105Zge/TgO8Kk8sAIkq4sbbXecTuWDudhUyHqQ0iIyCQKjH3TYgX2O8IL7b5
         efU+nN7xFh/BsUw29jgd0qtNvVdjSOhxpA0vpH+4frAdOnxxQoUYrZgkwDI9VmKPixoR
         2V/w==
X-Gm-Message-State: AOJu0Yy85n3TQ2A1upWr6U/yDNr+2u4z5QD9uLC3jIdcpZUPGnNXaSGk
	CugDkxu+RZgqnLnlVDPENtntHzf6KlWsj+kM3kyIVFfuPNknArjCKWXAxhAqVzk=
X-Gm-Gg: ASbGncv9bJejWTE68rrwHAQ4s1CPNSiU+YJc4ffvdBzVaUmx8dsV1PnJ3l/9tYC1IOt
	wt2tCrMe5pt1QxOifTGUUHCTaj+hmxkCjVRWCYikNONCdKaEqxG41qBz+6aFX9bQZaMzFGKPdn7
	RCpHKJafLWywUG4Cu0A8wAh/fqQhlGx1bkZ3g9bsGDBLVaSzZDTh1ShpT9K0VgDYW7s+T8QelXD
	ijMAVXbCHSqbAt7noZjM6dwvrX12K1v2bpVEeROuFFOsak/FLuTz/cOnYKENKKa/SjF9aihQrRo
	K4cOi+q9k854mmAKKwnp4D4gXhSw4k/JtRVv
X-Google-Smtp-Source: AGHT+IEZeNu92QMCNh9gLmafr7bxvZD2AJeWhv8BdshyKgPltTrzaPvmvoUSi8ZlWUY12jQ5Fff8vg==
X-Received: by 2002:a17:903:2f44:b0:221:1356:10c5 with SMTP id d9443c01a7336-2218c3e37eemr128835685ad.9.1740155698055;
        Fri, 21 Feb 2025 08:34:58 -0800 (PST)
Received: from localhost ([2409:4066:d04:319e:1d76:db25:b6bf:4f52])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-220d545d448sm139343505ad.150.2025.02.21.08.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 08:34:57 -0800 (PST)
From: Ravi Kumar kairi <kumarkairiravi@gmail.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ravi Kumar Kairi <kumarkairiravi@gmail.com>
Subject: [PATCH] staging: most: Remove unused mutex from most_video_dev
Date: Fri, 21 Feb 2025 22:04:25 +0530
Message-ID: <20250221163444.57492-2-kumarkairiravi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221163444.57492-1-kumarkairiravi@gmail.com>
References: <20250221163444.57492-1-kumarkairiravi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ravi Kumar Kairi <kumarkairiravi@gmail.com>

The `lock` field in struct most_video_dev is never used anywhere in
the codebase. Since it serves no purpose, remove it to clean up the
structure.

Signed-off-by: Ravi Kumar Kairi <kumarkairiravi@gmail.com>
---
 drivers/staging/most/video/video.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 2b3cdb1ce1..bd51125698 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -40,8 +40,6 @@ struct most_video_dev {
 	struct video_device *vdev;
 	unsigned int ctrl_input;
 
-	struct mutex lock;
-
 	wait_queue_head_t wait_data;
 };
 
-- 
2.48.1

