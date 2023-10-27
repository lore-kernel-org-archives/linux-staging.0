Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF982154AC
	for <linux-staging@lists.linux.dev>; Fri, 27 Oct 2023 08:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c8/cO6SS"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-581de3e691dso1017553eaf.3
        for <linux-staging@lists.linux.dev>; Fri, 27 Oct 2023 01:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698396750; x=1699001550; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qt5cbLVG/omYbe37e1faZ93UM/A9SfQku0KpypeCMxg=;
        b=c8/cO6SSwFYGt2TIwfDnCLppF7rJTFbt//hhodL1zYB+/YpSrF2uHx6sboBLmfUowv
         uYZfgM5SUHs6lvRhS02OUwA6nz22MxYPDS7IW6MT1lYVdefDyKBTr3UmGP0mIDSyzxsu
         azgXUa2/eQ3LTOY6c0U+mHUdx4PExm5MD1O/PO0JvJz4tvPQBJhbQsQUsjRMuSwU0oiT
         W+vxctIhkeF+oS+1LZtO/0lU1W03OUy74A8LkoIz5SSrvHLFoea3toznGY24Dbjs6ByB
         LJDpDWLFbGfPc/WnlVNDcoHczVs1gtvr/lR5GsJQ0z9QRMX3oDcFLnXFiRE0bWz2FvRy
         IZ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698396750; x=1699001550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qt5cbLVG/omYbe37e1faZ93UM/A9SfQku0KpypeCMxg=;
        b=hFKfLP1ZjA0+xRQRVTwC+RHfoS/pWR5rhFOGpmcgh0cKb0/qAuY/D8cmZ+NKSK3rl6
         p8m6dnThUvIMXX8bKEEi+JSIDDZuAPKduL5NcCRL+cKsRzZKZ4Om7/I0zpT65lsbrUFr
         zIG+DQ2QwuPnFXqptUhCgE2ZCSzXBQQef6syyRbll5MzZH3yGSgmM3/rMvL3vE7q8tkK
         6akhsXdfGp64nmEYZVVLqu14hjdH5npgpWfCH0QjbioJLYEwt8zA6q0AinVdrWCekoty
         j7jsDxVuw3WYMWumR+soOdXxMGpvHf/UcJZqyFVU86lRzyXfc9pUCAgycG0ZuicbrNcK
         HH6w==
X-Gm-Message-State: AOJu0Yx/gyBvtRxFOn363XjOWtXjojOGgF7yoU5w+blwPjaVa9xXfstJ
	tyQnMsfLP7fsjM0Rc+/bM4aMnPiuCbE=
X-Google-Smtp-Source: AGHT+IGrfpg0unlf6WB5+iDDQzGUt0B3wt5mtqV2QaYEGX2UU/qLr34soMOKdnr20FHJfwoz0QbI4w==
X-Received: by 2002:a05:6358:7252:b0:168:d31f:9fe3 with SMTP id i18-20020a056358725200b00168d31f9fe3mr2847686rwa.23.1698396749436;
        Fri, 27 Oct 2023 01:52:29 -0700 (PDT)
Received: from ubuntu.. ([122.174.106.169])
        by smtp.gmail.com with ESMTPSA id h12-20020a63b00c000000b0055c178a8df1sm698825pgf.94.2023.10.27.01.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 01:52:28 -0700 (PDT)
From: Pavan Bobba <opensource206@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH 06/10] staging: vt6655: Type encoding info dropped from variable name "byPacketType"
Date: Fri, 27 Oct 2023 14:21:55 +0530
Message-Id: <308813545f9364da18dfc3cdb051ed59eca18f7f.1698396278.git.opensource206@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698396278.git.opensource206@gmail.com>
References: <cover.1698396278.git.opensource206@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

variable name "byPacketType" updated like below:

a.type encoding info dropped from name
b.camelcase name replaced by snakecase

Issue found by checkpatch

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 drivers/staging/vt6655/card.c        | 2 +-
 drivers/staging/vt6655/device.h      | 2 +-
 drivers/staging/vt6655/device_main.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 4f73da832b6a..c58a25032a03 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -265,7 +265,7 @@ bool card_set_phy_parameter(struct vnt_private *priv, u8 bb_type)
 		iowrite8(priv->cw_max_min, priv->port_offset + MAC_REG_CWMAXMIN0);
 	}
 
-	priv->byPacketType = CARDbyGetPktType(priv);
+	priv->packet_type = CARDbyGetPktType(priv);
 
 	CARDvSetRSPINF(priv, bb_type);
 
diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index 7773b19a5788..d9ee0b7401fe 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -188,7 +188,7 @@ struct vnt_private {
 	unsigned char cw_max_min;
 
 	u8		byBBType; /* 0:11A, 1:11B, 2:11G */
-	u8		byPacketType; /*
+	u8		packet_type; /*
 				       * 0:11a,1:11b,2:11gb (only CCK
 				       * in BasicRate), 3:11ga (OFDM in
 				       * Basic Rate)
diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index c6627c10a462..17a323800ce9 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -177,7 +177,7 @@ device_set_options(struct vnt_private *priv)
 	priv->byShortRetryLimit = priv->opts.short_retry;
 	priv->byLongRetryLimit = priv->opts.long_retry;
 	priv->byBBType = priv->opts.bbp_type;
-	priv->byPacketType = priv->byBBType;
+	priv->packet_type = priv->byBBType;
 	priv->byAutoFBCtrl = AUTO_FB_0;
 	priv->update_bbvga = true;
 	priv->preamble_type = 0;
-- 
2.34.1

