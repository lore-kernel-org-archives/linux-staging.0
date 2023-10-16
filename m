Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4813717A;
	Mon, 16 Oct 2023 23:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dwq/Rcbo"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5a8628e54d4so16869927b3.0;
        Mon, 16 Oct 2023 16:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697497260; x=1698102060; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=izdWRaFanHQ8azSd91/9giaIXLaVsk5MY9ErGFWUe5M=;
        b=dwq/Rcbo+E0HbD88bGJkardk8kSsrJJZ/TVCEFdMM1PxOgENKHYuPLk8bjTO1/912u
         J2vfbBC87Y6mXFQ3/uWGfxKWrgYdi9KYmjTN082DkyJb2yJBXJUIj9q2Q0Zs6qI6q9Ad
         X1P53fpFRxJTRMkVP8Dpewlvrwqzb0V4G4XdfyKYd0Ch/nUoQy5RPbZ4AJ9zoOnOrxGW
         qWS6IspfyAfEs8MQLk15nPHizUd/nBUYVZlk1nSlXPcXEl4rq1V23veA5ZkswtAAh07R
         7T1jhdjFNExLHFmg/2BRoREosMXFaZs6ItaiLlsESg0ITUiFHFuxkgF4K6JkM2igug3X
         JZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697497260; x=1698102060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=izdWRaFanHQ8azSd91/9giaIXLaVsk5MY9ErGFWUe5M=;
        b=R+KgYnrDktPt9yywF0bO/lYPaAN7itDMre+E6CgnXdPJYauoUI3FD2VKi/8lOZ8HJM
         KNnuDMiLHbJYR9/M9ojXthSc9PA2uw0wYPVlyBxxWqjxS5wCD1ySuez4GoW4CQvLzzpF
         SyhtIVZnmIwyiukhyzzt7Cv+5zcE9zVnzMRa5WuPb5Ci+4IVKHqsdt6uXmoCfZ11kN5/
         r8+uaW7a6MeGCavvkfSkeRrDStE1oJCu50TUWCVdheiyZTQWB//hepVyLIf5I1aJZNdG
         BNyQ7nqZfF55v7F5e/swLUML0x6mbelLH4oI8MiB6Mi1QIsFeFkRDbvGK2dEZKSkEfxz
         k7LQ==
X-Gm-Message-State: AOJu0YyMUgSmRla0nMwfKgtu7/wfpe+mjw0ooGXw+WhdNi1SBjgqF+xJ
	3eWni3cQrvypscWcsHj853ErTdQIo+41Ku3ey7M=
X-Google-Smtp-Source: AGHT+IGrVAqh6QjbMlQ3vwhEyVA44SEHSnxHA6AsEjAtj9K68hmeeE0LdYwAZbDF0IhlVXgahW6Giw==
X-Received: by 2002:a81:a00c:0:b0:5a7:fcad:e865 with SMTP id x12-20020a81a00c000000b005a7fcade865mr141193ywg.2.1697497259815;
        Mon, 16 Oct 2023 16:00:59 -0700 (PDT)
Received: from gilbert-PC ([105.112.31.148])
        by smtp.gmail.com with ESMTPSA id m5-20020a81d245000000b005a815346d95sm91339ywl.71.2023.10.16.16.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 16:00:59 -0700 (PDT)
From: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
To: forest@alittletooquiet.net,
	gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gilbert Adikankwu <gilbertadikankwu@gmail.com>
Subject: [PATCH 2/4] staging: vt6655: Rename variable byCurrentCh
Date: Mon, 16 Oct 2023 23:58:55 +0100
Message-Id: <cd4c073d0e67e2ce6ed9f38a7add9bbd2fe760ce.1697495598.git.gilbertadikankwu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697495597.git.gilbertadikankwu@gmail.com>
References: <cover.1697495597.git.gilbertadikankwu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove byte Type encoding "by" from variable name and replace camelcase
with snakecase.

Mute checkpatch.pl error:

CHECK: Avoid CamelCase: <byCurrentCh>

Signed-off-by: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
---
 drivers/staging/vt6655/channel.c | 12 ++++++------
 drivers/staging/vt6655/device.h  |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/vt6655/channel.c b/drivers/staging/vt6655/channel.c
index c11bc2dbc356..7b864136a0a8 100644
--- a/drivers/staging/vt6655/channel.c
+++ b/drivers/staging/vt6655/channel.c
@@ -82,7 +82,7 @@ bool set_channel(struct vnt_private *priv, struct ieee80211_channel *ch)
 {
 	bool ret = true;
 
-	if (priv->byCurrentCh == ch->hw_value)
+	if (priv->current_ch == ch->hw_value)
 		return ret;
 
 	/* Set VGA to max sensitivity */
@@ -100,7 +100,7 @@ bool set_channel(struct vnt_private *priv, struct ieee80211_channel *ch)
 	 * it is for better TX throughput
 	 */
 
-	priv->byCurrentCh = ch->hw_value;
+	priv->current_ch = ch->hw_value;
 	ret &= RFbSelectChannel(priv, priv->rf_type,
 				ch->hw_value);
 
@@ -117,9 +117,9 @@ bool set_channel(struct vnt_private *priv, struct ieee80211_channel *ch)
 
 		/* set HW default power register */
 		VT6655_MAC_SELECT_PAGE1(priv->port_offset);
-		RFbSetPower(priv, RATE_1M, priv->byCurrentCh);
+		RFbSetPower(priv, RATE_1M, priv->current_ch);
 		iowrite8(priv->byCurPwr, priv->port_offset + MAC_REG_PWRCCK);
-		RFbSetPower(priv, RATE_6M, priv->byCurrentCh);
+		RFbSetPower(priv, RATE_6M, priv->current_ch);
 		iowrite8(priv->byCurPwr, priv->port_offset + MAC_REG_PWROFDM);
 		VT6655_MAC_SELECT_PAGE0(priv->port_offset);
 
@@ -127,9 +127,9 @@ bool set_channel(struct vnt_private *priv, struct ieee80211_channel *ch)
 	}
 
 	if (priv->byBBType == BB_TYPE_11B)
-		RFbSetPower(priv, RATE_1M, priv->byCurrentCh);
+		RFbSetPower(priv, RATE_1M, priv->current_ch);
 	else
-		RFbSetPower(priv, RATE_6M, priv->byCurrentCh);
+		RFbSetPower(priv, RATE_6M, priv->current_ch);
 
 	return ret;
 }
diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index b166d296b82d..b3ac6237010b 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -239,7 +239,7 @@ struct vnt_private {
 	bool bIsBeaconBufReadySet;
 	unsigned int	cbBeaconBufReadySetCnt;
 	bool bFixRate;
-	u16 byCurrentCh;
+	u16 current_ch;
 
 	bool bAES;
 
-- 
2.34.1

