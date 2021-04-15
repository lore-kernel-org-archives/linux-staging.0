Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1296D38
	for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 10:07:33 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id a4so22738190wrr.2
        for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 03:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nZeOoSTrmtcNAY29WBSl7pF72FqMaozdn6Exoiit6rA=;
        b=j9236lsxwlR31SRy+OP9n3GvpfSA0inJn4W/q48u7hWNAbq13L5VCzuaI290STNDhX
         6MTEGHaO5FhUdt4YTfVY6Gp9iHddq+nCvYbcKijcc1SsQiX1qnoFOjfgqxoF+lSmxIo8
         aJ9Ukhqmw4XqygKYQz5/bRF6irdDuQkyY0RqAm4eU6Zt9HkTsbZlcf2UxHdQ1Q6Jhuiz
         R7hIQtySzCPG1nSXazX6cptnaiLyGbhWs70CYkWxoeyj/8yFL8G5A/PMqyGpcj4z8j7d
         8Gph/2R4M+vQzIhNtt2UQItizbANYTBMa4VBpEGHBnd0ZvYqgf6dGbPW1tdKV5h8Zz5D
         k9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nZeOoSTrmtcNAY29WBSl7pF72FqMaozdn6Exoiit6rA=;
        b=F74GIHyMnjo8BK5eBUh6KHN0bw5TGG0j8JBDdqQNv8M09ocOeajh21FG9k1hq4vT7g
         MPhfOQaq6n0Rw64u23q6jtvcpgUlIQRGUxDIyqiei7H4xgplmZhL2TLhLLktbeFNoB+t
         SXSxWszKlsa5qeMmX+qW8T11myjNIrz1+k5Mlv8YFJpJDeJUj/Z0uKQlS+PArPMyX3F2
         jZ+75faVvqYbIaS8vKOT+P1lJ41UGAZhtWnUqxQTvo2NkLYXVQ4D+Fb36zRlwuuHs8wQ
         LuXTSJW5HOO+fswABmcXTqcTtmUVMkDwFKN57dK/ryu3l+sVVR/BzSOp/7u7s+SKdrWD
         iXvQ==
X-Gm-Message-State: AOAM532OemzdRCBKGe9N7g4RIpyRJR62eQ/Ux//22cHcAK/mVTCwZ7Do
	sGvEnrItYsSzbg8Vh3d+qGF6kJiw55U=
X-Google-Smtp-Source: ABdhPJzrI4+DL39WdB6fGpYzQOBlXP+eJV1XXlOhYP9qA8cTfez697sAu7nBzcJiBVJhhX6Y1U2mZQ==
X-Received: by 2002:adf:a3d3:: with SMTP id m19mr2643952wrb.24.1618481252397;
        Thu, 15 Apr 2021 03:07:32 -0700 (PDT)
Received: from agape ([5.171.72.223])
        by smtp.gmail.com with ESMTPSA id j14sm2105104wrw.69.2021.04.15.03.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 03:07:32 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] staging: rtl8723bs: fix indentation in if block
Date: Thu, 15 Apr 2021 12:07:21 +0200
Message-Id: <7f548510ebe2427e85f3fe8b33ed937160c64e9f.1618480688.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1618480688.git.fabioaiuto83@gmail.com>
References: <cover.1618480688.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix following post-commit hook checkpatch issues:

WARNING: suspect code indent for conditional statements (32, 48)
323: FILE: drivers/staging/rtl8723bs/core/rtw_mlme_ext.c:708:
 				if (!ret) {
+
	netdev_dbg(padapter->pnetdev,

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 775e55ecac25..06544d0652b8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -706,10 +706,10 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 			if (psta) {
 				ret = rtw_check_bcn_info(padapter, pframe, len);
 				if (!ret) {
-						netdev_dbg(padapter->pnetdev,
-							   "ap has changed, disconnect now\n ");
-						receive_disconnect(padapter, pmlmeinfo->network.MacAddress, 0);
-						return _SUCCESS;
+					netdev_dbg(padapter->pnetdev,
+						   "ap has changed, disconnect now\n ");
+					receive_disconnect(padapter, pmlmeinfo->network.MacAddress, 0);
+					return _SUCCESS;
 				}
 				/* update WMM, ERP in the beacon */
 				/* todo: the timer is used instead of the number of the beacon received */
-- 
2.20.1

