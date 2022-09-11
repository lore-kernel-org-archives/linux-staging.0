Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B427F
	for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 10:46:39 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id e16so10893674wrx.7
        for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 03:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date;
        bh=tt9NMRyw8MMy/Ms0k1vJAa4N/O0yRMe4kg49/O6Uyrk=;
        b=jqWNhxJtKn0Fa20uPv8Z+cGWTHh7J9ViS9ZNsWNOpg5ppGYQHG9xMELvpCwd4MXf8w
         3VFOFuK4d+Vs44exVnuv0+0CFBSB7TrxuNK4OsYJvZVbYoCNMfQ6+2yRZP97MFxx8V5P
         VraY4AnO4TuTKFknV5Z+OoRhuMYqyqkwaUoOyFBQT4g64LtMxoBmrKuVlipac/LMddK+
         OPGcKB3+VMIZ66PzlY8LiuZR2rX0n2wLCuT03OI59c5vAkZNL0k1DnrVEqVxTM/HK0JS
         JXwClV8uHAtGmsThZ/Gkzub5HlpW+lCPHBQmK+b8yRq6PMymtgdQi40yM2L92Tx/Ja3C
         rIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=tt9NMRyw8MMy/Ms0k1vJAa4N/O0yRMe4kg49/O6Uyrk=;
        b=7ucZxP+boy8iRBIYZ2CVILgPJp4UOcHlK3jCwZJ42/PDf8JTR2vYCkghYnlnh8OqRo
         N8CpWUPcLl8xluR227Qb3z9jPrHnVnIWEBKTwOGZ/FVsc8Q6KVyE9+OnBPFeRbP4ndBZ
         lLz6LYhYvv/vvUsJQed6meJW0V+SgMYKJfao51UOh/KJFUPjxOyo7c4h7n+RtRRPoro1
         f2/llZbAahBXoZ3qx4JMBRYPV4oVJiM51LYcECdePSD7J2Tkk9wP/44TliZBZnzfxSOS
         Pw48xyZ4M6cmAe/eH9EX9uDBQIsUq+h4v4LkqgbiSJKML2mdkz+Mj9h6bttNYnRhrVWD
         dVGg==
X-Gm-Message-State: ACgBeo3d4jCAxFGmb+G0Bp0LmzA+90xIaNASTCIW5owqfJGLO9XX7zjy
	0Q1KYvZzHlp1inu+pDdkGyxLj+JilDs=
X-Google-Smtp-Source: AA6agR7iDrtIh98z5LkgQYMMMSANdsEYPawSJdwyt+Gld+aVWp8alfCxw29OjzuwPg+3LMXJbr1/zg==
X-Received: by 2002:adf:a70b:0:b0:226:e1f5:7889 with SMTP id c11-20020adfa70b000000b00226e1f57889mr11985588wrd.108.1662893197732;
        Sun, 11 Sep 2022 03:46:37 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id m35-20020a05600c3b2300b003a845fa1edfsm8287707wms.3.2022.09.11.03.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 03:46:37 -0700 (PDT)
Date: Sun, 11 Sep 2022 12:46:35 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 07/12] staging: vt6655: Rename function MACbSafeStop
Message-ID: <5c91b281dfab75e5ccf13413232ec993a8056af8.1662890990.git.philipp.g.hortmann@gmail.com>
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

Rename function MACbSafeStop to vt6655_mac_safe_stop to avoid CamelCase
which is not accepted by checkpatch.pl. Remove unnecessary declaration
of function and make function static.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/mac.c | 6 +++---
 drivers/staging/vt6655/mac.h | 1 -
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vt6655/mac.c b/drivers/staging/vt6655/mac.c
index 24851fe53683..e1f639787316 100644
--- a/drivers/staging/vt6655/mac.c
+++ b/drivers/staging/vt6655/mac.c
@@ -19,7 +19,7 @@
  *      MACbSoftwareReset - Software Reset MAC
  *      vt6655_mac_safe_rx_off - Turn Off MAC Rx
  *      vt6655_mac_safe_tx_off - Turn Off MAC Tx
- *      MACbSafeStop - Stop MAC function
+ *      vt6655_mac_safe_stop - Stop MAC function
  *      MACbShutdown - Shut down MAC
  *      MACvInitialize - Initialize MAC
  *      MACvSetCurrRxDescAddr - Set Rx Descriptors Address
@@ -432,7 +432,7 @@ static bool vt6655_mac_safe_tx_off(struct vnt_private *priv)
  * Return Value: true if success; otherwise false
  *
  */
-bool MACbSafeStop(struct vnt_private *priv)
+static bool vt6655_mac_safe_stop(struct vnt_private *priv)
 {
 	void __iomem *io_base = priv->port_offset;
 
@@ -474,7 +474,7 @@ bool MACbShutdown(struct vnt_private *priv)
 	iowrite32(0, io_base + MAC_REG_IMR);
 	vt6655_mac_set_loopback_mode(priv, MAC_LB_INTERNAL);
 	/* stop the adapter */
-	if (!MACbSafeStop(priv)) {
+	if (!vt6655_mac_safe_stop(priv)) {
 		vt6655_mac_set_loopback_mode(priv, MAC_LB_NONE);
 		return false;
 	}
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 12b4f8937d14..c6147a4f563e 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -554,7 +554,6 @@ void vt6655_mac_set_short_retry_limit(struct vnt_private *priv, unsigned char re
 void MACvSetLongRetryLimit(struct vnt_private *priv, unsigned char byRetryLimit);
 
 bool MACbSoftwareReset(struct vnt_private *priv);
-bool MACbSafeStop(struct vnt_private *priv);
 bool MACbShutdown(struct vnt_private *priv);
 void MACvInitialize(struct vnt_private *priv);
 void MACvSetCurrRx0DescAddr(struct vnt_private *priv,
-- 
2.37.3

