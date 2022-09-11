Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB90B7F
	for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 10:45:45 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id s11so8838151edd.13
        for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 03:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date;
        bh=BiDnhWQR6g6Mj6136/H/ZREAE6myEKa/wQMFwuUDLyQ=;
        b=eRATwTDb4tdZl8oa9NPKs8lcb0bCZCR2qPAK+hhwflqa+1bjo8vEqFT62P2dNrR91T
         VeG7EAcrDCeBLmtLmiVar8MHMUJM1ZNd2Pnocpo/BN52kAqshEQ2wyMYA40CPCpQ5Reo
         l9j6MvTe+woEFXtCuCeXES9JoWfzA2aNKsQ0E87nBzTPEzRp0d0GOPKMWkeTHLHhSXfo
         a/kzf3+FFNVamDb18sry+56J+4y7Z/SMBUGZtTAhDDtO3s1n+vhwyb701vygyeim9boG
         aUxHVthaozlWrdFHvZmMxap/ElLmqOXGpkXzff8Za7Bu6p3nnLk/649NKsggI9leQ0x9
         mjfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=BiDnhWQR6g6Mj6136/H/ZREAE6myEKa/wQMFwuUDLyQ=;
        b=bGxRTGzPXMu8KUwF4IO0jNC8YHWuwA5/aAq84D2plg4O5hD9oUL0qxOC9IHFfzV9EZ
         C7D6dYqTjDBBTrGbiGb7izKo/8P/CEGFZ7GwQLxc/q18kgXIMw4is3rAmOf3fMWZO3CG
         EteU+QwGRrjDP6wkUApHBuGvbihKKcqHYVGUMO8f40vpbAMEsXCXACiTgGceFGjP26DL
         y3raThLfrYPlmI9Jb6fX37irSqhMGcYW1Tfrg29SGsMjkDJrB8fKvt8PakwfCJoJyCxt
         ebp7VaVA+GbSgba626Y8bugq/V4rAPaQC3gLhAB0RsvogbhR63eCXcFlCmB4wcru2u3X
         D8Og==
X-Gm-Message-State: ACgBeo3ZoK6voIyw4hbxNBvWoSQDOnp9Ke6r1oGwFf3inxhUNkvn0RhU
	uTTr+90fuQDZsslpF1atxyg=
X-Google-Smtp-Source: AA6agR7diDymzbq2G68+mWq3Lvc6HGGKCvrDd/8LzkIi42v4ywsAulBhrUOfN+7r9ZDHAVhpeGASXQ==
X-Received: by 2002:a05:6402:254b:b0:451:2b1d:d82c with SMTP id l11-20020a056402254b00b004512b1dd82cmr8013158edb.343.1662893144040;
        Sun, 11 Sep 2022 03:45:44 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id e7-20020a170906314700b007708130c287sm2840318eje.40.2022.09.11.03.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 03:45:43 -0700 (PDT)
Date: Sun, 11 Sep 2022 12:45:42 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 02/12] staging: vt6655: Cleanup and rename function
 MACvSaveContext
Message-ID: <f514711695f1eafde9996edcc246da2adcd5f9c5.1662890990.git.philipp.g.hortmann@gmail.com>
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

Rename function MACvSaveContext to vt6655_mac_save_context to avoid
CamelCase which is not accepted by checkpatch.pl. Remove unnecessary
declaration of function and make function static. Change declaration of
cxt_buf to shorten code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/mac.c | 6 +++---
 drivers/staging/vt6655/mac.h | 1 -
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vt6655/mac.c b/drivers/staging/vt6655/mac.c
index 567bc38ecfa9..092b1fffcfa1 100644
--- a/drivers/staging/vt6655/mac.c
+++ b/drivers/staging/vt6655/mac.c
@@ -14,7 +14,7 @@
  *      vt6655_mac_set_short_retry_limit - Set 802.11 Short Retry limit
  *      MACvSetLongRetryLimit - Set 802.11 Long Retry limit
  *      vt6655_mac_set_loopback_mode - Set MAC Loopback Mode
- *      MACvSaveContext - Save Context of MAC Registers
+ *      vt6655_mac_save_context - Save Context of MAC Registers
  *      MACvRestoreContext - Restore Context of MAC Registers
  *      MACbSoftwareReset - Software Reset MAC
  *      MACbSafeRxOff - Turn Off MAC Rx
@@ -181,7 +181,7 @@ static void vt6655_mac_set_loopback_mode(struct vnt_private *priv, u8 loopback_m
  * Return Value: none
  *
  */
-void MACvSaveContext(struct vnt_private *priv, unsigned char *cxt_buf)
+static void vt6655_mac_save_context(struct vnt_private *priv, u8 *cxt_buf)
 {
 	void __iomem *io_base = priv->port_offset;
 
@@ -303,7 +303,7 @@ bool MACbSafeSoftwareReset(struct vnt_private *priv)
 	 * reset, then restore register's value
 	 */
 	/* save MAC context */
-	MACvSaveContext(priv, abyTmpRegData);
+	vt6655_mac_save_context(priv, abyTmpRegData);
 	/* do reset */
 	bRetVal = MACbSoftwareReset(priv);
 	/* restore MAC context, except CR0 */
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index f7d00a251677..1752905d7df0 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -553,7 +553,6 @@ void vt6655_mac_set_short_retry_limit(struct vnt_private *priv, unsigned char re
 
 void MACvSetLongRetryLimit(struct vnt_private *priv, unsigned char byRetryLimit);
 
-void MACvSaveContext(struct vnt_private *priv, unsigned char *cxt_buf);
 void MACvRestoreContext(struct vnt_private *priv, unsigned char *cxt_buf);
 
 bool MACbSoftwareReset(struct vnt_private *priv);
-- 
2.37.3

