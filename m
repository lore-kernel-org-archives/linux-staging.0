Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EEC71
	for <linux-staging@lists.linux.dev>; Mon, 10 May 2021 12:46:25 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id n84so9143395wma.0
        for <linux-staging@lists.linux.dev>; Mon, 10 May 2021 05:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QKBDrlhjaJq2ItxNxA+omJE4a0bJoXUFeK6X38y0WSc=;
        b=eK5qcp3lz2fS8EH+Ov3w9RL4H3UfJN5FTMh6RWXtuiq5GwLUtGMvRZIkYZ6uRzlLw6
         VOnT6LuVN7S7palYc98AcrJX50fkUD92GDyOroGgSbejxm4UArgsTl9Ka2F8fRxSBNfc
         jEp0kpMnn5JGZXOHa1BIA35ZxV3N65fauh6pz+XtPh5/NO8+Hr7tyLUI2+laRJirKqSU
         IjzLnJMdxvAoPjLKsMN3dLHRPYT61qAYvGGRqvL/rbNsQy5DyXTnXDYlHpwFRnpOt/lY
         syR6uaHjkmbY4u4ACEpXwIKBG8P29D264+aHZop2dNJL6W9PDgQcGESgIjn9pCxCVbZG
         wSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QKBDrlhjaJq2ItxNxA+omJE4a0bJoXUFeK6X38y0WSc=;
        b=SORgzSzutDlaiwGsb4JcWjy4+IpHRv5Ndm9VL4Wv3oy7HN5af6wylkd9XQcw0a2uIQ
         AzPDY8htJ4BaCwhzqqkH4Bp0dRORroWZMx4Al++Bca3QxgWmA98SGqgR21CS73Ge8z32
         C9rKXoESDosZGW27q9jrwjTIfWnVAXRPolKhofg1oMj4+n+573ABI/Z5RdEUoBwGmYrm
         p/6bBYqJuB4eIF84kxNAWrzRqfYfa55GRzTDV76BNHcGwckipNwY0QkKyOwLFnJ7uV/G
         uGQTGbdsxXotSHKv7ttRiKn3OZFtwxoEVsfyNu5p41ODvNztOasZmmYwA84uzxE10Vig
         ujxQ==
X-Gm-Message-State: AOAM531t6oPqE28kWG/LdqJXPMM3ZbubimYhU3dq2pNYcBPwmWRiKU8j
	pGUZWT45ALrtr9BUWXz6FtE=
X-Google-Smtp-Source: ABdhPJzd/Hak8k5vvoB6dcR9CDFTPe7gfW8AI0CLWEyoj/Utp74f71YRJ2rT3NAnpbf6vhD/pAzSdg==
X-Received: by 2002:a7b:cf27:: with SMTP id m7mr36926162wmg.116.1620650784236;
        Mon, 10 May 2021 05:46:24 -0700 (PDT)
Received: from agape ([5.171.73.3])
        by smtp.gmail.com with ESMTPSA id x4sm25632507wmj.17.2021.05.10.05.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 05:46:23 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] staging: rtl8723bs: move comments to silence 'line too long' warning
Date: Mon, 10 May 2021 14:46:19 +0200
Message-Id: <cdb37302e4d7618141997229c59467f9d196eccc.1620650484.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1620650484.git.fabioaiuto83@gmail.com>
References: <cover.1620650484.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

move comments to fix the following post commit hook
checkpatch warnings:

WARNING: line length of 110 exceeds 100 columns
115: FILE: drivers/staging/rtl8723bs/core/rtw_security.c:510:
+					*((__le32 *)crc)
 = ~crc32_le(~0, payload, length);/* modified by Amy*/

WARNING: line length of 110 exceeds 100 columns
124: FILE: drivers/staging/rtl8723bs/core/rtw_security.c:518:
+					*((__le32 *)crc)
 = ~crc32_le(~0, payload, length);/* modified by Amy*/

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index bee1b2e2504e..4d0a86b69f41 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -507,7 +507,8 @@ u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 
 				if ((curfragnum+1) == pattrib->nr_frags) {	/* 4 the last fragment */
 					length = pattrib->last_txcmdsz-pattrib->hdrlen-pattrib->iv_len-pattrib->icv_len;
-					*((__le32 *)crc) = ~crc32_le(~0, payload, length);/* modified by Amy*/
+					/* modified by Amy*/
+					*((__le32 *)crc) = ~crc32_le(~0, payload, length);
 
 					arc4_setkey(&mycontext, rc4key, 16);
 					arc4_crypt(&mycontext, payload, payload, length);
@@ -515,7 +516,9 @@ u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 
 				} else {
 					length = pxmitpriv->frag_len-pattrib->hdrlen-pattrib->iv_len-pattrib->icv_len;
-					*((__le32 *)crc) = ~crc32_le(~0, payload, length);/* modified by Amy*/
+					/* modified by Amy*/
+					*((__le32 *)crc) = ~crc32_le(~0, payload, length);
+
 					arc4_setkey(&mycontext, rc4key, 16);
 					arc4_crypt(&mycontext, payload, payload, length);
 					arc4_crypt(&mycontext, payload + length, crc, 4);
-- 
2.20.1

