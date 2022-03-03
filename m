Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8837E
	for <linux-staging@lists.linux.dev>; Thu,  3 Mar 2022 15:53:07 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id c23so6307534ioi.4
        for <linux-staging@lists.linux.dev>; Thu, 03 Mar 2022 07:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D9wCC6ma+G0ROf2L8fTWOMDInn2EXx12HmoAUJb0VTI=;
        b=amzbu5kMPiTGrdFI/f9rqPr0FExXQ8QlMrRHMq7gHgN4Ma8NrghzJVsENJaH8ya2MK
         WwoG/15bQAAs4VRYn+rGqyLUQ5x7kEqiNEpRToGZpazXHf5MQO46V/1kf1CtbVoJ8QvO
         iQoCZ6kPGtApHygrlO3yHejHGUZLtLgkVDqLJbcA4lkH9TE/tuUj8OF0tN1NXs5hB6ut
         tzg+BhIBKbJGlzvFcyG/EwlPubLR2IsX0HcGBQZow08IC/PXaFjRB+8r2SMzWG1MvZRA
         FbAv2bHEtZfbpgF2jmfuCaXvoOYWsJC8luXYufZ3vkTwTbTvGs5YmmgOxabsWijVK6iO
         0KDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D9wCC6ma+G0ROf2L8fTWOMDInn2EXx12HmoAUJb0VTI=;
        b=kfHUQG19zKfEoV8E9QZWzYCc0hd0JClrZpEiCl6rh9cHWFwNT/uHn41Ul+gIAfTPEe
         H8b/LeQPd1tXdYm8OPIWfOaUws7us2TbvYAWiGUl9AMs/FCY8QgLMoMBPUJp/58AZaSW
         QIcu6qD9HSZDTUuSdQcRYe5poHi3th7LVDRkvDw9jldqepc9V3379AOq6Em3OHxRhAVg
         hFhWopOatXQIKP5owOYgkgkyIQ65waIzYTy5WzkoGZiDQV2DJjRLCE4PE+D2Chv7Akiu
         1Hyf79zABw8l0FTzAEFR0yVBkvL4io6JEepch17elYuVbEnmDBb5cMbFw+lxaPivGrlq
         aZFQ==
X-Gm-Message-State: AOAM532YJHKfcoxUTisAWut+gifDph5hQZ/QI/fB0guItlS16f0zgY+b
	60lklqtRHBM8pfNe8Wxxlis=
X-Google-Smtp-Source: ABdhPJyz3Apwg1nEMKBftYBiOJFs65vl0PkY+0lnY4bk8rt4EZ8bfaFGPCO9T+zLx4izQQfVu5nAyQ==
X-Received: by 2002:a02:604f:0:b0:30f:e6f1:3883 with SMTP id d15-20020a02604f000000b0030fe6f13883mr29779549jaf.266.1646322786397;
        Thu, 03 Mar 2022 07:53:06 -0800 (PST)
Received: from localhost.localdomain ([122.164.186.156])
        by smtp.googlemail.com with ESMTPSA id a6-20020a92d346000000b002c1a6040691sm2506599ilh.70.2022.03.03.07.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 07:53:05 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	paskripkin@gmail.com,
	martin@kaiser.cx,
	abdun.nihaal@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/9] staging: r8188eu: remove unused field list
Date: Thu,  3 Mar 2022 21:21:03 +0530
Message-Id: <558177d9165792a99f6efb439f6f537e13da705b.1646321515.git.abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646321515.git.abdun.nihaal@gmail.com>
References: <cover.1646321515.git.abdun.nihaal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The field list in struct recv_buf is initialized but not used.
Remove it.

Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188eu_recv.c | 1 -
 drivers/staging/r8188eu/include/rtw_recv.h   | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188eu_recv.c b/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
index 6af72b3e7a7d..341605c67216 100644
--- a/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
+++ b/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
@@ -54,7 +54,6 @@ int	rtl8188eu_init_recv_priv(struct adapter *padapter)
 	precvbuf = (struct recv_buf *)precvpriv->precv_buf;
 
 	for (i = 0; i < NR_RECVBUFF; i++) {
-		INIT_LIST_HEAD(&precvbuf->list);
 		spin_lock_init(&precvbuf->recvbuf_lock);
 		precvbuf->alloc_sz = MAX_RECVBUF_SZ;
 		res = rtw_os_recvbuf_resource_alloc(padapter, precvbuf);
diff --git a/drivers/staging/r8188eu/include/rtw_recv.h b/drivers/staging/r8188eu/include/rtw_recv.h
index d2f1c71f2262..90482cdd2236 100644
--- a/drivers/staging/r8188eu/include/rtw_recv.h
+++ b/drivers/staging/r8188eu/include/rtw_recv.h
@@ -207,7 +207,6 @@ struct sta_recv_priv {
 };
 
 struct recv_buf {
-	struct list_head list;
 	spinlock_t recvbuf_lock;
 	u32	ref_cnt;
 	struct adapter *adapter;
-- 
2.35.1

