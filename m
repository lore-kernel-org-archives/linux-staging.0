Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DA136CE01
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 21:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773093336; cv=none; b=f3aYroPm1B9e/m9bZzbV0fsRQcqmBbq9c48hCT0bfs4SCnBHxjA6SdepmAJyXljrhwKZ3xhZSE/UpHbrTDIBWnm1sBhX4IA6m2Ik1ZnC2VvicM9npFRbGZog55ov2YF7zoGV5KX7qElIFWI9pZMAQnkN4aHBu+oOVQ4Y1bnw4a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773093336; c=relaxed/simple;
	bh=gRGiHh5DV1Y4zNvyBsX0nhOwV2mP2uCGq4Xk13dFc6E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qamilc9gCXOU6+DOJHglIr4D7wHCSvk3LIQvfLyLyphR/C4+LndkOzHRA/riNwxNygXEKDfYUldg7UR+vJXRiZpklSULznZxSklp/Ts5LqW9h3Rep/UevkE+SW0tsaaCjBnxtkhxA6WVt/zsatSYvgq/mR1M8pCqLu9XqyM2gUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PPUQqR4n; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPUQqR4n"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38a49fc06b4so13754691fa.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 14:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773093332; x=1773698132; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l/kta3o08Ez8GWQWGgrupQOAhVskQNRKkeibLAq2u1g=;
        b=PPUQqR4nk8B09WPrmjV4l3VLj2WFadKEt2YXFMJub81luBM9SZa7iZPYCka57BwqhH
         IdSBe6p+e4ey3I0Y5sBxCDxeOUwbEkYNpwHsD73ZOnH01Q1znV9MwPT1Pnfj9+5O3FHn
         GKRRV/QQBdYcdm4gtu2QkRbxe7AA8t0MdIsNnTBppeyUuxBEel3JNyEa1NHAOMHbG9GL
         jMhpbBJGIdKGycLJBpRp/y7+iFQIVRNtQNiPlqZEGa90fmvczkBb2LDKrzyAAAbgWQGM
         MSRw0kUigQNqSj9HxoD8zQlPBBf0nO3yaKer9dLfTZqd5cmc9PG+DvHlAa3XuHlXH6sb
         QrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773093332; x=1773698132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/kta3o08Ez8GWQWGgrupQOAhVskQNRKkeibLAq2u1g=;
        b=fGdo9vViueWfmryVkTamKS9tyxZ9UISPDrwGAJwky4KL837feViEd35RzKP05TJG6d
         BoVb2M7gBP2fgNeK1qFghZxOMhFckWxhHgVqcZu6one6lWfnwQiVVUDv/SzKSkuQxTYc
         s45Xk/+rpX7FPi9ldKxWEOtAcawAfEuazIgzIYsOuE3OBuhkaySV8TJHPHygPvdr9iLy
         DtYttxNSdlYApziBRKBC2HpzQXl4FQitV1BOX5P79j2jVyQRwrXchpmaPhCmyKErbryV
         S/W9SdC390jHMGsphTqo5gMs4UogG4iuORn3Uc4P1Rr6c8wL7/oPV70UpE1zay2WrUyP
         wtIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYBwwuO5ICbBs//NgROk4Ab/jRBBH9NV+K73IGZoACZvbfmd29jxCxe1vhhk8DufL5htoXTmw/WS6/p0ud@lists.linux.dev
X-Gm-Message-State: AOJu0YwNB+Jwz5LQg7VNpmbjziPv/fScjstBBSbEx2/DOdHC0Xn4cd/a
	FFi/Qnc3a0vWbw8A3PtQa8T4Gjii0vD01hft/qPDb7lPrUg5reOaweel
X-Gm-Gg: ATEYQzyhwCa1Yphx+hhx5txASNlK1cZoeZ2rBC/Vbu23H8ahJH6YjpoejJcoO1gRN1j
	jZKcShuvWAEJC82p/iGRhHnLUYHT3yh3TOiRXmwvcApIv7QPCCaMWT/tf8srPNtaTwChG/e4zD5
	Wg44fxIf5Lf4Y9QkwBswiYIHLo6K9+13BC7MLikRQnUkJQQubcR6V6T/xzdGcCVBLgzGmucluBL
	cTirfE/vflsLwsUSNdAo3EH6ZhvbcZV+gHRB3iCoCW2VSKyWzo7RXEreG/cCL6fXuOmw+F1oyIn
	c2Sd7ashbqtlb86hzGo36diVr5LY7mqAK1wirMWlpBDPyISX3aTiGn18XxKt9SShGMpiOV1bUwq
	JHtbBCYiu9gbR+HtfO9mhvbLL9wyuhtnSgHJUmKphjZHjxHgrTLfkS9DyCJKnoOGSjFFmdYd5zP
	JTFEKYerKZAFktJWclvPaGFvKIME2rxYzAThiG9s8iNIID716VPok8f++Em6dV2ozlEHSDdpncL
	GwukKgKKe4B
