Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A568017B418
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 11:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778410978; cv=none; b=TbBx7RfsgMR8r6+ASoNw2OZtB6SSjgrPXytDY08eUIFdjObwUSYCCY6POPERRAlphgnBzwSloCn3vQjP671zDXxW0wBblf6lWEj9hVDiU3ljqem93fKtPjk6TurmqgMERbft0XfWKnCYkBvrf3MXbpURQPfeLEYpPbQ/iMigz9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778410978; c=relaxed/simple;
	bh=lYhKjAVgBz6ueuF/13ivLUzoj8h8gMNPEQ1F5xBpRWU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ECHW7XoGaw8j/YFx3KKCUcEM+bpb6rGP1xeM3zUTr5aKsz5U24KPN1RQIVu/Aa3VqJ0+oXV4AruzdO0Sz6rc0GOb61p6BiDxyH4nVwlIJPIyKB7xDnNu2s207zk+iEeID33apF4kJNshxMKrK1UVyhnz2ZBWor5/e64ytNqZzY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sgqj/PRB; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sgqj/PRB"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2bab82d75fdso18173895ad.2
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 04:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778410976; x=1779015776; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fZwf37m6WLcPRLeIeoM703/GyHu5TsPXwyEzEjiEMC8=;
        b=sgqj/PRB0rMRsVjQPBdMahAYqXJ/wbP8MnS6XToUtrNrujqRXCZBt7kXboGvhmHMJe
         Dnh6MXL9mOD/jJq+kgPwvyG8fAVXqavKe9E/1O6PMbKevr6QirI98ZWR/4CG3iAdz6PO
         wVwLergMfqN61CN/seOX+FV2t7LgN8niyHhB40bHftESvJA/QZFarHDEMkexKjnnRvIC
         qAzEp9o/SBzwabaM2XSUwCfC87lSRt3CWDLMrMFh5aNKf3nT+ZjjAZsKv23ji4mPzIWQ
         Zs3I4UokIgw1i0kzTYP1542v9mJETvbyJL4QFwjr/zAmY/mDEbjqf1EzUHz3KPExz44H
         //OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778410976; x=1779015776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZwf37m6WLcPRLeIeoM703/GyHu5TsPXwyEzEjiEMC8=;
        b=kOG9Lir8ksmXddyYPFpn3jKnXKz7qxndrei1AwcNNUXo//nyPZjChe5V5bBgaLwYuX
         L5NKbCJ5sSoSNahIRWvSSOHUJTh1IbifVbCL2+0evkXaJox+BFxGV+R/xcjiVk5+4iIT
         grQ98AUUqIelBbnjeScbcZsY79d5usUvnknJWsDG0D4jIaUno8tvb/XNQ9KcVtZNl8N7
         2eSeTcau3Lkr4nwyeQaqoL80PJmH/+MDnF058eRkASZnDnzRVQt4/fauG/5oM9EyPOD1
         6Hia3R27H096LEpMJFUIus0ermJpg5xMSuEsxEZ1oF8ENAeYjlmwAkKzrLbALMkdLwuy
         Tpew==
X-Gm-Message-State: AOJu0YxcTEnGiPBICPbIbwbn2dyXZuZHN+gKItox+vZ2lruZDxhtX7QB
	IFUKtXerjy3OUImuXLZ2CpLSfstVAU7FbxN/RQDcXd/dpHtU4V1lqR/X
X-Gm-Gg: Acq92OEFFSWrozvZA2NOC+prnwHA265pC5ThiojBFH3PZfFFILruu0VorND288KU8oL
	n2z5K84IOq648wPOo+qpEmla70BqtUvYQGzSu9vXc3iCVBdpOkaMd/0PbPfSFiim8IhLmo/NLUa
	11Ur2o6zxVDgUtf2WJUM9ngaxJ+n30qO2013mw+Wp8FbsWjGMVssDCHpanD2uQatfe1fy1Xd+be
	2fNzP6fZH4BDLsEMFeQQCsja1UD8vnHesZ4DZjpeDkRPPv8rVBQQwciA4sX671QudjnQJtgKjHS
	kryHZZwywBclczOwpvB1KbvoA8cSSrvcb6GWkgMWts1J8n9kbZ2ZYNgnSSA0/H4u2YRAylknJ1j
	tcdgtNQXo0HuWFmAqA9JXIxgGc/2SU5r/9ME6XwFPTnZlhGRcBhmGZAA22w8zQjiuaCs7AUm+pn
	/fbTKy4Ok1++ej4HUAIrLIvmoof7T58Q5PjOGtUy+c
