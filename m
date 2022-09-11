Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C65B7F
	for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 10:46:19 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id d2so10911997wrn.1
        for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 03:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date;
        bh=0hkQhpo1A1tdXsj7hM3SgBaWaZ2bYD8tzutyzKnpV6Y=;
        b=QuTOkaDTihOMWagUS0w0B0LiJt93fzUdDTfNECCTJkZ8NI4HZgUlHrE+gAtMMCwmsY
         ziLJFr8XrHqwGm3YDsov6q4m1/vVk3lH6cJVBwrV0pjFV1DeZxRPjcmxNT++dIqJuNwg
         gS4RnuU8vrtUzmGcKCiqsmITAAK/4K/2LSj887r9uAm4i9iN154G2YRrD/wTWhrF5+q1
         XOyLhEIjWqdZ8T/3ZTyE78bBBv3kWUTuHRnGjlfFK73ehCqO4fju/jUATyX8kvea8aHx
         wSu1XFYa9VH8lBdL8nBsW82JOqdafmDb8Vdp5BDSbdBstJNjDYZqgRINkiD7C/FYE0ZM
         2qUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=0hkQhpo1A1tdXsj7hM3SgBaWaZ2bYD8tzutyzKnpV6Y=;
        b=iOinZW+28ApI0m7iAA/hqqaPQWwRRZlfzfcQP0AqljIBt3PN6BZL4iIYM7Bvw2xMrk
         jEKMcl/nFw/BIcdYcBtqk83XjMw6CbittKkVNBv+Wm1/MxzivbzkP9hWecm+OioEPEXN
         3kznY7Bc1IbSGCRwByuwoa1zTaYYAQ5odwWFTHonOrEQFsCHSkIEIYKvdB3xWopiy9Ia
         el5U9RrSMcCDvOAOyR6jYdVYqfeoISTgjnDZt/zkkO0NXki/ejczWSO4uazbw6T00Dhe
         QL91QjNatlgY5sU0NbLriaC79m4+jNU7oECFNqichFqpMDjZNzLLMPjLp681IdwQkVoP
         HT0w==
X-Gm-Message-State: ACgBeo2/wkjivITkZFbDphte/NNnEYonllfp05xEw2bAqyHRjqq32iwl
	nnHJJ+0TNQ5f6jEgsx8b5F4=
X-Google-Smtp-Source: AA6agR4BPOftbJEfLk/OZLQ9U9wjvjFHpsv5VVUyjn1M1zZ2qDnyf22vqvea0eqz9a6M+WLoZVap3A==
X-Received: by 2002:a5d:6d4f:0:b0:225:63aa:27b2 with SMTP id k15-20020a5d6d4f000000b0022563aa27b2mr12737022wri.599.1662893177794;
        Sun, 11 Sep 2022 03:46:17 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id o22-20020a05600c511600b003a5b6086381sm6263484wms.48.2022.09.11.03.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 03:46:17 -0700 (PDT)
Date: Sun, 11 Sep 2022 12:46:15 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 05/12] staging: vt6655: Rename function MACbSafeRxOff
Message-ID: <0cbcc7205e943393e2873839116d5ffcfb9d3d00.1662890990.git.philipp.g.hortmann@gmail.com>
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

Rename function MACbSafeRxOff to vt6655_mac_safe_rx_off to avoid
CamelCase which is not accepted by checkpatch.pl. Remove unnecessary
declaration of function and make function static.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/mac.c | 8 ++++----
 drivers/staging/vt6655/mac.h | 1 -
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/vt6655/mac.c b/drivers/staging/vt6655/mac.c
index f292a34c23dd..e0216d320235 100644
--- a/drivers/staging/vt6655/mac.c
+++ b/drivers/staging/vt6655/mac.c
@@ -17,7 +17,7 @@
  *      vt6655_mac_save_context - Save Context of MAC Registers
  *      vt6655_mac_restore_context - Restore Context of MAC Registers
  *      MACbSoftwareReset - Software Reset MAC
- *      MACbSafeRxOff - Turn Off MAC Rx
+ *      vt6655_mac_safe_rx_off - Turn Off MAC Rx
  *      MACbSafeTxOff - Turn Off MAC Tx
  *      MACbSafeStop - Stop MAC function
  *      MACbShutdown - Shut down MAC
@@ -322,7 +322,7 @@ static void vt6655_mac_save_soft_reset(struct vnt_private *priv)
  * Return Value: true if success; otherwise false
  *
  */
-bool MACbSafeRxOff(struct vnt_private *priv)
+static bool vt6655_mac_safe_rx_off(struct vnt_private *priv)
 {
 	void __iomem *io_base = priv->port_offset;
 	unsigned short ww;
@@ -438,8 +438,8 @@ bool MACbSafeStop(struct vnt_private *priv)
 
 	vt6655_mac_reg_bits_off(io_base, MAC_REG_TCR, TCR_AUTOBCNTX);
 
-	if (!MACbSafeRxOff(priv)) {
-		pr_debug(" MACbSafeRxOff == false)\n");
+	if (!vt6655_mac_safe_rx_off(priv)) {
+		pr_debug(" vt6655_mac_safe_rx_off == false)\n");
 		vt6655_mac_save_soft_reset(priv);
 		return false;
 	}
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 5dd8644749ec..e6ff860c1bfa 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -554,7 +554,6 @@ void vt6655_mac_set_short_retry_limit(struct vnt_private *priv, unsigned char re
 void MACvSetLongRetryLimit(struct vnt_private *priv, unsigned char byRetryLimit);
 
 bool MACbSoftwareReset(struct vnt_private *priv);
-bool MACbSafeRxOff(struct vnt_private *priv);
 bool MACbSafeTxOff(struct vnt_private *priv);
 bool MACbSafeStop(struct vnt_private *priv);
 bool MACbShutdown(struct vnt_private *priv);
-- 
2.37.3

