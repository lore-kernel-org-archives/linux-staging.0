Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87467E0
	for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 13:05:32 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id c10so29574107ejs.13
        for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 06:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wLM8ocKt6f0arebieMXLbfikbZM3siH2fLv2W59ipRg=;
        b=GPYA80S5QnuytLdzBu2lKmTT4pttp+NDMO26zncwgWjfyTTSEE0CmyiOb3xx6xTzGJ
         4c6Vhz9iYrJgMYSxW6ZxJxyPo7KS+MoV+BD6TvGVU9GU0rWrhlfCR5ac1eupmJAaoPn+
         b9rWtDUypN8Kv5YWWYUm/hfBLHK4z1wt3lh+SgHiXyBUleZSm280/QZ+DrQG9VSROu9o
         +F+w+oAwV/DlmjW5if8ZPXJYQAoSqy97PgdjH/TAlqTAie5pJsK+c7Giqm5eWrAOPozZ
         LMNCeWCu0isId2APvA/BnHca1f7ZtqVtTZDNWv/ZK2Dfnkk4+8eLuxR1j2XghtXQ8IhO
         FgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wLM8ocKt6f0arebieMXLbfikbZM3siH2fLv2W59ipRg=;
        b=Kdp7HvzwkcZmV4Aw+mMmOcRHOpp+QqYjuikzYpKJsrkUViz7WSTjWgQ+PHUq/QSRP4
         XP1cY2xGNOzgyS1C/vXKTd+reApU6u+oVL+iF3Plz+yaIMMyNHEFZ4WiUS7jq0LINzEG
         NYGBYOikscBrKfRzcTgxhz1ABwv3eFGMxOCHtVNkIa57g5/AWHYm87ZnGmXWpQxw0CAe
         V7Plypzhz8TlU+fKLkIoaA8EOlUDNn5es4DEDodPyQ4IL8RZQpOBRS+9ggLaG1LZwHVg
         iRcVRLF9eXpT+mKYeJEXYbPgfZP7tB/k1NTMJt4Jc31QOTy1i0YxPAO4AqYAYPZwiKup
         1ssA==
X-Gm-Message-State: AOAM532zARmiavPd9/qQWdgIp5ZJbAkrju3Rhc3bYRUvvKoGg2khnVAS
	//bDvED+lMrilJtBL85X3jg=
X-Google-Smtp-Source: ABdhPJySxYC9VY6GU3cnheaUqRUTgTRtIMdM3cjme2J0sjJokpLC7EyjcXJpEn5RcJALk3PCjETRFA==
X-Received: by 2002:a17:906:1645:b0:6ce:de9:6eb1 with SMTP id n5-20020a170906164500b006ce0de96eb1mr4972136ejd.616.1648731929952;
        Thu, 31 Mar 2022 06:05:29 -0700 (PDT)
Received: from localhost.localdomain ([95.90.187.85])
        by smtp.gmail.com with ESMTPSA id kw3-20020a170907770300b006d2a835ac33sm9333358ejc.197.2022.03.31.06.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 06:05:29 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/5] staging: r8188eu: rename clear_bacon_valid_bit()
Date: Thu, 31 Mar 2022 15:05:18 +0200
Message-Id: <20220331130522.6648-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331130522.6648-1-straube.linux@gmail.com>
References: <20220331130522.6648-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename clear_bacon_valid_bit(). Actually it should be
clear_beacon_valid_bit().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c    | 4 ++--
 drivers/staging/r8188eu/hal/rtl8188e_cmd.c     | 4 ++--
 drivers/staging/r8188eu/include/rtw_mlme_ext.h | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 643f9f8a7a3d..15a91c5fc852 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -5761,7 +5761,7 @@ unsigned int send_beacon(struct adapter *padapter)
 
 	u32 start = jiffies;
 
-	clear_bacon_valid_bit(padapter);
+	clear_beacon_valid_bit(padapter);
 
 	do {
 		issue_beacon(padapter, 100);
@@ -5784,7 +5784,7 @@ unsigned int send_beacon(struct adapter *padapter)
 	}
 }
 
-void clear_bacon_valid_bit(struct adapter *adapter)
+void clear_beacon_valid_bit(struct adapter *adapter)
 {
 	/* BIT(16) of REG_TDECTRL = BIT(0) of REG_TDECTRL+2, write 1 to clear, Clear by sw */
 	rtw_write8(adapter, REG_TDECTRL + 2, rtw_read8(adapter, REG_TDECTRL + 2) | BIT(0));
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
index a7337954891a..2e252562e48c 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
@@ -557,7 +557,7 @@ void rtl8188e_set_FwJoinBssReport_cmd(struct adapter *adapt, u8 mstatus)
 		rtw_write8(adapt, REG_FWHW_TXQ_CTRL + 2, (haldata->RegFwHwTxQCtrl & (~BIT(6))));
 		haldata->RegFwHwTxQCtrl &= (~BIT(6));
 
-		clear_bacon_valid_bit(adapt);
+		clear_beacon_valid_bit(adapt);
 		DLBcnCount = 0;
 		poll = 0;
 		do {
@@ -596,7 +596,7 @@ void rtl8188e_set_FwJoinBssReport_cmd(struct adapter *adapt, u8 mstatus)
 
 		/*  Update RSVD page location H2C to Fw. */
 		if (bcn_valid)
-			clear_bacon_valid_bit(adapt);
+			clear_beacon_valid_bit(adapt);
 
 		/*  Do not enable HW DMA BCN or it will cause Pcie interface hang by timing issue. 2011.11.24. by tynli. */
 		/*  Clear CR[8] or beacon packet will not be send to TxBuf anymore. */
diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index 66f7361e7a19..a00da19c4b88 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -538,7 +538,7 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr,
 		     unsigned char action, unsigned short status);
 unsigned int send_delba(struct adapter *padapter, u8 initiator, u8 *addr);
 unsigned int send_beacon(struct adapter *padapter);
-void clear_bacon_valid_bit(struct adapter *adapter);
+void clear_beacon_valid_bit(struct adapter *adapter);
 
 void start_clnt_assoc(struct adapter *padapter);
 void start_clnt_auth(struct adapter *padapter);
-- 
2.35.1

