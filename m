Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A043772
	for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 18:07:34 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id g18so11520869wrc.11
        for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 11:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W80P863IqQoCYgbdux1PZ7ouNu5e3TSJsyvPZDzXj30=;
        b=D67gnxi/I3s5b0XFrfCwGR/U6wEiddqSAMJenEryXzKM44uQYjdLeAfypVxAB5R3vo
         oL2wVVF15s4mPPsdNM17Zjx+pBVph/D7ubh2ERDolrOXQlG01zqjMzCUCYtSolrGdcqV
         5Od2Oq26Qh7+H++x3jddMX8QiFf8Od8k14JjAagOybiBxlm6qvP/k7GNBmjvoH7p85Fk
         1oRQR7qcUyNZx0T4hkn4Mf9ZrlzRrtErUXTkS5Ka0uFLzoPISKoHw1QZ/9RvNO74lhS8
         ug0o74hiYbUPQXvSkdFZPIZ7XOOSCEibLhjX8VF3YHGIQuBPe6xD8MFMC/uA5st7ifcp
         xaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W80P863IqQoCYgbdux1PZ7ouNu5e3TSJsyvPZDzXj30=;
        b=o1mJUjbhEMJFs/aSYIrq51pb3Loke4q1OR+lVsKaszvgdjlz33Mg5Qits7qJu1Lfg3
         qZ5DoskYz9BwISId77oXTCUA6Ou1J4ZlTwqdCz4a6L1Yde3CJnoyggE9aicEOTse3Upa
         j+hMBLHkYHFPM6z722eUXy79UkDXU0sdeXXd0KCk35TjITbfe8QmsDvxuNXt2bdYJXLz
         uG+8+iqWtTEO2V37In1jHmeIQUf3vRpCDSQfq60uOuQPjBMzcbjY/Iw9rdPB3GktUAMN
         VuifITYOxFC4mb7NbtZvLeypqmKEqD/okgxZbj65+J+neFEXVEUGvSIi/Q3cV1400xO8
         Ptmw==
X-Gm-Message-State: AOAM530mTXQFl620uR5jdck+6LGamchgsWqDSO2HdLCRm9LlFsoAAOKM
	ZWM7cj0BkBnnN8JSK/BNS0I=
X-Google-Smtp-Source: ABdhPJxyIb4rSQufcibs6Cvm1uGh+8GPBNrle3Cpi5SvC/7zWsj3Ywi4sHNP9N+wFSE+xwVQDKlh/g==
X-Received: by 2002:a5d:4844:: with SMTP id n4mr21785676wrs.191.1630260453109;
        Sun, 29 Aug 2021 11:07:33 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::16fa])
        by smtp.gmail.com with ESMTPSA id f7sm17124287wmh.20.2021.08.29.11.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 11:07:32 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/2] staging: r8188eu: remove unused constants from wifi.h
Date: Sun, 29 Aug 2021 20:07:16 +0200
Message-Id: <20210829180717.15393-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The constants WLAN_REASON_PWR_CAPABILITY_NOT_VALID and
WLAN_REASON_SUPPORTED_CHANNEL_NOT_VALID defined in wifi.h
are unused, remove them.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/wifi.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index 0b3fd94cea18..eb07ac9b8943 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -126,8 +126,6 @@ enum WIFI_REASON_CODE	{
 #define WLAN_REASON_DISASSOC_STA_HAS_LEFT 8
 #define WLAN_REASON_STA_REQ_ASSOC_WITHOUT_AUTH 9 */
 /* IEEE 802.11h */
-#define WLAN_REASON_PWR_CAPABILITY_NOT_VALID 10
-#define WLAN_REASON_SUPPORTED_CHANNEL_NOT_VALID 11
 
 /* IEEE 802.11i
 #define WLAN_REASON_INVALID_IE 13
-- 
2.33.0

