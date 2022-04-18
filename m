Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF799A29;
	Mon, 18 Apr 2022 18:10:10 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id d15so12954769pll.10;
        Mon, 18 Apr 2022 11:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uMrcwYlsopVDqMWUTs3qkmmFIb/yivyw+8YXRb2YVA0=;
        b=bXiQ6T1FgzxyPdZKJtm0Tm1b6DC5PC0FjlGDaX043FwoLMk1zsc04G6GITsPVVyNH0
         9wdjzK3P6xbnqSYDNnVTzdvu5YKrFdL7L9/1ei1zvawLgVctKiA6Ojwp5Gwsky9nZY1B
         GWXa28WnNn1RUNB4BofS3LtBSdtONh5Mz0qKIXwG4Aexb9Do+XXptyXX4JGG9rxuokdx
         V/VwF1O9Jl0AQqLCoR2FlMOQLDr/bAcx/Qf75m2GLV1zbTUpdjtaYiN9CyBOAvyspnGo
         mIb1HZ/oh1D4DVwl64zVwmEnSnl88paSlDTe9weE7KxR6MZSMU9Q6ENo0uJqTztO2RGk
         j5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uMrcwYlsopVDqMWUTs3qkmmFIb/yivyw+8YXRb2YVA0=;
        b=40dotn5vwX9wKOxrllgUlWeGzgxvmH1CUJZ/5J8BKGALboqUDTs9M5fca76spr+sox
         2UeZJgCkuSx9j5UmZmeVBMj/tnnfbGCxZQzVUzW+MXE3nZCub0INLv8S4ObaVPVY/DvF
         D2viFneJ1U+GoavktRM6m637oQR8I/OxVnxzCPPL9eHhtJsHMb8cl9hcbM5Zjc+CAfY4
         piG9/3F3Y27OQD0tw23Yq/h8+BFuToRLGbRMof0H0aOq2g9qy2g0tdx7Jyr8ZxLQwWQo
         7y4kzid0jMjSybAbOqSiN4uSSq/q93MVLIDRcoggCAIM0+8UQ/S1H0djyEf7tvXhvQpo
         Ujng==
X-Gm-Message-State: AOAM533/jfnOlyuvPWYP6B7PxgC2k+Hkcxo9MRZtVLjpBeif2IO+pE9o
	+11gvFToAkZq4j3pfrebvlQ=
X-Google-Smtp-Source: ABdhPJwcnn/UGh09oo4BTd8LWL5E9cjB11+kD7eHuSt0qMNAnLH37OC9uK12Fxk3xukJIjTAu12ixw==
X-Received: by 2002:a17:902:7c17:b0:158:f6ef:497e with SMTP id x23-20020a1709027c1700b00158f6ef497emr8092615pll.134.1650305410270;
        Mon, 18 Apr 2022 11:10:10 -0700 (PDT)
Received: from aliyar-HP-Laptop-15-da1xxx.domain.name ([14.139.241.88])
        by smtp.gmail.com with ESMTPSA id b10-20020a056a00114a00b004f784ba5e6asm14416578pfm.17.2022.04.18.11.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 11:10:09 -0700 (PDT)
From: Aliya Rahmani <aliyarahmani786@gmail.com>
To: mchehab@kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aliya Rahmani <aliyarahmani786@gmail.com>
Subject: [PATCH] staging: media: av7110: comparison to NULL could be written "fe_func"
Date: Mon, 18 Apr 2022 23:39:00 +0530
Message-Id: <20220418180859.18488-1-aliyarahmani786@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed coding style for null comparisons to be more
consistent with the rest of the kernel coding style.

Signed-off-by: Aliya Rahmani <aliyarahmani786@gmail.com>
---
 drivers/staging/media/av7110/av7110.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index d74ee0ecfb36..bdc6adf70d72 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -107,7 +107,7 @@ static int av7110_num;
 
 #define FE_FUNC_OVERRIDE(fe_func, av7110_copy, av7110_func) \
 {\
-	if (fe_func != NULL) { \
+	if (fe_func) { \
 		av7110_copy = fe_func; \
 		fe_func = av7110_func; \
 	} \
-- 
2.25.1

