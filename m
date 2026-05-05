Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EF848B389
	for <linux-staging@lists.linux.dev>; Tue,  5 May 2026 17:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778001747; cv=none; b=F6UgZMGjAdSYRXinEpvPP5Yd0VkQoDxn/F1jeCqfgR0EBu3GEQ13UVVpoUCUiXnvXYrDXn0J7RDgkJpSX6kmokUOYZtsN0ek7UQkSLOA7DBPnjjAvoBK7j53pTTuvAKy8PY1fSxFg6AlVP28qZ9jM0gmUO/m6V9lUDNZtBrRD6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778001747; c=relaxed/simple;
	bh=+8CNpi9Emk9pvFDYp7sMDYqpu9yK+ln5XoO9066B0Ss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hj1bm6kZbeu3aEsQsTz8/n87PKz3OAEFFOQ06gRDc8n29RERu7lg6Q9vQzvgTLJQgnU0yV+cw07DgMvlPI+1l0zJZbXgrtxoeJSI8fygHT5KNamhvBIpFPKuPW6DbEuTy6M3pSEjMHO0LjMd/uLSoIOIsK0lIid5f2OPQF3uzx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hOIoMrZo; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hOIoMrZo"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43eb05b1875so2930149f8f.3
        for <linux-staging@lists.linux.dev>; Tue, 05 May 2026 10:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778001744; x=1778606544; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+mRnb7VtjjWLO9Am+98zCG8vyA2Azd5IwKeJ7qO7zuQ=;
        b=hOIoMrZoUi1vuVr+wvrBNDfzG87CbEEp/2MDGn8WiHCCSs5R10Y259x4rR89Fjxs1c
         s9NC5TnBj/vkjjBOh9n4O0Wx/LB+HlNEo7223KgbuhpeyIFcdtrGeNBxpZkzmPNzGxnK
         2fV/w1GBnLxOlOcUsg7OaNbdB15HJI6Q3TnzZwte4TZNVM/2GYTk3ge+RhoRANz9/0Pd
         YmrvdvpvQBxF9fIM68UhmEq7QrLwLRNbUKuokqCmUMS3hbO++nvCoZpMszqd8DJ+ig1R
         t0IqA8QtuhWEU+0GNK4zBg8u1Ne6mMRjhMdQW3GIJx74mLxXIqGapsqKTe8f0tnKAGop
         KCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778001744; x=1778606544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+mRnb7VtjjWLO9Am+98zCG8vyA2Azd5IwKeJ7qO7zuQ=;
        b=eL1cq7ghomoubYJwr6/v1wGicvSXw2sc2cYfuLkcPQCmEWjfJ52Odjj45Zxsb+YK/T
         XE/he5T3L92baIOfgaOV69YC5z2goLJ9+ZhSYUmnJS1/K2iUO6LPhkaeqgDOWjZrzSoB
         A4ic6ghqSRylKRrr9UXWpX2rbWFpIfTxtxTMwnfa8aYZcNIKXMVsTVgNSWcEmL5YAKZj
         BNkNd+l42uexzY47J/svtPS+nIY+d1bFX0Mq1Jpa4MVVg1H1Jq+uD/qBbBW+mgAVw5GS
         l6Sbx02y9Ni577g9Dl92ggWw/ICTtfQY/no5s9MyK8BahcwNNQKeCgIqIv/fiQt5mjHF
         Aejw==
X-Gm-Message-State: AOJu0YzuvKTUEKh/l0oDlZbg7xiy9SWjlXO4HDyi8Exii1Cg7qbx4WXc
	bsTwIm2eTq3xK1KznLPfcdfFeIH/KoA7r33GtjSPZq3fzfZY1ORo/hinQyqLSA==
