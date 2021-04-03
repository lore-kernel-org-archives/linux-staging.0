Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D1F6D09
	for <linux-staging@lists.linux.dev>; Sat,  3 Apr 2021 09:14:47 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id c8so6526331wrq.11
        for <linux-staging@lists.linux.dev>; Sat, 03 Apr 2021 02:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zv6blgVUmmcg0rrTba28HSVxaCH1kZzMtYvEm8Uvvjg=;
        b=QwMUK45sJB1AoxIsZTJePadnQG0x8fzcg6IQe88ZSQ0dPC98Ug8ehoSPGJhmJ5IdU+
         FyASs/QBumX24NezXi9V3jrfyN5Ja6axWdwuAMbjvbPv+LYECcA6DCr4UWSYVaijDYi/
         EBsEmraTl7RY589ckauLuDbBHg15wrs37DGoZoRpxQKFh95OKc3F/Zmbd8o+QnkJ46g+
         r0zagdZbiaTiVQLvMPtLUBlORVdtkwuuATcvx5cdz6080x6yaOG+ma+fLWZL/wI8clrI
         o9Oc62Zp2rQesiCVywEUxbtbr6pWmU/o65CMTsP5g1jOdupIDXQ4CEi1/iBuYL0rL/tb
         F5bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zv6blgVUmmcg0rrTba28HSVxaCH1kZzMtYvEm8Uvvjg=;
        b=lzrs3rZMUy9qzYoqkwYJpGbVFaLIv/x+qIDUueL3184asBAvzziYmUiGhulBiA+BKR
         EavqiENAc7JlQt/hly2d6EILp4Lt1jL16cY+tDiZQH0kjzzJzr/JChCfkdClc/WJFBOY
         swj9cXAY82vl3G6s4bN391m9OM5+X/Og4kbNF0nLZw8xg+hA1z1G67JGmJAWaFb0Zkkt
         V+fk2qdJqkb1Zt2sjP0mPRBYtKDwfws1HGbnRvBdzf0bBInvdQmAiBV9BLEbEBKBdEoJ
         1u2SiWwHUvzWbl/ynIQ+lqIuJbyf97j74ghjMtf+EJ6Sz1z1odlZL93UW/0XN/GwSMnx
         YgHA==
X-Gm-Message-State: AOAM533JCbkWz+uZrVTcHqRd5SD51CBPcYZC/JQ7CQl3O/uVC1k41r/S
	CZhVCfpoobQcjJHzfNDbVcg=
X-Google-Smtp-Source: ABdhPJzKuayUYrFevfUBNHgJr+PnRG3hfvrwzpq9VqD1Y+JvaVgDUq387IyxV2MQgtP/EWkZEgkVWQ==
X-Received: by 2002:a05:6000:10cc:: with SMTP id b12mr20078560wrx.29.1617441285784;
        Sat, 03 Apr 2021 02:14:45 -0700 (PDT)
Received: from agape ([5.171.72.64])
        by smtp.gmail.com with ESMTPSA id m11sm17958154wri.44.2021.04.03.02.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 02:14:45 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v3 20/30] staging: rtl8723bs: added spaces around operator in core/rtw_recv.c
Date: Sat,  3 Apr 2021 11:13:42 +0200
Message-Id: <7f5152d0cae2d6624fc00471db2178f9046578da.1617440834.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617440833.git.fabioaiuto83@gmail.com>
References: <cover.1617440833.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix post-commit hook checkpatch issue:

CHECK: spaces preferred around that '+' (ctx:VxV)
60: FILE: drivers/staging/rtl8723bs/core/rtw_recv.c:359:
+				if (miccode[i] != *(pframemic+i))
 				                             ^

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 2d749341d47b..953351f896c3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -356,7 +356,7 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 			bmic_err = false;
 
 			for (i = 0; i < 8; i++) {
-				if (miccode[i] != *(pframemic+i))
+				if (miccode[i] != *(pframemic + i))
 					bmic_err = true;
 			}
 
-- 
2.20.1

