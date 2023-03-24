Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C9127706;
	Fri, 24 Mar 2023 22:10:01 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id l12so3129112wrm.10;
        Fri, 24 Mar 2023 15:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679695799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Mi0Pc446/hNZjoA2whb7pVis3I9iPt8Xg8w3eBefMA=;
        b=C3lIZ59MI/zpkajBX1d9LTgxSG0qzcXP1h+ypEYFxHDSerYuKyU6WuRbqGvsqVwkWG
         bVKnIyc7XZyJMQMG2fSsGEpnGiRA6bOjwuGcTJebMtW4h9r7kiPDwdRLT6MzKr5sZLUj
         un40BwtzlLI4OQO5VoeIORjX5D8D3HXVajTHXhBFRMcAtsc69aZ728a9N7elA918E/bg
         IHq9Y2kKMBvQbVswxQ2AZOcchbQLGOEPGf1Lrr7MnzPz6fspsEAQFjjWMo+XvvM9KZwH
         hihL/buxOeshSk+P1ZoNYRrZ9wMsVXbqYFRWKc11O4DDMgj6BDbQ7901xCnOWRew3JVe
         q9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679695799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Mi0Pc446/hNZjoA2whb7pVis3I9iPt8Xg8w3eBefMA=;
        b=VSV+JeVGB4m6mhSwAeYlqN0siloyoitHIZVzEWmX20Y9qpF5H+WxaKm/K4QVPd+aCu
         2ks4Qcygr5c2ba84TSklxALh/778Sde+Ghn+egQnkKi1JBE9PAXhV7TjtwDhFYSXp3Fz
         kV0HlVCSaRgsCiRJtBuFehloFheEVpKzL+mEErdN1bwcQVP8O1Gq1/+xWZAnoixBqIgG
         uOPsgKnTqSWYExZMUsjmFkzrBHqLYel5tW6k8Oe20BU7R5aR6gB7I+XCm397fsBBPf1M
         aMVUqwY1hcxfXfbNQrAf2VzcsjRsiq6iSLcL/mr0F8gx2bZZnsDHjAftbsYIEpOBstEl
         tdQA==
X-Gm-Message-State: AAQBX9dak9f9RndHHn4JGYVcnrv5RcBc3dKYXtV1uVCgPvQ60WY1fW+f
	xgksWauCBU5W5L2waFrG5t/kpEVDbI98y/jK
X-Google-Smtp-Source: AKy350YjgZrnou6wBPTuCWPpZ2H5j5+SSAl4aMmQtvh8CHcJPd8u2xbM00+091JwSq+cRGDa5f1KbA==
X-Received: by 2002:adf:e90b:0:b0:2d4:751d:675b with SMTP id f11-20020adfe90b000000b002d4751d675bmr3330504wrm.35.1679695799202;
        Fri, 24 Mar 2023 15:09:59 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id x12-20020a5d650c000000b002c5544b3a69sm19201736wru.89.2023.03.24.15.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 15:09:58 -0700 (PDT)
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] staging: rtl8192e: add blank lines after declarations
Date: Sat, 25 Mar 2023 03:09:49 +0500
Message-Id: <d8a5e738046ffdc1b257e1935eacb8e16af34d5e.1679695111.git.kamrankhadijadj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679695111.git.kamrankhadijadj@gmail.com>
References: <cover.1679695111.git.kamrankhadijadj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add blank lines after declarations to adhere to the Linux kernel
coding-style guidelines. These issues are reported by checkpatch.pl

"CHECK: Please use a blank line after function/struct/union/enum
declarations"

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index c6114d99829b..7144a0630ea6 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -231,10 +231,12 @@ rtllib_rx_frame_mgmt(struct rtllib_device *ieee, struct sk_buff *skb,
 static unsigned char rfc1042_header[] = {
 	0xaa, 0xaa, 0x03, 0x00, 0x00, 0x00
 };
+
 /* Bridge-Tunnel header (for EtherTypes ETH_P_AARP and ETH_P_IPX) */
 static unsigned char bridge_tunnel_header[] = {
 	0xaa, 0xaa, 0x03, 0x00, 0x00, 0xf8
 };
+
 /* No encapsulation header if EtherType < 0x600 (=length) */
 
 /* Called by rtllib_rx_frame_decrypt */
-- 
2.34.1

