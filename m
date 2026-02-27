Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265B91FF61E
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 07:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772176700; cv=none; b=C59MtqgR0B9JQ0gQxVEeR/Etgh05lk4I75n7EiBRL8CPWcLZiPnF7rL/VjDl49NEmahnal3DAcSy44BVSa808RNqznGgPESlKEEPpxR5Rl4WizsPQzYrmekaVG+NwMTpb9zMiSxlM7JAIIAa3K54ni5DgbA57rFwydCPZohB61s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772176700; c=relaxed/simple;
	bh=w6Nv2bbVz5OJVA6iDxv8sg51pWNVi6XiPIqLgpNb66s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fpu31Ti5NXk981iBl5PUOa4j6amM21fpjZU3M5r19ikP6Ois9CQW23jDjxdMZ1q0qNKBamh24HoU1F31orPJ1jrlzphK8uQ63uhcVZQ3Zeeb673gbhyt/YoKKLXvHdfBhMb/NyilF7VixsEyyUFCFbzsi/JQqg+YiIZSz44K04k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSwr4S31; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSwr4S31"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso14577755e9.3
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 23:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772176697; x=1772781497; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zQ/Qm1j+tziQZm4fGVU2OGup9+oFu36amqN0SnHDuLk=;
        b=CSwr4S31014bUgx39Gg6XT+mDox1V3eplamKEU6rac//ol1S4Jqi0LjAZeESK5j3Ph
         NiHr61aMhlrVYtPs/Q4W0c0x6WwjymWrC46ASDhG8OFuA8gSVe/COstwe/l/AqP14a6U
         WUqwV/i96BI8g4c7W9b8g82FYMEh6BbCYuyIFTvEUwBiqepBvuNY+vW9dcTVPUSNVbXq
         vEvdUNfuxdHMePX4TJvQ9j8VPLufvBer7XWyswB/OzWl9QWyhFpwq60zsjYf82mU92nJ
         ZiZn0ViQ0NlhWmfQDZCjFsRwbYpk+b87Vy6NRas5+DnHOQ5E12l9SPiRty2jR5VJAcY1
         o83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772176697; x=1772781497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQ/Qm1j+tziQZm4fGVU2OGup9+oFu36amqN0SnHDuLk=;
        b=HRmzvy88xkE/wxVylWCK2Xs72/qgLD+uEV5aJf53C378gqfzFyHThnBq4Ff5MeQus0
         95KNbHz86tWoAKHUqxYHvjIgGARQ4Cki2dOdfZXacYFG+mBtzBuZfBLAimhOUS6FPDdD
         yTnKWx6djWFoZgopZWs45Fd6uZGxZWvXeHBVTeDCR93Icw8XufgshFJbylBc7S5dh3RI
         Pm/TTz4Lrrh/QO+4CPpYn/qs9gtumaBTxi2JoShkgEsck28Mu5V+F0zoUEgGNRbo6Kqh
         MMFJjhxlD7ZuvEzIVsxwkjRtaOei/g1IY+2c2pTIaO+9bSwj17L+kRLb62S3BCvX5B5O
         8Zkw==
X-Forwarded-Encrypted: i=1; AJvYcCV6CtefEva0ZBpECpkgpUu9SwkFTAqVxScxnogK1a6W0dnukj9LVVi/qOhwlO3aE3y3Ndw7B/9xUGpdyRVV@lists.linux.dev
X-Gm-Message-State: AOJu0YyLjN5VdmD7KcDYBP1WQQHRr+dCk5wOR5KnUx6q/syRlnxWAYL1
	jXS1crDzjKMYWSDEQ4CpABp5YjiJCKP8AQdbcWjPFbTqzqIs72ZJxFfy
X-Gm-Gg: ATEYQzwZTxP9UZOW2bq+Cq9GkRP2jikpjN3vmnS4y9npZfPTVfP2OK/ghHJBXklbisA
	AfTnDd7x3upsLQXeyhLn7WaPtmdga85GYfVLDyH0ahQG+KEXVSgmEyCeYsok0ohmmALtpMHocTu
	JCIuNwxoxwHDtVbwy6ug8hH+t0TfxtCyo9ZNrWJCLiMw0chBgz7fHIRPKWrR92fqe4FvUobNpxn
	0gsGuusT1HOmRLmLVHcGANMc2uN2a44FCBZWae/t+PV5dtBGLKpuDQPg5OFQB60aEHSkHI7emHz
	Rper+dMcmNoWox79zthiXISVbmjudnWVEr5Ouaa5SyVjVkgTEumYqPPyCvD8m5B77ffh1YFcS+R
	ZP6RkDBxpz1RcUFVuIcyk+1fBBGbcgalafKAYICI6O8zPJrR39xy2u+nDsfFFhl6cuULI+DhhZ/
	Q+iQphi6VXmbXhr9egh/+RIY/UmTNXy1yxrtrR2VuFG1BgpwrvZW/c
X-Received: by 2002:a05:600c:4f11:b0:477:7925:f7fb with SMTP id 5b1f17b1804b1-483c9babeaamr26713235e9.10.1772176697186;
        Thu, 26 Feb 2026 23:18:17 -0800 (PST)
Received: from mariyam-Latitude-5310.. ([39.37.133.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd765604sm171412125e9.15.2026.02.26.23.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 23:18:16 -0800 (PST)
From: Mariyam Shahid <mariyam.shahid135@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ethantidmore06@gmail.com,
	trohan2000@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mariyam Shahid <mariyam.shahid135@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: Fix logical continuation placement
Date: Fri, 27 Feb 2026 12:18:11 +0500
Message-ID: <20260227071811.6255-1-mariyam.shahid135@gmail.com>
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

