Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2376D19
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 15:59:37 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id r6so24380780wrt.4
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 08:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pneosDARu3FWmahaZQQKanjShxTTQDb7R85mkUv+f3c=;
        b=LKDRmrhqKi5Mwr6/GT63BiP4qHp10Uokk2Lr90sdpMxGVIN0ttFyfHjla8LXOUfoFl
         DddAsAjJoclyfPBXXr5UjYkYdQTMHyS7EvD1SwpWp7Iz0wmZQU6XccfXDTYkDka/CIwX
         aU26Mw8m84/HZ+65f2wfo67DQ6kd4tuD9db1umidsB/9JghVmRRQpJDdXE4ulwwWxLN3
         J/ECERFUgwe35NXDDgSD/rQ8mMsxVq1qiJHC/MNCZml+M0v0UceRHRd8tzhLB79vKhdj
         1AIOkQN6HaOR78nuvHUhI4Aw5uPwki+e32WfdFzEou3xigPWdaBbEFkJDaufHpYvu3MN
         DjFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pneosDARu3FWmahaZQQKanjShxTTQDb7R85mkUv+f3c=;
        b=rZmGI9208QXzeIp30mREB9QVsi5l2a6mRuzLqOt5mgfl8ewYEOqKKVsAytMfC5tU9k
         mRg/fKre8YKHr38LF4kfyBxL25nQlrGOOW/RhsKT7M40eeu63G6DaLTeTrIeRW2i+jXS
         qdduuKO0bsZxjhQlf67FB6DM/KFuI0Q4AmdZyPLl5fU0wDTwfoegzbrraX+JhF98r0Q1
         XlKtFjzOhCXpu8ejsxbUJHyHAQotROz1aSLdhAAj2kqOF0kvu0f5m66HPcSnNrfUlHGE
         qywyikUTTZ6xgbvhJH7OR+0l8RsGawgGmcZ7A4IjtKAQNZVU7slcmkQQS7BQmerm7PAu
         uEHQ==
X-Gm-Message-State: AOAM5314T/jTyLmdybIfT4exTEyNL792zf1Q51aYfK0CFNmEWOYuR7Gj
	a/erMQRghlTcZmuxGwsU04o=
X-Google-Smtp-Source: ABdhPJziPYXa1OFEiBzgIT61oDyoCChTBrsl3huMDfxotk3CX0oeqeH0NoWsrMJcW59KazCZ+u8RlA==
X-Received: by 2002:a5d:4ec5:: with SMTP id s5mr12420382wrv.267.1629129575667;
        Mon, 16 Aug 2021 08:59:35 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::4058])
        by smtp.gmail.com with ESMTPSA id a77sm11589597wmd.31.2021.08.16.08.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 08:59:35 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 13/23] staging: r8188eu: clean up spacing style issues in core/rtw_mp_ioctl.c
Date: Mon, 16 Aug 2021 17:58:08 +0200
Message-Id: <20210816155818.24005-14-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210816155818.24005-1-straube.linux@gmail.com>
References: <20210816155818.24005-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up spacing style issues in core/rtw_mp_ioctl.c reported by
checkpatch.

CHECK: spaces preferred around that '|' (ctx:VxV)
WARNING: space prohibited between function name and open parenthesis '('

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mp_ioctl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mp_ioctl.c b/drivers/staging/r8188eu/core/rtw_mp_ioctl.c
index fed94d66aee0..36091eac0e0f 100644
--- a/drivers/staging/r8188eu/core/rtw_mp_ioctl.c
+++ b/drivers/staging/r8188eu/core/rtw_mp_ioctl.c
@@ -309,7 +309,7 @@ int rtl8188eu_oid_rt_pro_set_antenna_bb_hdl(struct oid_par_priv *poid_par_priv)
 		SetAntenna(Adapter);
 		_irqlevel_changed_(&oldirql, RAISE);
 	} else {
-		antenna = (Adapter->mppriv.antenna_tx << 16)|Adapter->mppriv.antenna_rx;
+		antenna = (Adapter->mppriv.antenna_tx << 16) | Adapter->mppriv.antenna_rx;
 		*(u32 *)poid_par_priv->information_buf = antenna;
 	}
 
@@ -734,7 +734,7 @@ int rtl8188eu_oid_rt_pro_read16_eeprom_hdl(struct oid_par_priv *poid_par_priv)
 }
 
 /*  */
-int rtl8188eu_oid_rt_pro_write16_eeprom_hdl (struct oid_par_priv *poid_par_priv)
+int rtl8188eu_oid_rt_pro_write16_eeprom_hdl(struct oid_par_priv *poid_par_priv)
 {
 	return 0;
 }
@@ -754,7 +754,7 @@ int rtl8188eu_oid_rt_rd_attrib_mem_hdl(struct oid_par_priv *poid_par_priv)
 	return 0;
 }
 /*  */
-int rtl8188eu_oid_rt_wr_attrib_mem_hdl (struct oid_par_priv *poid_par_priv)
+int rtl8188eu_oid_rt_wr_attrib_mem_hdl(struct oid_par_priv *poid_par_priv)
 {
 	return 0;
 }
-- 
2.32.0

