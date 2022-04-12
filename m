Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF0046A5;
	Tue, 12 Apr 2022 06:15:44 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id cw11so531984pfb.1;
        Mon, 11 Apr 2022 23:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XHWMHnieMRPWnnTbhgeIU4H7tm3e3STl/gyvGxE87wI=;
        b=gU0sJC/XFrrS/WAVUaoDaCteB8WfHghYL9+kBc3P8+iZi48UBITZ2DpTm3yonEaB6a
         LCxAJqhPg5Rw0Rm1/KcZ47uxjjehVeca7EgtX8fVvLD0PK6ZrLFdObJZNer3OE2UN8gc
         uFrZBipyUs7kp+ShVqa8eDZAeq1p8JyTkHyU00ElxoUXQnINC8xEJ5pX4KnUyGyX/83l
         5fVMjGTjLdfcuBnDb/nZXPFrlkeRNppoxgfcgjuuXkFRwTaLFkzJUl/NBCQF92nLLFrD
         scN1TlcDTgADJvptdMhz7bBm+pJQab6c8ioZFN5vQEwJDBlnqrsoowF2dNy9FWXp9jW6
         QFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XHWMHnieMRPWnnTbhgeIU4H7tm3e3STl/gyvGxE87wI=;
        b=fjNfNYYU+grPMdJlwhvEcJUPgkQ0KB0p5SXq49gU3Sj1UY27nMgRWalAYd9kaMWsbf
         RCsQkPk0xQpRhGbi9qts4QXbzL5Mlq3yLpUOJMQZRLPFqnx5A/bRsl54zNgHERUxi/8x
         oqScSxaakGbRr8+1TydoYHBuGAsK/eI8R8JNX26jnfPmQxizjp02ML3v23f7IqdLiUQt
         Iom1RpM2/fgMID8T9YCaYWthNaaAcGcGJFm7PAFIr+BhVvwK5rYzjiMz7mzzBdRtLIJH
         yzF+xDJw01bUHgc3svUnajJDLNEPO6V2FEX6t/ctOirWyqW6J4fy5LsZZBJGGZ6/B4j9
         tp5Q==
X-Gm-Message-State: AOAM533S/a5HtMxjarS0oxA5Sr23r1P6psjf8/NI3P7mZPIaydqgRkYj
	sZW4B9ywTz5Q6QsWYsoUit8=
X-Google-Smtp-Source: ABdhPJz+BoA1aKSFG0aHLEkP/6kSptsQACrbzoaROFCaesPOafTklorN5/QOVVUkbekS7FUBOCG7kw==
X-Received: by 2002:a63:d1e:0:b0:399:8cc:e86f with SMTP id c30-20020a630d1e000000b0039908cce86fmr28609762pgl.230.1649744143999;
        Mon, 11 Apr 2022 23:15:43 -0700 (PDT)
Received: from aliyaR-laptop.domain.name ([14.139.241.88])
        by smtp.googlemail.com with ESMTPSA id o4-20020a625a04000000b004fdf5419e41sm29589231pfb.36.2022.04.11.23.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 23:15:43 -0700 (PDT)
From: aliya-rahmani <aliyarahmani786@gmail.com>
To: florian.c.schilhabel@googlemail.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev,
	Aliya Rahmani <aliyarahmani786@gmail.com>
Subject: [PATCH v2] staging: rtl8712: efuse: code style - avoid macro argument precedence issues
Date: Tue, 12 Apr 2022 11:44:42 +0530
Message-Id: <20220412061442.32536-1-aliyarahmani786@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aliya Rahmani <aliyarahmani786@gmail.com>

This patch fixes checkpatch warnings of precedence issues. Added parentheses
around macro arguments 'offset' and 'word_en'.

Signed-off-by: Aliya Rahmani <aliyarahmani786@gmail.com>
---
v1 -> v2: Updated the description of the fixes.
---

 drivers/staging/rtl8712/rtl8712_efuse.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl8712_efuse.h b/drivers/staging/rtl8712/rtl8712_efuse.h
index 4969d307e978..2e1ea9d7a295 100644
--- a/drivers/staging/rtl8712/rtl8712_efuse.h
+++ b/drivers/staging/rtl8712/rtl8712_efuse.h
@@ -15,8 +15,8 @@
 
 #define GET_EFUSE_OFFSET(header)	((header & 0xF0) >> 4)
 #define GET_EFUSE_WORD_EN(header)	(header & 0x0F)
-#define MAKE_EFUSE_HEADER(offset, word_en)	(((offset & 0x0F) << 4) | \
-						(word_en & 0x0F))
+#define MAKE_EFUSE_HEADER(offset, word_en)	((((offset) & 0x0F) << 4) | \
+						((word_en) & 0x0F))
 /*--------------------------------------------------------------------------*/
 struct PGPKT_STRUCT {
 	u8 offset;
-- 
2.25.1

