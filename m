Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BEE226174
	for <linux-staging@lists.linux.dev>; Thu,  6 Feb 2025 09:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738834112; cv=none; b=cFK3anZlz7YhOpwmPwDkVkTeRkwWw4RcExGMjuNwYZPsHy05wIf3NC+ns2gZtlZfSyaZyOH3t7oIdT7XU9abVwya61UR9JJjnYG0ciZMzp0EjNSajMAYbycCOG1ymr3J/CyqCIGRJeDEXkmLRIP2geCtWKrYSlYXgN/Ysoc/riA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738834112; c=relaxed/simple;
	bh=OF971a4q8HwnxSC0ySetrRs3ZIDkHcOF0xo4y73zDds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ldTT4MuhQ95FfDu3cKQLbgEik0Po4HrvxY8SZyyDQsewNcfcuKSBe0WYailLXtFfpcs5Kn0ESY6ctcbIBridD8bpUixl+VEn1MpWMs8nMLRlnfSYThUvx5cOJn5nckwVdHUgMDm347miEcm85tLdCzKFX/rt1c5tBYTyCnyjYWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IoMS44yH; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IoMS44yH"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2fa0892f9bdso581036a91.2
        for <linux-staging@lists.linux.dev>; Thu, 06 Feb 2025 01:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738834110; x=1739438910; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2byJgRGWBVViDhx8IapV9YTVY9KGkswpq6ruK43H46Y=;
        b=IoMS44yHVkU3tA3I4kI/gPdlNH/L6DBMpFIX9VoIIO5/Av44sf9w+/dYc2QMLFpxsR
         lE+DAmrQgkNFDl7wr2dDTWayf1EJS+vs7JyMCpXhFB1zu5Oo3fveTGRPv5Auq1lrYOVR
         Wp2o9AEehVvku2B24EaltCmFbUxMNyzvP5fsaKjN2hBbCAhOEfPeHc68W0MZYq0JjWJV
         kO3Ws9+prVJlzkw/unLVDogF47ubFsE6iLSprVDQ/lmk1bZLVmRu7lCD3NaRaptPhTId
         KFV0vsur9GhmbBmF97VMRQedi0c/CJ2m14DNnr7RjTUDhhPRBhCZcwKU9ZnHQAse7c3H
         SPow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738834110; x=1739438910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2byJgRGWBVViDhx8IapV9YTVY9KGkswpq6ruK43H46Y=;
        b=ju+IGATP6E2RV+DL6XOxESIhVrHui31CX5ILLgFYSx1VbXFv5pP9ZcdZHC84ciEOby
         d3Z6UGKLjk/fxpVQykAVxE6/peeKGRN26rcrD2VHjSqtCTSCwP6aU0L63dp6ZXtswnbQ
         dCY3bZsof1jkM+MPS4erowbCyJZD9f04BlrMqTFfy64k2Hpm3Bmvx7Iwue6sqFzZKRhR
         LLKwEfB46FPsNXIM+eY7Wh8VVr9EaJW/7bjbthT6YnGpFwKQLkib+6Z7JkpT8IRqb5Ro
         9EUpx+ILI8eCXb6u2Eo4E3m3fQLTBP2fKtIYt0I0+iMS4o+X4r5TmFPTBYHjEaRlzWi9
         SmuA==
X-Gm-Message-State: AOJu0Yz0/zS3yF1ihp2slb3EICdZdMSTmHKnKOI95dgcNpf0vToi1t2m
	96TMqa0UmNT0aqm64q3csqCi/tMhInbM31Juw8qdzSXqfwDup9AQhi6dO1ND
X-Gm-Gg: ASbGncsLM77VXHRngA/1RLMOi/Mc2uIfxZuXKkON9q6hefficpMZVGfLMMdwDmcTQO6
	AfoYqRiEuAjeFGspBauPLzrrEPju6oPenDAJnysPWAGZIiqA7vZeqDwMyDGNqZQybSzbLz+NAvS
	ZAQJ+cETccXawN9JOpwGVW2a6cNfedRwwT+Bv05nMDuMuYa6OPAyuqMshfY++Nxed+fv4bgzyYj
	cUy8sOxtGRl0q0oNz4ksThl9jHNqxlVP6+IrUBrwzW9aUwsT0AXnYq2w4ostPXwgDugjglQ0PPW
	mXPbLk2ZsNl89V5AagB5
X-Google-Smtp-Source: AGHT+IE8bXyGkF6GFPLQ+AZx6Ht9QYvHf0fJunNuAvLpU60xJLuQbXCvhab2bPj1k2yIL4ip47V19g==
X-Received: by 2002:a05:6a00:3908:b0:729:c7b:9385 with SMTP id d2e1a72fcca58-73035103911mr8408512b3a.6.1738834110271;
        Thu, 06 Feb 2025 01:28:30 -0800 (PST)
Received: from virtualbox.. ([103.16.71.115])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048a9d195sm884979b3a.18.2025.02.06.01.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 01:28:30 -0800 (PST)
From: Ajith P V <ajithpv.linux@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ajith P V <ajithpv.linux@gmail.com>
Subject: [PATCH] staging: gpib: Resolve prefixing 0x with decimal
Date: Thu,  6 Feb 2025 14:58:15 +0530
Message-ID: <20250206092815.3267-1-ajithpv.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- pr_err() of hp82335_attach() in hp82335 uses 0x%u which is defective.
- The iobase is of u32 and correct prefix is 0x%x.
- This error reported by checkpatch with below message:
  ERROR: Prefixing 0x with decimal output is defective

Signed-off-by: Ajith P V <ajithpv.linux@gmail.com>
---
 drivers/staging/gpib/hp_82335/hp82335.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/hp_82335/hp82335.c b/drivers/staging/gpib/hp_82335/hp82335.c
index 451d5dc6d340..6ce79b17a419 100644
--- a/drivers/staging/gpib/hp_82335/hp82335.c
+++ b/drivers/staging/gpib/hp_82335/hp82335.c
@@ -274,7 +274,7 @@ static int hp82335_attach(gpib_board_t *board, const gpib_board_config_t *config
 	case 0xfc000:
 		break;
 	default:
-		pr_err("hp82335: invalid base io address 0x%u\n", config->ibbase);
+		pr_err("hp82335: invalid base io address 0x%x\n", config->ibbase);
 		return -EINVAL;
 	}
 	if (!request_mem_region(upper_iomem_base, hp82335_upper_iomem_size, "hp82335")) {
-- 
2.43.0

