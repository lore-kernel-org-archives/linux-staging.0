Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA9C3483
	for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 09:10:36 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id x11so14644633ejj.8
        for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 02:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GpbDiJV/Na2P3w3G7ZGi4FHd+w20lWJcijkHVW1cIVo=;
        b=UDMukiA5PiEWaHXiI+7Cum5PgIcR3OkOUzd3du/a01n7lpXoth30fK1+KKiz+g/2E7
         Qp5Tjl6ChFGrgYYPRdjwGcpyl+NcDwCreJ5vGD0aihELz+VuQLBr+3ypBn7oFb0YqISH
         jqeWBIENI1plBHgu/WL18AiMMdHkgztXWy2II3GiZT819bXBTpv/m7HAnPEiZQKZ3ClR
         1Zwtwf7HL6BNno0jfhQhpDlvZJY4+BZdWmNeyRk7FSqwui2TAaNSK3qukJvS5NaJKvy/
         o0S69QaBeoU4KbFOBnqb5p540q8OyZFySPhjC3UbO8BEwZ6MDY1m/y/MGoMRvzCDL7gi
         Ga8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GpbDiJV/Na2P3w3G7ZGi4FHd+w20lWJcijkHVW1cIVo=;
        b=eCp1RqlGF9Shb7lClIhje6i0pVw5cmlNY4xwk2ENn7xoBz/E/dDp0bT/CxqOvPEMmX
         H16cE0TtYiBJgnNm0P5SQHmB1vOPdB8ibPg34UN2KFp31J5p9C7JSW7KsQ9uNCs7O1aj
         b06Cpr5FhcxFhyT5JmYDlmMuok/vUnEBIPdALtRgsJJYuv/k7uIJJhCfbXs6iLdd9HLd
         OEvHaFkwthMg+NC+hV+EOL/dCHrqoK0qpJFS8NHpZwRzGiaWjhCPLuAVsszGephX3HTv
         B0lHnmLqR0P9ChICaGsYS86aR6sO6VjPeT6Lk32Yn/P/6SmU38d0/KCiaHeCeQ7dbwQd
         YT1A==
X-Gm-Message-State: AOAM532h9/kqBOQgWKhmUIP0AFtlKt5TdceersUU3dzeELMfyq4OmeMZ
	E2wSi2l0hhfaIjqIlIb8hEnpZ95z5Dg=
X-Google-Smtp-Source: ABdhPJzbUNmWQdV/pEBoKkHIImqmIIF3ollktxxiNFq7yXeMlZCLQo2WnCkmEkYN4GdaMycWQGQHnA==
X-Received: by 2002:a17:907:160d:: with SMTP id hb13mr1575364ejc.489.1627636234859;
        Fri, 30 Jul 2021 02:10:34 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::4bf9])
        by smtp.gmail.com with ESMTPSA id da23sm417665edb.34.2021.07.30.02.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 02:10:34 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/3] staging: r8188eu: rename parameter of odm_evm_db_to_percentage()
Date: Fri, 30 Jul 2021 11:09:47 +0200
Message-Id: <20210730090948.32759-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210730090948.32759-1-straube.linux@gmail.com>
References: <20210730090948.32759-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename parameter of odm_evm_db_to_percentage() to avoid camel case.
Value -> value

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm_HWConfig.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_HWConfig.c b/drivers/staging/r8188eu/hal/odm_HWConfig.c
index 6afe3f9bc47c..51ae02805149 100644
--- a/drivers/staging/r8188eu/hal/odm_HWConfig.c
+++ b/drivers/staging/r8188eu/hal/odm_HWConfig.c
@@ -77,12 +77,12 @@ static u8 odm_SQ_process_patch_RT_CID_819x_Lenovo(struct odm_dm_struct *dm_odm,
 	return 0;
 }
 
-static u8 odm_evm_db_to_percentage(s8 Value)
+static u8 odm_evm_db_to_percentage(s8 value)
 {
 	/*  -33dB~0dB to 0%~99% */
 	s8 ret_val;
 
-	ret_val = Value;
+	ret_val = value;
 
 	if (ret_val >= 0)
 		ret_val = 0;
-- 
2.32.0

