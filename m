Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51D13717A;
	Mon, 16 Oct 2023 23:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JKSF8FFh"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-d9a389db3c7so4308971276.1;
        Mon, 16 Oct 2023 16:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697497264; x=1698102064; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2IYm2IJHgZqgLhrQSi41vFLt6AS98aZ4cbdFPTivNc=;
        b=JKSF8FFhnIj0HTujHh2okuSPfrpBwrNPLw3h9JyZ5YJZq3Q/6yZ1hU9+vR8dJ4VQz9
         /ER8LFZQkc6IC8KOW6rdTUu4HjoYYIYuGAgfhg74qKXW7qvypEARZ1w/TewuMpkPjASf
         Rba+znlgbuXLDP5ltVcMskkpO16uQg17GHQcBS9zypk3Ow76OeT1IgepheLzU8BR9UK2
         oAG2WLbmtc6U1ogM4i9pK/SrisrnQ/HBOi68/fGu15pYeh4fqa1nldYJN++3hX6fklfg
         Sg7DkV+j1qxD6iXuE9rdDVehICjhbnq8Byfgz5bMop9XB2S10t5MwnKk6cK+v6DGMezo
         /kkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697497264; x=1698102064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2IYm2IJHgZqgLhrQSi41vFLt6AS98aZ4cbdFPTivNc=;
        b=j0rxsTN1MB7tB6bZtgnaGqrNVhkMthNEHo9ZqCE1qpxqdIzPGttvplogjCWeJPKQSJ
         0H2KiaBS2ZpFYozydv3Fg5ViI6TxLWbe/HYlJt7IVozFYEtgPUSKVVXi9TAf1VmkhKf4
         EbJUiO27NoSArjZGwUmYUDRnFfgTLzuMNazIb+JSbYpiVMmO2h89K3fvlZLH/TxuuHUn
         GezbbHzqiN8UBIuEsuF4xEf9fZTvu9uY77MV508gvSaNvmcbDNsqttq5/o3Zo3XLT4+S
         Up+edjghYIPMtVFRXckcdJOQWd/nznMwz5J8xvCRHPc+ZkgVGXXbU6fdLwOG8EeaRpgU
         RcXg==
X-Gm-Message-State: AOJu0YxOzTI1TQFFoZ9rQkwPxE1iI2Jsd0VgDmwS8P7i4QlSx96pR3sN
	265TxCzRvK4D9+ptlweyerk=
X-Google-Smtp-Source: AGHT+IG4ayR7mON0S7ILkqhGHB6oE0NjhKErUM+Z2bQdBiIEjCzb3eKC3mvznAWPh9EghWnobNp3ew==
X-Received: by 2002:a25:9004:0:b0:d9a:45e7:c7f1 with SMTP id s4-20020a259004000000b00d9a45e7c7f1mr105065ybl.30.1697497263716;
        Mon, 16 Oct 2023 16:01:03 -0700 (PDT)
Received: from gilbert-PC ([105.112.31.148])
        by smtp.gmail.com with ESMTPSA id 5-20020a250905000000b00d9b33e0b952sm58047ybj.8.2023.10.16.16.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 16:01:03 -0700 (PDT)
From: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
To: forest@alittletooquiet.net,
	gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gilbert Adikankwu <gilbertadikankwu@gmail.com>
Subject: [PATCH 3/4] staging: vt6655: Rename variable byCurPwr
Date: Mon, 16 Oct 2023 23:58:56 +0100
Message-Id: <4c24962988ac990ae21c95e4a1754cfabfd2db8d.1697495598.git.gilbertadikankwu@gmail.com>
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
with snakecase

Mute checkpatch.pl error:

CHECK: Avoid CamelCase: <byCurPwr>

Signed-off-by: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
---
 drivers/staging/vt6655/channel.c     | 4 ++--
 drivers/staging/vt6655/device.h      | 2 +-
 drivers/staging/vt6655/device_main.c | 2 +-
 drivers/staging/vt6655/rf.c          | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vt6655/channel.c b/drivers/staging/vt6655/channel.c
index 7b864136a0a8..771c1364b0f0 100644
--- a/drivers/staging/vt6655/channel.c
+++ b/drivers/staging/vt6655/channel.c
@@ -118,9 +118,9 @@ bool set_channel(struct vnt_private *priv, struct ieee80211_channel *ch)
 		/* set HW default power register */
 		VT6655_MAC_SELECT_PAGE1(priv->port_offset);
 		RFbSetPower(priv, RATE_1M, priv->current_ch);
-		iowrite8(priv->byCurPwr, priv->port_offset + MAC_REG_PWRCCK);
+		iowrite8(priv->cur_pwr, priv->port_offset + MAC_REG_PWRCCK);
 		RFbSetPower(priv, RATE_6M, priv->current_ch);
-		iowrite8(priv->byCurPwr, priv->port_offset + MAC_REG_PWROFDM);
+		iowrite8(priv->cur_pwr, priv->port_offset + MAC_REG_PWROFDM);
 		VT6655_MAC_SELECT_PAGE0(priv->port_offset);
 
 		spin_unlock_irqrestore(&priv->lock, flags);
diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index b3ac6237010b..6df1694d556b 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -264,7 +264,7 @@ struct vnt_private {
 	/* For RF Power table */
 	unsigned char byCCKPwr;
 	unsigned char byOFDMPwrG;
-	unsigned char byCurPwr;
+	unsigned char cur_pwr;
 	char	 byCurPwrdBm;
 	unsigned char abyCCKPwrTbl[CB_MAX_CHANNEL_24G + 1];
 	unsigned char abyOFDMPwrTbl[CB_MAX_CHANNEL + 1];
diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index b654fc24d725..2152c6850e61 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -359,7 +359,7 @@ static void device_init_registers(struct vnt_private *priv)
 	RFbInit(priv);
 
 	/* Get Desire Power Value */
-	priv->byCurPwr = 0xFF;
+	priv->cur_pwr = 0xFF;
 	priv->byCCKPwr = SROMbyReadEmbedded(priv->port_offset, EEP_OFS_PWR_CCK);
 	priv->byOFDMPwrG = SROMbyReadEmbedded(priv->port_offset,
 					      EEP_OFS_PWR_OFDMG);
diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
index bf9a10563b12..d319ec21c97b 100644
--- a/drivers/staging/vt6655/rf.c
+++ b/drivers/staging/vt6655/rf.c
@@ -438,12 +438,12 @@ bool RFbSetPower(struct vnt_private *priv, unsigned int rate, u16 uCH)
 		break;
 	}
 
-	if (priv->byCurPwr == byPwr)
+	if (priv->cur_pwr == byPwr)
 		return true;
 
 	ret = RFbRawSetPower(priv, byPwr, rate);
 	if (ret)
-		priv->byCurPwr = byPwr;
+		priv->cur_pwr = byPwr;
 
 	return ret;
 }
-- 
2.34.1

