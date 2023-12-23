Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FCA8F5B
	for <linux-staging@lists.linux.dev>; Sat, 23 Dec 2023 09:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHuVDQJf"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-35fd0154368so11067935ab.0
        for <linux-staging@lists.linux.dev>; Sat, 23 Dec 2023 01:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703322930; x=1703927730; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EqU4At89cLX9pipG5dJk4yhFSAyDFeGlPgFtPpbBGJM=;
        b=QHuVDQJfUAZSvtziZ1legqulOouIZr6rgNI0fL/mW02fCoOPg6FlfUB4Ya77+9kGiO
         Up04Q8NbajFDnXr4ik/+bhrTAwCNYB9ltp+Niy0qz+5OJa0OgFCcY5OARTwA4oMPMpDk
         p+bZ6dw4lYaZ72JmWaz0IAUtatpWeEE/TQlOwA9Wl9LL14lcNVi7uDobGIAbS2Wurkdt
         60C2Tzf50nf//llsceXr3R5R1+kWswWXOLcQZeIGzQUJf3qQzTTrsPh+0V0pXroxoMdu
         H77qIKbxVlejXWOGkHkaywj+e333rBTvItmbN9bqVmttyFVm4qI8Nf5q1Y35kKdOReTA
         Vo5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703322930; x=1703927730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EqU4At89cLX9pipG5dJk4yhFSAyDFeGlPgFtPpbBGJM=;
        b=w7yhOTNGaBglNE+vl/hibjfS1YmOkNGvnq07Wgw2g6idTE4MB7fgT/6Vg/QmObAKFo
         sPSYkW30ghRF1Lsrg3M2hAABXf8W54u39cugbZa9O758VXdVe327LpKeBGwqCOn/V/Nx
         m7VJ3S8A1IeQGemBX3elClpEJ5aadPIIznBIY/r6pcUFWR0VjEhepgE7LE29HsQF+prV
         /VKYKHGoSuRlCrDMnqi4MY12+Fr5WlM11oLkfYfT1IkNs41+iA2+cgYvTtssWG4tGUlh
         ybeJAwRTFwJaWc+kvai5PVPE7gHm0d6Z0/GDfl//mG7wxl/zXA9lDolmTgQXt4zsOXG7
         1HMw==
X-Gm-Message-State: AOJu0Yx7YOrTWUdRhM+bk1bR8inFyEEqMeT9tQsarlwBKNv6UNXPdaxf
	U3L9mvg/6Kbm9QiKHht+5jE=
X-Google-Smtp-Source: AGHT+IGYqnq6An6iJM9CoXnlhddaGq6k5UXUB0u+ZIzGyEqqwpf89ybQ9Sp/R+KHDStSKxfSMQIumQ==
X-Received: by 2002:a05:6e02:1be5:b0:35d:59a2:1281 with SMTP id y5-20020a056e021be500b0035d59a21281mr3730843ilv.45.1703322930322;
        Sat, 23 Dec 2023 01:15:30 -0800 (PST)
Received: from localhost.localdomain ([2400:1a00:b060:2b26:f462:e3d9:c28:4c99])
        by smtp.gmail.com with ESMTPSA id p6-20020a170902eac600b001d365153d09sm4711179pld.184.2023.12.23.01.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Dec 2023 01:15:29 -0800 (PST)
From: Dipendra Khadka <kdipendra88@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	hpa@redhat.com
Cc: Dipendra Khadka <kdipendra88@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] staging: media/atomisp/pci/runtime/binary/src: Fix spelling mistake in binary.c
Date: Sat, 23 Dec 2023 15:00:21 +0545
Message-Id: <20231223091521.85467-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

codespell reported following spelling mistake
in runtime/binary/src as below:

'''
./runtime/binary/src/binary.c:537: spcification ==> specification
'''
This patch fixes thisspelling mistake.

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
 drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index 0f3729e55e14..130662f8e768 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -534,7 +534,7 @@ ia_css_binary_uninit(void) {
 static int
 binary_grid_deci_factor_log2(int width, int height)
 {
-	/* 3A/Shading decimation factor spcification (at August 2008)
+	/* 3A/Shading decimation factor specification (at August 2008)
 	 * ------------------------------------------------------------------
 	 * [Image Width (BQ)] [Decimation Factor (BQ)] [Resulting grid cells]
 	 * 1280 ?c             32                       40 ?c
-- 
2.39.2 (Apple Git-143)

