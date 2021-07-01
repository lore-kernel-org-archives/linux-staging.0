Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAD272
	for <linux-staging@lists.linux.dev>; Thu,  1 Jul 2021 15:46:52 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id f14so8474866wrs.6
        for <linux-staging@lists.linux.dev>; Thu, 01 Jul 2021 08:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LnVmENkMzBPYFYRO7NPCY2zA2KVOkF51h3Z74m5eLEA=;
        b=NMeu16Su6dWBjbvi8soHdm25qUAZlr3uAaWX7w4pd2h0vH2er/oD8fvef5hThRdtpN
         3rwce683xdcOKO2VgWkD5H3Fte6Z/VKCTi5A9XXIeaSWoX7hJIhVgPRn01A6mFu7SaHJ
         jBCjl+8WZZlnuAtvQaX5WBuZG5OQZoshYoETmW2oVnIur8E1rHFZ5uoniFKLXE7wKcbU
         9uNaLXKqRt67i0dZ0ufPnAm5H3e6KzxMPXfI/ojaIUNTbkBR25Av6eiXFp5cFVqzzAfW
         UFw9+PAYyYErmH+Fe0nz3NA+FfDr1OULGy4khwDk7x7c9LhpZFcYSSlgBqt3pVr4hf7G
         CvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LnVmENkMzBPYFYRO7NPCY2zA2KVOkF51h3Z74m5eLEA=;
        b=re0gwbdLroxt67VszyiF5jM7+zNwz7kBURYer1b9OAIOFyvL3HOV0krXL9zGTTvgdE
         Nm45sy0ZOCnCfYdq8iarYJ7HQaBvY+ToiOPqG18f+eKdJdPLU6haq89AAuEqjWFnm/6P
         mNr61UeoNWMwnPPRSHTc37mRw0LDikGQ3gVj7xn/NGwNq76R1S7Cx6fU0zFP75aPtnvD
         x4ZClP4woA7z5plrOcBCzcEAFk9R9EwOh/RRG5o8FaylQ2GeHRjmzaa1OIkjuJBCLrA9
         drBe85zJT3YZuTqBRNQV2VeGU1r8Aa/nWiAjSIdhDbiRUdq7+LfFLajtjEHmybOk9Rsf
         rxdw==
X-Gm-Message-State: AOAM5311npAxgiS2NCw5vapEmgkFGRQujodGMGoIbfF7Z0oUnEbe1puD
	Y011eKrPaNDmn0Fiijvk4Mg=
X-Google-Smtp-Source: ABdhPJy8kfxl9RnPkdTVZwCLnkBmWwMsdlNumF3X0wt8s37N3rGVNZUXwXY057azXU7qhElAFUptiA==
X-Received: by 2002:adf:ef8b:: with SMTP id d11mr368471wro.346.1625154411339;
        Thu, 01 Jul 2021 08:46:51 -0700 (PDT)
Received: from linux.local (host-80-181-152-252.pool80181.interbusiness.it. [80.181.152.252])
        by smtp.gmail.com with ESMTPSA id o11sm309807wmq.1.2021.07.01.08.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 08:46:50 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH] staging: rtl8188eu: core: Remove set but unused variable
Date: Thu,  1 Jul 2021 17:46:47 +0200
Message-Id: <20210701154647.18975-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove variable sec_idx because is set but unused. Issue detected by
GCC with -Wunused-variable.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
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
2.32.0

