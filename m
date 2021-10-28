Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6342C81
	for <linux-staging@lists.linux.dev>; Thu, 28 Oct 2021 10:36:02 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id b194-20020a1c1bcb000000b0032cd7b47853so3496967wmb.5
        for <linux-staging@lists.linux.dev>; Thu, 28 Oct 2021 03:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=57jrsqHmJG3XduSsdkS6puAAy8HJeI7z6m7TmMyYW+g=;
        b=aWiCs+Xn1Hutl4fQQCHwuZkWzIv5Vr9egCcMdniw98K87gxzW27JDelUGRSAxn0Mbh
         s2IAq0xKqJxKEGUJ/f+4mbCInjyFi7ps33WI+IscYACNqsf4s/GytYgHHOpeZUFOhzXp
         8+t5GalbQe3AAEjzvx/qVd8KyJEc68Qi2drTRic6IIc5C+kDU+PgAtoXoUcm838xVL1y
         HNEADG+5mT2xL4ZBDfMddoOwANUxcpXj+Qxk0IcwIMO4SCFSfoWSUp+Cie+rO9ivjqaP
         t+3tUPCZxZhugfNa3P/rQqyKT2wrRKh1/1e7ya03oIGAdM8l2zdXay949h7iPhLF7tET
         R2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=57jrsqHmJG3XduSsdkS6puAAy8HJeI7z6m7TmMyYW+g=;
        b=gjjLl/6x6xVEbNNbRr0+9+OBbMvnUEoYAbXm9RCZRHOdlSAvo5A7EmbVWgz2A7pQzY
         u9SF6WF2nCTM9roIKFnlPESbFXcLv3VUHqI4hlqi0tsLWWnl4q6x/iXwMxJaU6jVWrvl
         OHbzVT1fWrgA/L50+vPReJbTesv9YVvaQEDQpXgVV6FHr7Oa2H5ma8/Sx+sKvJfCI9oe
         XkxCuK14P1HnI5BYak6GH8w03GrcvNg0iwisUK3I43qbHrsCkUM0/wClUOjPEItp/xV+
         f4adKK+z+dYgmtCbBVBaJNUWXRef5CxvAY1DeAv8buC2zbeA7AHt0Ccfjt+LzRY+30DL
         F1IA==
X-Gm-Message-State: AOAM530Dc/mUXD2vZqfRA3/1+dtwWOLFjzP/7qfqdYe8vDxy1r3cpMY3
	Osdqa6tn8qOLqdmAZeeJk9M=
X-Google-Smtp-Source: ABdhPJwbmE95qXKO/Q6XxnsnmOmHOKh171FNsn+WKyRCAfn3dcwM+zmk+ZFI2qAvtzaolXdeVoXMSw==
X-Received: by 2002:a1c:750b:: with SMTP id o11mr3543917wmc.5.1635417361472;
        Thu, 28 Oct 2021 03:36:01 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id 13sm3768083wrz.38.2021.10.28.03.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 03:36:01 -0700 (PDT)
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karolina Drobnik <karolinadrobnik@gmail.com>
Subject: [PATCH 5/7] staging: vt6655: Rewrite conditional in AL7320 initialization
Date: Thu, 28 Oct 2021 11:35:35 +0100
Message-Id: <948406a3e7d23f1cdf866aa4448d9428bdd32512.1635415820.git.karolinadrobnik@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1635415820.git.karolinadrobnik@gmail.com>
References: <cover.1635415820.git.karolinadrobnik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use conditional operator to determine which table for AL7320
initialization should be used. Use `data` temporary value to
store this value.

Signed-off-by: Karolina Drobnik <karolinadrobnik@gmail.com>
---
 drivers/staging/vt6655/rf.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
index afd202ea3356..af4eb7eb8e7d 100644
--- a/drivers/staging/vt6655/rf.c
+++ b/drivers/staging/vt6655/rf.c
@@ -716,13 +716,10 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char rf_type,
 		if (init_count > (MISCFIFO_SYNDATASIZE - sleep_count))
 			return false;
 
-		if (channel <= CB_MAX_CHANNEL_24G) {
-			for (i = 0; i < CB_AL7230_INIT_SEQ; i++)
-				MACvSetMISCFifo(priv, idx++, al7230_init_table[i]);
-		} else {
-			for (i = 0; i < CB_AL7230_INIT_SEQ; i++)
-				MACvSetMISCFifo(priv, idx++, al7230_init_table_a_mode[i]);
-		}
+		data = (channel <= CB_MAX_CHANNEL_24G) ?
+			al7230_init_table : al7230_init_table_a_mode;
+		for (i = 0; i < CB_AL7230_INIT_SEQ; i++)
+			MACvSetMISCFifo(priv, idx++, *(data++));
 
 		MACvSetMISCFifo(priv, idx++, al7230_channel_table0[channel - 1]);
 		MACvSetMISCFifo(priv, idx++, al7230_channel_table1[channel - 1]);
-- 
2.30.2