X-Received: by 2002:a2e:a5c3:0:b0:38a:292e:b3f4 with SMTP id 38308e7fff4ca-38a40d9e6bfmr38028031fa.27.1773093332312;
        Mon, 09 Mar 2026 14:55:32 -0700 (PDT)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5d072320sm1581821fa.39.2026.03.09.14.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 14:55:30 -0700 (PDT)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH] staging: atomisp: fix block comment style in refcount.c
Date: Mon,  9 Mar 2026 22:55:16 +0100
Message-ID: <20260309215516.6091-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix block comment formatting to comply with kernel coding style:
- Add leading '*' on continuation lines
- Move trailing '*/' to a separate line
- Remove unnecessary braces around single statement block

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
 .../atomisp/pci/base/refcount/src/refcount.c  | 29 ++++++++++---------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c b/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
index 58e4e3173b40..00e8a73f413e 100644
--- a/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
+++ b/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
@@ -16,7 +16,8 @@
 #include "ia_css_debug.h"
 
 /* TODO: enable for other memory aswell
-	 now only for ia_css_ptr */
+ * now only for ia_css_ptr
+ */
 struct ia_css_refcount_entry {
 	u32 count;
 	ia_css_ptr data;
@@ -93,14 +94,15 @@ void ia_css_refcount_uninit(void)
 			    "%s() entry\n", __func__);
 	for (i = 0; i < myrefcount.size; i++) {
 		/* driver verifier tool has issues with &arr[i]
-		   and prefers arr + i; as these are actually equivalent
-		   the line below uses + i
-		*/
+		 * and prefers arr + i; as these are actually equivalent
+		 * the line below uses + i
+		 */
 		entry = myrefcount.items + i;
 		if (entry->data != mmgr_NULL) {
 			/*	ia_css_debug_dtrace(IA_CSS_DBG_TRACE,
-				"ia_css_refcount_uninit: freeing (%x)\n",
-				entry->data);*/
+			 *	"ia_css_refcount_uninit: freeing (%x)\n",
+			 *	entry->data);
+			 */
 			hmm_free(entry->data);
 			entry->data = mmgr_NULL;
 			entry->count = 0;
@@ -173,7 +175,8 @@ bool ia_css_refcount_decrement(s32 id, ia_css_ptr ptr)
 			entry->count -= 1;
 			if (entry->count == 0) {
 				/* ia_css_debug_dtrace(IA_CSS_DBEUG_TRACE,
-				   "ia_css_refcount_decrement: freeing\n");*/
+				 * "ia_css_refcount_decrement: freeing\n");
+				 */
 				hmm_free(ptr);
 				entry->data = mmgr_NULL;
 				entry->id = 0;
@@ -183,7 +186,8 @@ bool ia_css_refcount_decrement(s32 id, ia_css_ptr ptr)
 	}
 
 	/* SHOULD NOT HAPPEN: ptr not managed by refcount, or not
-	   valid anymore */
+	 * valid anymore
+	 */
 	if (entry)
 		IA_CSS_ERROR("id %x, ptr 0x%x entry %p entry->id %x entry->count %d\n",
 			     id, ptr, entry, entry->id, entry->count);
@@ -221,9 +225,9 @@ void ia_css_refcount_clear(s32 id, clear_func clear_func_ptr)
 
 	for (i = 0; i < myrefcount.size; i++) {
 		/* driver verifier tool has issues with &arr[i]
-		   and prefers arr + i; as these are actually equivalent
-		   the line below uses + i
-		*/
+		 * and prefers arr + i; as these are actually equivalent
+		 * the line below uses + i
+		 */
 		entry = myrefcount.items + i;
 		if ((entry->data != mmgr_NULL) && (entry->id == id)) {
 			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
@@ -238,9 +242,8 @@ void ia_css_refcount_clear(s32 id, clear_func clear_func_ptr)
 				hmm_free(entry->data);
 			}
 
-			if (entry->count != 0) {
+			if (entry->count != 0)
 				IA_CSS_WARNING("Ref count for entry %x is not zero!", entry->id);
-			}
 
 			assert(entry->count == 0);
 
-- 
2.43.0

