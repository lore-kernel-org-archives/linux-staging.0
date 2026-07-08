Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3140717D6
	for <linux-staging@lists.linux.dev>; Wed,  8 Jul 2026 10:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783506026; cv=none; b=O11uhH5gt/k/ncKLkl9bO9mdTWkkNvV8c29FDN3ADDRnnbW8IXbDZkZfmW5TCdMBYrneUhR3JIRoe12HLMOqVdTa2JOnpeq1BsuSfdGJn45fbi7TX4Uur2wMX1VSnrzJKymTjHUcb9l95UfzAZUW0TyJ2b3H7cyfI8sr0AvKsF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783506026; c=relaxed/simple;
	bh=XK+1KniWXCB7XoMOtQDxlvdgvg3bvC30vY1qFrFEe5I=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BM8vowlCBM6HXcMArtC/5U8MQeCPak5mxOGMQ2ucJ0QZgA4iRnYsiRuEm6dEnsUFflNfg9YeBK90BTZ1DdOGv23yIdshKNVcJeLI3jivSouWZ0CjNSRoegUWJbfnlmXfiUmVK2lYybkBv9L9OYUD/C5zyYGln9osR/gU/xxJwuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=M1aqmonZ; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="M1aqmonZ"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-698b6c87884so860283a12.2
        for <linux-staging@lists.linux.dev>; Wed, 08 Jul 2026 03:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783506024; x=1784110824; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:to
         :from:date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1VshF73V7P16vj4vjpKNjbMVjoc1uOeX/+BiGq0nGJ4=;
        b=M1aqmonZ9xXkOsBFiMro4TpJbSKk0/3Jb3Nf4iF+6I1nv7VQJj4OReyU4uh9KjGbB6
         baqkn2qKduQnp7t60ZnnGBnibXQ3vWylE32KejoMoiGr6vJ7p2O1FOtgTEQQZd31jKYk
         k6K+BWCwbhhHODDytwdKEP3nC7qitL7nt2L2d+k8tHIcOuXoAGNyBFGJb1aPa8JLMLhd
         XmO7qkHLp0LkCXk2btgNY8fPjQP229zSUABHR5wmZ8KX1CC5pgbS5d3U4HOq5TKzs7MP
         X1G/QSIxbbOISyCtqm5cdBY2hYE1VUZxhREEqwthj8YC1cnSnfNfyWp4MQ5/hV3W2Cy3
         5EaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783506024; x=1784110824;
        h=content-disposition:content-type:mime-version:message-id:subject:to
         :from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1VshF73V7P16vj4vjpKNjbMVjoc1uOeX/+BiGq0nGJ4=;
        b=LYX3cHjYkdETlCFa18yfo63ilUu4PQnK7iV1f7KdZqYO8cGWfsyKG6HoG22LN9VJDv
         t8ckmrfE5LfU7OjHGWBGL/iVczfu0+XSuzkVD5BgoqdaKqWo3tdXOxVEziDz5+nyyjnF
         IllqOpp0JORIy2mawgtDbeI6YWG6Flmrszamr/0/hDiRdlPNFQdIWaTGDLOZMmmEJlEx
         Qqpm9h2DHr0VV9R6heD2FYQKuMwJtA2hBXu+LDVtlfqrWxpv0PsxO0pscFrMJPhhOBsZ
         lLXWy9zls/4r9mVvmAObfpC7hlKXVcI4PEk3l6CQ/gxh+jQIxj5sHnyTBKigif3my3If
         FI5g==
X-Forwarded-Encrypted: i=1; AFNElJ8hBMPFn5KtVZe4JFfI7eFl0jj66CTnbzPDWAY+SwYgpB+l4/8Lu0olswOmXXfGjstowOD6SESnsxGdLlv/@lists.linux.dev
X-Gm-Message-State: AOJu0YyG2eVK8lZKWqIqiVb1Ji4U6zPKphmM2p2KFTa4AZg/ESu8FDX7
	/OXQpCCsqGcAeCCsE0B+jA3nCGGwqYJXtbyUgIoQHcc5dky4e3syqUFD
