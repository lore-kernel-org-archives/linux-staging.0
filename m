Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82BE3783C9
	for <linux-staging@lists.linux.dev>; Tue,  7 Apr 2026 13:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568868; cv=none; b=mcAe1fLTj30+XFquS/GQghRaec6iJV3SCE/LhBRE1o1YG0DbZwCufo0M8if1Qs/Vh9NkRdG9ehZT/gWlFYlgaGu2Qdwb5tLLkO8MjzMv11VXyYhAFSAud9g9BoinYyZPFtWn9eYWo+PUns+XpWj/63cS1pB+DhjIBvbfhxtlbcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568868; c=relaxed/simple;
	bh=HlU87euuBGUAn5caArfz/j03nMokMW9Lsh5piLGHEOE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PBCeVmhRZU3tZ/yBSAJX4ouvig5BsZhXnNOAZGKzD6ylM7zyKu3+gFo+yYIqca1CS8zjZcHPaHgnX1B/tNsY3teVuwXpTVHShsyE48tpKD1OpTRerHM6JhXQEf84Rhv6jHx8bGMFu7I9FG6HCyxAPRsiKVkhXhtyEgfuRqkAFjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OlI1BcvU; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OlI1BcvU"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso4815625eec.1
        for <linux-staging@lists.linux.dev>; Tue, 07 Apr 2026 06:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775568865; x=1776173665; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FJ5UGvzlNyGAgIzX2gahc4byA8+M/F6HMi4wZ7/WiGI=;
        b=OlI1BcvU//Yv/g8r43zm0SyAEolY8hjEk/HTz3gLzH3wwUjRSF/dY2gUzJUBtte6FY
         edswfrBXOSVqPVtjtKotXmadMC6l4xgfy2lLLdIezBgq7/d89v2SpaD4MQj/ixgmlNKt
         mQyRlLT0Sr4W+Ax7xOUlox8GIHFpzYAd+DPLP32uC2AmQtPDVJzI6+/8kCe/MSMwph/v
         jamsqBrvJhHY+j99+yqQvmgDLeAzv+SaN7SH+LiGyexpKh4f7rpyQmeXTP40dbgj9aCK
         lRPED8mcyJL5qg3meBiaIUGa8+5cs1kUl8itIfhAcuynSnyZB6DJ/WeCmL94L1zGe7tE
         4cmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568865; x=1776173665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJ5UGvzlNyGAgIzX2gahc4byA8+M/F6HMi4wZ7/WiGI=;
        b=aB5If/rVsC64JXfE7kUAh82RTfrsxhlQu0CsNxMN07DFL64f3Ez8EzHQ2WDmuRl+7w
         1D9JSJHfxFGrSpx9iH8D1r1W7NhAuoHOSD2L5/DVCoE/DadNfVXnWZMzR6W0YsKRuvFy
         0lV3OG19afjtFCC2r+Xv5r1A2mXN0GIH41gmM3drueQJfj172wmfnq5bEL3TNZlLIjNd
         j41rf8LMrs0GlE67B2IkSOJPykW0XDSyTqe60VLTp83YZ9UrRxVMdONLGAhuOxS3uIit
         KNs5bqlrkKvWIPNkuXoVtcIXs31ztAWv1ga3SonMA3VN24YBEbR4QlhEOM6r7JhDaIRx
         C+IA==
X-Forwarded-Encrypted: i=1; AJvYcCXeCNLXSRtOm3Ks7Mj1bmBLkLFE5v7uOGYmkLL+4mAGWMQcOQI97jAYVN3J7LnzjyxF2SKf8NI0iszPRDq0@lists.linux.dev
X-Gm-Message-State: AOJu0YwQe8C4DgQ3iNxfJLxlYqcxnKTU4XwApe/3mRHUKNRB6RMfb9/G
	VPIAHopoDjbs/lSPTZR9XCRI9B5983AK8KnksqmQdHcfu9eSr/HH0FwOom3Nuw==
