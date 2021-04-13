Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FA071
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 12:30:47 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id r12so25639512ejr.5
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 05:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pAgxhBv5/NtB+cWLkX3BpIezGlDEtSC6ik2muIVW1Gc=;
        b=CxyDwaoJqNN/OwD7hAXxGSPuhJmXJM48x6CShyhYyO+l76LLtt8YRUsBDWgcCALiyR
         rO54kBHPYbvfVh7ohrqZD0xVFPDcNgfn7P86G/txg+UOmxlMRXisdxIsFHHXA1NCHvQA
         qmTm5tiEjL7F5dStR7q20BjNwsoQUGJJOEjqQahu84Snf6aqCP9RPi0C8q8YjhqsjjZ/
         AGRDtvpGaEByPOLwXAeFduUkkzXiPcnRzvori0VT57wE4v+FUQ0VBUpD7SjBW7MOD9QD
         U+RxaeaE62jBJ/OQV4clfralWwhWz2+wLXpsJ+2zhRJf/KXwGZaFh4KpuV+KIyL4Wx7Z
         KKGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pAgxhBv5/NtB+cWLkX3BpIezGlDEtSC6ik2muIVW1Gc=;
        b=oV+sEgM3KNZl/i2it4seRAbnEyJA0TQ2QzqN0jik+EtDOufqz5Ckd+zV3CbxuMqxzT
         u6qbr/zq5v0J+cJlhZR8V+TaY5/UFfVWUAkY65VID6esf3FDyZNkoZ3T5WuIhnZ1oBZS
         iOCiD1RxbPaUlMDq0DQocH8Lj7mtsZ9pfkJKVGMe0AcptUKq7pF2a8gG1U0QK6v5ON0d
         +jgCLGv774WmsObmZIhtPPhKdA5WIu16d1Ox2PUSvitBHA1dNsTN/F3L4Ax/2iFjxoiW
         Kl3/ThEqDGiP/CaUGbtueIz+o2OsMrSifyGskxa7esEutg6SavuI/BAMVcJcjM/VA8ye
         +vGA==
X-Gm-Message-State: AOAM532n1Z3nj+3b8vZI93y7KRE4tO/v5+qEluKnwD6C5rd8ZxOCQsoB
	JkXtBC8UGY7R1jpYHZf2wMI=
X-Google-Smtp-Source: ABdhPJy3RUm5199KNZFcG3FHQV8zoLwzVvCxYhlXgazrCE7Jv9Oxy5BfBiNl7OdKuv4V91V9cuGGog==
X-Received: by 2002:a17:906:1444:: with SMTP id q4mr32001626ejc.343.1618317045883;
        Tue, 13 Apr 2021 05:30:45 -0700 (PDT)
Received: from linux.local (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id d22sm687391ejz.79.2021.04.13.05.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 05:30:45 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy-kernel@googlegroups.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [Outreachy kernel] [PATCH] staging: rtl8192u: ieee80211: Replaced strncpy() with strscpy()
Date: Tue, 13 Apr 2021 14:30:41 +0200
Message-Id: <20210413123041.24260-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replaced strncpy() with strscpy() because of compilation time warnings
about possible truncation of output [-Wstringop-truncation].
Furthermore, according to the Linux official documentation, strscpy() is
preferred to strncpy.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
index 25ea8e1b6b65..aa58eedf5e86 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
@@ -1385,12 +1385,12 @@ inline void ieee80211_softmac_new_net(struct ieee80211_device *ieee, struct ieee
 			 * essid provided by the user.
 			 */
 			if (!ssidbroad) {
-				strncpy(tmp_ssid, ieee->current_network.ssid, IW_ESSID_MAX_SIZE);
+				strscpy(tmp_ssid, ieee->current_network.ssid, IW_ESSID_MAX_SIZE);
 				tmp_ssid_len = ieee->current_network.ssid_len;
 			}
 			memcpy(&ieee->current_network, net, sizeof(struct ieee80211_network));
 
-			strncpy(ieee->current_network.ssid, tmp_ssid, IW_ESSID_MAX_SIZE);
+			strscpy(ieee->current_network.ssid, tmp_ssid, IW_ESSID_MAX_SIZE);
 			ieee->current_network.ssid_len = tmp_ssid_len;
 			netdev_info(ieee->dev,
 				    "Linking with %s,channel:%d, qos:%d, myHT:%d, networkHT:%d\n",
-- 
2.31.1

