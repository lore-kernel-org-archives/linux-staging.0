Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F326015
	for <linux-staging@lists.linux.dev>; Wed, 20 Jul 2022 16:03:07 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id go3so23502pjb.0
        for <linux-staging@lists.linux.dev>; Wed, 20 Jul 2022 09:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jp50sRoRGeJze1E2rq+2nmALFyFZat+do6tJhJW091I=;
        b=C6bXWRwpERSuRRbU5tW5VuIqswjUfZAcif7gWaarsp9Wo3l8sRwQxCc4UtP/gWfvBi
         9v6Qy49mb9vK6MX7+izRWfzlddD151t6XgvwHIL9PyJx3biQsiqEQjC8GXoSAGj9N1uL
         L9hILSRy5aFJc8az7AguxCUNXDTTuiYbWTM7q/7S0JgM6CgvVMYoaUG6a0RkyAKGPf9V
         KdlW2CRXKwvSHzrJkmntrMYB/6L7vRZip5ri+RyXYjhBn1Q+8qt6ugsvxpUBlyJPdmmP
         775jl6fCod02MMsTdjuqTcGBHDh0u0ghsEfb2z3cGj+UWf9kIPIa/YKTUbcS8bKGze+f
         A8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jp50sRoRGeJze1E2rq+2nmALFyFZat+do6tJhJW091I=;
        b=YcAFKkoXKJdGMyoV6q53oMTwY8Xbc0I/v64LBbO0aqIj83d/aSMwMaPkPyAsbAg3AC
         nRE397VPKyes9aCUP3mhWQ7w1qZdgP5SXh7pjbnyZJGHfGR7orA4RoYgnnSmUy1vVBbi
         uFma7eoZL8n84eoTMHUu23dCxK9xcL4j8BUsXwHQ8y3XuKSDfX6wA2P/EKWslkWQGXIt
         Qg/jEYNDLE1cSBfHBRme+Jmwm4L+CVP0I0KmAxOKOXKiohmDUTyWmW5MqeY7pmPG/aBA
         vM3AqfEN9Aj8y9mtjuao45w0I4sc4A7D3uoiXvZhZO58pCiz/uYjy5GEecWc4UiPm8oO
         CIMg==
X-Gm-Message-State: AJIora+N+6asmLK+ARGAbw/W3iw3PgpxgSHw/BvztI9n8SWS+grr1xbl
	5x3SczCjwBtoH/q0Xg20sd8=
X-Google-Smtp-Source: AGRyM1tfiyEzJYTofcdx7m8RezbjRvQrqGyHLDhUXfW213hZREtpSZddgdHv7Sq4J42ECTrojIxKAQ==
X-Received: by 2002:a17:90a:7aca:b0:1f1:ff59:fe7e with SMTP id b10-20020a17090a7aca00b001f1ff59fe7emr6354010pjl.11.1658332987007;
        Wed, 20 Jul 2022 09:03:07 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d01c:7038:2c8a:aeeb:6f47:1018])
        by smtp.googlemail.com with ESMTPSA id je15-20020a170903264f00b0016d1f6d1b99sm1977472plb.49.2022.07.20.09.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 09:03:06 -0700 (PDT)
From: Abhijeet23081989 <abhijeet.srivastava2308@gmail.com>
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
Subject: [PATCH] staging: r8188eu: Inserted empty line after declarations
Date: Wed, 20 Jul 2022 21:31:56 +0530
Message-Id: <20220720160217.70966-1-abhijeet.srivastava2308@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Warning found by checkpatch.pl script.

Signed-off-by: Abhijeet23081989 <abhijeet.srivastava2308@gmail.com>
---
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

