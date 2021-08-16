Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3F572
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 19:32:35 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id hs10so33903098ejc.0
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 12:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RUip0byKTWINqq7HUHlw/1zObxHE53/yOMwnFMivC7s=;
        b=UfqMlnexxkVYO39i4ailUlIrA+3b73CHy5jrbvXm0N0Y0eWPMM5j6vX8krUFa1s2rm
         KZzaILUIzBGPu2rNY6m8AUn/m5TSlBJe2ErbDPC0mLzPhXddjzjPkVNWv/FUlId3QMim
         p5ShUKRyFnHJ3n8GBT+W9NnxqI17i0fAF1kP5fL4bCbCUT2VNPUtu9em3O3gqfK4tD+M
         YX0ppdOfb/GMVDLW6sIozFpqJh6E2RsUl0l68t2myDLMByIOMnG/FZ1vKTQ9y0PyBtwM
         HX8+xhuqEVQg4YPYbTB8ufPDarIruesP7z/mhJPlgIe31YSmA0ZghFPi8EIQi4TqCLdH
         VakA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RUip0byKTWINqq7HUHlw/1zObxHE53/yOMwnFMivC7s=;
        b=Ia984ziB3V7iLzPDH9JSeKsJIocVv1Rd5MHveORQXWrJ6Fy8dvrFT49xLbIx/OOjPC
         5Tb96BwLcuOUOdOs1eSSbLO+oW55q8Of69vUXkdRilUkMDpVc0iPaON6xw1FRNi4C3VU
         b1AtPaeBARdmOvs9aL6XaVrOiKS2zYAdNk0j+9pHG8uGUMpz2YFPW//YGSEZ25DOoRE9
         ZbqIE9FR5unDh1zcak5et2fXDg/RXMIQjybYE24WWRYj8FuORBCiSBZ73OLhKRPqtOG2
         bt4yRFxpe0NYFTKaSl3qGP5WxZzkVwR58xER/XOS6OyOZL3GKyUOYxx/SpdNbWM1Fcx3
         L4FQ==
X-Gm-Message-State: AOAM530t4XQGxt9NR+hN80uKsu98lqFFiDGPX3JyPffuC0Zlipasqx79
	adovXU1TidovU2V7hgvwRbk=
X-Google-Smtp-Source: ABdhPJxLbMMG2L56yXomJKvOR5YgUNZy6nNlvIQR/5rehXPGscXqjdRz9m0WKHvFelKas6eSvm4okA==
X-Received: by 2002:a17:907:785a:: with SMTP id lb26mr71436ejc.77.1629142353756;
        Mon, 16 Aug 2021 12:32:33 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::4058])
        by smtp.gmail.com with ESMTPSA id v13sm59312ejh.62.2021.08.16.12.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 12:32:33 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>,
	Joe Perches <joe@perches.com>
Subject: [PATCH] staging: r8188eu: refactor rtw_is_cckrates{only}_included()
Date: Mon, 16 Aug 2021 21:31:25 +0200
Message-Id: <20210816193125.15700-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor functions rtw_is_cckrates_included() and
rtw_is_cckratesonly_included(). Add new helper function rtw_is_cckrate()
that allows to make the code more compact. Improves readability and
slightly reduces object file size. Change the return type to bool to
reflect that the functions return boolean values.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ieee80211.c | 27 +++++++++++---------
 drivers/staging/r8188eu/include/ieee80211.h  |  5 ++--
 2 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ieee80211.c b/drivers/staging/r8188eu/core/rtw_ieee80211.c
index 0c7231cefdda..892ffcd92cc7 100644
--- a/drivers/staging/r8188eu/core/rtw_ieee80211.c
+++ b/drivers/staging/r8188eu/core/rtw_ieee80211.c
@@ -68,28 +68,31 @@ int rtw_get_bit_value_from_ieee_value(u8 val)
 	return 0;
 }
 
-uint	rtw_is_cckrates_included(u8 *rate)
+static bool rtw_is_cckrate(u8 rate)
 {
-	u32	i = 0;
+	rate &= 0x7f;
+	return rate == 2 || rate == 4 || rate == 11 || rate == 22;
+}
+
+bool rtw_is_cckrates_included(u8 *rate)
+{
+	u8 r;
 
-	while (rate[i] != 0) {
-		if  ((((rate[i]) & 0x7f) == 2) || (((rate[i]) & 0x7f) == 4) ||
-		     (((rate[i]) & 0x7f) == 11)  || (((rate[i]) & 0x7f) == 22))
+	while ((r = *rate++)) {
+		if (rtw_is_cckrate(r))
 			return true;
-		i++;
 	}
+
 	return false;
 }
 
-uint	rtw_is_cckratesonly_included(u8 *rate)
+bool rtw_is_cckratesonly_included(u8 *rate)
 {
-	u32 i = 0;
+	u8 r;
 
-	while (rate[i] != 0) {
-		if  ((((rate[i]) & 0x7f) != 2) && (((rate[i]) & 0x7f) != 4) &&
-		     (((rate[i]) & 0x7f) != 11)  && (((rate[i]) & 0x7f) != 22))
+	while ((r = *rate++)) {
+		if (!rtw_is_cckrate(r))
 			return false;
-		i++;
 	}
 
 	return true;
diff --git a/drivers/staging/r8188eu/include/ieee80211.h b/drivers/staging/r8188eu/include/ieee80211.h
index bc5b030e9c40..1205d13171b2 100644
--- a/drivers/staging/r8188eu/include/ieee80211.h
+++ b/drivers/staging/r8188eu/include/ieee80211.h
@@ -1206,9 +1206,8 @@ int rtw_generate_ie(struct registry_priv *pregistrypriv);
 
 int rtw_get_bit_value_from_ieee_value(u8 val);
 
-uint	rtw_is_cckrates_included(u8 *rate);
-
-uint	rtw_is_cckratesonly_included(u8 *rate);
+bool rtw_is_cckrates_included(u8 *rate);
+bool rtw_is_cckratesonly_included(u8 *rate);
 
 int rtw_check_network_type(unsigned char *rate, int ratelen, int channel);
 
-- 
2.32.0