X-Gm-Gg: AeBDietGSKhpNIIXbac+PyuIk+mpw0tY4cgPptyxZJrA93qLeu0W9KqwwyWNVdzmQfU
	HHXb2HanAyh7SufhtQ416ws4Hx3oB8++GRrEy8hFJAoudUi1ZN+x6aWKpEHJZIYnEBgq/jJW+SN
	xteFGBakduaTCOFD7EuonccwIqKzGr7CQ5YnEM6z5tRBEzFJJjlyf7XQk9Y3aS35IyseaEQtzP3
	u7zUdCwpb0Zpq/bexjKK7+GRSPeQr9O+E1VuV9JQs+lPyA92isqfBloyhVNPPkTfy4qPhDk2bCZ
	3faPyL5BI0AgLPW3P9MHEz7TOBV9y5PCfE34dWSQ7TXSn7pboT17CYM/qRHQIPAobf9YKHxQh3b
	opLTnZO0BNEiK4Vn1Gv03NvL7MbgroT1OVWsGpP/OqSOKD5OZbzOMbyYFQ2sJsMNwDDyxwj1aEE
	K9fJOx4zQ7pCt3aYSbxqmlrJmCg+2fCtXjECA6pCHTIOPyFRlYm4nRWJKR6jGHZ9k7gjiE98Qem
	QK87vxZuTmQgndUOEys+7cTqs4VDjPpvkfy38eHpOGR+AEsLiBvvJg6LsrdTBKWkD4lZ3I=
X-Received: by 2002:a05:600c:3b17:b0:48a:568f:ae8a with SMTP id 5b1f17b1804b1-48e51e1a870mr2765905e9.8.1778001744152;
        Tue, 05 May 2026 10:22:24 -0700 (PDT)
Received: from ahossu.localdomain ([82.78.232.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960902sm6640747f8f.28.2026.05.05.10.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 10:22:23 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	luka.gejak@linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v4 1/2] staging: rtl8723bs: fix OOB write and read in HT_caps_handler()
Date: Tue,  5 May 2026 19:22:13 +0200
Message-ID: <20260505172214.3650398-2-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505172214.3650398-1-hossu.alexandru@gmail.com>
References: <20260428091621.739680-1-hossu.alexandru@gmail.com>
 <20260505172214.3650398-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HT_caps_handler() iterates over pIE->length bytes and writes into
HT_caps.u.HT_cap[], a fixed array of sizeof(struct HT_caps_element)
bytes.  pIE->length is a raw u8 from an over-the-air 802.11
Association Response frame and is never validated before the loop.  A
malicious AP can set it to 255, writing up to 229 bytes past the end
of the array into adjacent fields of struct mlme_ext_info.

Additionally, after the loop the function calls three macros that
unconditionally read pIE->data[0] and pIE->data[1]:

  GET_HT_CAPABILITY_ELE_LDPC_CAP(pIE->data)  -- reads data[0], bit 0
  GET_HT_CAPABILITY_ELE_TX_STBC(pIE->data)   -- reads data[0], bit 7
  GET_HT_CAPABILITY_ELE_RX_STBC(pIE->data)   -- reads data[1], bits 0-1

If a malicious AP sends an HT Capabilities IE with pIE->length less
than 2, both bytes the macros need are outside the IE payload,
causing an out-of-bounds read.

Fix both issues:
  - Set HT_caps_enable = 1 first so HT negotiation is not regressed.
  - Return early if pIE->length < 2 to protect the macro reads.
  - Use umin() in the loop to bound the write side.

The parallel HT_info_handler() already guards against oversized IEs.
This patch applies the same discipline to HT_caps_handler().

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
Changes in v4:
  - Add pIE->length < 2 guard after HT_caps_enable = 1 to prevent OOB
    reads from GET_HT_CAPABILITY_ELE_LDPC_CAP/TX_STBC/RX_STBC macros
    that access pIE->data[0] and pIE->data[1] unconditionally.
    Caught by sashiko review of v3.
  - Use umin() in the loop bound to cap writes at
    sizeof(HT_caps.u.HT_cap) without bypassing HT_caps_enable.

Changes in v3:
  - Switch from min_t() to umin() (Dan Carpenter).
  - Keep truncation approach rather than early return so HT_caps_enable
    is always set before the length check (Luka Gejak, AI review).

Changes in v2:
  - Replace early return before HT_caps_enable = 1 with umin()
    truncation so HT mode is not disabled for APs with oversized IEs.

 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 6a7c09db4cd9..98aa50357e96 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -936,7 +936,11 @@ void HT_caps_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE)
 
 	pmlmeinfo->HT_caps_enable = 1;
 
-	for (i = 0; i < (pIE->length); i++) {
+	if (pIE->length < 2)
+		return;
+
+	for (i = 0; i < umin(pIE->length,
+			     sizeof(pmlmeinfo->HT_caps.u.HT_cap)); i++) {
 		if (i != 2) {
 			/* Commented by Albert 2010/07/12 */
 			/* Got the endian issue here. */
-- 
2.53.0

