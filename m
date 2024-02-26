Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3111C21A0D
	for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 03:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708919806; cv=none; b=XX9Opf2A1JvQxnFqfTbin1RfQ88EIF3r2NANfSglxaRsj4uOzr9X2+Nni35IG60XWFYNZlii5hn9LiJhrP8G9K5w1VdFqpTPOaqMletX4/mUl+pi8w5+j5O0tT0h2kQJ3IgnNzBZxRgO0JDdEd+RoiNhvdFTPIeBG7T0ldegFmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708919806; c=relaxed/simple;
	bh=+bfyLssgh9QfNNLZN3qPFtAp9PFPZMfPbg+HNh2vzHI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AhfTINUys4eejTfblRZvnW2OioHrdq4VWkLf5bOy31ImYKsTAt97wHOPVyZBPrFZEXEC0A12KtGuBiTmavXemAhFWE+7yDdiKzx53edYA6pRcJPEtX3DTfD0RpfJcPfErK8c9NemqSPAc2iO+mMCySzAYolIGxuGQSxPyDTLbXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=QWfi0mMh; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="QWfi0mMh"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5d8b70b39efso2838175a12.0
        for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 19:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1708919804; x=1709524604; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tkdpdseH4pwO/YOLWCepBZaFQOdyRtvEOXrnxx5LS6o=;
        b=QWfi0mMhKgdBEYe6OMENdid2AolEwuGM0Gv//6f5KB/tzCHHZm7OFaLLzlAQ4zxdNg
         T0tArYVHeLkI4sMVUQNYN9v/rq15d2N0Mkh4H2rcJteG30jVNzVcQMnqe39lqt8lBTh5
         /sjqLh4qXnp86bBV2pmNvwVKzCPGTWHFSamzITQrOxyNrsJ+a4xI3H+jmnD7ZJOwX2l/
         SztyhRBvfFeQ/hyM7A0XJ1WS5A3KOGQ1HS++GGWUXcJPH9q0i9hvWWuxGjvWiDOdHYq7
         L4DOVrPfJpG/eAdDIw7t9QqGNH9WVzx5LVK5n1Cbtiy83jFVvfOQM0+bU++pzjOXZAnQ
         ebOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708919804; x=1709524604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tkdpdseH4pwO/YOLWCepBZaFQOdyRtvEOXrnxx5LS6o=;
        b=fZn83xLBkD/o0Ljwjw+7Pz5tLe1NYQ+Wfx2hVdDw+5Z1vA9DJrumaiyPowudKW2Pbc
         hJ9QreCxESEZYpHhygPB3Sw6euBZq7PaYuD47ncozarR4YC4znpw60SixTQ3FkiMDP0K
         rVtfl6/QtP1RdasnP9yW0ndV5eDfUA4gfFitfKLxdAkrnqXrwjbQekEOp+9fLD8nei87
         +p+ids/UbOuyXTGJWa3/+V81yBzZ+aZyPVXNfvQ3qHHh1E/19Ro1DT4I9aZfYc6oxv3P
         SdvffFsTKpX69F7sYNhsM9xOMNhflprR4/5TtDn3kiDqX7fuFljgOlWVwKODE18ozl+W
         /GZA==
X-Gm-Message-State: AOJu0Yw9TCXSgSKh1w3reQXrjZ7nS4e6RSqRBSA0kXCg2cWenr701VtK
	CdxWdIwiw9N9JClQdYl6olLfgQqIBzxgdhDexJTqMfhliADnMDrEaUpg7oOjRiw=
X-Google-Smtp-Source: AGHT+IEv9idbaaVYCs7tgHpClaiYjJNxPXY5PTCLFn/aVX6S4iK4WrRGGTIS1z6mGpwnlINElDWn+w==
X-Received: by 2002:a17:903:2cd:b0:1db:b09c:6d0 with SMTP id s13-20020a17090302cd00b001dbb09c06d0mr6487932plk.64.1708919804656;
        Sun, 25 Feb 2024 19:56:44 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id kh5-20020a170903064500b001d8a93fa5b1sm2897615plb.131.2024.02.25.19.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 19:56:44 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 19/20] Staging: rtl8192e: Rename boolean variable bHalfWirelessN24GMode
Date: Sun, 25 Feb 2024 19:56:23 -0800
Message-Id: <20240226035624.370443-20-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240226035624.370443-1-tdavies@darkphysics.net>
References: <20240226035624.370443-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename boolean variable bHalfWirelessN24GMode to half_wireless_n24g_mode
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h              | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c      | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 59110da6c4f3..cc7764707e61 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1937,5 +1937,5 @@ bool rtl92e_is_halfn_supported_by_ap(struct net_device *dev)
 	struct r8192_priv *priv = rtllib_priv(dev);
 	struct rtllib_device *ieee = priv->rtllib;
 
-	return ieee->bHalfWirelessN24GMode;
+	return ieee->half_wireless_n24g_mode;
 }
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 7ad8bab23224..aa915d09bd63 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1264,7 +1264,7 @@ struct rtllib_device {
 	int ieee802_1x; /* is IEEE 802.1X used */
 
 	/* WPA data */
-	bool bHalfWirelessN24GMode;
+	bool half_wireless_n24g_mode;
 	int wpa_enabled;
 	int drop_unencrypted;
 	int tkip_countermeasures;
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index b32c190f0113..933672ac8546 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1684,9 +1684,9 @@ static void rtllib_rx_auth_resp(struct rtllib_device *ieee, struct sk_buff *skb)
 		if ((ieee->current_network.mode == WIRELESS_MODE_N_24G) &&
 		    half_support_nmode) {
 			netdev_info(ieee->dev, "======>enter half N mode\n");
-			ieee->bHalfWirelessN24GMode = true;
+			ieee->half_wireless_n24g_mode = true;
 		} else {
-			ieee->bHalfWirelessN24GMode = false;
+			ieee->half_wireless_n24g_mode = false;
 		}
 		rtllib_associate_step2(ieee);
 	} else {
-- 
2.39.2

