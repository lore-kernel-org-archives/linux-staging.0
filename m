Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F355D1C6FE8
	for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 02:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752807162; cv=none; b=czkVs0WUMS2CbyvMl/2mB2hXoqOlUgGemVAu26n9iM7/CKtoSQ5X2TioCsZiZWZUX0QGAFS5E7Bn9apeV8g61Y+nNMzLnYoQMzD25of288QL9arunMNe2ICUzuErLPNvHP1hYRsOofnsaSWEgrGYZFdNLHw+NkXOXo5xhCHnrN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752807162; c=relaxed/simple;
	bh=h9GGpNNIpEixTMir1PYqWvBLQrrlkuxtKIziA8p8SMQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XSSoscg/Km31MVIwRPyGn2V2rCkOt3hbhsFN/8gqx0X6fD654O5FS7sAcEMFlaJyokynq3957Fm72v/ra/8qJ7fTTivWC/p6MQZN9vnN6jlN3sjU5bG490R9x4+njB3XlLmXviicwqC3Oaq0gntvU1tgp8aqY1XBkiRqCboLbTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ty3nCoVR; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ty3nCoVR"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6fafb6899c2so19124376d6.0
        for <linux-staging@lists.linux.dev>; Thu, 17 Jul 2025 19:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752807160; x=1753411960; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iDlXE/KCw2qSqLxnWSLl7l0n5eGJ5huDsYk4m27l4sE=;
        b=Ty3nCoVRFGv5PF2bXGE5QPYi5BM7vXHYOAD08QQNxYTTd5RnV8OqPT0XO5/CUDex1/
         92LNjRPFW6GhXoINOU9KdSVyHy+g6xN6p08Diqikx3tpH1GyYn190+5MoOTRjMmjKb3Y
         4IidwoBW4ju0wgTrgxpnEjkud01vDp491MjvCnDlmYRwEmUFYfaWW25drbLi/w1/3uKQ
         6TaWc93ZRXAtKsfQ3lg8kuMg9CvJsPwqiMHaGTEwziwMWDQhpA9q4ZCnRA6vzYWPAkDr
         UiR6qWNQkysQIOIrExz77L9bK7clo9ch2X7grOMYWgAV94g1gNsqaOwXldQs3vJaYiOD
         6QFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752807160; x=1753411960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iDlXE/KCw2qSqLxnWSLl7l0n5eGJ5huDsYk4m27l4sE=;
        b=wWTPxJ94Z0jzh4TyY5qXV5+2eQaSOBwsLqwtBlJYGpNKnmo6jtCwV3c1vwtaoo79wa
         na+FI8H/23z5p8XyTieeYSLdv7TjwuM7kudQ2U5QIxfUxn1UPEy4GSV8lfNpkWkWwnYC
         aow62ax9O8iIuE8fMcJoQUFSz019Oq6jLMhfRA14McHt7aulGYyWOCCHkiVGKMqZZyq7
         3Hm6i9sW2CQXhLME6fWl0xeic0wfZflAd5fmxP/Hs4DQTaHvZDVJcTkUUQvWEHAGZScv
         /jlCncS4oZ9YhSS5KFuEs4Jmv0bLQTxUaBaUroDwHFqY1kQKVV5WbyCZRER5PbcahY9H
         KA4A==
X-Gm-Message-State: AOJu0YxnyS01jcImocFS1sbL3vybyRnEy81HHfQEXRrVpkNYP0lVmQYI
	yg4+ZJFlDUkjmYIt3oWQMqCRrDFOvDyLQCok4hHQXViSxNh0T4Dd5Zy8
X-Gm-Gg: ASbGncuda641pcRV+vKEPYKePncOUC9RhiFj7gHAiNBiqsUdSWzxS812qFYPQoTqUs9
	Eq85ArAkecwCN0s8rWzYpMGEThbvIgANVP59usN/lb1TPkTyh4ppiOstFbtgYoqb/YlhqfjV2vi
	+laeLFNBBB7Z45YSZ+frTCVxiMUnBcTP1tE5icpOi+47vqec9JLlj+CJ1LPgCRas4OvD90dHDyJ
	r7+0wUoA9CC0kv0wF0JPfups2y9v3ouGs/qOpa0TOaQ87n4Yht65makj3ANrEzRmqn08g+/8QHq
	Sd/oS4+H74G4ZZVdUu6trSlnnPQNm4qVhX/DEyvy++pctU0kfJvDz7oq+uKz/jcj4/h897NjRnS
	pzOyNUaaiwOwMDC29GK/iXvRlgv6fsWDVJbUVhWrxtREs/ArJ0UA=
