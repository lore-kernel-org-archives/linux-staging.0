Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342B97F
	for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 10:45:33 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id v16so13933522ejr.10
        for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 03:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date;
        bh=gV8fTFzQ9QuQyibPPmknRwrm0cpQSXvIjVeP1F06DNg=;
        b=aImQoD96l+vLllY9AvIKt8nI7o1w2Xb1S/g5l2fnTZpf/IClk/HYfJHkooHJduJ4aS
         PqcOeCg3uxkzfIiXkKHpqnTHrDa4nIpq58taNErtoerFWwxbsC5YVzKla3DuoYnAFpIm
         6aGkpvnkjfCLHI6lLlO8bY9I9U/IhObgpWZDXe1h1dfARwg9Rh3Ph4tdpx7a72QoPKBD
         Ixcdoh8ef3Bq3W1B7INUWF+WJyAUt3Af9aKab7974EB/AP+VnbXZozfLyx8BjjObuAS+
         YR+W+Il+uwOwq11+GWXQOW6lW5H6DPObc8Y1rsRNAw2KHsOUBsOqBLCzMIx774fTlymS
         NkwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=gV8fTFzQ9QuQyibPPmknRwrm0cpQSXvIjVeP1F06DNg=;
        b=3UMhiyR4O2lR7G5dhMA1ytpT16DaFpCsZ6y+UPieIZLtaLE/w/OPzqXWcB+QDT0Z9n
         8X6NAwX7jIf99Yr5bvN1CE8B9ewTBwWp2nJ4kbU71XVpow9wRoW2wWvjvpoA0GyrxNkE
         7Vq2pzqhXCvgDbhuRfQO7zRmlcAuWGFor4NUFaQerZKXAbuI+M3XEdDMA0DNclRSwQXE
         uWAadkyK6MQatsyjdHdiXLnH7OmMGq6A8x7eEgBtr+1vDnfx8OK7oq+7meCbQ40qy6/c
         7RN9kXaWxqXgZgHgyPV35YJRdZOfleeEFoWSQANIkmStn7aTBEPkt1p2x2ASrIXmBKcm
         UhOA==
X-Gm-Message-State: ACgBeo2sUMi8m/2840IZn7/XMHV8s44CDzIQzGciZJBa0/MVFlWZQohR
	Vxb7CQZqGhL1rrRudFS+S9hbYU/1msg=
X-Google-Smtp-Source: AA6agR5BK/qFkqEBuGgyTzpznO75iyQspsKyruoPLrI1zWNPN2qwzD3ptUBP6HykL+aZg5DbJ2HMjg==
X-Received: by 2002:a17:906:730d:b0:73d:c8a1:a6ae with SMTP id di13-20020a170906730d00b0073dc8a1a6aemr15738297ejc.540.1662893131309;
        Sun, 11 Sep 2022 03:45:31 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id t8-20020a170906268800b0073dde7c1767sm2810121ejc.175.2022.09.11.03.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 03:45:31 -0700 (PDT)
Date: Sun, 11 Sep 2022 12:45:29 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 01/12] staging: vt6655: Cleanup and rename function
 MACvSetLoopbackMode
Message-ID: <02ce61620e13eb7fd24833e59a288f52bf5b9730.1662890990.git.philipp.g.hortmann@gmail.com>
References: <cover.1662890990.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1662890990.git.philipp.g.hortmann@gmail.com>

Rename function MACvSetLoopbackMode to vt6655_mac_set_loopback_mode and
byLoopbackMode to loopback_mode to avoid CamelCase which is not accepted
by checkpatch.pl. Remove unnecessary declaration of function and made
function static. Change declaration of loopback_mode to shorten code and
remove unnecessary line break.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/mac.c | 17 ++++++++---------
 drivers/staging/vt6655/mac.h |  2 --
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/vt6655/mac.c b/drivers/staging/vt6655/mac.c
index d056df1220d3..567bc38ecfa9 100644
--- a/drivers/staging/vt6655/mac.c
+++ b/drivers/staging/vt6655/mac.c
@@ -13,7 +13,7 @@
  *      vt6655_mac_is_reg_bits_off - Test if All test Bits Off
  *      vt6655_mac_set_short_retry_limit - Set 802.11 Short Retry limit
  *      MACvSetLongRetryLimit - Set 802.11 Long Retry limit
- *      MACvSetLoopbackMode - Set MAC Loopback Mode
+ *      vt6655_mac_set_loopback_mode - Set MAC Loopback Mode
  *      MACvSaveContext - Save Context of MAC Registers
  *      MACvRestoreContext - Restore Context of MAC Registers
  *      MACbSoftwareReset - Software Reset MAC
@@ -152,21 +152,20 @@ void MACvSetLongRetryLimit(struct vnt_private *priv,
  * Parameters:
  *  In:
  *      io_base        - Base Address for MAC
- *      byLoopbackMode  - Loopback Mode
+ *      loopback_mode  - Loopback Mode
  *  Out:
  *      none
  *
  * Return Value: none
  *
  */
-void MACvSetLoopbackMode(struct vnt_private *priv, unsigned char byLoopbackMode)
+static void vt6655_mac_set_loopback_mode(struct vnt_private *priv, u8 loopback_mode)
 {
 	void __iomem *io_base = priv->port_offset;
 
-	byLoopbackMode <<= 6;
+	loopback_mode <<= 6;
 	/* set TCR */
-	iowrite8((ioread8(io_base + MAC_REG_TEST) & 0x3f) | byLoopbackMode,
-		 io_base + MAC_REG_TEST);
+	iowrite8((ioread8(io_base + MAC_REG_TEST) & 0x3f) | loopback_mode, io_base + MAC_REG_TEST);
 }
 
 /*
@@ -476,13 +475,13 @@ bool MACbShutdown(struct vnt_private *priv)
 	void __iomem *io_base = priv->port_offset;
 	/* disable MAC IMR */
 	iowrite32(0, io_base + MAC_REG_IMR);
-	MACvSetLoopbackMode(priv, MAC_LB_INTERNAL);
+	vt6655_mac_set_loopback_mode(priv, MAC_LB_INTERNAL);
 	/* stop the adapter */
 	if (!MACbSafeStop(priv)) {
-		MACvSetLoopbackMode(priv, MAC_LB_NONE);
+		vt6655_mac_set_loopback_mode(priv, MAC_LB_NONE);
 		return false;
 	}
-	MACvSetLoopbackMode(priv, MAC_LB_NONE);
+	vt6655_mac_set_loopback_mode(priv, MAC_LB_NONE);
 	return true;
 }
 
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index a70e75ff78cd..f7d00a251677 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -553,8 +553,6 @@ void vt6655_mac_set_short_retry_limit(struct vnt_private *priv, unsigned char re
 
 void MACvSetLongRetryLimit(struct vnt_private *priv, unsigned char byRetryLimit);
 
-void MACvSetLoopbackMode(struct vnt_private *priv, unsigned char byLoopbackMode);
-
 void MACvSaveContext(struct vnt_private *priv, unsigned char *cxt_buf);
 void MACvRestoreContext(struct vnt_private *priv, unsigned char *cxt_buf);
 
-- 
2.37.3

