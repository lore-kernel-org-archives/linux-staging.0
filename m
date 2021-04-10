Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC9071
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 15:00:39 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id bx20so8705128edb.12
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 08:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bgdrPa7l5L6m3hWfj8WaDq/TG4IT8UX2aSD3AHmvjM4=;
        b=a4++dpXfQhFANQH3JEHBxYb72PGTgDy2ZZOmdYrZUjZ0nq5RFbDPFAubt6sH6KNe7+
         ECLEWOqho1uHNdpZLJcz0V0q4ft43WUZ2h6EUqz//pH7lJzYfIdlpmePYqVcjFbFkH0J
         McoflhG6YzEg8rUs8bnSajnmEGtaVLM79+CvlortLqdyluzfIU3y7PVNosNraG9e78MW
         bEdQnwJ8HqN7eNCWrDclXIjLFbk/iRV4U78zU3pFd2aIWTOeGleWl4ACzmOeVCLjw39T
         OnR1R4wToexQN1eA5nJi5g0FjRvYdoVGm1tn2xLFJ59Tsdibq6uydyc+FiNPmo7wvvyO
         UtdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bgdrPa7l5L6m3hWfj8WaDq/TG4IT8UX2aSD3AHmvjM4=;
        b=FURQJUu6niudZ8Jq74XxY/IPkewk1Y/WPLLGkwG0FPZTigNH3UknkP5rN4/HXm5KgY
         W/NMa2Aq/BfXE4aXPvVX0v4Qkg+Hqk9kecipPzN/9WFYjG0yt1Zm9T7fS5l1V1UkKMnM
         xZ1FAB/nY9oYUE53iJMfXUKaD7cZq/z6WflneLmNO2hLuwF8PcMiHu1byCXydYdZR2Vt
         i6XUUwIFJaGaFOhkl1YgcPiknsSNiGU8tzXoGGDk9+eu4sJ9C6NFu9YRr9tIpbTp6COE
         Zph/+NB/W/xIi9fMRkvKgY0zDUvzrV9SimHOxhB4kVKhONT2NF4AAcAa/l2dqx5pFSg2
         MFhA==
X-Gm-Message-State: AOAM531ZjRDX9q/DpLTxV3+EvGb7JmY4rfVsCdFDb6uOBQJXLvmcDU1n
	L2hOY3VC5hWXWC8+fAG/F4szIoEDgnbstbPk
X-Google-Smtp-Source: ABdhPJzourPZ2SALuJifEw4Kr/rB2XuDE/jyruxX9Bjtq5LyGlbB6CUjICg39sAbm4SA1xboi0uVRg==
X-Received: by 2002:a05:6402:17af:: with SMTP id j15mr22330057edy.50.1618066837748;
        Sat, 10 Apr 2021 08:00:37 -0700 (PDT)
Received: from localhost.localdomain (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id gb4sm2719494ejc.122.2021.04.10.08.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 08:00:37 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	outreachy-kernel@googlegroups.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [Outreachy kernel] [PATCH v2 3/5] staging: rtl8723bs: core: Remove an unused variable
Date: Sat, 10 Apr 2021 17:00:06 +0200
Message-Id: <20210410150008.5460-4-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210410150008.5460-1-fmdefrancesco@gmail.com>
References: <20210410150008.5460-1-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Delete local variable "u8 sec_idx" because is declared and set, but never
used.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

Changes from v1: No changes.

 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 2af66a18200d..3fd8a4261ea2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -628,7 +628,7 @@ int rtw_get_wapi_ie(u8 *in_ie, uint in_len, u8 *wapi_ie, u16 *wapi_len)
 
 void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie, u16 *wpa_len)
 {
-	u8 authmode, sec_idx;
+	u8 authmode;
 	u8 wpa_oui[4] = {0x0, 0x50, 0xf2, 0x01};
 	uint	cnt;
 
@@ -636,8 +636,6 @@ void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie
 
 	cnt = (_TIMESTAMP_ + _BEACON_ITERVAL_ + _CAPABILITY_);
 
-	sec_idx = 0;
-
 	while (cnt < in_len) {
 		authmode = in_ie[cnt];
 
-- 
2.31.1

