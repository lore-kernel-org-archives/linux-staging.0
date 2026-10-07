Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9216E3BD22E
	for <linux-staging@lists.linux.dev>; Wed,  7 Oct 2026 11:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791374064; cv=none; b=I8okoAofhQHP/Su3+57FJ/7Ink3ZifUpWeBqAFY1Ka/rDnap6Ctg8eX4ZAUHp6vQklePvMIHRGu/oLicZhJgAnC9Ycygkf9MOQgQgON3POrk8g+6yN84fwPHo0NN1TOBHIYSWbr9fm9WWUZ4rY4qDumXoQ42q8vDIU3uImbp57E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791374064; c=relaxed/simple;
	bh=qPsAUzybV6gCxXnbHSXY/WPpDyCPwUWq98p0EGI0M/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NDXbjvSLvIsSDOleN20fCC8BLKz5NKzR/XlfO04EuDB1eZo85yd1pagCKvedZ52eqTTzR3sjP5M5Wwo7VzTZHo676Y6yl+lgnLXLnUwo/GTcrYushT690ZUGf4LUIetjhaBk6Yr8K43jdLHagtxG9gf3k6Gi6B/jB9aonvJPMbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R7C0cYq2; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R7C0cYq2"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc4ca696de6so1025917a12.2
        for <linux-staging@lists.linux.dev>; Wed, 07 Oct 2026 04:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791374054; x=1791978854; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TxLF9WC9h0ud76U4Gv3cyGgWW9mMfTpz+8WgjYplMkQ=;
        b=R7C0cYq2dnUWJt9J9WLnwblDtypkMJn273sakhlAKfhjuxOBcpFDFWXHA/9/OH6TT0
         XqwiUuARMwxqX4VtiLfGBzBcHvQinm7SJV+OLezS/hsPUb3NVbxljhsmpbCl7REEC6Sl
         UQy5JUDeo75vLdN6RgHpKiWHYWlXzVA4Y/+aj29AN9jHqbsfFwbKOAArmw8IGThbFRMu
         VyhfxidY/6AqX1u8mSETDeVETqHmAxxlSGhANdCpTB2Felj7LPFnkIddWk+4iQ17Ck5f
         hSSRJOK/MNI/Qe3l1OCC0F7z0pUjl3gjS3wBh2qieGFMdceezwuyTvKAFacqvt0jw6CF
         xcTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791374054; x=1791978854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TxLF9WC9h0ud76U4Gv3cyGgWW9mMfTpz+8WgjYplMkQ=;
        b=F88xEds1D0FoLbDLL3h/2PZpWcGDVrucZ/5ohO9Dw9Z7MkVHgmiyYvaFg/juO03Clh
         6D3KDLxrlT3oBhj8WKoR4uiLrkjgFzwJ/Ge3U4MFxPV1+HTgCbyOkMKYjcL6Ybls6vYs
         9GoaiUGPbB93tyJ+Bvy11U04RuC8IdsWgY3f9NZptKKLFXf5brUfOVhmK43tniSPhTM8
         92rQ/JRzDUajtNna6CC+5wkNkSpOSC17Yvgpa7AI8vIjPD6zgDk4hvl0oxESA4qx2tgX
         RoK4RU2BUOU47mbaawIBQzY05reNYJtLbs8tNSZMu4TiufI/mlEbXkaMuXLkLDanSyJR
         1O0g==
X-Gm-Message-State: AFq9FYJPF0l28+7rfkhrO/5uY4hSXuPNnbT+9H0hRuKayrL94sLQMr+4
	CPmzMDf7/Aw1a/iHL3oc00v2Y4hX0djP8c1ArLNMkGyy6pTmMiloD3Xd
X-Gm-Gg: AYBFou2u5EreaPymC1BgiINxUf0FGIi2KF4m8nelMbIoEOSa2rmqjITRUAY9piOJNR6
	kevDKq4OxlNEYJlUYcap9d0mZVqyL7TY4ZBhIde+vmKCXs6sHdrbWNo49+WyilMIBRKRML5fGeq
	vmHxO0RWg/+UUzgtMOjx867xAELGqzn6JMkSwpHrF0VngfPajsaWb8YCbKy+UPgMb6hFRle5SX3
	ryN5PwCqEdCF50HgpUr4mWKZCW/QwzFhL59Euf9IINbWJsWamVas2IBIzkr7V24nG1ikqQjyXEd
	GvldLsfhnfIAitTjJOOjAquKvbzPR0jnZtjhl5hGGmZ7godvoDuLORjiE+IpXj3+r9hPwUTf9xT
	P0EZoBSc0OwH0IYf8TSrgSbzakHHI4X4XTFl45Q0d7z4ENUFvtNPWtQ7DLBtpeFLGGgWrdKXlGh
	f9woJ9BtpTuOrVBlGN+2FWYKS8Ur9ewhghcLcGk51O3X9VYA05dcV8TWMZFzfFiR4fZTYcpjh0f
	Kc=
X-Received: by 2002:a17:90b:258b:b0:39e:6a7f:1dcd with SMTP id 98e67ed59e1d1-3a8a117382cmr1766075a91.41.1791374053580;
        Wed, 07 Oct 2026 04:54:13 -0700 (PDT)