X-Google-Smtp-Source: AGHT+IHZtvH+GBGMsUktTpIH4Ks+9vJ3s3yC14qfjb2oKzvv4uW0x2T0ny6TWVGFGCML8OmP7FzqEw==
X-Received: by 2002:a05:6214:1bcc:b0:704:f7d8:7032 with SMTP id 6a1803df08f44-705055a32bemr84490596d6.23.1752807159696;
        Thu, 17 Jul 2025 19:52:39 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7051ba9d63asm2710226d6.89.2025.07.17.19.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 19:52:39 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Subject: [PATCH v5 1/1] staging: rtl8192u: Rename ChannelPlan to channel_plan and fix index name
Date: Fri, 18 Jul 2025 02:52:06 +0000
Message-Id: <20250718025206.171361-2-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250718025206.171361-1-vivek.balachandhar@gmail.com>
References: <20250718025206.171361-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch renames the global array ChannelPlan to channel_plan
to follow Linux kernel coding style. Also renamed the index
variable from channel_plan to chan_plan_idx to avoid
shadowing and improve readability.

v2:
- Fixed Cc list to include Greg and staging list

v3:
- Removed EXTRAVERSION = -vivek from Makefile.

v4:
- Tested and verified Makefile EXTRAVERSION removal does not break build
- Removed EXTRAVERSION = -vivek to keep version clean

v5:
- Renamed chan_plan_idx to chan per Dan Carpenter's feedback.
- Removed mistaken blank line addition in init/main.c.
- Removed unrelated changes to Makefile and init/main.c.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8192u/r8192U_core.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
index 0a60ef201..092f36383 100644
--- a/drivers/staging/rtl8192u/r8192U_core.c
+++ b/drivers/staging/rtl8192u/r8192U_core.c
@@ -120,7 +120,7 @@ struct CHANNEL_LIST {
 	u8	Len;
 };
 
-static struct CHANNEL_LIST ChannelPlan[] = {
+static struct CHANNEL_LIST channel_plan[] = {
 	/* FCC */
 	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 36, 40, 44, 48, 52, 56, 60, 64, 149, 153, 157, 161, 165}, 24},
 	/* IC */
@@ -145,12 +145,12 @@ static struct CHANNEL_LIST ChannelPlan[] = {
 	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, 14}
 };
 
-static void rtl819x_set_channel_map(u8 channel_plan, struct r8192_priv *priv)
+static void rtl819x_set_channel_map(u8 chan, struct r8192_priv *priv)
 {
 	int i, max_chan = -1, min_chan = -1;
 	struct ieee80211_device *ieee = priv->ieee80211;
 
-	switch (channel_plan) {
+	switch (chan) {
 	case COUNTRY_CODE_FCC:
 	case COUNTRY_CODE_IC:
 	case COUNTRY_CODE_ETSI:
@@ -172,15 +172,17 @@ static void rtl819x_set_channel_map(u8 channel_plan, struct r8192_priv *priv)
 				 "unknown rf chip, can't set channel map in function:%s()\n",
 				 __func__);
 		}
-		if (ChannelPlan[channel_plan].Len != 0) {
+		if (channel_plan[chan].Len != 0) {
 			/* Clear old channel map */
 			memset(GET_DOT11D_INFO(ieee)->channel_map, 0,
 			       sizeof(GET_DOT11D_INFO(ieee)->channel_map));
 			/* Set new channel map */
-			for (i = 0; i < ChannelPlan[channel_plan].Len; i++) {
-				if (ChannelPlan[channel_plan].Channel[i] < min_chan || ChannelPlan[channel_plan].Channel[i] > max_chan)
+			for (i = 0; i < channel_plan[chan].Len; i++) {
+				if (channel_plan[chan].Channel[i] < min_chan ||
+					channel_plan[chan].Channel[i] > max_chan)
 					break;
-				GET_DOT11D_INFO(ieee)->channel_map[ChannelPlan[channel_plan].Channel[i]] = 1;
+				GET_DOT11D_INFO(ieee)->channel_map
+					[channel_plan[chan].Channel[i]] = 1;
 			}
 		}
 		break;
-- 
2.39.5

