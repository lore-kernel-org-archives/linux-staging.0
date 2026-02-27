Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8113290CE
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 07:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772176446; cv=none; b=eDH8iDg3R7o/jC4T/GCBEjHkIm24r6ZK2MFR7BOYwpC6tsF4TBhVJrl2orfwcmYmvfMdUwr+7NFVpMGZ0K22aJSKVVREkcx8oxMp5zqJDE+aZuw6uIQP0bk44BHkE8k50U/jZa7PrdMMggyKfwqkHAkKlajw64r9vaA0gFqipD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772176446; c=relaxed/simple;
	bh=w6Nv2bbVz5OJVA6iDxv8sg51pWNVi6XiPIqLgpNb66s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YbE7zNlohPWN9tWw2c9ZjwpChRHnAC7tMKSf2VD3f7HLlFvBE9DKocXSwFHUUFR/fhyBe7QvpE0ESEtqFO2SfLIp8uLsh64lRP9/o+vl9OPSk3n4FYFFHIsHmxVkAZzj3GYtUcUDayheD0tPXixlQhPlaWDGbdrDzcpSHJLYh10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ng7vzd+W; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ng7vzd+W"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48378136adcso9827255e9.1
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 23:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772176443; x=1772781243; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zQ/Qm1j+tziQZm4fGVU2OGup9+oFu36amqN0SnHDuLk=;
        b=ng7vzd+WGyBEXKypbzfnfiVOh3szkiaKxMBfnrUvPhCu9KFKHqUul0lMKxNk+UZhVW
         atO5Hqf6Pz0zxNTF/X4eUCyafNE3WRt2OBhoWdhk9SHl/vB6xIQbUfBlk0bLjkxxC5nd
         dGBjxNviGHLJtsIasSo/s9/3cE5gBvKTG4A6FUmTzEg1z3ChBjTl/En3gbGJDNkxNiMR
         9ryNH+S5j+U3eHYAzJdBgvwSYy2WdvzQ3pgVM3xHQsjbartr3C1165SincoX+cM0NFBo
         Jcj4XOSFNkSCPwkmtaADbLQnfX/rOKztXJzZs+EvfZL3zFZ14i5ftAvJyxQh91rDcsGN
         tnfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772176443; x=1772781243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQ/Qm1j+tziQZm4fGVU2OGup9+oFu36amqN0SnHDuLk=;
        b=mDoSBAIvFBKWcLa4Ivbph+uxGA0+nCrQQYxuk8+ILVQ//c2z+YCFW1YSfwoBJDpnlm
         t4OZ4DszfFETaKfxo24ELvGnxWkMp10sZE05Sr0R21Q70wfPdeaTtgh1xpT83kDsLgpQ
         fgPjDN9l/h+sLJ7D8cjlRBX+zHP5tLwwXV/2+ecWnFqbD39n0y9ynVpMXqGNufwXwM4Q
         3gucsNfFKGvVIuwk764L9fLVjDRmuik9YwCL5YcahkimslL5xN2A4lYayRjK+FeQ6a1f
         IRljF1HrXYvMpGULqncsq9ZuYGUx9Q9DWxoraB0i/reSYeeP+C3ken7//O/QsIKbT059
         cThg==
X-Forwarded-Encrypted: i=1; AJvYcCWeZ1/APBhIiG66XekGsj7RposiWbSa/XHvWpenbkVuPTdEUCwF0zQEwxmi+qobczILtWRKfVKYggOpKIW+@lists.linux.dev
X-Gm-Message-State: AOJu0YyckiqXewRWpoPqy1Gwyb7RDuEbTXnvsiHujZd5T7+Uk2PXeemw
	TEGjg0gaQZBd/3jSP85gfnPy3TeLimcHBrlZOnqHbtxWJl8zXcHfR3QT
