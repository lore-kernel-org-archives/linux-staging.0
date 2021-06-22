Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AFD71
	for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 12:29:52 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id p8-20020a7bcc880000b02901dbb595a9f1so2140386wma.2
        for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 05:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fuMF6VsqpQHGen6pDrwB6pK2wNwSSnPLXzA/6UmoJDM=;
        b=iZsILL/SQTeES+u8n1pX1NjLIwD9N8e2hYo4nMg+LqThin36zGQSwa+Iv1lCiNYN8d
         mqFqNwOpOFb5CRDZennsFRE0CTWBUQebMJL/oznsBt3wFl1nP9Gmfmkki8oyScdj6XOW
         cRVrBQRSTIFtz+/K9ILFRGV/i6I7vjOyu7efMwR+w2w8//Ezv6Jh5X5FipP5fReVxvlv
         cG7XwHa/bGebpqQikTUQ/NMFZAaRk95FYFNKtBbxbIaGKCXgVArN/f7FJ33Untuly1ta
         vi3SBSNKHwnkdgzAHTlehps02RRA5KNneRjQF6P79RLa0DIRteWqnDtqSgR5C7hDw41t
         Pgzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fuMF6VsqpQHGen6pDrwB6pK2wNwSSnPLXzA/6UmoJDM=;
        b=hAEenCeU8u72lApoa4tN9z1rn69yuzEXBn3GemLdpAfIzu/yXJ2pxAuuFH3/kbk9jG
         njIskXWwr1WSnmC49y9cUYaRr3nOnKr080HbpmYS3fF2ryP0f3ArOlafiEQF1VoY8f4b
         xaofaTYhB6FLp4F9yL+GeA5pozyeUGdcpKTKiR4VJkYsmt6OZuJecTUvxwAdvS7N3ykV
         /tBQ90YTgN7NeSIqnc7DEWzcXltXlDzkhDtVPlQuQpfgskRePrGrKn9a+rey8RCShB+Q
         fIE8SF1anhBUZRsihGdRXQSK0Q0tB4e2oyJ4A1ad1E5eMj9lGYAquqOi4uxs8luqBdH7
         nMOA==
X-Gm-Message-State: AOAM53374nU0tx6Y+j9AJpMFwsASImlA2ngcaJF89HiGYusPCAlZWHEC
	Bkywk3U7hr9kI6/ZbF9og+I=
X-Google-Smtp-Source: ABdhPJyaximZXWTula4U/AFuaDbPl3aanncYQkfQiiFv+1RalFE0Xbp4Qy2jUGFPXyxjoKon23mF+g==
X-Received: by 2002:a1c:f206:: with SMTP id s6mr3996874wmc.102.1624364991526;
        Tue, 22 Jun 2021 05:29:51 -0700 (PDT)
Received: from agape ([5.171.73.108])
        by smtp.gmail.com with ESMTPSA id b18sm6028018wrx.45.2021.06.22.05.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 05:29:51 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/17] staging: rtl8723bs: remove 5Ghz field in struct registry_priv
Date: Tue, 22 Jun 2021 14:29:30 +0200
Message-Id: <2d01d07bfad725fd8fd6437a3abe9332a781bd4e.1624364582.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1624364582.git.fabioaiuto83@gmail.com>
References: <cover.1624364582.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused 5Ghz field in struct registry_priv.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/drv_types.h | 2 --
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 02df5bd8f575..895c41526164 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -171,9 +171,7 @@ struct registry_priv {
 	u8 RegPowerBase;
 	u8 RegPwrTblSel;
 	s8	TxBBSwing_2G;
-	s8	TxBBSwing_5G;
 	u8 AmplifierType_2G;
-	u8 AmplifierType_5G;
 	u8 bEn_RFE;
 	u8 RFE_Type;
 	u8  check_fw_ps;
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index a06c8b1beb01..648456b992bb 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -289,7 +289,6 @@ static void loadparam(struct adapter *padapter, struct net_device *pnetdev)
 
 	registry_par->RegPowerBase = 14;
 	registry_par->TxBBSwing_2G = 0xFF;
-	registry_par->TxBBSwing_5G = 0xFF;
 	registry_par->bEn_RFE = 1;
 	registry_par->RFE_Type = 64;
 
-- 
2.20.1