X-Received: by 2002:a17:902:e750:b0:2b2:5258:a23d with SMTP id d9443c01a7336-2bc7a9ba9c0mr55293015ad.14.1778410975916;
        Sun, 10 May 2026 04:02:55 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d008:80b:a00:27ff:feb6:42dd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ec13f0sm72019735ad.80.2026.05.10.04.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 04:02:55 -0700 (PDT)
From: Pramod Maurya <pramod.nexgen@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	pramod.nexgen@gmail.com,
	Nikolay Kulikov <nikolayof23@gmail.com>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Yuvraj Singh Chauhan <ysinghcin@gmail.com>,
	Bryant Boatright <bryant.boatright@proton.me>
Subject: [PATCH] staging: rtl8723bs: Fix coding style in ieee80211.h
Date: Sun, 10 May 2026 07:02:24 -0400
Message-ID: <20260510110228.96612-1-pramod.nexgen@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following coding style issues:
- Replace __attribute__((packed)) with __packed
- Fix comparisons to place constants on the right side
- Fix block comment style: move trailing */ to its own line
- Add * on subsequent lines in block comments
- Enclose CHAN_ARG macro value in parentheses
- Wrap long IS_CCK_RATE and IS_OFDM_RATE macro lines

Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
---
 drivers/staging/rtl8723bs/include/ieee80211.h | 60 ++++++++++---------
 1 file changed, 31 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index fbb12fe31a6c..739d3f142ce2 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -231,7 +231,7 @@ struct eapol {
 	u8 version;
 	u8 type;
 	u16 length;
-} __attribute__ ((packed));
+} __packed;
 
 #define IEEE80211_FCS_LEN    4
 
@@ -274,7 +274,7 @@ struct ieee80211_snap_hdr {
 	u8    ssap;   /* always 0xAA */
 	u8    ctrl;   /* always 0x03 */
 	u8    oui[P80211_OUI_LEN];    /* organizational universal id */
-} __attribute__ ((packed));
+} __packed;
 
 #define SNAP_SIZE sizeof(struct ieee80211_snap_hdr)
 
@@ -394,18 +394,22 @@ enum {
 };
 
 #define IS_HT_RATE(_rate)				(_rate >= MGN_MCS0 && _rate <= MGN_MCS31)
-#define IS_CCK_RATE(_rate)				(MGN_1M == _rate || _rate == MGN_2M || _rate == MGN_5_5M || _rate == MGN_11M)
-#define IS_OFDM_RATE(_rate)				(MGN_6M <= _rate && _rate <= MGN_54M  && _rate != MGN_11M)
+#define IS_CCK_RATE(_rate)				\
+	(_rate == MGN_1M || _rate == MGN_2M || _rate == MGN_5_5M || _rate == MGN_11M)
+#define IS_OFDM_RATE(_rate)				\
+	(_rate >= MGN_6M && _rate <= MGN_54M && _rate != MGN_11M)
 
 
 /* NOTE: This data is for statistical purposes; not all hardware provides this
  *       information for frames received.  Not setting these will not cause
- *       any adverse affects. */
+ *       any adverse affects.
+ */
 
 /* IEEE 802.11 requires that STA supports concurrent reception of at least
  * three fragmented frames. This define can be increased to support more
  * concurrent frames, but it should be noted that each entry can consume about
- * 2 kB of RAM and increasing cache size will slow down frame reassembly. */
+ * 2 kB of RAM and increasing cache size will slow down frame reassembly.
+ */
 #define IEEE80211_FRAG_CACHE_LEN 4
 
 #define SEC_KEY_1         (1<<0)