X-Gm-Gg: AeBDiesTdQ8YOQ7HhU2obDbUbOKNDy0QHPBvjzyGxGXRQha46o34kQPGK2KIK+arwJr
	7KmE/9G5tMEduN+YheHseydi5G8OxuelCDC/vG06OUewud2AjKDTYOtTDwd5O2jmsbVAsoabGOD
	b5jiYeuLYpwt2aGd/JA+MDEp1y6iP+e78A6nILCqUaQyTum9+BzF31r1JFyPDP8fiiADVQf/Bbo
	Su1binjXHeySwKqz1XD84dSjRjDYtel+64/Dcby0TovnTO6+xxJi3YZGzG5leqan1HppzTtAgMz
	1CLVYZ4OnGVt6OKqgosUlhqF3pafzYUp1xmicVrmaog0qsrPR0vQ4R6SOgRsOB8vOqsRUeTvjGG
	TdAktT6HLKGOWLF0lzMgM8D5fwHrPp36VMAQuA1cd22Tu1LIGJnWW8eDcG6E35Qy2lWJqMmGku8
	z7kvtEMRneWwR4CEPi0NWXmWxJWK5wZb9eaqHUe+vPg/LrVnNNA3aX0G8LI7YaCJ4Zz83CYrFZz
	wg74Q==
X-Received: by 2002:a05:7300:8c04:b0:2c4:4363:3742 with SMTP id 5a478bee46e88-2cbf9fe1c97mr8797529eec.9.1775568864869;
        Tue, 07 Apr 2026 06:34:24 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:a160:4978:2ff1:7409])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d1e4ad4cc7sm1906367eec.7.2026.04.07.06.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:34:24 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	a.nasrolahi01@gmail.com
Subject: [PATCH] staging: rtl8723bs: fix unnamed parameters warning detected at checkpatch
Date: Tue,  7 Apr 2026 10:27:21 -0300
Message-ID: <20260407133416.13983-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Detected the following WARNING: function definition argument
'struct adapter *' should also have an identifier name.
Add explicit names on those definitions.

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
Hi, all,

Found a set of these warnings with checkpatch:

drivers/staging/rtl8723bs/include/hal_btcoex.h:25: WARNING: function definition argument 'struct adapter *' should also have an identifier name
drivers/staging/rtl8723bs/include/hal_btcoex.h:49: WARNING: function definition argument 'struct adapter *' should also have an identifier name
drivers/staging/rtl8723bs/include/hal_btcoex.h:50: WARNING: function definition argument 'struct adapter *' should also have an identifier name
drivers/staging/rtl8723bs/include/hal_btcoex.h:51: WARNING: function definition argument 'struct adapter *' should also have an identifier name
drivers/staging/rtl8723bs/include/hal_intf.h:255: WARNING: function definition argument 'struct adapter *' should also have an identifier name
drivers/staging/rtl8723bs/include/rtw_btcoex.h:18: WARNING: function definition argument 'struct adapter *' should also have an identifier name
drivers/staging/rtl8723bs/include/rtw_btcoex.h:19: WARNING: function definition argument 'struct adapter *' should also have an identifier name
drivers/staging/rtl8723bs/include/rtw_btcoex.h:24: WARNING: function definition argument 'struct adapter *' should also have an identifier name
drivers/staging/rtl8723bs/include/rtw_btcoex.h:25: WARNING: function definition argument 'struct adapter *' should also have an identifier name
drivers/staging/rtl8723bs/include/rtw_btcoex.h:26: WARNING: function definition argument 'struct adapter *' should also have an identifier name
drivers/staging/rtl8723bs/include/rtw_pwrctrl.h:218: WARNING: function definition argument 'struct adapter *' should also have an identifier name
drivers/staging/rtl8723bs/include/rtw_pwrctrl.h:219: WARNING: function definition argument 'struct adapter *' should also have an identifier name