X-Gm-Gg: AfdE7cmkkcCHgyPvWLyFfe8QjbLqG0SERFIkr6tluJPxlk05N3aBYS1WSmCBUB4gyZ/
	zOjy1jnSUov5yQ1j42iRY0ksi987MsdSBnGy0RScyqcQqavWgC2yWjJ8IRUHhPPkfoybeTFnYm0
	TP0eQ92O8HKZA8EY7UmJ844+uG/i8RTVjJ/p39sqG4I2cZNY6VM8pHBKomKNlLcyK7TDaidTHE3
	f8AWxzQiToiutRKIrSTB4hEF2XptEak+Q1omHl2a/iUKPHP6jHII5txYXZ1PU8HeyVgfe/Q1pia
	Fmb7Xm8XNZzmDhHAdvG44ial+ai9BUU3p5WiM4jmASd/gk1IU4n/nUlIEtZEjTGCiUDPyQc7zP6
	96uytBHwCI2v4xyv/uipvHwnpS/nSkD1FV6B5aqz5sYqJRuac0DTmF8sAzUDEiULqrs7uBH9IQU
	WpWm1V4+2prhh41OQoeWpTdN3SH32Tjnm2oJWtlkO9
X-Received: by 2002:a17:906:c14c:b0:c12:7b3f:6c1d with SMTP id a640c23a62f3a-c15ce151107mr92379366b.60.1783506023447;
        Wed, 08 Jul 2026 03:20:23 -0700 (PDT)
Received: from fudgebox (k10193.upc-k.chello.nl. [62.108.10.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15b7561db1sm235657666b.12.2026.07.08.03.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 03:20:22 -0700 (PDT)
Date: Wed, 8 Jul 2026 12:20:21 +0200
From: "David C.C.M. Gall" <david.ccm.gall@googlemail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: clean up struct spacing
Message-ID: <ak4kZZ3CQE69cjSm@fudgebox>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Adhere to Linux kernel coding style.

Reported by checkpatch:

WARNING: please, no space before tabs

Struct definitions in drivers/staging/rtl8723bs/include/wifi.h had
inconsistent spacing.

Signed-off-by: David C.C.M. Gall <david.ccm.gall@googlemail.com>
---
 drivers/staging/rtl8723bs/include/wifi.h | 34 ++++++++++++------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/wifi.h b/drivers/staging/rtl8723bs/include/wifi.h
index c8844e2bf7b4..d5132bc4280a 100644
--- a/drivers/staging/rtl8723bs/include/wifi.h
+++ b/drivers/staging/rtl8723bs/include/wifi.h
@@ -329,21 +329,21 @@ static inline int IsFrameTypeCtrl(unsigned char *pframe)
  */
 struct ieee80211_ht_addt_info {
 	unsigned char control_chan;
-	unsigned char 	ht_param;
-	__le16	operation_mode;
-	__le16	stbc_param;
-	unsigned char 	basic_set[16];
+	unsigned char ht_param;
+	__le16 operation_mode;
+	__le16 stbc_param;
+	unsigned char basic_set[16];
 } __packed;
 
 
 struct HT_caps_element {
 	union {
 		struct {
-			__le16	HT_caps_info;
+			__le16 HT_caps_info;
 			unsigned char AMPDU_para;
 			unsigned char MCS_rate[16];
-			__le16	HT_ext_caps;
-			__le16	Beamforming_caps;
+			__le16 HT_ext_caps;
+			__le16 Beamforming_caps;
 			unsigned char ASEL_caps;
 		} HT_cap_element;
 		unsigned char HT_cap[26];
@@ -357,22 +357,22 @@ struct HT_info_element {
 } __packed;
 
 struct AC_param {
-	unsigned char 	ACI_AIFSN;
-	unsigned char 	CW;
-	__le16	TXOP_limit;
+	unsigned char ACI_AIFSN;
+	unsigned char CW;
+	__le16 TXOP_limit;
 } __packed;
 
 struct WMM_para_element {
-	unsigned char 	QoS_info;
-	unsigned char 	reserved;
-	struct AC_param	ac_param[4];
+	unsigned char QoS_info;
+	unsigned char reserved;
+	struct AC_param ac_param[4];
 } __packed;
 
 struct ADDBA_request {
-	unsigned char 	dialog_token;
-	__le16	BA_para_set;
-	__le16	BA_timeout_value;
-	__le16	BA_starting_seqctrl;
+	unsigned char dialog_token;
+	__le16 BA_para_set;
+	__le16 BA_timeout_value;
+	__le16 BA_starting_seqctrl;
 } __packed;
 
 /* 802.11n HT capabilities masks */
-- 
2.43.0

