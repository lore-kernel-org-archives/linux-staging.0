Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314084A09
	for <linux-staging@lists.linux.dev>; Fri, 22 Jul 2022 16:18:05 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id 17so4903844pfy.0
        for <linux-staging@lists.linux.dev>; Fri, 22 Jul 2022 09:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H3JvjBk5rZE8CylMCyXbpA9801AN+xNrDTvZ4epSXkg=;
        b=Zvxq3QTNpkDSkq1tK84gybTjc+mVOOo5e5HuakpNkJdweRp032xFQMkmFvRxEhHMUn
         3aFHS6UETE8+Zj/6VdIBJhwJWSx8ijdOWBqkju379FLK6DjWBvyjQAA2wqhpwUbiEnQL
         nRRrR98+qAC6SYJE7AVbb9biUyAK0ke4bZZboZD6HlneCWhoyQ3d/vKH75K41q3Mo/iW
         fsDxOrVzY0dT3iWrq6eRvRCD7O+aip2ekMgJ0qaPw48UBdLBExl3fRpdJPD83mdkf7c2
         UQyIxCl8NZV+VPNOOgZRV3Slbw3+16/34QSW2sNkfF+JPuOWU5+jQat3/XPx8bkFg/kV
         6Z5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H3JvjBk5rZE8CylMCyXbpA9801AN+xNrDTvZ4epSXkg=;
        b=4pJKG6jIukUFsOyKGbJ9m++COTca7kfKmDk7aZI8qhPhq3UIu1B1JzKn28X+lQ2LcD
         kyvOIKprlM2kYCUnL4sfJ8eUwNEbhL4t5UzGjX8ALcQfteBGFZzN5q5bvs6+98cr/Quh
         wR3dNqd0f8pXz0g3RLTa6Rki9CjlNMYYZLvuUJHRI0R0/CQ4eU3CIsMBXk3BVsseMw5Z
         db5tNLxhEaMxLLOU4m/PRaeD9cQYJfoi7YR5083OVVC33BuOqkysvSknSwYBgtXkOOV+
         NbJlPt2Gc06563Htr8uevSorlrXqmCJTqmlTE237nkXDDhjFbtBImK/8z6suCu80oSCV
         mnDw==
X-Gm-Message-State: AJIora/1zfAS04I4fv1mKyywv5chbemXy34/3iD6uA6ofxuxUWp+nMtn
	nWfudo+MEpoyiYXVZKcho4c=
X-Google-Smtp-Source: AGRyM1uXxhWO/DeUEIRwooeBofbzNK9MYQD6dG142de1EM9XYp98gEDWYmIb+zcFNVD1VBtYoOI56A==
X-Received: by 2002:a62:ea01:0:b0:52b:39ec:a72f with SMTP id t1-20020a62ea01000000b0052b39eca72fmr563667pfh.52.1658506684452;
        Fri, 22 Jul 2022 09:18:04 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d01c:7038:50b4:cec9:4ce:e06f])
        by smtp.googlemail.com with ESMTPSA id x5-20020a170902ec8500b0016d21c1b26csm3963621plg.170.2022.07.22.09.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 09:18:03 -0700 (PDT)
From: Abhijeet Srivastava <abhijeet.srivastava2308@gmail.com>
To: 
Cc: abhijeet.srivastava2308@gmail.com,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Rebecca Mckeever <remckee0@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>,
	Vihas Makwana <makvihas@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] staging: r8188eu: Inserted empty line after declarations
Date: Fri, 22 Jul 2022 21:46:31 +0530
Message-Id: <20220722161744.14914-1-abhijeet.srivastava2308@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Warning found by checkpatch.pl script.
Signed-off-by: Abhijeet Srivastava <abhijeet.srivastava2308@gmail.com>
---
v2: 
	- Fix my name on the patch
v3:
	- Fix commit message
v4:
	- Fix body of explanation
 drivers/staging/r8188eu/core/rtw_cmd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 5b6a891b5d67..6fbf6e4234cf 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -25,6 +25,7 @@ void rtw_free_evt_priv(struct	evt_priv *pevtpriv)
 
 	while (!rtw_cbuf_empty(pevtpriv->c2h_queue)) {
 		void *c2h = rtw_cbuf_pop(pevtpriv->c2h_queue);
+
 		if (c2h && c2h != (void *)pevtpriv)
 			kfree(c2h);
 	}
@@ -323,6 +324,7 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
 	/* prepare ssid list */
 	if (ssid) {
 		int i;
+
 		for (i = 0; i < ssid_num && i < RTW_SSID_SCAN_AMOUNT; i++) {
 			if (ssid[i].SsidLength) {
 				memcpy(&psurveyPara->ssid[i], &ssid[i], sizeof(struct ndis_802_11_ssid));
@@ -334,6 +336,7 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
 	/* prepare channel list */
 	if (ch) {
 		int i;
+
 		for (i = 0; i < ch_num && i < RTW_CHANNEL_SCAN_AMOUNT; i++) {
 			if (ch[i].hw_value && !(ch[i].flags & RTW_IEEE80211_CHAN_DISABLED)) {
 				memcpy(&psurveyPara->ch[i], &ch[i], sizeof(struct rtw_ieee80211_channel));
-- 
2.34.1