Received: from host ([103.103.208.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89b625d01sm4160128a91.14.2026.10.07.04.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:54:13 -0700 (PDT)
From: Pranav Desai <contact.pranavdesai@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pranav Desai <contact.pranavdesai@gmail.com>
Subject: [PATCH v3 2/6] staging: rtl8723bs: use bool for flags in rtw_security.c
Date: Wed,  7 Oct 2026 17:23:38 +0530
Message-ID: <20261007115342.1121742-3-contact.pranavdesai@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007115342.1121742-1-contact.pranavdesai@gmail.com>
References: <20261007115342.1121742-1-contact.pranavdesai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace 'uint' with 'bool' for the 'qc_exists' and 'a4_exists' variables
since they are only used to track true/false state.

Update their assignments from 1/0 to true/false to match the standard
boolean type.

Signed-off-by: Pranav Desai <contact.pranavdesai@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 34 ++++++++++---------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index af461971c827..34e35c0eccbc 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -628,8 +628,8 @@ static void aes128k128d(u8 *key, u8 *data, u8 *ciphertext)
 /* nonce                                        */
 /************************************************/
 static void construct_mic_iv(u8 *mic_iv,
-			     signed int qc_exists,
-			     signed int a4_exists,
+			     bool qc_exists,
+			     bool a4_exists,
 			     u8 *mpdu,
 			     uint payload_length,
 			     u8 *pn_vector,
@@ -702,8 +702,8 @@ static void construct_mic_header1(u8 *mic_header1,
 /************************************************/
 static void construct_mic_header2(u8 *mic_header2,
 				  u8 *mpdu,
-				  signed int a4_exists,
-				  signed int qc_exists)
+				  bool a4_exists,
+				  bool qc_exists)
 {
 		signed int i;
 
@@ -783,7 +783,8 @@ static void construct_ctr_preload(u8 *ctr_preload,
 static signed int aes_cipher(u8 *key, u16 hdrlen,
 			     u8 *pframe, u32 plen)
 {
-	uint	qc_exists, a4_exists, i, j, payload_remainder,
+	bool qc_exists, a4_exists;
+	uint	i, j, payload_remainder,
 		num_blocks, payload_index;
 
 	u8 pn_vector[6];
@@ -803,14 +804,14 @@ static signed int aes_cipher(u8 *key, u16 hdrlen,
 	frsubtype = frsubtype >> 4;
 
 	if ((hdrlen == WLAN_HDR_A3_LEN) || (hdrlen ==  WLAN_HDR_A3_QOS_LEN))
-		a4_exists = 0;
+		a4_exists = false;
 	else
-		a4_exists = 1;
+		a4_exists = true;
 
 	if (((frtype | frsubtype) == WIFI_DATA_CFACK) ||
 	    ((frtype | frsubtype) == WIFI_DATA_CFPOLL) ||
 	    ((frtype | frsubtype) == WIFI_DATA_CFACKPOLL)) {
-		qc_exists = 1;
+		qc_exists = true;
 		if (hdrlen !=  WLAN_HDR_A3_QOS_LEN)
 			hdrlen += 2;
 
@@ -822,9 +823,9 @@ static signed int aes_cipher(u8 *key, u16 hdrlen,
 		if (hdrlen !=  WLAN_HDR_A3_QOS_LEN)
 			hdrlen += 2;
 
-		qc_exists = 1;
+		qc_exists = true;
 	} else {
-		qc_exists = 0;
+		qc_exists = false;
 	}
 
 	pn_vector[0] = pframe[hdrlen];
@@ -984,7 +985,8 @@ static signed int aes_decipher(u8 *key, u8 hdrlen,
 			       u8 *pframe, u32 plen)
 {
 	static u8 message[MAX_MSG_SIZE];
-	uint qc_exists, a4_exists, i, j, payload_remainder,
+	bool qc_exists, a4_exists;
+	uint i, j, payload_remainder,
 			num_blocks, payload_index;
 	signed int res = _SUCCESS;
 	u8 pn_vector[6];
@@ -1018,14 +1020,14 @@ static signed int aes_decipher(u8 *key, u8 hdrlen,
 	pn_vector[5]  = pframe[hdrlen + 7];
 
 	if ((hdrlen == WLAN_HDR_A3_LEN) || (hdrlen ==  WLAN_HDR_A3_QOS_LEN))
-		a4_exists = 0;
+		a4_exists = false;
 	else
-		a4_exists = 1;
+		a4_exists = true;
 
 	if (((frtype | frsubtype) == WIFI_DATA_CFACK) ||
 	    ((frtype | frsubtype) == WIFI_DATA_CFPOLL) ||
 	    ((frtype | frsubtype) == WIFI_DATA_CFACKPOLL)) {
-		qc_exists = 1;
+		qc_exists = true;
 		if (hdrlen !=  WLAN_HDR_A3_QOS_LEN)
 			hdrlen += 2;
 
@@ -1037,9 +1039,9 @@ static signed int aes_decipher(u8 *key, u8 hdrlen,
 		if (hdrlen !=  WLAN_HDR_A3_QOS_LEN)
 			hdrlen += 2;
 
-		qc_exists = 1;
+		qc_exists = true;
 	} else {
-		qc_exists = 0;
+		qc_exists = false;
 	}
 
 	/*  now, decrypt pframe with hdrlen offset and plen long */
-- 
2.55.0

