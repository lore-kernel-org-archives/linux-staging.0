Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CAB36896E
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 20:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773174979; cv=none; b=d7lFR0jGkD4NAzyTKEfX79HqUXAjDJQwVsf3O4iuaSupJFIiuYikIDdLo6OnzwrQDGhhWNkQjZRd60bVZi814/Z1F8MqVWnlqQ4ea1kCflC6ZnUvSIOzkwfLnHmsu3eErMan0RAqE3VRbhMN6KUYt4zhqnspcfaMrtG7LlzsH0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773174979; c=relaxed/simple;
	bh=I9i22WPTRAmhpxhypjMdYtzA+JuNyUwyEIYAxkX9C34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V48nSnA0tuuCsD1UwS0zIu3s9iFYA3PCqz6PumNEmyl+I1DMRfLdMZ94Ww9Mh1XzNwQNa2soEbq4Ki9C+EPa53ZM/YWvozpBVPHUqOvsy+x0bc3Z/a7Rmca+LUbQvlzj3sontUv9FXsUs5hJ9OaM0Lc97NbQLYjavZGGtrPjSE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d+NSHPG8; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+NSHPG8"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a131870b72so6772990e87.1
        for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 13:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773174976; x=1773779776; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9gH63xno2m/4CidvXeQf37K4ZWvOPR2V3GJ+M/nb9CI=;
        b=d+NSHPG8bGGfnZvKg9XY5/850SusmGmOUppN1br6MHpiIYak8s6mODgKXP686p7Iwk
         ghB7jIA6H9/72jCsWQ5/9EycSVqqItG5yxcNU9ljo1M6lXM5Xhjy/ayO33TVyhQj0oxZ
         vphajlRjgCprJQhFTWaMtssPe3vnb8lV9hVSmP8k0Z0rjPuI5vmWv5KXXceqpMiE3Pxy
         PGFgVcfrdU4J4XSeapokLmrMwugbT5ZuXicmZr/Jayh8ItXxL4sJoZCbuy9kQHXwFJZS
         IlRDo7h88VL00kq6Vf8TTy4ean/Ve3NGYy8z9WqerdH5HBU/93jRUFD6W8N36d/Wyrze
         rlTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773174976; x=1773779776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9gH63xno2m/4CidvXeQf37K4ZWvOPR2V3GJ+M/nb9CI=;
        b=m2XEsO4n8ZoKEFgpuioyEYmKmgYoyKTcKwFqzAWTDW6ljF6Wlo4uLGAbHPTn3D0gZr
         uJuCajCZNlRPZEiZNt69gJ+xqhqiI9e2iS9Cg8AWxa6V2eYxBv1tmueVddqC1BpVxZBG
         4J0MHCpWO/Tf/D1grZSF0YPPGV2W/7cDchCSrdmgUG/sW0LmkgjR2jvn01WM66s91XHN
         FN4bls9VZ3s31dQlfhDeR7ftNfDpM6nr8fvJ1FJqHMfuKqbjdPUGWMJdFZMrky6pjsIH
         eXT9K3Y2YiEFNyvZ98g9Doh1CJ6/lu4lV6Gmb2G9z9wQP4w+9ZlFgW+GcMTIYRDDAdy1
         R05w==
X-Forwarded-Encrypted: i=1; AJvYcCVcpu1uU1+jKBP7C4XczVeJFLXpe6tICixiEtyC8PEbO2jvXPcuhQ8rESjMb6oI7/nFGEAwF//IEkj8Vu6R@lists.linux.dev
X-Gm-Message-State: AOJu0YzwVk2nQ+6THMooRy/TydWFo6SxUFZQH2K7fOMGLU/uXi5c8nIO
	R1shTpmt5NXTugjHS+NsWadfFA33JQlU9i1urQ4LuRInj0MJ/NtmU3Jv
