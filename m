Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA05F35203D
	for <linux-staging@lists.linux.dev>; Tue,  9 Jun 2026 22:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781043129; cv=none; b=iSn4zvEllSDOWs7P9vqPsiWcOQY0mkWHAOiEndX3/KiB2IFs8DbOziJmrLVfERCxJ61Ol/PvjpcRAsNekE9PSe+xTE1Zs3ZhBZdidEx4wTretZDHPoOEW3AtOeAwUZa2g+VbY06ST1dVaHCoFcVJnTLC1I/rqUmzKf7zREPNRG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781043129; c=relaxed/simple;
	bh=2zHJGczMgPTnPHetrKgAokSYc6u9xAry7V6kAueCMEc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n2cxHi7d6N4Ptiwr113QXh34AV2IgCDJRylc7r0rt6W+G6ZqRrU6TcVkgzC8ChZ7uwKsceWSuecOE+v+JLvB4udGZJBn5S10PECFn6xwi+TaJCfxzkntKR6S/rv1EUoX7qzSBKlpRPEa5OwWRuNptbc4ZXZan4nal8MoeClA5MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KeAV50o0; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KeAV50o0"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-963b09d5b91so4889102241.0
        for <linux-staging@lists.linux.dev>; Tue, 09 Jun 2026 15:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781043127; x=1781647927; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SRFLeAm+ZIb8Ah+Gyq2iccaCBid+13JpRL0PKWMiPUg=;
        b=KeAV50o05ZevzKowX8Hq7lW+Ibhdjn+PfFt3zRnwq00vvGuhqVNRDJ9uAgdd1kuIE2
         PM7gnAdjdME8c7TiYUEzy/tgIRchTQMUVAAlUidYeMB37HaxMHwDsfkCOA/Q9hn6Gbt5
         vRs/QFgwXuCZJrpie/twEzA0okjkYw8b9R1hIWt+JnLasQsz2KZsjwsOUB04kWyOrYpi
         kzkyXuL7vuHuUtptz7C9z0ETxDR3dyxuTWs4Lh1mQCabFKgB6tZFjc8U2wnIVxsXTLkU
         rS3Aq5YyzVksimvxIMUNVn2X0miQLQ/VJ5sH4z56SEwkhtJ7jIwJN7bsH3wzxeBkGC3C
         i62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043127; x=1781647927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRFLeAm+ZIb8Ah+Gyq2iccaCBid+13JpRL0PKWMiPUg=;
        b=rAjpnv8l+DcnZItQyn6Re+xKwKOrKvXCWzk1vA4lyW80Z6pWISUImD7nQb8ebsSR1M
         GhILZ3Wb3TG/4fNhl1ujfYB7xN0O8WNlJkgTd/y2rj0SCh7tvQ9ro5NDl35Om8xuQKvA
         eT43tlmr/Wkf2foTRtkgR/JTGn7P5xBAa4A0BI2XY5KY9WZVtz69MbT+RiiFbqvZ8nJm
         reFzGyD86sNrbfSU9mRc7tyPRhbPKB9va7qrFqmqAwQqLaxQcODNiYa6gMsZ5sqXrl2P
         FZIJfyIN0ngoY+LnEGwwg8+unpeOas2DYYMRkXXX5iGo/8jCelzTxj09LKEjfTKp8TBU
         4fCw==
X-Forwarded-Encrypted: i=1; AFNElJ+PApSfTCmeD9Xgqeldg/SmBF+8NtqveHYw/OXVFf4RGbwW2U5bnNYY8ZbrxIb/jzV79ETAP3NDSzjCF0cC@lists.linux.dev
X-Gm-Message-State: AOJu0YwiHbcazO1YIAhGcbf4DgwWIojmhJqlBksdlTxQyw0l/ZH8GYZi
	GqMhTlJOLTx7q+4IUEiJtDYYKJi4FJKhe/XCPqM5uXM8HglQB/0r2XJ9
X-Gm-Gg: Acq92OHY/wZ8/bwU3hron/FRta7xV1wTLypL2fFkoph9ge8Yl+cn9u9sObYc3hFiIV8
	0tCIQiciRhvkdDRT2yDdn+Nrj3Rv1cPbtUBF6u/BNrU2sPvr680L8nQ/ExUwOKuN32rx5gMShDu
	L5cOSIHOb5mFK07pfBKzT+s2HoAoS3UOoMM/K20pmaEH2sDr2GVtD6jiTKzTmrs2hzwEj1S9Abo
	F2d4MSCAdSsydHY7pXYp0ZnosQnOGMnf2AaTatOqvuU7vfO1jNK7vvPAW8e1MLmJAK/9FE5qxE8
	1yvpeHiBXuZbxgR7QNmViZyPuahaZ4aU8Gooflz+d1VDB5odRdVrfCtIDq+oMLq6rebBX+JWj7p
	h060/qCC/0zCahGx3hlzjp8pVP2zj/hV5U/hv5L6MFkUBktYDaa+xeILqlzPgjYfV0h0FqU+U93
	2L84aJptmQjiR0xcHwWnUNlLhMRoz81/Y+5ogyD91DdmzN60ZUU5OBUCN0OG4BwHRG7BzJVmtSj
	192MeWE4RcSrpYI
X-Received: by 2002:a67:fb92:0:b0:6d2:1633:1803 with SMTP id ada2fe7eead31-700392f5baemr6130775137.19.1781043126899;
        Tue, 09 Jun 2026 15:12:06 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:f671:db74:6740:62ca])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96413fcc8fdsm17224269241.7.2026.06.09.15.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:12:06 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	a.nasrolahi01@gmail.com
Subject: [PATCH v3] staging: rtl8723bs: fix unnamed parameters warning detected at checkpatch
Date: Tue,  9 Jun 2026 19:07:03 -0300
Message-ID: <20260609221200.123422-1-rodrigo.gobbi.7@gmail.com>
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
Hi,

v2 was not applying anymore after a rebase, sending v3.
Tks and regards.

Changelog:
v3: rebase; the rtl8723bs/include/rtw_btcoex.h from v2 is not needed anymore.
v2: https://lore.kernel.org/all/20260523142312.9223-1-rodrigo.gobbi.7@gmail.com/
v1: https://lore.kernel.org/all/20260407133416.13983-1-rodrigo.gobbi.7@gmail.com/
---
 drivers/staging/rtl8723bs/include/hal_intf.h    | 2 +-
 drivers/staging/rtl8723bs/include/rtw_pwrctrl.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index ee8ad26325b5..8a85e8419e47 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -239,7 +239,7 @@ c2h_id_filter rtw_hal_c2h_id_filter_ccx(struct adapter *adapter);
 s32 rtw_hal_macid_sleep(struct adapter *padapter, u32 macid);
 s32 rtw_hal_macid_wakeup(struct adapter *padapter, u32 macid);
 
-s32 rtw_hal_fill_h2c_cmd(struct adapter *, u8 ElementID, u32 CmdLen, u8 *pCmdBuffer);
+s32 rtw_hal_fill_h2c_cmd(struct adapter *adapter, u8 ElementID, u32 CmdLen, u8 *pCmdBuffer);
 
 void SetHwReg8723BS(struct adapter *padapter, u8 variable, u8 *val);
 void GetHwReg8723BS(struct adapter *padapter, u8 variable, u8 *val);
diff --git a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
index 6977892a5742..c8592c4753c2 100644
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

