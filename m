Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222CF47A57
	for <linux-staging@lists.linux.dev>; Wed, 12 Jun 2024 03:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718162563; cv=none; b=aDzA5hFMm1i2Upga674s8CzBpZgZiUE8Q7cMahY76HqJl/43noN7UiDbIgwN5dD4Mqojh8wMs2y/akLysC3zt3AisijAp+QITlGBsd95J19kEgdc1UgwuZ3tbZKzmXYIj25lu223z2Rl09ytMV5fdekF2nVJS6kFJsPZPYWLD+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718162563; c=relaxed/simple;
	bh=yEvhe5zcXooYHpUfZbWvNC4CUpB1uvDEagS/CWcMKl0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LW57rRJf2hIs+2AqPSkpj8VdSuySiBWiG2CJJygeZ3xyeYXQvxWJViVB4DmcHSdDMifgfrX7aovwouvCOXtnAGLAkSploFWZeFWFtbUs9XFyB/vw9t+fpchzdiBRYuyP74HLVcPIRJ7hWzer1xpkQbdEFXcVCWxsmrxRwzj1ESg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=eOoRH1ee; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="eOoRH1ee"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5b97539a4a5so3505515eaf.2
        for <linux-staging@lists.linux.dev>; Tue, 11 Jun 2024 20:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1718162561; x=1718767361; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IAXnGG9HDug0Dq5esLT95FpBApufxXlkCmYmEp4KdDM=;
        b=eOoRH1eey22YTxpp1hf3JfqRNaU/0lmjEVA8jOFBsvik7KQ9AFX0oyZ3HlxYSwPPJr
         gKmKGw4OqN4825Heg6qeOWRMRDKGEGhrhCsLKQMxQpDnKogbfB8Jby311GGcOeeyG+bx
         NcNrkFr78knfCvxZOD3kC8bg+e/zX4aikaJ/FQQeUxc8DGhAs59ePXTO+OSGcxCYdMWr
         Rb+lZLa20EgN3K+h5+33f663LXawhIOfa1o+qsq1M5ENQirYpD1rxnXUN0slZbT/maF9
         TPUSYDNfdCUoqXE95XMJm+QoDRxjZ7B5S0mD/YIiICCSN8ur8SaVGqzhqX570isHNKK+
         0dVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718162561; x=1718767361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IAXnGG9HDug0Dq5esLT95FpBApufxXlkCmYmEp4KdDM=;
        b=pxBuHR7HJRa9XumQcVhdErdpO1ywBVdfvggygg6DCx0XPWuG5KPiKquEz5/qKE58Al
         g1IhnklJInRax4pVbMRH993MdprsS+p9UwfTwFFQTPDUIpj18dtVcASlkpLh673Ze8U/
         AMIDWvdu7WST2xHbehcW3DSszxcu1iemZSTRbvPD0DKlY5PTo60tOC52GkrP/JBEi5Y5
         EmJUYbNNUQVn5bfwKn0NnG5XL1Y9jvU7TSMsIufNeYnHAJud5uOP+WwtAjdYz+hL68xt
         smKNlsWvTPv4cFdrpDcSsvyv2XHijWO82n1hJLwF4PY8V16TL4WBHCLEZPf2Bsag2rYC
         JkrQ==
X-Gm-Message-State: AOJu0YyVr50pc+tb3OEpqClS7jY7magBcJYzPWqlwCrXYHrWxkVb7lFc
	iNeY2hfRo83PVJmhA6kTo0aDt+ZauC8NhcimNvYgjlJ4t8cyxQ8aQnOc6uBK4q8=
X-Google-Smtp-Source: AGHT+IGNzkXfTLzUyM1dxjmWpxPlb3gEuzHU+oLu8U1CS3fxRl2I8x9VOX7JJKwBxiufWm2+wJgIgQ==
X-Received: by 2002:a05:6359:4c86:b0:19f:2c7e:a226 with SMTP id e5c5f4694b2df-19f69cf9c16mr96921355d.5.1718162561096;
        Tue, 11 Jun 2024 20:22:41 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6e8e8a84949sm5635411a12.32.2024.06.11.20.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 20:22:40 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 10/24] Staging: rtl8192e: Rename variable bPacketBW
Date: Tue, 11 Jun 2024 20:22:16 -0700
Message-Id: <20240612032230.9738-11-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240612032230.9738-1-tdavies@darkphysics.net>
References: <20240612032230.9738-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bPacketBW to packet_bw
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No Change
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h              | 2 +-
 drivers/staging/rtl8192e/rtllib_tx.c           | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index a52db6b1fdb5..8dec4e1b89b8 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -903,7 +903,7 @@ void  rtl92e_fill_tx_desc(struct net_device *dev, struct tx_desc *pdesc,
 			  (cb_desc->rts_use_short_preamble ? 1 : 0) :
 			  (cb_desc->rts_use_short_gi ? 1 : 0);
 	if (priv->current_chnl_bw == HT_CHANNEL_WIDTH_20_40) {
-		if (cb_desc->bPacketBW) {
+		if (cb_desc->packet_bw) {
 			pTxFwInfo->TxBandwidth = 1;
 			pTxFwInfo->TxSubCarrier = 0;
 		} else {
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index ab52fd66c705..1f4c1f1f0274 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -120,7 +120,7 @@ struct cb_desc {
 	u8 RTSSC:1;
 
 	u8 rts_bw:1;
-	u8 bPacketBW:1;
+	u8 packet_bw:1;
 	u8 rts_use_short_preamble:1;
 	u8 rts_use_short_gi:1;
 	u8 multicast:1;
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index ba76d2fcc750..a3c211c1b0fa 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -351,7 +351,7 @@ static void rtllib_query_BandwidthMode(struct rtllib_device *ieee,
 {
 	struct rt_hi_throughput *ht_info = ieee->ht_info;
 
-	tcb_desc->bPacketBW = false;
+	tcb_desc->packet_bw = false;
 
 	if (!ht_info->current_ht_support || !ht_info->enable_ht)
 		return;
@@ -363,7 +363,7 @@ static void rtllib_query_BandwidthMode(struct rtllib_device *ieee,
 		return;
 	if (ht_info->cur_bw_40mhz && ht_info->cur_tx_bw40mhz &&
 	    !ieee->bandwidth_auto_switch.forced_tx_20MHz)
-		tcb_desc->bPacketBW = true;
+		tcb_desc->packet_bw = true;
 }
 
 static void rtllib_query_protectionmode(struct rtllib_device *ieee,
-- 
2.30.2