X-Gm-Gg: ATEYQzyXadS77h5ZtfLBvLRGxXaw2Or05pGTxfgGV3tz3GchP4k453O+9zGgQdXVDfK
	P4K0GNB3k1LGhbRmRVrOtJ9PkM7pVPVoEdhe6/oij4pLhlpbH0edv5d6C+NlVRtXGBy81D0EHrR
	sYEVei1C307LgoWGj8ShFfbNMndJdaIrPq7ekQNRdMc8dxy+hMDlV5tsL5B+REaprU8p1fBgbkv
	Rqoc5kIPvtiFkRsC8+x9QHoWpD7DDu6U6kJ7b7i4d8HTVLYV9T+c+d//29Crxs9rtR76dh3i4+N
	CWLT7fJV1WzVXbZRk71dEJN2jCjQyH41F8VGpXsFROXDDHPaOS8xCk+mtH/OnzbZLSejAvKE2fr
	dGuC1ZHcKAqkY1bTZ9zCqooeAOQUu1cYjLwuDyOx4YO3HElAFo9nQnIdZyuDNm2VUsRzuTX1inQ
	PQtlPrrLqcUTee33Uk0TOtwTsPsdK5w4i9/ffSpsGEDxS1YEoXFbAeMrYYIf4uQhWtu9p7adCZC
	g==
X-Received: by 2002:a05:6512:1458:20b0:5a1:376b:692a with SMTP id 2adb3069b0e04-5a13caae83fmr3641678e87.10.1773174975906;
        Tue, 10 Mar 2026 13:36:15 -0700 (PDT)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156162dcesm23345e87.58.2026.03.10.13.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:36:15 -0700 (PDT)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH v2] staging: media: atomisp: fix block comment style in refcount.c
Date: Tue, 10 Mar 2026 21:35:46 +0100
Message-ID: <20260310203546.8849-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309215516.6091-1-rayfraytech@gmail.com>
References: <20260309215516.6091-1-rayfraytech@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix block comment formatting to comply with kernel coding style:
- Move text from opening '/*' line to a separate continuation line
- Add leading '*' on continuation lines
- Move trailing '*/' to a separate line
- Replace commented-out code with #if 0 ... #endif blocks

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
 .../atomisp/pci/base/refcount/src/refcount.c  | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c b/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
index 00e8a73f413e..68c3bc181a96 100644
--- a/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
+++ b/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
@@ -15,7 +15,8 @@
 
 #include "ia_css_debug.h"
 
-/* TODO: enable for other memory aswell
+/*
+ * TODO: enable for other memory aswell
  * now only for ia_css_ptr
  */
 struct ia_css_refcount_entry {
@@ -99,10 +100,11 @@ void ia_css_refcount_uninit(void)
 		 */
 		entry = myrefcount.items + i;
 		if (entry->data != mmgr_NULL) {
-			/*	ia_css_debug_dtrace(IA_CSS_DBG_TRACE,
-			 *	"ia_css_refcount_uninit: freeing (%x)\n",
-			 *	entry->data);
-			 */
+#if 0
+			ia_css_debug_dtrace(IA_CSS_DBG_TRACE,
+				"ia_css_refcount_uninit: freeing (%x)\n",
+				entry->data);
+#endif
 			hmm_free(entry->data);
 			entry->data = mmgr_NULL;
 			entry->count = 0;
@@ -174,9 +176,10 @@ bool ia_css_refcount_decrement(s32 id, ia_css_ptr ptr)
 		if (entry->count > 0) {
 			entry->count -= 1;
 			if (entry->count == 0) {
-				/* ia_css_debug_dtrace(IA_CSS_DBEUG_TRACE,
-				 * "ia_css_refcount_decrement: freeing\n");
-				 */
+#if 0
+				ia_css_debug_dtrace(IA_CSS_DBEUG_TRACE,
+						    "ia_css_refcount_decrement: freeing\n");
+#endif
 				hmm_free(ptr);
 				entry->data = mmgr_NULL;
 				entry->id = 0;
-- 
2.43.0

