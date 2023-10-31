Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B860FD511
	for <linux-staging@lists.linux.dev>; Tue, 31 Oct 2023 05:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYbfs1AJ"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1c9e072472bso37356185ad.2
        for <linux-staging@lists.linux.dev>; Mon, 30 Oct 2023 22:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698730499; x=1699335299; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=chNs6Qc+1FG5MNRfJZOW4RScvr4v+fqdqp2PEyYmdAc=;
        b=iYbfs1AJbUjB5gi02hu/uFpHiTVGIIagVmhfYbAEBdv15STmNc2B8JuMghGyOSxhCp
         af8BG109nlfQbMYCwXpG9HH7NtH2x/1mosaDnPTvdH5iKhxRLqMMSub0AxVBN8+A87Wq
         t7X/VO+t5P6Plzx6EeoP6uzaisYn8FhdpvYIqs948yFR0TtERONNNcqz9QtiZmc49Acr
         lZdf2ko5zvWGaRjCUb9xpaXWg2/JvKbGBx7QCeQSwp7QQFDhfMvqmHzGtAlkZXcA6ZsP
         PQf+IZ18H+3FipGcDvqW52vr4Yy2UQ8dZ/G/ysfhqZJzzOLaSn+aV3cdtKHyVAsy1BVd
         J3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698730499; x=1699335299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=chNs6Qc+1FG5MNRfJZOW4RScvr4v+fqdqp2PEyYmdAc=;
        b=ojPFqR1F5jIFcXnvW7hIKaf+zk3wIQR9yJlOxtN+lxZ2Tz6q2e3n/svkACN/0Nuzzm
         HaYdYdoTOCNDseT62CF7PXrFuMX5bv9DklTOP8mBg8SwGouhDnK5T0xhpG5iiAy1dQ0s
         lAgZbzC+zZ1tFtVwVKriC+pr7ECaayMj2G5zLXYAbjidJjbYgoZb93hXPVHXtzt84XbC
         wTee31yMkx9Rax+olMAW08utelEPxjRvf4/ucsc7zi0oM5BvvmOEf5ChFHZXE2gfe1QW
         39YAP/Vs8NsINgKoNFWX3T5rwu5LFMLknP5iYi1ITV5OSwVkT8bXkdywmTALp9iRfgYH
         Vf1w==
X-Gm-Message-State: AOJu0YxG4oeVoOShIHvidNpqLWQogdn3+J2OCeCHaN2arDbNqZapkiNv
	GhEFJT+Zs7Bn2o2h6WYktd4=
X-Google-Smtp-Source: AGHT+IFNGQ3+AMxG0ca79zSTJ/KrvclsNhqovQ/kVJHj73tDoYlvRBDp51qa+I4nnGMByS1WEcfAng==
X-Received: by 2002:a17:902:a510:b0:1bb:b855:db3c with SMTP id s16-20020a170902a51000b001bbb855db3cmr7369388plq.41.1698730499022;
        Mon, 30 Oct 2023 22:34:59 -0700 (PDT)
Received: from ubuntu.. ([122.182.231.82])
        by smtp.gmail.com with ESMTPSA id b17-20020a170902ed1100b001c0a414695bsm422211pld.43.2023.10.30.22.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 22:34:58 -0700 (PDT)
From: Pavan Bobba <opensource206@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH 09/11] staging: vt6655: Type encoding info dropped from function name "CARDvSafeResetTx"
Date: Tue, 31 Oct 2023 11:04:32 +0530
Message-Id: <785a163ab01555bd0a7ed87484d727560d22cd95.1698730318.git.opensource206@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698730318.git.opensource206@gmail.com>
References: <cover.1698730318.git.opensource206@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

function name "CARDvSafeResetTx" updated like below:

a.type encoding info dropped from name
b.camelcase name replaced by snakecase

Issue found by checkpatch

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 drivers/staging/vt6655/card.c        | 2 +-
 drivers/staging/vt6655/card.h        | 2 +-
 drivers/staging/vt6655/device_main.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 7980b93d2b1e..b249f22246b0 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -382,7 +382,7 @@ void card_radio_power_off(struct vnt_private *priv)
 	vt6655_mac_reg_bits_on(priv->port_offset, MAC_REG_GPIOCTL0, LED_ACTSET);  /* LED issue */
 }
 
-void CARDvSafeResetTx(struct vnt_private *priv)
+void card_safe_reset_tx(struct vnt_private *priv)
 {
 	unsigned int uu;
 	struct vnt_tx_desc *pCurrTD;
diff --git a/drivers/staging/vt6655/card.h b/drivers/staging/vt6655/card.h
index 5ca715b415e8..f52e42564e81 100644
--- a/drivers/staging/vt6655/card.h
+++ b/drivers/staging/vt6655/card.h
@@ -50,7 +50,7 @@ u64 vt6655_get_current_tsf(struct vnt_private *priv);
 u64 card_get_next_tbtt(u64 qwTSF, unsigned short beacon_interval);
 u64 card_get_tsf_offset(unsigned char rx_rate, u64 qwTSF1, u64 qwTSF2);
 unsigned char card_get_pkt_type(struct vnt_private *priv);
-void CARDvSafeResetTx(struct vnt_private *priv);
+void card_safe_reset_tx(struct vnt_private *priv);
 void CARDvSafeResetRx(struct vnt_private *priv);
 void card_radio_power_off(struct vnt_private *priv);
 bool card_set_phy_parameter(struct vnt_private *priv, u8 bb_type);
diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 210c94312310..a1f3dc25ad0e 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -463,7 +463,7 @@ static void device_init_registers(struct vnt_private *priv)
 	/* reset Tx pointer */
 	CARDvSafeResetRx(priv);
 	/* reset Rx pointer */
-	CARDvSafeResetTx(priv);
+	card_safe_reset_tx(priv);
 
 	if (priv->local_id <= REV_ID_VT3253_A1)
 		vt6655_mac_reg_bits_on(priv->port_offset, MAC_REG_RCR, RCR_WPAERR);
-- 
2.34.1