X-Gm-Gg: ATEYQzwlegQyB0I9UwSAdGJwMqwx1yaU5pkA9su41qiWw806FTIGVtMyV25lIn/1gnJ
	rFVpERMxG27JHN2QbU3U8v9w2yzKIavLJphEOZogB77C4B+BAQ/ziIi9/Jd3KeSAkm0MHFDdc50
	s9EZ82h+9hidnKEQntPT3II+oPTB4giVQhGuhbpLV1bh+qGP6HB7DP2m5mEA/yVrwh8SBMuu9Kd
	zVisT4+oUPyDnRptGMbdNNjH/I9EgARLOWb+MSnQy5RwQb9XOV4nqIaQSPzbf20DtwZq/Hzc5Xx
	dMcpPBYFZJuEeXuFlU/vHKCeFK5aHtO8RJv8ZqVkZ+1h9hXIOyCuJlsuTeKoypVorYgHPaTO6WY
	M49Gh/cdZax8Q59RIr+yJI1HXWNpL5EQocBhx4zlYVJN9N7j4sZo1sN8+TRXvCP1npje3rpMvFM
	X7pQAZ7nJas5KyrpKvgsIxM6KlBSUvdVJ1Lkr/4knCOYxEZ1y940bm52jr8mNWXuQ=
X-Received: by 2002:a05:600c:3b22:b0:477:a978:3a7b with SMTP id 5b1f17b1804b1-483c9bff7b0mr22685115e9.22.1772176442825;
        Thu, 26 Feb 2026 23:14:02 -0800 (PST)
Received: from mariyam-Latitude-5310.. ([39.37.133.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcbd781sm104755925e9.8.2026.02.26.23.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 23:14:02 -0800 (PST)
From: Mariyam Shahid <mariyam.shahid135@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ethantidmore06@gmail.com,
	trohan2000@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mariyam Shahid <mariyam.shahid135@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: Fix logical continuation placement
Date: Fri, 27 Feb 2026 12:13:56 +0500
Message-ID: <20260227071356.6019-1-mariyam.shahid135@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move logical operators to the end of the previous line
to fix checkpatch warnings.

Signed-off-by: Mariyam Shahid <mariyam.shahid135@gmail.com>
---

v2: fix indentation of continuation line, correct Ethan's email
v1: initial submission

 drivers/staging/rtl8723bs/core/rtw_ap.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 3e62fc8f61cf..249c2c0bf2d7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -1573,8 +1573,8 @@ static int rtw_ht_operation_update(struct adapter *padapter)
 	if (pmlmepriv->htpriv.ht_option)
 		return 0;
 
-	if (!(pmlmepriv->ht_op_mode & IEEE80211_HT_OP_MODE_NON_GF_STA_PRSNT)
-	    && pmlmepriv->num_sta_ht_no_gf) {
+	if (!(pmlmepriv->ht_op_mode & IEEE80211_HT_OP_MODE_NON_GF_STA_PRSNT) &&
+			pmlmepriv->num_sta_ht_no_gf) {
 		pmlmepriv->ht_op_mode |=
 			IEEE80211_HT_OP_MODE_NON_GF_STA_PRSNT;
 		op_mode_changes++;
@@ -1780,8 +1780,8 @@ u8 bss_cap_update_on_sta_leave(struct adapter *padapter, struct sta_info *psta)
 	if (psta->no_short_preamble_set) {
 		psta->no_short_preamble_set = 0;
 		pmlmepriv->num_sta_no_short_preamble--;
-		if (pmlmeext->cur_wireless_mode > WIRELESS_11B
-		    && pmlmepriv->num_sta_no_short_preamble == 0){
+		if (pmlmeext->cur_wireless_mode > WIRELESS_11B &&
+		    pmlmepriv->num_sta_no_short_preamble == 0){
 			beacon_updated = true;
 			update_beacon(padapter, 0xFF, NULL, true);
 		}
@@ -1799,8 +1799,8 @@ u8 bss_cap_update_on_sta_leave(struct adapter *padapter, struct sta_info *psta)
 	if (psta->no_short_slot_time_set) {
 		psta->no_short_slot_time_set = 0;
 		pmlmepriv->num_sta_no_short_slot_time--;
-		if (pmlmeext->cur_wireless_mode > WIRELESS_11B
-		    && pmlmepriv->num_sta_no_short_slot_time == 0){
+		if (pmlmeext->cur_wireless_mode > WIRELESS_11B &&
+		    pmlmepriv->num_sta_no_short_slot_time == 0){
 			beacon_updated = true;
 			update_beacon(padapter, 0xFF, NULL, true);
 		}
-- 
2.43.0

