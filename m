Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FCD2DF14C
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 16:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769702679; cv=none; b=UDntEJeWDdmiQfCip7rHF1HXeewcYTrjevOCzIOS8fCyRvh02VQORRxMsABZrKxN/Rd3A22nRjUyVzfMbfBjZNRkiaiJBS7QMvcAvz2XMLqHVQ3R7f75jqTPwguYNYDyDwIeKVHUsR7DIRucSoCo2G5fFej8BtJM3XoZtuSR9Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769702679; c=relaxed/simple;
	bh=sU25cQy7XTnbmHtrk/z815qpaWUdmYcJnn9qEEvbQnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bdHFWtbK/VoZLPsqc+zZbz0AmmPrnS/hWqh0pCuq2nD12fgNxZ+vW5jNsdfiHGlwFWY2311Ouw4RhlkLEqOLAqJCFf2tV7FUBT6tLjXSoaOAb/QbbYUSfDbHn+GUZGvZwiQ43qOkw8yCwsW/g2H5FzX20k0nacAsEBz4uBmJEZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yn5sWOjt; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yn5sWOjt"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4801eb2c0a5so11138685e9.3
        for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 08:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769702676; x=1770307476; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=md4zqsrhPtC4Pn78MMJhfjmDzauSiLfeoWDEpx6MXzo=;
        b=Yn5sWOjtxhopHiJf/r0ssjYLg5tEbC2TTjxXzfUZNt5z0tJ83w7UxOxUhMNJUOd6T/
         Nic7Pe+ROFyPZ/jrt57X/mhJ3JfpU5micwNolqnD+zA0Myz9w5HuilWVL58ZbuNowuWj
         8rmUXgoyELlQNM3p7ILArFZGH3kfN/iLATlVDTsd8gnE7tAUnf+MDwYjuDkmuzOF78Ai
         Fht19ZQXeK+aYQnZnBxqkS+KcuyKP0DL491N/Ro3pHUz16mDyQzFuGgIzI1SI9YMVQ5i
         Q4XvI9mgxlHNEuB6jrlZOOif2HkAbZ2L0aR176VZX/4xo6lBnfkeY9J6xY5C2OcBBWMT
         Fxzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769702676; x=1770307476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=md4zqsrhPtC4Pn78MMJhfjmDzauSiLfeoWDEpx6MXzo=;
        b=IIW3SvTlv0wxhJFEK6poROviIPbLvPKsyrdI/hTWWZNmSEhgWSqP7ZCip6DESXnQ7w
         hMkahGdRls8iBt4+aMr63nCmB+2B7cavxYoTwbGaSYaSGcytnX2jQa2XWmnK0DpQr79/
         O9AXVFw16nBs3kgflwDUTuNPj41gQQ0R/lcIojdS0j4s+8RR4kntPQAo6iAkllGx2hsG
         ps03UQUtimTFSI9XHWHLG4+Xc+uUBf/6hap97zTkzUX3ZiUa6oLaEZVUW8s+bnHyUTJN
         ABCOvaV9bP65ZZy/00svzTTfQjEgwIl9COmhREafvQPCpcSFCN7ia0COLi/BWCER4ZOS
         FY2Q==
X-Gm-Message-State: AOJu0YzL0CQB30jZQ0+UtYP5lXs+y6uIsejs7PDBaXe2u8gTCZL5rrHr
	5RTgY8ZA6qD+gK2eIERS7VFbYA8rdCSovkwL7+Hx8BJUDTB2cr8GwHCV
X-Gm-Gg: AZuq6aInsfY9yVcARgF3XNEQ7fVsBJAXShvKznwHJwBeEhGpYewACT8ZrHG8F+UzFvQ
	8/vXp+9e53vh+m4j7fEuMDiQx1xGAcLAZXNTwQuVnyvo8A6IZPeDkBi+coqQhr2Hn7cQpwpQhWo
	H+9Xm1X21qqbiTJ7odUgJHHhkNu4sv7KgY5xgmAaPV5q+NIKMDhgN46OClS1a6QpF+oiOj0qR4z
	llsVEmLxLViQGSdM54Cy7/BpUNY4mZyVo0XPRWj1YxwAbxqvrdTxzgG7+2GnbaFYFcYNLUIaOvb
	KuT7wkwO7xuyxN8+3VjQZvcnWPKT/1oKCovRRDHqmulf16uB3X2lBU8hegYaD7ZrM0kr6cOktzn
	We2EaBD/c02vmup3OvsuOOTLJPGUWF7ZNon81irlUJ2c1Wuiy49/qGhAC8+P0cTfSecf8HWl+Pu
	Tt+vwch+HoktOsllPEEzRRG8/lqpU2/hunLu5KHI8=
X-Received: by 2002:a05:600d:15a:20b0:47e:c562:a41f with SMTP id 5b1f17b1804b1-48069c55790mr94395565e9.18.1769702676350;
        Thu, 29 Jan 2026 08:04:36 -0800 (PST)
Received: from localhost.localdomain ([2400:adc1:447:6d00:1c1a:7818:23f6:aae1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce4c515sm135883175e9.11.2026.01.29.08.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 08:04:36 -0800 (PST)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mahad.ibrahim.dev@gmail.com
Subject: [PATCH v3 2/5] staging: rtl8723bs: fix multiple blank line check
Date: Thu, 29 Jan 2026 21:04:23 +0500
Message-ID: <20260129160426.13737-3-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260129160426.13737-1-mahad.ibrahim.dev@gmail.com>
References: <20260129160426.13737-1-mahad.ibrahim.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl check regarding:
- Please don't use multiple blank lines

Remove multiple blank lines to adhere to kernel coding standards.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c  | 1 -
 drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c
index ab5af96c335f..988636a16112 100644
--- a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c
+++ b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c
@@ -31,7 +31,6 @@ static bool CheckPositive(struct dm_odm_t *pDM_Odm, const u32 Condition1, const
 		pDM_Odm->TypeALNA << 16 |
 		pDM_Odm->TypeAPA << 24;
 
-
 	/*  Value Defined Check =============== */
 	/* QFN Type [15:12] and Cut Version [27:24] need to do value check */
 
diff --git a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
index ac5e3d52b3bc..1fbb71149cc7 100644
--- a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
+++ b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
@@ -31,7 +31,6 @@ static bool CheckPositive(struct dm_odm_t *pDM_Odm, const u32 Condition1, const
 		pDM_Odm->TypeALNA << 16 |
 		pDM_Odm->TypeAPA  << 24;
 
-
 	/*  Value Defined Check =============== */
 	/* QFN Type [15:12] and Cut Version [27:24] need to do value check */
 
-- 
2.47.3

