Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3DB2931D0
	for <linux-staging@lists.linux.dev>; Mon,  3 Aug 2026 18:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785780952; cv=none; b=fDrSZxr0bOc6LAa8FhLgwKUndZ7fmHQmPwGbH3bArnNkRr5FiuAfJdYFIBXXRLDIABAe1lp5kBGu4uUaVq10Q6wsFFgInVIezK+Rfv/PTX9ZGdkQeAcR0hYG2Dm8ZFvea4b4D2eQ/fShitQHTBZQae/OqawnBk5jL0I4oPVn3wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785780952; c=relaxed/simple;
	bh=TsfvArG6hXQ/Marb+xax568CluLwVabgPXt1ATNAGXA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hdo0AHEjcF7LpKrEE9jBIdaPCzHSClroSA158ouysx32Luo1aOUmK4y+dar+J+4BK8JmAnmBau9Rk0ILQ/nUolexpF1ddEozmenR3JELnRXDfSpz0Bd/d1uDJRbHAjnDBhiZqDrxOncKWz4ZmwKOeTE5qu2kNdHwYGXfghT/Qig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O3pQN6oi; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O3pQN6oi"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84e507b079dso2626865b3a.0
        for <linux-staging@lists.linux.dev>; Mon, 03 Aug 2026 11:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785780950; x=1786385750; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BoW4RbOi9ddZlgoTqrW35lS+rdNuVLZGgPV69hcVRis=;
        b=O3pQN6oiC2CSMn0CS0DLxuzVUN4eCZf3GqzsiCuLw3urG4frfsgSqy7MnvrlU9kR19
         rL+Zzd6ZgjKnsW2Q943XxWdKvGXW+bgEJ9rEcFDY6fUNlCf2NlR5seBA8h03/SDGYkwb
         8DgVkDtozzGsbfoIYb1WMksYgcTXqBzcrrn3RYI4n+i+hOkXOZ8AiS2IT+0hwnq+LGAy
         IqEKSkiY0vMRiKNCh5NHueeuXx5bMITblL07KxEXt7uPLJ9/k2tSMXG8ZKzp+Xx8CWdM
         sSLIwQmvE4lc/0VcV5brgb41iTXKXIVpE+ySgJwPV4dFZyfKf8mtxXlOt1miTcv7odvp
         lwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785780950; x=1786385750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BoW4RbOi9ddZlgoTqrW35lS+rdNuVLZGgPV69hcVRis=;
        b=OSOUC5XDd0HwgRPQDU2aHVEo5xJF3m+u8u2hqgU8Xtej48Othle3OW6C2ZlEETZpZ0
         Cx+cyb0eg0J+YpVbK+QLc7HEtybjUrL4UaKSpPuH3tZJLjlumaL4Z685WAmCKg4xeUJz
         c0V9Rx7cJYRt/T4gGOcFFJylDpOkQG4TAv7jifytg2+hxf3dRD12ruU7av9UTMf8dfya
         PNPU15Jjv88s5QwTGAJZeB1RUXDCS79COJ05ScjyOXYfqrtqdrkmWOUYBH1vG1nf4LTj
         9yUZAdLcIk6oSXJ4rkw3BOTof/OSOlFsbLAVbxdqG7BvDhk4/HCWyUhpxTEQpn8OrFNF
         vLwA==
X-Gm-Message-State: AOJu0Yy8GRp+XjNGE7Wn6tGmplgDq4ctmFBzStCkmZ2xfSBzEba5z8Ld
	5KgFa6h1JP8cxZLNikcxBKf+f2C9GBA6Y0FNyvjkb35le/QsC4Rpl9vA
X-Gm-Gg: AR+sD10VV2/llxW8TkNlizVbSh9jIQT543uPcjzCsmT+bjP2BjeEuo+rQI8+fBNQvMQ
	IQOmMwlKIwvGxf3TW8nIXgr4nbNPC0A30FacU/9LEiAnfdejSFk2WpbrS4HMzDVMiMYjfG3VEsR
	beSqHyQYVwrB6GqpHCpSsDUoyPINjOzHrt90Bz2cC+Jcbyb6hR0uuyw/nq7HMjDzDuvBY92U668
	1PY1D0GMMPwpRAdFjGsJvkPP8Ev0x0SctCk1VdLsNsrSjc2FZRxR6zIty1l242on+RzpeLVZyVZ
	r1m8KYoUFRBxD90QC+o3liKcU5B+GuK+QZ3leCFuohFqADHEBA1ykIy7uzJlZVUZTBZwHIMYT0w
	yZ4SL7YOPowNF2DPMHkRrgErGtdgTNlpHb7BrVC0iGahN8g/eeDnQ3Ccw2e/YQyRxHHKhSuTgy+
	Tjj7eRSbz4ilrRcpdcA5x1bBFUCcj4NuVuU/jmIqxuGXHjosUe7EHQ4GZ+S0Rf9PmeObwPoIOm9
	M1tTDVt
X-Received: by 2002:a05:6a20:6f02:b0:3c4:68aa:8881 with SMTP id adf61e73a8af0-3c92a8f49d9mr10963752637.60.1785780950014;
        Mon, 03 Aug 2026 11:15:50 -0700 (PDT)
Received: from Vicious.localdomain ([223.228.81.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e666sm57919087eec.4.2026.08.03.11.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:15:49 -0700 (PDT)
From: Ashmit Kumar <work.ashmitkumar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ashmit Kumar <work.ashmitkumar@gmail.com>
Subject: [PATCH] staging: rtl8723bs: rtw_ap: remove unnecessary parentheses from return
Date: Mon,  3 Aug 2026 18:15:22 +0000
Message-ID: <20260803181522.3748-1-work.ashmitkumar@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Linux kernel coding style specifies that return is not a function
and therefore parentheses are not required.

Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 065850a9e89..4e9d91deb7e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -1085,7 +1085,7 @@ int rtw_acl_add_sta(struct adapter *padapter, u8 *addr)
 	struct __queue	*pacl_node_q = &pacl_list->acl_node_q;
 
 	if ((NUM_ACL - 1) < pacl_list->num)
-		return (-1);
+		return -1;
 
 	spin_lock_bh(&pacl_node_q->lock);
 
-- 
2.43.0

