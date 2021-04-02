Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CE86D09
	for <linux-staging@lists.linux.dev>; Fri,  2 Apr 2021 17:30:56 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id j18so5301076wra.2
        for <linux-staging@lists.linux.dev>; Fri, 02 Apr 2021 10:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HW8zP7DoM2YfAVkpuEz006Zh/rGoWUODHC32UiI5NeU=;
        b=LBQDvdQOdjzGKgtB763p2eI+OHAjKW5vCaTn21nn2gP5+n2DeNmtK/TPJyJUHqWqII
         yHXruJzoJs+IR/VLnM8cmmXd583OVLj95sIyEuGfkiCrnCeuxomNpMVWosbhIGhpstbl
         w3+qyymujACljzJP/4QAMsQBT6LerbJHKJrb2C1V16chEPYXKSkN78UqNWa0GUzga2Wp
         T7mL3XBUw3Msrc70kfka9nmZnf7eTvzuDLtsNGWfUg9uroMKhqVEK/RenxnX3D0yfbfY
         X8Ew2be6gkz/oKNmb2R/BGywMNveIDU5vabpMMf4WP/PFlhWwCFsnfJ+iQ55Fgyy0ymx
         OJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HW8zP7DoM2YfAVkpuEz006Zh/rGoWUODHC32UiI5NeU=;
        b=GoW6uRuXcGiMNbW39K35E/vV3/nv2dk7wnkJwoQzWuCeA8fnEXn/u9rZLi3tqxvlMA
         MEh4GtR+nO0KMjpo6sCihds74GMvo6z3yWHkUpKKQdBuSC49UOLBL7wEs560wjv3y7+b
         lq9RO7kVpcohEqjJZQN6qqM1JvXSh2YEYvHDhKUYglPiLBKoTOrpKuc6x8xRCsGcONKP
         RcTlWvRfIqAYfEGz0Zk/xFinZsRYJRJpwF32GTqii2BTfw39KJ9xl1eLdO23ugzJhoSP
         4K3DF5NFQLlw0tJBoQ2Y6AjWxgaqk3gzvxsLt/mWx/BzMDgxEM/QPI+AJh2u/7df/6qN
         fnsw==
X-Gm-Message-State: AOAM530zq/NTvaGuaMjKebkLi7W0zAfeUcoaYS31Tae1ZR+ySvHLfvZu
	BeldVTJfanAEd/zYmKxIIe4=
X-Google-Smtp-Source: ABdhPJw1NbZ2CtGu1W3vPbh86GHMgiqTV0pwBLy0CgY1z7cNWVVlvqTyOhuG97oDuO0XOjtTLJrIrQ==
X-Received: by 2002:adf:e541:: with SMTP id z1mr4091602wrm.383.1617384654730;
        Fri, 02 Apr 2021 10:30:54 -0700 (PDT)
Received: from agape ([5.171.81.4])
        by smtp.gmail.com with ESMTPSA id f7sm12130341wmq.11.2021.04.02.10.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 10:30:54 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 23/30] staging: rtl8723bs: fix comparison in if condition
Date: Fri,  2 Apr 2021 19:30:05 +0200
Message-Id: <d35e38ba478476a2fe38cfce73ab8bd80a1b2c51.1617384172.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617384172.git.fabioaiuto83@gmail.com>
References: <cover.1617384172.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix post-commit checkpatch issue:

CHECK: Using comparison to false is error prone
27: FILE: drivers/staging/rtl8723bs/core/rtw_recv.c:381:
+				if (psecuritypriv->
			bcheck_grpkey == false &&

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index cd4324a93275..21949925ec77 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -378,7 +378,7 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 
 			} else {
 				/* mic checked ok */
-				if (psecuritypriv->bcheck_grpkey == false &&
+				if (!psecuritypriv->bcheck_grpkey &&
 				    (IS_MCAST(prxattrib->ra) == true))
 					psecuritypriv->bcheck_grpkey = true;
 			}
-- 
2.20.1

