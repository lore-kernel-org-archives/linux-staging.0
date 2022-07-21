Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E71E441A
	for <linux-staging@lists.linux.dev>; Thu, 21 Jul 2022 14:14:38 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id 70so1895714pfx.1
        for <linux-staging@lists.linux.dev>; Thu, 21 Jul 2022 07:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KuXMSQ36nSusUUMBALQ3dzyi8fmdnN+BS6RFuCmYlZg=;
        b=ZP7YaKj7s2VtFhhan69q4hB0HJGOyf4M87x0EzKLo18Jz1CFNZzGjXYZo7Mvuxj6yQ
         48YYTupyPRgUBAi27s4pKUyBh0uQJ6KvA4AB93rOGV1Wb4C2oJM3cnMF5rugkGwomTU9
         HFzAvW34XExJIeh0NljBWK57guKs9MuhIdMJLGU5ux9hpqwtTqTCQAhOM5yVmqLFJeie
         886Xfd4udXA3PL1iEHxLLFuvlJViqs5AV1ERfQyCBdQb4cBYzzve4b2M8zOF7im11XZb
         6eSXLtRpQGRRtmEmnZw30GyCR2WDcqEMvjHP431y8ZsnG9fkzL1S5iuG7cJuFIIvq0jq
         WAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KuXMSQ36nSusUUMBALQ3dzyi8fmdnN+BS6RFuCmYlZg=;
        b=CtVOR8glyTzWWb8GEd5bWuCtR8fEN9LmBfgSivmAeRGXwT5Emp6X9mCjZLxDmSLzBz
         aAsjHOs44T7OX8Cyvrg+O2mFUJFU3gWFBT0RgF8DyWw1MdPe7Zw9hlqUAlN2eLhzFzob
         u84RJIMnr3aCaSz3nmpuqN7+Jna3OPHFA51hLyzu/wUXUCJ8o8Z6QJK+b/nN0qU8d4Vd
         101jvR4Mi1m/lfuLuffF3YuWXKOxOllpzxywGXO+0OFHgoPuIJbmDq4t2AEaWY9set0S
         NG/PQ4Qs7pjULFMxwWo/XA8sIcD7iTK+tD8Itvcdb1vvEby/Pgaxme6ZpL5rEXHQSfjH
         IZPw==
X-Gm-Message-State: AJIora8HyeZAqLO28OOVKHy4dnkOIVQdi/ELkgh/y+4X7gFZUguASQ5Y
	Q51P1XoGJPAB52Sk7KpS9yIaWyFMTQC+rQCzm1o=
X-Google-Smtp-Source: AGRyM1u01IOSYOqwFqB/coJZbKD/Aj4cnTFxkXxxRpqbCXkWIH/BSNNrWyucPaUNVvvGmGjklneRVg==
X-Received: by 2002:a05:6a00:b4c:b0:52a:f6e7:818b with SMTP id p12-20020a056a000b4c00b0052af6e7818bmr44269274pfo.26.1658412877903;
        Thu, 21 Jul 2022 07:14:37 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d01c:7038:6d29:af18:34a6:1c34])
        by smtp.googlemail.com with ESMTPSA id 186-20020a6215c3000000b0052536c695c0sm1866493pfv.170.2022.07.21.07.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 07:14:37 -0700 (PDT)
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
Subject: [PATCH v3] staging: r8188eu: Inserted empty line after declarations
Date: Thu, 21 Jul 2022 19:42:39 +0530
Message-Id: <20220721141407.45663-1-abhijeet.srivastava2308@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220721141051.45447-1-abhijeet.srivastava2308@gmail.com>
References: <20220721141051.45447-1-abhijeet.srivastava2308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Warning found by checkpatch.pl script. Resending this patch after
correcting my Username

Signed-off-by: Abhijeet Srivastava <abhijeet.srivastava2308@gmail.com>
---
v2: 
	- Fix my name on the patch
v3:
	- Fix commit message
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

