Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EFF154B1
	for <linux-staging@lists.linux.dev>; Fri, 27 Oct 2023 08:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fReBEXFz"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-584042e7f73so984435eaf.2
        for <linux-staging@lists.linux.dev>; Fri, 27 Oct 2023 01:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698396754; x=1699001554; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odtp1UBA19+ficrtQPWbxsKa6nO8M/UF+tBujmgQ4Mo=;
        b=fReBEXFzVuuwfVNGipoW/ANkvDATUE6FGDMQBP1xaLWc3u3UedJCAo+JuGR6tA1wRc
         Bq214lKbFwM7pD6626NF5sAmcXn4BbHQ4wzC0V9/QhqNL695TW7XN5MhZp76oa8wqSJF
         ebYyfMX7CR4zbr6r0+QlZ3Jk8ZZc2XgbW6PB80PcpwrJvCBCkRFJFQUI6nIIp3aRaJIl
         To2fNF8ORLTMjZhQFpB0YCLBp7irMsB5kmWu775vtFHUt0eNtYBTOVmD4+KvVL90ffS0
         3yWnAir84HldPhKlVPYa0KRs4OZex8TRZAS+HM6jzr8eA0opDWZh5qHNN4YGQ2wXyXm1
         BTnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698396754; x=1699001554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=odtp1UBA19+ficrtQPWbxsKa6nO8M/UF+tBujmgQ4Mo=;
        b=U4RtNTN/yxfOANlzvTZc7b/iJV/V37VpNUTHpggDHyQj66elxFow+syvIBrWMM0wOC
         WRDqVGLeoKvE2+qSPKmY/0fyaxcYodVci14gCAOOz/tDQzkc0fmKhbzEghZYELZVmYeU
         yWGBcUdjp6npPYd50r/4wkddiFOHRnuHWPapksBkk0R4UyhzR38Bi4Xx9pDn2GBp9KVw
         MnA9GgJxGvgVyV0XooVY+nE8lMpApyoVbQAtm3YOVmfI3DI/RpNhLXtktoGFfkKoaLNm
         B9MhMggdk7C/GWtyfe0xZndMKim+aLq4ZM1IhoVx3MEiN9OYQIRao7wOAoQ3/yEIWT0J
         TuGA==
X-Gm-Message-State: AOJu0YzWZvipsfwpjDwSeKtJKAgx9I/gJkm2CnzLADgxhs0q6GqOSOKD
	mikQQnnFADB1XH88+i+ldPk=
X-Google-Smtp-Source: AGHT+IElPngMjVW0JTG2kjBPqUelLmUVA/04PHfBS5k0JGhHYPZWDZ5RsfjL2YcyLck+gCv2sxgv4Q==
X-Received: by 2002:a05:6358:881f:b0:169:81e:b6e0 with SMTP id hv31-20020a056358881f00b00169081eb6e0mr2832291rwb.24.1698396753849;
        Fri, 27 Oct 2023 01:52:33 -0700 (PDT)
Received: from ubuntu.. ([122.174.106.169])
        by smtp.gmail.com with ESMTPSA id h12-20020a63b00c000000b0055c178a8df1sm698825pgf.94.2023.10.27.01.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 01:52:33 -0700 (PDT)
From: Pavan Bobba <opensource206@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH 08/10] staging: vt6655: Type encoding info dropped from function name "CARDvSetRSPINF"
Date: Fri, 27 Oct 2023 14:21:57 +0530
Message-Id: <63ab11bce827d20cf30eafd874d96128a6e969f8.1698396278.git.opensource206@gmail.com>
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

function name "CARDvSetRSPINF" updated like below:

a.type encoding info dropped from name
b.camelcase name replaced by snakecase

Issue found by checkpatch

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 drivers/staging/vt6655/card.c | 6 +++---
 drivers/staging/vt6655/card.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 7d632d1057c0..56beaf6de488 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -6,7 +6,7 @@
  * Purpose: Provide functions to setup NIC operation mode
  * Functions:
  *      s_vSafeResetTx - Rest Tx
- *      CARDvSetRSPINF - Set RSPINF
+ *      card_set_rspinf - Set RSPINF
  *      CARDvUpdateBasicTopRate - Update BasicTopRate
  *      CARDbAddBasicRate - Add to BasicRateSet
  *      CARDbIsOFDMinBasicRate - Check if any OFDM rate is in BasicRateSet
@@ -267,7 +267,7 @@ bool card_set_phy_parameter(struct vnt_private *priv, u8 bb_type)
 
 	priv->packet_type = card_get_pkt_type(priv);
 
-	CARDvSetRSPINF(priv, bb_type);
+	card_set_rspinf(priv, bb_type);
 
 	return true;
 }
@@ -536,7 +536,7 @@ static unsigned short CARDwGetOFDMControlRate(struct vnt_private *priv,
  *
  * Return Value: None.
  */
-void CARDvSetRSPINF(struct vnt_private *priv, u8 bb_type)
+void card_set_rspinf(struct vnt_private *priv, u8 bb_type)
 {
 	union vnt_phy_field_swap phy;
 	unsigned char byTxRate, byRsvTime;      /* For OFDM */
diff --git a/drivers/staging/vt6655/card.h b/drivers/staging/vt6655/card.h
index 6564682bcd56..b36e276c699b 100644
--- a/drivers/staging/vt6655/card.h
+++ b/drivers/staging/vt6655/card.h
@@ -39,7 +39,7 @@
 
 struct vnt_private;
 
-void CARDvSetRSPINF(struct vnt_private *priv, u8 bb_type);
+void card_set_rspinf(struct vnt_private *priv, u8 bb_type);
 void CARDvUpdateBasicTopRate(struct vnt_private *priv);
 bool CARDbIsOFDMinBasicRate(struct vnt_private *priv);
 void CARDvSetFirstNextTBTT(struct vnt_private *priv,
-- 
2.34.1

