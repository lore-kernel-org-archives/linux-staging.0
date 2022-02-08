Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F112F27
	for <linux-staging@lists.linux.dev>; Tue,  8 Feb 2022 19:54:40 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id d18-20020a9d51d2000000b005a09728a8c2so32726oth.3
        for <linux-staging@lists.linux.dev>; Tue, 08 Feb 2022 11:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zuxBOxSXx7d4b4cX2jnWBhyNkXcf+aRokxgpIzaMMY4=;
        b=CKfBmmYn6zVLOBAXCzB4HbpOqT28Iz0wtkN2m8QBkqb4RPqsKjrXwnGt3ZJbnD3SDW
         GOmAqhYcOClgVzKKvHk1hfJBMMVBg5OLoWTgwW8gllUxdz4CQT3eJBo7x3Bnl0Micb6U
         Dn2z5sbZjVYesizs8uldTX3MtZaKwJDa0nKmPuUgMgK+Zpxuj6i/f4oGAXsJ+uZtOP4E
         sDhhE8pavmiaz33Bz3nPq+XmDYGcQ/gD5PJ/txpnzxIUNNJG2ujd3C3uY0o5FX4T3Tiq
         LC/tnfSJdgO4AawFjRZ3ZWCZat/elQt0le+nAd5DL9JdPsOcvHHnwhpEBURkGThuL/Zs
         yexQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zuxBOxSXx7d4b4cX2jnWBhyNkXcf+aRokxgpIzaMMY4=;
        b=tHGtq5uVQ5RGXriBtMa/aKFGyfa6jps4fyLzYD1SqZdMN/f5Vl3anMWxmdJfYjeAha
         4k2PpeyGJWGksskekiL6AbVSbs0Hij8hn/wux4pHbUNvgIy/ZbK4V/bTxoj+qL2PJ3eW
         5taRLnS1rvxjO/sLhMZhvh3iaxV6JSfOHh/DcuQjFXL1hPdD2mAd3pVFEhgGphFV/KFI
         v1QjwsfbL2iFzBCtUQYVSP9zptjpMepfw5zkgCYwPImXvsAByrThRzN70vvApAF9abbL
         B+L0/R0AvxluC1Z7a8RE6eqw6bwYXjEwCnEt1D1ccT83VI4aboh4WcbFDtDudHSC1Y0s
         vuBA==
X-Gm-Message-State: AOAM532Xl+Gu7Cl+xVdizqcQuDiiECq39mNVxnlk0/1wxjfv2qRCyihW
	kWkwWfHRaro1NDaZS4CnILk=
X-Google-Smtp-Source: ABdhPJzDFsOkiI+GltX2s6MP2uANOLhlNipg9bTK+D1nKUInvxZkn6mZe1NF/PqswBq8Hlj7Jz0IZg==
X-Received: by 2002:a9d:609a:: with SMTP id m26mr2493399otj.223.1644350079668;
        Tue, 08 Feb 2022 11:54:39 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:4cd8:12bf:fde8:3cda:d976:7f4e])
        by smtp.gmail.com with ESMTPSA id 8sm3468204oav.28.2022.02.08.11.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 11:54:39 -0800 (PST)
From: Leonardo Araujo <leonardo.aa88@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Leonardo Araujo <leonardo.aa88@gmail.com>
Subject: [PATCH] Staging: r8188eu: core: do not use assignment in if condition
Date: Tue,  8 Feb 2022 16:54:25 -0300
Message-Id: <20220208195425.32286-1-leonardo.aa88@gmail.com>
X-Mailer: git-send-email 2.29.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes the following checkpatch.pl warning:

ERROR: do not use assignment in if condition

Signed-off-by: Leonardo Araujo <leonardo.aa88@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index c7e8602d2097..d02632dc16c3 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -1329,7 +1329,8 @@ static void c2h_wk_callback(struct work_struct *work)
 	evtpriv->c2h_wk_alive = true;
 
 	while (!rtw_cbuf_empty(evtpriv->c2h_queue)) {
-		if ((c2h_evt = (struct c2h_evt_hdr *)rtw_cbuf_pop(evtpriv->c2h_queue)) != NULL) {
+		c2h_evt = (struct c2h_evt_hdr *)rtw_cbuf_pop(evtpriv->c2h_queue);
+		if (c2h_evt) {
 			/* This C2H event is read, clear it */
 			rtw_write8(adapter, REG_C2HEVT_CLEAR, C2H_EVT_HOST_CLOSE);
 		} else {
-- 
2.29.0

