Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2012A68
	for <linux-staging@lists.linux.dev>; Mon, 15 Nov 2021 10:56:32 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id z200so13520443wmc.1
        for <linux-staging@lists.linux.dev>; Mon, 15 Nov 2021 02:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dTBXnapqkVFlBYxNariu8PZzYpFF1+dh6PCGaUsL4VA=;
        b=VjkSs0poiWDZzogiZvuAQrpasCXjxw+5vmonR5qwXMBRrDwi5cvlD/8kd0ccuU89Bt
         N1fkPREZ4X67mH3VMzatu8JdTCNPjXTwKoxtLutR6UeQBW+Bfg1PjmyVxqtqzGh4Rwke
         uUC92A33pFJcriJEyF0Y6qpH1rPs+xK3CmqiLy7vTQZOf3yfvlb+c44ETv7qHwfEhgdR
         txaaE5fMY318Vcaprh9x9J75f1GTyoGRCymiHyKNylE5vf1HiagGM3F+YLjbIjtmUdA6
         ipwvBMAJd0AP6yUN083d+zqMDslSWVYf5yMilmhhpq5906JqEGaDw6VtM8ptNdkPipr0
         zLdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dTBXnapqkVFlBYxNariu8PZzYpFF1+dh6PCGaUsL4VA=;
        b=dmlXIycYt8IWxQ5r9ngilGMQcT5hhjCUUqvKL10sGQWOmypcz0md7rwZUy16+auurH
         DQLxP5dvh3gbPOLbv3lY3V07vpSdyhuPvULYHS3I+uc89sEEVbFKQLgpNjbPq2n7iQkT
         SV83yrI5pMUeq2sTZ1wBnd1ku+J+iTfqeUv4+3WWzursnWZPrjA22J6AVtdOWN9jIbtt
         yHgICj1Cw7UrxX9WlSHIiZIoUYVKiVl2I3d7+T/Aq2e+HA0xSMlUWWT2OApK5FDYyhaB
         PtjX3o9jTtR499jKb99eFuKASRRgEctqm0YuTbTNnnHCinizhO4E+9IS1rEHU3nmP9GE
         izcw==
X-Gm-Message-State: AOAM530XhLXxcKaH7hOEh1yfUhDtR/D9WhAEsheedoibt5/CPfIYEtKQ
	Ix5wG/UwY7+oYw1H9jmd8TY=
X-Google-Smtp-Source: ABdhPJy3zxH0wl4CUIcRQoDNkh9NMSy2X6CBC+uheQfkt1MI02valrM+zHKSKmscYwesVq0E81GmJg==
X-Received: by 2002:a1c:1b08:: with SMTP id b8mr56453882wmb.28.1636973790577;
        Mon, 15 Nov 2021 02:56:30 -0800 (PST)
Received: from localhost.localdomain ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id d1sm13516532wrz.92.2021.11.15.02.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 02:56:30 -0800 (PST)
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karolina Drobnik <karolinadrobnik@gmail.com>
Subject: [PATCH v3 6/8] staging: vt6655: Update comment for `rf_write_wake_prog_syn`
Date: Mon, 15 Nov 2021 10:55:47 +0000
Message-Id: <be06c8f0df043598f3280a15397ad66aabefeaf4.1636729147.git.karolinadrobnik@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1636729147.git.karolinadrobnik@gmail.com>
References: <cover.1636729147.git.karolinadrobnik@gmail.com>
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
index 569b430dd9ae..d4c18d9bfc67 100644
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

