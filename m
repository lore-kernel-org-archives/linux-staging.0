Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6D168
	for <linux-staging@lists.linux.dev>; Mon,  1 Nov 2021 14:32:30 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id j128-20020a1c2386000000b003301a98dd62so8937449wmj.5
        for <linux-staging@lists.linux.dev>; Mon, 01 Nov 2021 07:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lnE5IjZuGwXG6XS2XQreum/NO857Wg9hdT9kIZgNu3Y=;
        b=VEo78Gzyp2Np+8mDr3CsmDH++MVYntUnn4LV28IFTPKlzNiiZllZ+wDg9XHrqqAuJA
         /op9GHfE57btllrGf7tiBPiBU6XKmdyeqIhSWZAUP9f/FATZglqItBzp/ntKoqUmTQth
         84QLfPNb22YJMAqT798/kro6b87uXFPpZYfXs5P2YFvQgVjtIamK3tr3NpKBJNqWKUEt
         lP7xKa5WWwTFTJBEwYck00ueIXiZ138WBbN+GKZYU9ohHoMYv/GVzoQZZDe+ACy+WQyd
         dqgJXzIi9i6tL8HdYnilYjNpmuMSsWw0e6TM/9ogiZJmj+RqzuoWr7i3s1vTCOOUQ86d
         3KDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lnE5IjZuGwXG6XS2XQreum/NO857Wg9hdT9kIZgNu3Y=;
        b=UxERGBq8hS5p7YomO2M38CxsUgA0ePCTMgOiLkgynW2KX+tQYa4YVK7AU5hz6hmxw0
         TO1oaS8LtIs0oKEeBdRYYur5lUduQgy/QOXeTpm0o7rSHIN4FqoSHC6Iefn6By34oYxm
         EcLh6pGY6dOQPWljh24w4BEKY55d4Mb/ylcC8ovePkebdWoX9NmTqhQhiNnae+2sdtTb
         r8wfl7HcmY7QT5baK7zCXAf5JXgfxHDf3pPaJpEk0Ctw/2Fh9I03kwor0MCtzjy7VYKh
         Efq3oTGWXhCZsBg8a7ZqpQWEjIuTTkKQAJK2QP1Z9GRoK1GjOEEie6R9ORr+r8FFk30U
         dF/Q==
X-Gm-Message-State: AOAM5324y2qUVohLvDFtzwp/AYHnBUMB/Ak+3DdAdhb4getNDUk7BRnj
	rd3K09QEw8H6nuNi3HQPXKM=
X-Google-Smtp-Source: ABdhPJx/BIoKnyTQf6FH4n3jxaE+EuB0itaVTCIcxP6Tl+EpSS1fdZM3nA6QTWS6IqZed+WQs3Zi5g==
X-Received: by 2002:a1c:f405:: with SMTP id z5mr31420070wma.72.1635777148515;
        Mon, 01 Nov 2021 07:32:28 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id l8sm17157721wry.43.2021.11.01.07.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 07:32:28 -0700 (PDT)
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karolina Drobnik <karolinadrobnik@gmail.com>
Subject: [PATCH v2 6/8] staging: vt6655: Update comment for `rf_write_wake_prog_syn`
Date: Mon,  1 Nov 2021 14:32:04 +0000
Message-Id: <bac06d44359d3634ad66b7ab46128366bb985426.1635773681.git.karolinadrobnik@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1635773679.git.karolinadrobnik@gmail.com>
References: <cover.1635773679.git.karolinadrobnik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the function description to include the actual parameters.
Update the comment on the return type.

Signed-off-by: Karolina Drobnik <karolinadrobnik@gmail.com>
---
 drivers/staging/vt6655/rf.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
index 34fa54f7a92d..1fe073c5fb6f 100644
--- a/drivers/staging/vt6655/rf.c
+++ b/drivers/staging/vt6655/rf.c
@@ -669,11 +669,11 @@ bool RFbSelectChannel(struct vnt_private *priv, unsigned char byRFType,
  *
  * Parameters:
  *  In:
- *      iobase      - I/O base address
- *      channel     - channel number
- *      bySleepCnt  - SleepProgSyn count
+ *      priv        - Device Structure
+ *      rf_type     - RF type
+ *      channel     - Channel number
  *
- * Return Value: None.
+ * Return Value: true if succeeded; false if failed.
  *
  */
 bool rf_write_wake_prog_syn(struct vnt_private *priv, unsigned char rf_type,
-- 
2.30.2

