Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43B52DB789
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 07:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776410255; cv=none; b=GGrII48+fRtvWcDqk3B+qEpzx2PNes4QMfdZHqPTcnsELUi2YZMyVAFEyCyPErvF0Uw5JsB9AJDiU8ujC2/ttJrS4p0Yf0J+KDKw2sHTn3mZ1w0/t+0iSF4jHQ+BrwnSkiN7ulkG9SL/KIMk5gyyoZC6zPHMu4ZzVGf4GJhfb9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776410255; c=relaxed/simple;
	bh=lA6rlGoT9puKOQN0xlK6oSAivLyFkn/8t+uJZ6sFXqA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MwQCkEc5XJdrsAhyPb9IuwURCGdA1sBdX6bs/oNdhPC3JPek2b4ZDKwFbx6B4tZrWfTSIR4+HZXZpVGm37XQ+j33Kl0N/nb5JD+jgmp6hkiDWXmRb0RY1E9nkl/8ReTm87RSnUmP5fFNPCgDvnZaoeTMH0KnTnw4nCXeWv/Jf/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N5gJFQaq; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N5gJFQaq"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-354a18c48b5so383794a91.1
        for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 00:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776410253; x=1777015053; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j9e8tvTlsJ6v+omPGOwFsgHnhAedv7uDHDLSwyKSlBA=;
        b=N5gJFQaqh6hTT2kDJWtFDdZJAxPYc8mPB93OrLSi/zobxVbSlex8QGwW9vmTtopIfb
         7AslQb2UignpqUemLS2IJ+CWl45GEm1IwYi8isoFZPh4KFoRymLrWnWcFFlfuljS0GC5
         DjSRi06Udme/N8mile9oqmmvoBbPJBQ1z1WCbQvNNHMarbzraU9OGycarDFvjlLSxrJd
         ozNIcQTcE2MzwXj/BxFbGU6uxUfQFQUgQschDYSxO/aKUX2Y7JiMX/DUrRDdTZlD5oV6
         Wo+NCWUTXt0YznzWFnfVGKJjBEh1UT714ioAMgl77TaQ4K5zRMc0ubiBWrVxvfgBmaOV
         9Arw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776410253; x=1777015053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j9e8tvTlsJ6v+omPGOwFsgHnhAedv7uDHDLSwyKSlBA=;
        b=GMPeoXPimrkuzNkF7uyKW2upLddhTpjZi9BJynGXVA2i9ca36FqKq956kS1oygY5HM
         dDvb435sxcwTpIHfSoHLKtxyrcdZTjfgDJY49vk1BzzP8s5KhQ6jJaaqOyDbQYQ4IjRQ
         EYSJep+uwFqRCjJo6ihAdEMjkHetfkHq4uT6UJkrfskAu2bNquokGdQd8Hne6SMM+8UK
         Jur8AFhdCWnUm2st6xby8ai4ZgAATTq6zLqkBMdAf5PaHL1XCDeAj8gMnU+/ELW++cFp
         JC2Twxia+LXIgu8kg2GxxUKpskz+QJPDcdfzf6wpzmImyXCp9xDNoI5lLbfk2IaL2akd
         dXHA==
X-Gm-Message-State: AOJu0YwZ6dy/QxQni4mqQJxs8ab1htcqcXkXwK7vYbQDHMuBn7ZvnjP5
	JO9fzE/p5xIO1sWIQRmbY2Me9dfKIGmJBfalyS4QY8B04jIoZ8SWDYKM
X-Gm-Gg: AeBDievJoRB3rjq1RJNuungegTYxy/H4tOVqgqAdS+PFnUs/QSZdPpwIXxCiABKwCFI
	Nj5CJsvWO2satDmtBMSvJiOJll8NrTpnfv6nKetWH1xVDYtVMWOrRLyNST/JR8RMLqhnpZnCePq
	vpN4PbaXBvxk7cWmimFeKBpg/hg0mRCnuii5UNI314pJsqZhZ4A9YopjpypqfpvFAJEKjQwIVoa
	gvVWcltVgB/HVdagz02SMNOseph2aGAD1E22ThCjjiZwNEVzAQWojQ+PKUsGg4srK1Kwn9sWI0K
	9cMGvmTYPSZbaGXPw3+2VQcYf/YbVLdFZsDu3b09FL7SK5wMtiU9THVL20UB2uMv5kIwHXqs3Yc
	ql4OBofQoLqSBVRxzhu4131yK6wZh09uBzpDmMriIl6E6sIDp8/3nZ5lwSBB10WSQ2y+ANYv54e
	PDc0/qE5NQJPKCp3hxyaeFKVia2M8NMS2BXD0kGplYMTaen6JSodXmYUG4olmc+VHt
X-Received: by 2002:a17:90b:4fc4:b0:35d:a861:36de with SMTP id 98e67ed59e1d1-3614049efb7mr1881588a91.24.1776410253102;
        Fri, 17 Apr 2026 00:17:33 -0700 (PDT)
Received: from volcano9b0c-hostos.amd.com ([165.204.156.251])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3613fbd470fsm456492a91.12.2026.04.17.00.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 00:17:32 -0700 (PDT)
From: suryasaimadhu <suryasaimadhu369@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	trohan2000@gmail.com,
	dan.carpenter@linaro.org,
	suryasaimadhu <suryasaimadhu369@gmail.com>
Subject: [PATCH] staging: rtl8723bs: simplify boolean comparisons
Date: Fri, 17 Apr 2026 15:17:25 +0800
Message-ID: <20260417071725.110471-1-suryasaimadhu369@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid explicit comparisons to true/false, which are unnecessary
and can be error-prone. Replace them with direct boolean checks.

No functional change intended.

Signed-off-by: suryasaimadhu <suryasaimadhu369@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 864cd8b6d1f1..6c29dc55b180 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -1013,10 +1013,10 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 
 		rtw_ht_use_default_setting(padapter);
 
-		if (pmlmepriv->htpriv.sgi_20m == false)
+		if (!pmlmepriv->htpriv.sgi_20m)
 			pht_cap->cap_info &= cpu_to_le16(~(IEEE80211_HT_CAP_SGI_20));
 
-		if (pmlmepriv->htpriv.sgi_40m == false)
+		if (!pmlmepriv->htpriv.sgi_40m)
 			pht_cap->cap_info &= cpu_to_le16(~(IEEE80211_HT_CAP_SGI_40));
 
 		if (!TEST_FLAG(pmlmepriv->htpriv.ldpc_cap, LDPC_HT_ENABLE_RX))
@@ -1156,7 +1156,7 @@ int rtw_acl_add_sta(struct adapter *padapter, u8 *addr)
 		paclnode = list_entry(plist, struct rtw_wlan_acl_node, list);
 
 		if (!memcmp(paclnode->addr, addr, ETH_ALEN)) {
-			if (paclnode->valid == true) {
+			if (paclnode->valid) {
 				added = true;
 				break;
 			}
-- 
2.47.3

