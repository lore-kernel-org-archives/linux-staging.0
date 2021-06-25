Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4591A177
	for <linux-staging@lists.linux.dev>; Fri, 25 Jun 2021 18:30:11 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id 19so9783858qky.13
        for <linux-staging@lists.linux.dev>; Fri, 25 Jun 2021 11:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ahjwf9HqwEUWxfT27RhcaX1vAqu39xvQmFxCmdymgYk=;
        b=bcJmnLILLrzdC40glkAg3vuavgVVrwsOURCkguA1DaLF+T+a8GL3UNaz8hq0BiHr4Z
         8EtWMIOGbouieDhHgj2gB+A2jWssbCAz7y/BuZT3gSxxzMIyrDtfu4gdP4N/D2ETMSN1
         nxoMA4BLlmOPprt4k6b7PaeJLZgiUInRZq6v0DyB8lUozh4pQrBPfmFWefCkYrivekv5
         xCfCBEycYSQ4yjxtthonW/rGCTB1lHysVh8O8hYIA+qaVfGu1pQPOwRYe6pTZ3axggdU
         VrzNwuS6CQqDGQMK40TbKn2xOfGufayiZBj6CxAfE+uaBduxRkmFaDbduq4Pu7/UljyK
         L6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ahjwf9HqwEUWxfT27RhcaX1vAqu39xvQmFxCmdymgYk=;
        b=FFfaOulGQwIfd2BY463zA4D/pu8qsNFtz/PO0H49JYXTflqi5800JSDcmhYjxkdHyF
         0BZol0v2bZFLzSYRQtGBQo7Rts2KiWPDd/xerQq70T5Igpn31HQHHUfEDOw3W3n34ZMN
         4G4g2yI38p68NMpDup0hCIqxYIvCs/GFF5kxkhXookH9SNcIfohhAmSgrSSAEuWS08RD
         Rk0DIR4kFbGP1WAV+HaqRn+aAFUU8Ad2kci7XAiMTT+sR6cPgiLVVpVHJ8yZzxyw249j
         smgP1pJB8tINoBfRcBx9cP1bMfmJbry1Y6QEOlY6IyJR4ZlX8L52bGWQP6OtJVNMbKAv
         vykw==
X-Gm-Message-State: AOAM531oVfvAr609ilB5IymXfDofOPQeDpLo5X8nnaxT9250qJF6iFXr
	pyOr1rQcI/Pj/E0EJsp4qnmsIg==
X-Google-Smtp-Source: ABdhPJx447qGBHdeQmiSJ8K60QjlehV4Ec4hD8sNWp3QYYcv21yKlryC3Z9/n8ORV/uPsantb0hF5Q==
X-Received: by 2002:a37:44f:: with SMTP id 76mr13025187qke.161.1624645810318;
        Fri, 25 Jun 2021 11:30:10 -0700 (PDT)
Received: from kerneldevvm.. (5.6.a.8.a.a.b.f.c.9.4.c.a.9.a.a.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:aa9a:c49c:fbaa:8a65])
        by smtp.gmail.com with ESMTPSA id l1sm974449qkc.93.2021.06.25.11.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 11:30:09 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: rtl8188eu: remove set but unused variable from rtw_get_sec_ie
Date: Fri, 25 Jun 2021 19:30:07 +0100
Message-Id: <20210625183007.7065-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove set but unused variable 'sec_idx' from the rtw_get_sec_ie
function inside core/rtw_ieee80211.c, to fix a kernel test robot warning
introduced by recent removal of erroneous debug statements.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/core/rtw_ieee80211.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_ieee80211.c b/drivers/staging/rtl8188eu/core/rtw_ieee80211.c
index e431914db008..ce82b866c633 100644
--- a/drivers/staging/rtl8188eu/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8188eu/core/rtw_ieee80211.c
@@ -465,7 +465,7 @@ int rtw_parse_wpa2_ie(u8 *rsn_ie, int rsn_ie_len, int *group_cipher, int *pairwi
 
 void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie, u16 *wpa_len)
 {
-	u8 authmode, sec_idx;
+	u8 authmode;
 	u8 wpa_oui[4] = {0x0, 0x50, 0xf2, 0x01};
 	uint cnt;
 
@@ -473,8 +473,6 @@ void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie
 
 	cnt = _TIMESTAMP_ + _BEACON_ITERVAL_ + _CAPABILITY_;
 
-	sec_idx = 0;
-
 	while (cnt < in_len) {
 		authmode = in_ie[cnt];
 
-- 
2.31.1