@@ -431,19 +435,17 @@ enum {
 #define BIP_AAD_SIZE  20
 
 /*
-
- 802.11 data frame from AP
-
-      ,-------------------------------------------------------------------.
-Bytes |  2   |  2   |    6    |    6    |    6    |  2   | 0..2312 |   4  |
-      |------|------|---------|---------|---------|------|---------|------|
-Desc. | ctrl | dura |  DA/RA  |   TA    |    SA   | Sequ |  frame  |  fcs |
-      |      | tion | (BSSID) |         |         | ence |  data   |      |
-      `-------------------------------------------------------------------'
-
-Total: 28-2340 bytes
-
-*/
+ * 802.11 data frame from AP
+ *
+ *      ,-------------------------------------------------------------------.
+ * Bytes |  2   |  2   |    6    |    6    |    6    |  2   | 0..2312 |   4  |
+ *       |------|------|---------|---------|---------|------|---------|------|
+ * Desc. | ctrl | dura |  DA/RA  |   TA    |    SA   | Sequ |  frame  |  fcs |
+ *       |      | tion | (BSSID) |         |         | ence |  data   |      |
+ *       `-------------------------------------------------------------------'
+ *
+ * Total: 28-2340 bytes
+ */
 
 #define BEACON_PROBE_SSID_ID_POSITION 12
 
@@ -467,7 +469,8 @@ Total: 28-2340 bytes
 /* MAX_RATES_LENGTH needs to be 12.  The spec says 8, and many APs
  * only use 8, and then use extended rates for the remaining supported
  * rates.  Other APs, however, stick all of their supported rates on the
- * main rates information element... */
+ * main rates information element...
+ */
 #define MAX_RATES_LENGTH                  ((u8)12)
 #define MAX_RATES_EX_LENGTH               ((u8)16)
 #define MAX_NETWORK_COUNT                  128
@@ -497,11 +500,11 @@ Total: 28-2340 bytes
 #define IEEE80211_PS_MBCAST IEEE80211_DTIM_MBCAST
 #define IW_ESSID_MAX_SIZE 32
 /*
-join_res:
--1: authentication fail
--2: association fail
-> 0: TID
-*/
+ * join_res:
+ * -1: authentication fail
+ * -2: association fail
+ * > 0: TID
+ */
 
 #define DEFAULT_MAX_SCAN_AGE (15 * HZ)
 #define DEFAULT_FTS 2346
@@ -555,8 +558,7 @@ enum {
 	ACT_PUBLIC_MAX
 };
 
-#define OUI_MICROSOFT 0x0050f2 /* Microsoft (also used in Wi-Fi specs)
-				* 00:50:F2 */
+#define OUI_MICROSOFT 0x0050f2 /* Microsoft (also used in Wi-Fi specs); 00:50:F2 */
 #define WME_OUI_TYPE 2
 #define WME_OUI_SUBTYPE_INFORMATION_ELEMENT 0
 #define WME_OUI_SUBTYPE_PARAMETER_ELEMENT 1
@@ -637,7 +639,7 @@ struct rtw_ieee80211_channel {
 	/*"orig_mpwr:%d\n"*/
 
 #define CHAN_ARG(channel) \
-	/*(channel)->band*/ \
+	(/*(channel)->band*/ \
 	/*, (channel)->center_freq*/ \
 	(channel)->hw_value \
 	, (channel)->flags \
@@ -647,7 +649,7 @@ struct rtw_ieee80211_channel {
 	/*, (channel)->beacon_found*/ \
 	/*, (channel)->orig_flags*/ \
 	/*, (channel)->orig_mag*/ \
-	/*, (channel)->orig_mpwr*/ \
+	/*, (channel)->orig_mpwr*/)
 
 /* Parsed Information Elements */
 struct rtw_ieee802_11_elems {
-- 
2.52.0

