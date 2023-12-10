Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67CA28E3
	for <linux-staging@lists.linux.dev>; Sun, 10 Dec 2023 19:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="T9BW1jDq"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d075392ff6so28212885ad.1
        for <linux-staging@lists.linux.dev>; Sun, 10 Dec 2023 11:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1702237032; x=1702841832; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wj8Hd4lGCgripGvVsJUh/sN5wUyBalDJjlWk5HNgirc=;
        b=T9BW1jDqgWugLwqPeEmDFelybAggfZzLbDL5er1B6D1uUuxY8jPUBQPX1BTVBBn5+G
         Z49SqFtA0a5zi/PhmWMX/Q97onMy0u3sm2mt2fXYHHK22xwchIGo+dI/TihnLQkrWirU
         Csy/tLReLItmK4f72JFxdBZ9CyMzbDuhAoVKaxper1/eEpqf33pJPHLuuZpJkSKwtt1S
         +9QQCDYUm5aJ/U9qyRjFx6B14PAQHY1wwnXjD8/ToMwuz1bphrTmKrBNoVgO+s0ZJMnf
         rQh5GbVZ4pO6Hqkr40+Pjg3oAVUgiPwlc1nME+20yHwvCFavbdomO6T/svbke3d5ukOw
         e7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702237032; x=1702841832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wj8Hd4lGCgripGvVsJUh/sN5wUyBalDJjlWk5HNgirc=;
        b=GAgHFLxJabOsSovUVqdw5eIi3562B7Ixqaezvc3Sr5+DGfa11uy6ke3L8DFA4uqIlS
         PCBb6VbA2pws4stu1akG2YUIeAzo5jdESteLpYBMpqGPtQ7fro/3QZ7dVSiAQo3m3sLL
         sa9LUt9uS/50P5JkYMo3BGCHgbebElSzvP12oQLPGa26CB+inehZPJYpXIcDKJfb1Z64
         7jzaR/mSzXfII5/yU2h+U78ODgGkMTqkPaJDZt12kd6DOoDFYZ5bqz1zDS/2mz1vl4eH
         /hw1Af8CspN+5zbcQLhRV5s+csj9iTnXS7uct+D4Pyv4iipTRJkbO0JjEt4gc5DQsQty
         J5iQ==
X-Gm-Message-State: AOJu0Yw3Jl+8A//kJqs5fq2dDMwv1zKJ7Ncb7+lCXxJL+sC6iGnq+U8R
	oRKyNdiE4fsVoDZ2eL2MbAshAQ==
X-Google-Smtp-Source: AGHT+IEOmedNGJhoLZQdFfmyi211smkBgEiDDRbyF2scO0icDkWVNTqrFlrBkNxibm2I3D1d91Yw1g==
X-Received: by 2002:a17:902:d490:b0:1d1:d30a:17ba with SMTP id c16-20020a170902d49000b001d1d30a17bamr4370107plg.36.1702237032255;
        Sun, 10 Dec 2023 11:37:12 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id k9-20020a170902c40900b001b9e9edbf43sm5117419plk.171.2023.12.10.11.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 11:37:11 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 3/4] Staging: rtl8192e: Remove variable bEncrypt
Date: Sun, 10 Dec 2023 11:37:04 -0800
Message-Id: <20231210193705.2131807-4-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231210193705.2131807-1-tdavies@darkphysics.net>
References: <20231210193705.2131807-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove variable bEncrypt as it is defined but never used.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index fb399acb7157..224774b1ba31 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -103,7 +103,6 @@ struct cb_desc {
 	/* Tx Desc Related flags (8-9) */
 	u8 bLastIniPkt:1;
 	u8 bCmdOrInit:1;
-	u8 bEncrypt:1;
 	u8 tx_dis_rate_fallback:1;
 	u8 tx_use_drv_assinged_rate:1;
 	u8 bHwSec:1;
-- 
2.39.2

