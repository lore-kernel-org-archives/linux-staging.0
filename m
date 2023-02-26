Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850D02119
	for <linux-staging@lists.linux.dev>; Sun, 26 Feb 2023 13:25:06 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id 16so2044225pge.11
        for <linux-staging@lists.linux.dev>; Sun, 26 Feb 2023 05:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WIdIsNJqgjcgtgkT28wQ/X13SL46siMQE4Wb+rfuVYs=;
        b=OFF+HS/j6e9XUDNsULpXyIrj1eeG0iuwwuEALp/mbz2yZYlgxUAu0sX7OPAgcKb6cc
         lLkx/0/GsRl/ZE4Mx5Op2bD8xnPCv2H1ZDl88IflWmZTgybi0Du1hHzoH4m/u+L3B9TZ
         db/pxVcUKqkMLg3yXeXZ5IJBJtwr9+cGXIlDyZ67grF2ImzdKoQOQynWvyndBp69IbIN
         DDt4sxONV10oHhm/ht+54Xq3Wwz8YjkHC/xz1X2BnQtX8f8GLVmi6ENh7ZLsK2wBZt0E
         OfUiAaNvZTYzeGf+ZG6KFDZEIY/XPLweqy2Vlb6fIKtVkMN+mobgU8sCdbk2srskg7ho
         9d7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WIdIsNJqgjcgtgkT28wQ/X13SL46siMQE4Wb+rfuVYs=;
        b=xUqW6VwXv7EqZVQi768PCrpRkLlEpwNfpnCoacLk4AGRh4CEeVv6Ma70GcwdpGphfN
         t4Ne8JBpgzekJg4GgzXbXiQMcCKPa4eoJjrzByziq662L7vejJ9psxM5k86F+WhD25XY
         PV6pBXNXNOdjuy3KOsAelnacrNub7W+BzcDiYourKOXr8cZD3clXoxCzNWkpN7XYVJyN
         QEo3NnH66juJ6pxHC/o9rjEqSpRohwGYFXEUyeOTHkT+rLJKLj5+CciGJ4pBluKpNOaF
         htMoYE90odSkyBojcX/IzfK8fUcHGXaLxXR90ElStz9wnWl45gPZ6wigh+j11cDnNmq2
         uPqQ==
X-Gm-Message-State: AO0yUKUjc4mIWfr1fa5aTLqtvJiEsMvd+zFkhVLgM2sT+C5hNPcOwP1O
	1QrPwxOGtHP9UdpLkdDZe9k=
X-Google-Smtp-Source: AK7set+cLoNNrU1K3IL3FiBj8M7xOsOAR4VcJfsntkyKZJDBUtf9dogiTalemjQAwLMS7WRPmTwRYQ==
X-Received: by 2002:a62:790f:0:b0:593:befd:848c with SMTP id u15-20020a62790f000000b00593befd848cmr20422654pfc.16.1677417905841;
        Sun, 26 Feb 2023 05:25:05 -0800 (PST)
Received: from passwd123-ThinkStation-P920.. ([222.20.94.23])
        by smtp.gmail.com with ESMTPSA id e13-20020aa78c4d000000b005a75d85c0c7sm2495932pfd.51.2023.02.26.05.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 05:25:05 -0800 (PST)
From: Kang Chen <void0red@gmail.com>
To: paskripkin@gmail.com
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kang Chen <void0red@gmail.com>
Subject: [PATCH] staging: r8188eu: add a null check of kzalloc in go_add_group_info_attr
Date: Sun, 26 Feb 2023 21:25:00 +0800
Message-Id: <20230226132500.3933232-1-void0red@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kzalloc may fails, pdata_attr might be null and will cause
illegal address access later.

Signed-off-by: Kang Chen <void0red@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_p2p.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/r8188eu/core/rtw_p2p.c b/drivers/staging/r8188eu/core/rtw_p2p.c
index 93d3c9c43..802e1170a 100644
--- a/drivers/staging/r8188eu/core/rtw_p2p.c
+++ b/drivers/staging/r8188eu/core/rtw_p2p.c
@@ -31,6 +31,8 @@ static u32 go_add_group_info_attr(struct wifidirect_info *pwdinfo, u8 *pbuf)
 	struct sta_priv *pstapriv = &padapter->stapriv;
 
 	pdata_attr = kzalloc(MAX_P2P_IE_LEN, GFP_KERNEL);
+	if (!pdata_attr)
+		return 0;
 
 	pstart = pdata_attr;
 	pcur = pdata_attr;
-- 
2.34.1

