Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6074207DF4
	for <linux-staging@lists.linux.dev>; Tue,  4 Feb 2025 13:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738677121; cv=none; b=c2Ij8soItPZ9h9DO/5UsDUeGKOxOAcNixMRdYs4Bz2rdPXrXcerubHNcT9o6Exj2RPD783EaImrNYB/rvODTojIrtefIVzeqQC71acOQfBU5wv5TS4SlwTIt+vo0G1Y/3RR5VNzxaYyut+nsyW6sD+ZEmtyfm8LTi4mnXLsOqik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738677121; c=relaxed/simple;
	bh=2TGSwxCXJQpa+8oxNj+WypV0kbSHnlTvS7h6o+3uRpA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=teKrEiqPupBRWxGfIRHJlUnR+EMkV2HPcAgOgnK3fU03o29cSQZY8ETxZnc49q65MEwsdHiI29P10R4bI3mGYg5pAxuZb3SoZhwV2LR/acUdG6AZSCNDLssAB56ma8mVi3aK1TMdBQHvviNJb/Qsmhkk04/tUg70bs8XFiZaD8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WrhzzP8O; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WrhzzP8O"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2f9cd9601b8so682441a91.3
        for <linux-staging@lists.linux.dev>; Tue, 04 Feb 2025 05:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738677119; x=1739281919; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7PfMkDBo1AVubmWzaMJLsWewtHoQf9eOswkoTA+L0S4=;
        b=WrhzzP8OeAb6nnk33m9Sgc/46EyiI1EAYw+vMcqRYkzXTHXZx8dZTuO69TP6YIWdrc
         XIiddRlqaOGhQucTvUtvI1iB5jiYqkU5CtjJNOm9odireoX/Hf21lfaWR3jWWd7/jOtQ
         Lp8e6blIcAWni4lFdQd6VB3rf/MW7eA6c4CepKVxlDY1KzPhSvoq88l8rHgG1iwnUB6/
         DulWYISK58geMH2ZbvYiCncbTpD56bzTuyWwRndAXgeBLTa5W0iAHc7TN5sPNaI6y8ik
         WaUmFM2ebJ/olHzJrS9dqDu99FYMm9Et5Cm6FaZOJVG+uBz6trKxqKO9TMQ+DDOW9Aht
         jxXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738677119; x=1739281919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7PfMkDBo1AVubmWzaMJLsWewtHoQf9eOswkoTA+L0S4=;
        b=o4Sqgjjsrl2F5tREcF83SiX4gnsbgYLHku1veTFhrbPnorc1lfK4Mvb8+1H7yvYaJN
         eDS1w4Dt8kCWyRpBuG8MijQD6pxSAjglJ6aG24CikDgRaz6TjPGEmAK1JTOuCVWVU5Vj
         lWiv824tpZc7VRalblnEplqXsrct5WzVKp1Ik7TTuIpm2qkaP/uKUlW3WCW5a7gY0hlU
         +H27YffDbr+F0AcqLxJpOs9NRELim4A0b5v7yXkBbJhKoZq5rXZYDU904ETHlIn2fbFy
         CiLkTJhLZDB2cIsh39xztLyvQlO5Ct3ZD7RWy4NokEVt3yDQYZAP7tIge2zy5yFeoZL3
         FryQ==
X-Gm-Message-State: AOJu0Yz461S5SoAfxAo7O8ziqV/9HHwsfW2BdtTDtC7iVb4bgGbH+6yq
	t+YEDkyHT0tyvu1R+JRUzieOqe+/OPeEdTiAJyNvtFlwlzzBFyBM
X-Gm-Gg: ASbGncsczqp5lDZ3h+eMiilNiz+8gpk9imGSqwnOudwXqD0g+0H8eEtxOqxlgaNV9gO
	XG4Nrt8AbGrgIcQ6W6nlpHlLc8gp2xVQD/qjtPdB2DO2UEyJZBfHQU4l1+KngMEZSyIZ4bMkpIV
	lIfx8qdQ+8n704x6eM+E7NyyZmgKB+4t1CZ5REfbBW4+Yk2uy5FTiejMT3xwCx4TgUakbQb1k59
	zv1ONfTw+7M8TevUsf4XTUorOeYxz8Xiaibf/mOyxYQgN0JkZiClgduB4B60QaDDVZkYeXMzw6g
	ouQdGtDe0nIVR1xJndGU
X-Google-Smtp-Source: AGHT+IHfDN4MHh/878HCRBwbQuewHXGGJtk7D2x6oQrMqapYfXQYwmMXiSNvfpENyyshkbNSmlZjog==
X-Received: by 2002:a17:90a:39cf:b0:2f9:cf97:56a6 with SMTP id 98e67ed59e1d1-2f9cf9759f5mr1630872a91.14.1738677118000;
        Tue, 04 Feb 2025 05:51:58 -0800 (PST)
Received: from virtualbox.. ([103.16.71.112])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f848a99a50sm11167191a91.39.2025.02.04.05.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 05:51:57 -0800 (PST)
From: Ajith P V <ajithpv.linux@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ajith P V <ajithpv.linux@gmail.com>
Subject: [PATCH] staging: gpib: Resolve prefixing 0x with decimal
Date: Tue,  4 Feb 2025 19:21:31 +0530
Message-ID: <20250204135131.3094-1-ajithpv.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- pr_info() of hp_82341_attach() in hp_82341 uses 0x%u which is defective.
- The iobase is of u32 and correct prefix is 0x%x.
- This error reported by checkpatch with below message:
  ERROR: Prefixing 0x with decimal output is defective.

Signed-off-by: Ajith P V <ajithpv.linux@gmail.com>
---
 drivers/staging/gpib/hp_82341/hp_82341.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/hp_82341/hp_82341.c b/drivers/staging/gpib/hp_82341/hp_82341.c
index 800f99c05566..740c450914dc 100644
--- a/drivers/staging/gpib/hp_82341/hp_82341.c
+++ b/drivers/staging/gpib/hp_82341/hp_82341.c
@@ -723,7 +723,7 @@ static int hp_82341_attach(gpib_board_t *board, const gpib_board_config_t *confi
 		hp_priv->hw_version = HW_VERSION_82341C;
 		hp_priv->io_region_offset = 0x400;
 	}
-	pr_info("hp_82341: base io 0x%u\n", iobase);
+	pr_info("hp_82341: base io 0x%x\n", iobase);
 	for (i = 0; i < hp_82341_num_io_regions; ++i) {
 		start_addr = iobase + i * hp_priv->io_region_offset;
 		if (!request_region(start_addr, hp_82341_region_iosize, "hp_82341")) {
-- 
2.43.0

