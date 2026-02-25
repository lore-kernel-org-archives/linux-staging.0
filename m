Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBBA387362
	for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 14:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772029341; cv=none; b=msSihu+pXcRpKbYgP+s7WOozTMNV+oKlFBuUmawFbp/u8jQM7ESjIkegC56sb5Brwju4Pc7PBSzRFfpy2kol0y8u07lAlY6r7QqK0WWqImdH7NxLrvXjRExhcLFI9+5VnTmGxH87CdAdwO1vlAoMsYLvq/MbA35QTkf9PiygQfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772029341; c=relaxed/simple;
	bh=WNG322/8ryIaFYXmQR9CNc1Ky5Sjib2XtdSFppAj8Is=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NumFH1AmleBRdcytdEDWHq7K6wCjTiOWxL2NP72FGxtjgahV3PqQ5a53jLp49YizUKUTbcAKdIPvdQDgGk6O4M6X3qBZK0P0d8Uu0VP/8Abg50FwlVxBQTDhLXxRahS5YYEU05U6efa17cL3Ge1FmabVpNeyepm/U1wnCCl4GHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VkQuGNHN; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VkQuGNHN"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4398ebdf4c2so40136f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 06:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772029338; x=1772634138; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=faHTyWHlOFxJhwrI3ZrnlZURpS47KQZfvCk4rbbiiDg=;
        b=VkQuGNHNwhL1OX8KLx+AiQUqz8p9YkeYY8LQUA4402OXdcfl9PJBov3Mqun3Dv+f8b
         SyKSwKBcmsGljDI9bYMYjzfi9BoDf5QyuOmVY+Pgd8lOOn7UKKXvd7ipFDzYTichmgo4
         7K+Np/yxW56eS0RiklDtqMAvYIzP/4yglnsx6EVnsHvxPjdlL3Oxi6gvSCma80q+tB1x
         LITbHOrE2UhlX7HaOYrmB0MZw0AJ1JF9XQ5yADIGCiLiDpcKxRbyv3/MzCWRDMwwOgOT
         0LDowKua9B0egIDPU6nomMBdvHKzo3K45eNzfaGf68Z1aXgb5cNImdQTg+ofcWM9Vh83
         PwwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772029338; x=1772634138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=faHTyWHlOFxJhwrI3ZrnlZURpS47KQZfvCk4rbbiiDg=;
        b=jw4s09xxnr3yHJ0ajIFIW0SZRVKc0Olv66RXH3BrCe7/5/wYaVO5+gEodUOwpC+tG8
         4divI9VZX4hxPd2EaYUNWsiIwUn2dRLiHBzPoCDQUmJeixekUWf36Z8fO2Di8nJGphf/
         5nmctPN4aAx0oxeWznDunjYXMIZXBfvmtMmmTr29lPgacV1zBYZBWEeDYOYekXYcfVWw
         NNQ5YXhFWnELvY9rcMYMr5a6OyjQihKWM27mQI9HfGOIGavuKm0n5XMKYixELiDZXYWw
         sQpv433NLgYAfsZxOagcK+1xDQ/mWYgxuQ+qaUsnRrsAZdwQPoVqYCxN31S0cgAAGV8Z
         lbqA==
X-Gm-Message-State: AOJu0YyLzY5Vfsfk4hRFgVbgN6RLG6Tt2ZD2WXyMqhZT9rMP0GINPz6H
	TdUi/smyVBq5wKodHwO95vwKvZzw0VAAKMacdBTdKRXLt7TJHnP5DRVQ
X-Gm-Gg: ATEYQzwgEoVpo48I1rkYWQTvDgaXQ1Lizni4Dal43pKn314QL5NUDgPlgn0Mirz0p6j
	/Wref6Yiw/873ACOyLih/r6eLKTBsnCttgbzIpTQRsgJmFs9suNQ9HP48oKOcNYlQq7RIH9Ulj5
	/RGXAUQZwoInexiiHodTZf+7rgCey/7bh8Ul6mbCloPknn5o6pxGp9jCJEt9jN2hESAYnhC5q3H
	ICGFZIw0iDXn/H0na+55ZVBlTM0QDnmAQmSt3rWsMKTRnDB7FLJL8fCRR1b3yf+tldL3FvH8DIO
	L9B7vrgGRAd36+BZU9hRyfXSXHN9eVnyzAmQvCvzJa5a1oUfgaG6wItC5oc783HBt0KyH0u+LS/
	ruk0po75QhhbP1XrVEZSzqbZpB7X384X2iG3cmiG6qYfiRjSNl0Bd1IhedMo7jjkQlg3chJAUZm
	9cnSXQSCfHAGeEBgVVgiXCT+arPUblxku8ekKBLxrxESCV9np7zzU=
X-Received: by 2002:a05:6000:40cf:b0:439:9106:3bab with SMTP id ffacd0b85a97d-43991064a10mr2016059f8f.8.1772029338385;
        Wed, 25 Feb 2026 06:22:18 -0800 (PST)
Received: from rivka-VirtualBox.. (px140.isp.net.il. [195.60.235.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d3ff1csm33485591f8f.20.2026.02.25.06.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 06:22:17 -0800 (PST)
From: Rivka Bukchin <rivkab300@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rivka Bukchin <rivkab300@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: fix CamelCase variable name
Date: Wed, 25 Feb 2026 16:22:10 +0200
Message-Id: <20260225142210.3493-1-rivkab300@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename pHT_info_ie to ht_info_ie to address checkpatch warning.

Signed-off-by: Rivka Bukchin <rivkab300@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 67197c7d4..9ab2219cd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -802,7 +802,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	int ret = _SUCCESS;
 	u8 *p;
 	u8 *pHT_caps_ie = NULL;
-	u8 *pHT_info_ie = NULL;
+	u8 *ht_info_ie = NULL;
 	struct sta_info *psta = NULL;
 	u16 cap, ht_cap = false;
 	uint ie_len = 0;
@@ -1060,7 +1060,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 		       &ie_len,
 		       (pbss_network->ie_length - _BEACON_IE_OFFSET_));
 	if (p && ie_len > 0)
-		pHT_info_ie = p;
+		ht_info_ie = p;
 
 	switch (network_type) {
 	case WIRELESS_11B:
@@ -1097,7 +1097,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 
 		HT_caps_handler(padapter, (struct ndis_80211_var_ie *)pHT_caps_ie);
 
-		HT_info_handler(padapter, (struct ndis_80211_var_ie *)pHT_info_ie);
+		HT_info_handler(padapter, (struct ndis_80211_var_ie *)ht_info_ie);
 	}
 
 	pbss_network->length =
-- 
2.34.1