...the ones from hal_btcoex.h is already ongoing at [1].
Fixed the rest of them following the pattern of each file like:

struct adapter *padapter
or 
struct adapter *adapter

Tks and regards.

[1] https://lore.kernel.org/all/20250720145524.9733-4-A.Nasrolahi01@gmail.com/
---
 drivers/staging/rtl8723bs/include/hal_intf.h    |  2 +-
 drivers/staging/rtl8723bs/include/rtw_btcoex.h  | 10 +++++-----
 drivers/staging/rtl8723bs/include/rtw_pwrctrl.h |  4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index b193854bfe6e..10762ffbafb6 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -252,7 +252,7 @@ c2h_id_filter rtw_hal_c2h_id_filter_ccx(struct adapter *adapter);
 s32 rtw_hal_macid_sleep(struct adapter *padapter, u32 macid);
 s32 rtw_hal_macid_wakeup(struct adapter *padapter, u32 macid);
 
-s32 rtw_hal_fill_h2c_cmd(struct adapter *, u8 ElementID, u32 CmdLen, u8 *pCmdBuffer);
+s32 rtw_hal_fill_h2c_cmd(struct adapter *padapter, u8 ElementID, u32 CmdLen, u8 *pCmdBuffer);
 
 void SetHwReg8723BS(struct adapter *padapter, u8 variable, u8 *val);
 void GetHwReg8723BS(struct adapter *padapter, u8 variable, u8 *val);
diff --git a/drivers/staging/rtl8723bs/include/rtw_btcoex.h b/drivers/staging/rtl8723bs/include/rtw_btcoex.h
index 19764c80b8ba..cb566825e77f 100644
--- a/drivers/staging/rtl8723bs/include/rtw_btcoex.h
+++ b/drivers/staging/rtl8723bs/include/rtw_btcoex.h
@@ -15,14 +15,14 @@
 #define	PACKET_ARP				2
 #define	PACKET_EAPOL			3
 
-void rtw_btcoex_MediaStatusNotify(struct adapter *, u8 mediaStatus);
-void rtw_btcoex_HaltNotify(struct adapter *);
+void rtw_btcoex_MediaStatusNotify(struct adapter *padapter, u8 mediaStatus);
+void rtw_btcoex_HaltNotify(struct adapter *padapter);
 
 /*  ================================================== */
 /*  Below Functions are called by BT-Coex */
 /*  ================================================== */
-void rtw_btcoex_RejectApAggregatedPacket(struct adapter *, u8 enable);
-void rtw_btcoex_LPS_Enter(struct adapter *);
-void rtw_btcoex_LPS_Leave(struct adapter *);
+void rtw_btcoex_RejectApAggregatedPacket(struct adapter *padapter, u8 enable);
+void rtw_btcoex_LPS_Enter(struct adapter *padapter);
+void rtw_btcoex_LPS_Leave(struct adapter *padapter);
 
 #endif /*  __RTW_BTCOEX_H__ */
diff --git a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
index c27d07861b8c..df5dbcceea06 100644
--- a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
+++ b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
@@ -215,8 +215,8 @@ struct pwrctrl_priv {
 extern void rtw_init_pwrctrl_priv(struct adapter *adapter);
 extern void rtw_free_pwrctrl_priv(struct adapter *adapter);
 
-s32 rtw_register_task_alive(struct adapter *, u32 task);
-void rtw_unregister_task_alive(struct adapter *, u32 task);
+s32 rtw_register_task_alive(struct adapter *adapter, u32 task);
+void rtw_unregister_task_alive(struct adapter *adapter, u32 task);
 extern s32 rtw_register_tx_alive(struct adapter *padapter);
 extern void rtw_unregister_tx_alive(struct adapter *padapter);
 extern s32 rtw_register_cmd_alive(struct adapter *padapter);
-- 
2.48.1

