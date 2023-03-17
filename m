Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5413A65C
	for <linux-staging@lists.linux.dev>; Fri, 17 Mar 2023 06:50:50 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id z21so16626863edb.4
        for <linux-staging@lists.linux.dev>; Thu, 16 Mar 2023 23:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679035848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVUZy9GLOTi6aHPZwsHc62dMvLgMytvSk8FMI0v4FVc=;
        b=YRz7uLreoI4ccx7dGlfy6il3ilTF4CT0w8jUu2k61nNB2LLKfikZVw2khfATBKszwJ
         N5YM0OoeF+plNiXzoQVxnmxWkjSKDDfNgZ7cBMfk+KLcoMY/8jxHo0DjxAShm/X6lL8x
         GlYBe4UYpnhtqkmLuOM07XyLfyfJ4MYzbYyfqDNsMErc/TU5dP6GNSyRaAEoGAnZmQDJ
         ZvdcmXBUGXkSbFeTX82RQi9XVPCrNLRPNzDhupTrDM/ypvXlIL1MMou8bZ3dOb2VCVdo
         igm9P4GBCiJi22oonKVoW11cS6K8DlUGat4bIukuozN7nIAPNU2e5oq7LCjs+YF+5Y0w
         rNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679035848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nVUZy9GLOTi6aHPZwsHc62dMvLgMytvSk8FMI0v4FVc=;
        b=DaNmRkJ1ZJM8c8H+QKcuU095vqpP+PxngNGwIKvHxCCWR0yRHMVqGLrc1W/w23Y4nT
         PBkKGa4cc7Um9HexXp57UOEFr1WA+SIv7JCLBpB8XfXRxiC2N9wy7HOZHQ42glDxwxyK
         pAWnMGpfRsevg6370Ez4l199fYZsiM5o3pgzJBknAXLcX3fe4SbzF+WqmRYdhxo1i4DI
         FpEf9Kl3FpeN/YGpD+9n1MYTp6puKC37z2ukVrVisPmmtrVTSqqt68pJDANrXLt3Dkwi
         CmLafXeoTLOCt+K+3ZaRsfp/xdweNay9lOfCsIBqU5qCqI3ZIl9eG+2iHGjDrvXJMS1r
         zJrA==
X-Gm-Message-State: AO0yUKX3o0a0XbwSlfC+dkZmxph4ipb9jJXaUtTVDfBKY43AgthlX5va
	5ZpQ367DlSRbabAX0IAZarA=
X-Google-Smtp-Source: AK7set9N9ip30JoVnUaaM0uRvuAW+EhNVUsVcGPdKWaVrqcCWAmUqiiyGEwZcWpseVjkltdYy7juLw==
X-Received: by 2002:a05:6402:455:b0:4fd:1fe1:838f with SMTP id p21-20020a056402045500b004fd1fe1838fmr2318136edw.14.1679035848524;
        Thu, 16 Mar 2023 23:50:48 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abbef.dynamic.kabel-deutschland.de. [95.90.187.239])
        by smtp.gmail.com with ESMTPSA id z24-20020a17090674d800b009289de993e2sm577438ejl.216.2023.03.16.23.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 23:50:48 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/2] staging: vt6655: remove unused bb_power_save_mode_on() function
Date: Fri, 17 Mar 2023 07:50:40 +0100
Message-Id: <20230317065041.16635-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230317065041.16635-1-straube.linux@gmail.com>
References: <20230317065041.16635-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function bb_power_save_mode_on() is not used anywhere, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/vt6655/baseband.c | 22 ----------------------
 drivers/staging/vt6655/baseband.h |  1 -
 2 files changed, 23 deletions(-)

diff --git a/drivers/staging/vt6655/baseband.c b/drivers/staging/vt6655/baseband.c
index 6ce41983dcf4..d7c3e4bec560 100644
--- a/drivers/staging/vt6655/baseband.c
+++ b/drivers/staging/vt6655/baseband.c
@@ -2171,28 +2171,6 @@ bb_software_reset(struct vnt_private *priv)
 	bb_write_embedded(priv, 0x9C, 0);
 }
 
-/*
- * Description: Baseband Power Save Mode ON
- *
- * Parameters:
- *  In:
- *      iobase      - I/O base address
- *  Out:
- *      none
- *
- * Return Value: none
- *
- */
-void
-bb_power_save_mode_on(struct vnt_private *priv)
-{
-	unsigned char by_org_data;
-
-	bb_read_embedded(priv, 0x0D, &by_org_data);
-	by_org_data |= BIT(0);
-	bb_write_embedded(priv, 0x0D, by_org_data);
-}
-
 /*
  * Description: Baseband Power Save Mode OFF
  *
diff --git a/drivers/staging/vt6655/baseband.h b/drivers/staging/vt6655/baseband.h
index 15b2802ed727..d1128d050ac5 100644
--- a/drivers/staging/vt6655/baseband.h
+++ b/drivers/staging/vt6655/baseband.h
@@ -63,7 +63,6 @@ void bb_set_vga_gain_offset(struct vnt_private *priv, unsigned char by_data);
 /* VT3253 Baseband */
 bool bb_vt3253_init(struct vnt_private *priv);
 void bb_software_reset(struct vnt_private *priv);
-void bb_power_save_mode_on(struct vnt_private *priv);
 void bb_power_save_mode_off(struct vnt_private *priv);
 void bb_set_tx_antenna_mode(struct vnt_private *priv,
 			    unsigned char by_antenna_mode);
-- 
2.40.0

