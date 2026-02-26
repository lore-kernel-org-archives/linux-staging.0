Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604D738BF70
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 09:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772098700; cv=none; b=g5IH6qn11YYjxCFeBLFQVR8hSe69eOhghdwgKArhjPM9+dDOxnuDgnrIZhv91vLtgk13FNTkkJ5GrsnAUbyhqZ1Xnz/J0q2zTg5zuJhWiA0buMxEWaZrhtNhSi7sTsS6Uu753759f6nxxA25oLKIM6DJc6giaA/z8CEfU584WI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772098700; c=relaxed/simple;
	bh=GmqYrbLcoW5QqmaaatdkHex5B4EzBpWZMRMVT7ilXR8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tRtI2DDW/946yD1nTXq2EEj2HDdAngWxe9eJOUyJ+qpmwRXHrFM5sNlzqcnWm1ai0+ti5bjZORhV1W8vnQOBgjRsPZNTv7vP4I5ocE5BysyB2vhIBismVNnH6DrppU0zY/oGpo53z1ryuGJDOlWr7ySMl3FMKrCeqZd/Oe4U7JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XzB+4aLn; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XzB+4aLn"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43989bd056bso527990f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 01:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772098698; x=1772703498; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cHZjwROud4cHURRVnpcYYmwjPq1hapsDVmB8VjSgMBw=;
        b=XzB+4aLnHWCo4IaS0VN50u1ZAAu8H9ineuUB5ArknfnjMi2cqCezi1Di5L3EKtMoDq
         aT/7ZdoXvLeEcle0YOpzLN7XHuK11SBUbEu9/3bnvl1QIZK4nAoCgrhvPcJoLI0GAfft
         fw8ue+md4S0sGR7/f3Gvp70148AeXjjdNfCxDcEoJoT1nptiEGe7NaPB1dHT94A5vpxZ
         9XeRaMksymwZnV/rnp3tLjW9Im+VMmrsFrXv46LGIGkYuyMhSygxePjjh3hSzv8qs+e5
         z5YRW3sV3dr4xVSnexeeqxsL6oKJIzqUm1jKP+NqDQIljHX5y+rV9Q32puOarYR6gqeS
         Plgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772098698; x=1772703498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHZjwROud4cHURRVnpcYYmwjPq1hapsDVmB8VjSgMBw=;
        b=OPN9hJPcGdFoPmyc2j7hrO7zs8xqgPiOMVr68KCD6ecUO6UkYG2cqTXZR2TMpZrAPO
         Mvdr+ThmMrDYay6Tg6gCF5wGO0Z8bm5L6PEgqZJ+HqOIBgUHBcZm0SuXojvTXqzdHpxI
         rQalVPB3fbTdiOjYBq85cyNUmXAu0YnORxVTKIdBCcA1touqeYvPj2Nlc780Q6bGb8U5
         fLnhdvB2tirtjYT56r85ZyAjNbLBAkN34lE1Bw5nzberuEU0RLB8/iZpcOj56zhdrRgy
         LEPVLkdnQ9HjQ1upEdbAL3aWKf6dBkT5Lf73V6SFSwnHK0cK+iSNPZzGMSNY/5IjA9Wc
         SuPA==
X-Forwarded-Encrypted: i=1; AJvYcCVrXKlfVc+tHZtZcf7Eo5nd21U8iz7gUUn9G5+lhLl6A8WLuj0mOC8fg+sxfWW4jxtfp+NE/eOGGLggY04c@lists.linux.dev
X-Gm-Message-State: AOJu0YziE3vAlVI6PnPwOmjWmq3TZFbJdXmpzWxWI2Ph+c8BNEhu5DxO
	c+MOel0w8Ppz7Qc7Hct0EX9DeaXgaIOHSvOFlrfcKddzPXNdLZiGGCcJ
X-Gm-Gg: ATEYQzyUlEVZ5B1TJcXwrTPaxUT9MBYurWjPUpmODVQtrnKAjl5yhrGdRU1RjKxHlLG
	h0adGz2WNkBsE7ti9hU4J7hLop42c51Eac6G/nzUyrAbChjK4Fx1FKZAjmBOQL6AHdRx6H8nEyH
	LQqn9l+2zaWjH8FAdXrjDEm5rGSYBHNQmipb7CWAkYZMmnrat3YV1IYzRDzJOrYxlw7wKefRDJy
	jGKheXOJHDPOpd54fPGVxBpD0aI2pfbet8s9OOBS7zYgswvL2uuocQmpvrwUKMOUCCbMNUXIxiA
	aEpjsNW9GlwexLeJECkaa/GZIBQ5lWvRT7da2o5zHRD9kOrn2w7JteOM72Uh2l1HkwYS/KytWZR
	zZH1fLi63HUgvkkORHUfbm5ETaXvVYz+gifUyJOkPZYly8yGiTETXhrAhTz9ylPpGF3K4yok2dz
	4pU0m84BejC8mQgzTW2xBc+ar/VjjRpuwty14a27MaCb0l+EH5VnKu
X-Received: by 2002:a5d:5d08:0:b0:437:678b:83cd with SMTP id ffacd0b85a97d-439971f15f7mr4307073f8f.15.1772098697521;
        Thu, 26 Feb 2026 01:38:17 -0800 (PST)
Received: from mariyam-Latitude-5310.. ([39.37.133.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43995c4b726sm6098777f8f.5.2026.02.26.01.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 01:38:17 -0800 (PST)
From: Mariyam Shahid <mariyam.shahid135@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	ethan.tidmore@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mariyam Shahid <mariyam.shahid135@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Fix logical continuation placement
Date: Thu, 26 Feb 2026 14:38:11 +0500
Message-ID: <20260226093811.30659-1-mariyam.shahid135@gmail.com>
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
 drivers/staging/rtl8723bs/core/rtw_ap.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 3e62fc8f61cf..004730d5f98c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -1573,8 +1573,8 @@ static int rtw_ht_operation_update(struct adapter *padapter)
 	if (pmlmepriv->htpriv.ht_option)
 		return 0;
 
-	if (!(pmlmepriv->ht_op_mode & IEEE80211_HT_OP_MODE_NON_GF_STA_PRSNT)
-	    && pmlmepriv->num_sta_ht_no_gf) {
+	if (!(pmlmepriv->ht_op_mode & IEEE80211_HT_OP_MODE_NON_GF_STA_PRSNT) &&
+	      pmlmepriv->num_sta_ht_no_gf) {
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

