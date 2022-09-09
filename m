Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4947D7E3
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 09:09:50 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id z8so1539997edb.6
        for <linux-staging@lists.linux.dev>; Fri, 09 Sep 2022 02:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=u4h5rh1/7ebU+oz1gbKVh9qvXaWbHW7SaMiwSJOBlk8=;
        b=dF2+n+HrpcXh6mJROrascPsihmSVsPXZEH4nSJLfj6w4CSw5aSOG3YW8j/IzpHs2TM
         cTbkizNfGMT3s0GNOzrN/xA3h/0dgvXlE2s0HMfRJShPdaQ/woiVIk3nS93dxqX2ujl/
         GrDEBiRk9/JY6nGMxg2mbDqJCf7gbUwsamqDmF1kEl8+F4P+HeSdNp9mqgTadj9EkZTX
         +6rmlAjmBbKXmVNi/4AQ49R4sVAYti4LXbtPtiB4hYNHENdJ4SWISGQPsQzzDG296Xi4
         o7eodjtjZc4vOZCSQ4Q9brYf0KMuK4GNxqUxy1LWsqW8vm6tuFWjhwjQkFDfZlymlgNZ
         3Qrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=u4h5rh1/7ebU+oz1gbKVh9qvXaWbHW7SaMiwSJOBlk8=;
        b=g+F6sTkATVp8P2PQ4mIs3R7h7EQXMq1A7Ibmg+D6M9ahemB+Y6yWDFoxNQbOJIMSID
         41OEqp78HYRW4sHRyiZHtKmjllo5Fx8Q6SAz7FSITajG96/9MAmPHBfHpy1CR746IUn9
         qTSnLe2dnfJGSXqLKg8pFkyc2tlxP1baxWAHL6vE9TRa7K31mSLcMgd1HfgvH7P6plyj
         5cIxbffeOjiy0RPpyonyaSesUo75nKOciMXlW96qgIt0QnI9ki5NGI6iu5fgW6ECy/UM
         vFeI/DY4ZYUaVRzzbSdJeJprYDM0cKvDYugG97BFu8xs7UsM1zixEaknaqNIF7uuq5Bg
         xW0A==
X-Gm-Message-State: ACgBeo2PliQ7slm7L3FUXOEjtyKxBK2dZmyzKKR1JT8XeBdKu2/gG5gY
	GfiaqW5chD2doQEhz1u36GRqLdWHraw=
X-Google-Smtp-Source: AA6agR6U7CUlydBrgp8xw3+cbyHTg0d1YgbUdDrKtYpfDtOG4mLIi8J+rk4LB8PCsMUajANBZchlSA==
X-Received: by 2002:a05:6402:190d:b0:447:ed22:4d0d with SMTP id e13-20020a056402190d00b00447ed224d0dmr10808933edz.309.1662714588404;
        Fri, 09 Sep 2022 02:09:48 -0700 (PDT)
Received: from localhost.localdomain ([131.155.244.90])
        by smtp.gmail.com with ESMTPSA id r20-20020aa7d594000000b0044e9a3690e0sm24001edq.9.2022.09.09.02.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 02:09:47 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: forest@alittletooquiet.net,
	gregkh@linuxfoundation.org
Cc: namcaov@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2] staging: vt6655: use memset to make code clearer
Date: Fri,  9 Sep 2022 11:08:57 +0200
Message-Id: <20220909090856.18427-1-namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A line of code sets the entire struct vnt_rdes0 to zero by treating it as
unsigned int. This works because sizeof(unsigned int) is equal to
sizeof(struct vnt_rdes0) (4 bytes). However it is not obvious what this
code is doing. Re-write this using memset to make the code clearer.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
v2: re-write commit message because previous message describes a
non-existent problem.

 drivers/staging/vt6655/device_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 8e2a976aaaad..a38657769c20 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -867,7 +867,7 @@ static bool device_alloc_rx_buf(struct vnt_private *priv,
 		return false;
 	}
 
-	*((unsigned int *)&rd->rd0) = 0; /* FIX cast */
+	memset((void *)&rd->rd0, 0, sizeof(rd->rd0));
 
 	rd->rd0.res_count = cpu_to_le16(priv->rx_buf_sz);
 	rd->rd0.owner = OWNED_BY_NIC;
-- 
2.25.1

