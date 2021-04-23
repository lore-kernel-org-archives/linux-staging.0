Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC7F2FA1
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 14:58:56 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id y5-20020a05600c3645b0290132b13aaa3bso1396834wmq.1
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sc8HgTLbiRFbrMbWcYG4U/VQmwhqHIp2KM2VpwNB9S4=;
        b=Lxh2N0gXHXSTBDK6pOfjqBsw3Cu2a+VkkhzzG1IWlMvk18anEyk+FkSQaLZ0fZ+65d
         s/J0wyJ5PWrIVrTLFxXkdfC1ellCq/bINFkKdqVIHbc7WkRMDjDCe8fwTP0WWyn8waHn
         7cWw41DJg7wc25EXSkvpGNXE4YYLaxseVvWSZKy5ojaYS4XNlogiRE/tY59RZ264zrcU
         HSGCxpyFJFibgIQ54fOs81DJZOdwVdACyejLeAnaf97tJOtWbXTJ2ZPn3dA77jbL8zbM
         z2pK75D9eFBtuMR5BP7MdakhFMzfcD704i+SPbv7WEEdbaa1GpQIneYnjkFR7j+oat+z
         fXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sc8HgTLbiRFbrMbWcYG4U/VQmwhqHIp2KM2VpwNB9S4=;
        b=kBr1lmpHbakaM1Fyb4TgHmMb9qez3YRi+Q06b9aOBzNJFg1u+5lFlmfgvNGCoIksEs
         6OTLZPewIUceNlqPYbQ6tbueqTk24BAylTgCTpZcjrdYaoEtal11MEF2FEYFdLYVM/5w
         AsUvbSbJQAJKfzHQ/4wI23tg9QZcS/naxZb4/GI7xAzCt/k1+SFXWGP1B9DRaCmBB6gl
         XER39IR1FI5Trbu4pdmnEwt1Uu4bSqPmKd20CpXj53UWPC6N9vdX25zT6k0ft7Pj9Iqy
         vvDcrrav8MutlNkvDvlo4Nzl9abxRdkUbZcRgECC9+0v5e9dU67peaDsVUG75ObB20Oi
         F3jg==
X-Gm-Message-State: AOAM532/fd3Mdt7/MYmPCHYllwtJ4Dgge3BrPV0cpwvEInlF88qEDq0F
	GbI9ncQN/mc2U2lQwNA3x8w=
X-Google-Smtp-Source: ABdhPJxcOZPhOg0vSSTDmNsW4+YkIYBIGU/XFG19D801LgblS4HC/IT5l9A9SBzb18MZD/Bib/oNVw==
X-Received: by 2002:a1c:9856:: with SMTP id a83mr4761086wme.14.1619189934965;
        Fri, 23 Apr 2021 07:58:54 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id p18sm9047731wrs.68.2021.04.23.07.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:58:54 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/49] staging: rtl8723bs: remove unused RTW_DBGDUMP macro definition
Date: Fri, 23 Apr 2021 16:57:59 +0200
Message-Id: <a0421881e2e0993ead23b52932584ef3e2d19269.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619189489.git.fabioaiuto83@gmail.com>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused RTW_DBGDUMP macro definition.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index fc187a4ed2c3..c7e8187ca7f5 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -144,8 +144,6 @@
 
 #if defined(_dbgdump)
 
-#define RTW_DBGDUMP NULL /* 'stream' for _dbgdump */
-
 #endif /* defined(_dbgdump) */
 
 void mac_reg_dump(struct adapter *adapter);
-- 
2.20.1

