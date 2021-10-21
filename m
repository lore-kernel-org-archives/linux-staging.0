Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6762C80
	for <linux-staging@lists.linux.dev>; Thu, 21 Oct 2021 09:28:19 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id l38-20020a05600c1d2600b0030d80c3667aso111257wms.5
        for <linux-staging@lists.linux.dev>; Thu, 21 Oct 2021 02:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dbqiLL8aUgPksDHzHaUghNX/IFV5YGYn2GKMzSbGgXE=;
        b=FBVF3ZPIVUk9qKdxRPmrXVIhsOvmuadNOKFlxnp6cDew1DInimJnkB0oyvoLlJFRAs
         fsCPIobNZyb+gStsCk6BZeL1SwOw//LExuo+gAqwILbi5eK3c/tmCZ2DH69+o/UVhUWh
         VCrE4ReqQrolqyZzvSgryO6A8RySv2DYxjGzSSuLGV49C1NVnac2ciN87ja6yLwwyd7d
         VSw8LbbCLrKXDHJ5An3yOTK9iNMjyWv60FDoDVGJWqcQWiSlb+FoD52iq8oFHgUNzkea
         SyAfSN6mdgcoK34+LzSHCpGr2NxsCWR7KCdjvJZqbyy2VNs6/2gslC6cWTm5GCL3OKpy
         /WlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dbqiLL8aUgPksDHzHaUghNX/IFV5YGYn2GKMzSbGgXE=;
        b=ix8QCm3ZOJZ9yKmAhx9bANRewXxgIrZ5nCJN34nKl1sbQAyEtECF3q/pswqvqp4I7e
         ArI9npH9aQrot+FPSEGK6AMqFp8bKZBgh90TIpgc0N5pM5R/MqhkJZvH3rGyOn7kw/p5
         PeiFed7vWmOLoMNM7V/olE5ctCuEYkzqSsAcy8MJqeElQsicdq+wZSwQmu/51dei2MPm
         +0sfQP1X4nmmfaXxkVVFSXRA9hilSmnv3II2xxgtatIdYPT6Riy3RJuG9G7swjiGg6pt
         oQBpcK12LQKxb+nTEA+Py27R4OxcS6IP9SquZQgQ/RmFBx9NLSkzTVfPQN1BN/G9F1nQ
         e6SA==
X-Gm-Message-State: AOAM5317CZKohvxWnOK1ZqMG+r4o2tYQP1hRhonua0laei7Z3wSeV3La
	I/RbkKPgJ/Cfx1sdBNjCz9U=
X-Google-Smtp-Source: ABdhPJxa776eBpnKqpKTSouJp7u9j7v5OrKMq3uCSxdmJaIzShj+sduCDyBVOSf/PM+GIhcK1cODWA==
X-Received: by 2002:a7b:c444:: with SMTP id l4mr19316174wmi.115.1634808497790;
        Thu, 21 Oct 2021 02:28:17 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id p19sm7198376wmg.29.2021.10.21.02.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 02:28:16 -0700 (PDT)
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karolina Drobnik <karolinadrobnik@gmail.com>
Subject: [PATCH] staging: vt6655: Use named constants when checking preamble type
Date: Thu, 21 Oct 2021 10:27:53 +0100
Message-Id: <20211021092753.511863-1-karolinadrobnik@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Compare `preamble_type` to a predefined constant, `PREAMBLE_SHORT`,
instead of a literal in `bb_get_frame_time` and `vnt_get_phy_field`
functions. Thanks to this change, it is clear that we check
the type of a preamble, not just compare it against an arbitrary value.
Remove a redundant comment.

Signed-off-by: Karolina Drobnik <karolinadrobnik@gmail.com>
---
 drivers/staging/vt6655/baseband.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vt6655/baseband.c b/drivers/staging/vt6655/baseband.c
index 8f9177db6663..84fa6ea3e2e6 100644
--- a/drivers/staging/vt6655/baseband.c
+++ b/drivers/staging/vt6655/baseband.c
@@ -1717,7 +1717,7 @@ unsigned int bb_get_frame_time(unsigned char preamble_type,
 	rate = (unsigned int)awc_frame_time[rate_idx];
 
 	if (rate_idx <= 3) {		    /* CCK mode */
-		if (preamble_type == 1) /* Short */
+		if (preamble_type == PREAMBLE_SHORT)
 			preamble = 96;
 		else
 			preamble = 192;
@@ -1779,7 +1779,7 @@ void vnt_get_phy_field(struct vnt_private *priv, u32 frame_length,
 	case RATE_2M:
 		count = bit_count / 2;
 
-		if (preamble_type == 1)
+		if (preamble_type == PREAMBLE_SHORT)
 			phy->signal = 0x09;
 		else
 			phy->signal = 0x01;
@@ -1792,7 +1792,7 @@ void vnt_get_phy_field(struct vnt_private *priv, u32 frame_length,
 		if (tmp != bit_count)
 			count++;
 
-		if (preamble_type == 1)
+		if (preamble_type == PREAMBLE_SHORT)
 			phy->signal = 0x0a;
 		else
 			phy->signal = 0x02;
@@ -1809,7 +1809,7 @@ void vnt_get_phy_field(struct vnt_private *priv, u32 frame_length,
 				ext_bit = true;
 		}
 
-		if (preamble_type == 1)
+		if (preamble_type == PREAMBLE_SHORT)
 			phy->signal = 0x0b;
 		else
 			phy->signal = 0x03;
-- 
2.30.2

