Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B936F7C
	for <linux-staging@lists.linux.dev>; Sat, 23 Apr 2022 13:02:21 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id h5so9534526pgc.7
        for <linux-staging@lists.linux.dev>; Sat, 23 Apr 2022 06:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=idFLEuhhRBrIFoG+4fgFrk263hwBaKFKAvkJX1uSpV4=;
        b=CLTrwpUjDt+EKT+A/MFKftljZ9OzVlZE2pp2sby4IndormmslmJ5PLAJN0UOFDtsEM
         Npa1g78QMW3mZXiJPRcPffpGQ0b0kutjXFtRLwM1+aDJzN8IY0EcFeRHrm733GGxL9Lh
         /JrljX9pSLx0N6TYE9pvD64LrOH+nTRea4kah5f0wuBJ9yk5+sDmfGXOVW5ZVNrEtiBA
         icbEtpH+QSgeiUzPFdJz8WCXTGTsZ2dF9Q2jLqoSt5f7QmCtYfTVCRxz8UwVoVLtaSGi
         xYempN0Y0tFejWmxD69oF0aKJMcT8M0Bak9JPyLLr/xPiLPaFrQe2kIJz+rAaql98T+7
         ztAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=idFLEuhhRBrIFoG+4fgFrk263hwBaKFKAvkJX1uSpV4=;
        b=dxIrPuOAaD8fpP6eNr9NbxZ9fvaozoE0y0KZzMna1NHUIv0Fnum6gavRnIiI6wS6Mo
         gavO9mX54Gra+eRRUGrIkHqEKk4rs8ZDrDmAeAIwCYLDZQb/ivBvZyLhCpllXykJp7UK
         rw5YRiwXHeMczZ1VWPwZCJ0IfONv8+iZ1bT6knZJUybyHgpKWLK3rBZyNWYdzstt8r8N
         yXLyIa09x1VdbphM443OfyxA7zddnIY2hoVW1Q9OHIU48z3O3JUF3JLayhfqfOCWmIWc
         4CiBlRPmg6+X2EPbC0250L0qi3zYBCR7mNeRK8rpy+DMpisKxDdJQTkCp9BUyDmvf7Yp
         FOMA==
X-Gm-Message-State: AOAM533W2TY4FsLm0kXXTVDD03hm1Lb7PnO6Sdf6VdjkPr86Lrrxws93
	I+9LUZcPWQM/R9PCZuWlUMk=
X-Google-Smtp-Source: ABdhPJwTT7gagDiYTgzLspQB+d5xn7GjsnscQCajwVcnKJALZvPy3m2pmp1QV5tQ7VYSXk31mXQYFQ==
X-Received: by 2002:a05:6a00:a0e:b0:4fd:fa6e:95fc with SMTP id p14-20020a056a000a0e00b004fdfa6e95fcmr10043915pfh.17.1650718941187;
        Sat, 23 Apr 2022 06:02:21 -0700 (PDT)
Received: from localhost.localdomain ([14.100.36.163])
        by smtp.gmail.com with ESMTPSA id c139-20020a624e91000000b005060cdff4ffsm5808994pfb.129.2022.04.23.06.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 06:02:20 -0700 (PDT)
From: Solomon Tan <wjsota@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@oracle.com
Subject: [PATCH 4/7] staging: rtl8192e: Remove unnecessary u16 assignment cast
Date: Sat, 23 Apr 2022 21:01:47 +0800
Message-Id: <20220423130150.161903-5-wjsota@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220423130150.161903-1-wjsota@gmail.com>
References: <20220423130150.161903-1-wjsota@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the explicit casts in assignment statements for u16 variables.
Because these variables are declared as u16, there is implicit
conversion to u16 during the assignment, so an explicit cast is
unnecessary.

Signed-off-by: Solomon Tan <wjsota@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c | 2 +-
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c    | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c
index c5e44bbe997c..cd8bbc358d01 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c
@@ -58,7 +58,7 @@ bool rtl92e_send_cmd_pkt(struct net_device *dev, u32 type, const void *data,
 			memset(pTxFwInfo, 0, sizeof(struct tx_fwinfo_8190pci));
 			memset(pTxFwInfo, 0x12, 8);
 		} else {
-			tcb_desc->txbuf_size = (u16)frag_length;
+			tcb_desc->txbuf_size = frag_length;
 		}
 
 		seg_ptr = skb_put(skb, frag_length);
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index b608540c036c..feddb15bccbe 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1225,7 +1225,7 @@ void  rtl92e_fill_tx_desc(struct net_device *dev, struct tx_desc *pdesc,
 	pdesc->LINIP = 0;
 	pdesc->CmdInit = 1;
 	pdesc->Offset = sizeof(struct tx_fwinfo_8190pci) + 8;
-	pdesc->PktSize = (u16)skb->len-sizeof(struct tx_fwinfo_8190pci);
+	pdesc->PktSize = skb->len - sizeof(struct tx_fwinfo_8190pci);
 
 	pdesc->SecCAMID = 0;
 	pdesc->RATid = cb_desc->RATRIndex;
@@ -1298,8 +1298,7 @@ void  rtl92e_fill_tx_cmd_desc(struct net_device *dev, struct tx_desc_cmd *entry,
 
 		entry_tmp->CmdInit = DESC_PACKET_TYPE_NORMAL;
 		entry_tmp->Offset = sizeof(struct tx_fwinfo_8190pci) + 8;
-		entry_tmp->PktSize = (u16)(cb_desc->pkt_size +
-				      entry_tmp->Offset);
+		entry_tmp->PktSize = cb_desc->pkt_size + entry_tmp->Offset;
 		entry_tmp->QueueSelect = QSLT_CMD;
 		entry_tmp->TxFWInfoSize = 0x08;
 		entry_tmp->RATid = DESC_PACKET_TYPE_INIT;
-- 
2.36.0

