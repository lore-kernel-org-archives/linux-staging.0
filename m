Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663EF2FB2
	for <linux-staging@lists.linux.dev>; Thu, 10 Jun 2021 15:52:41 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id u13so14948271qvt.7
        for <linux-staging@lists.linux.dev>; Thu, 10 Jun 2021 08:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i36Pm00DsGO/5ZcssBo+hCuQzpo+lYCkZTs5S1qBdoA=;
        b=aJ6PRPAQsUXnMrl4CIN1S6+VkGEZ2x8ELCatoeXiQoNj94owq2Cq3NvG/R5NP06/9l
         UuBphj8F9+F6rJMtytiiJBodcjv/xId9QPUioJsnM/ALNVOx6wb9GfzYY9IweDuPNqtp
         toUKA4Y1rib+3E4TOy/i17YVOjaubAgIYBrwWpBHpcc5t3IMKnOshQeFN7zYNA4NI3En
         TjDtOwTUh07tArOQOanJoDgo9VmanI4PjaN5qoMhXN1bTDB7SAIVmdaUO/LXWIZCAe8B
         Fyvq1Q7fRCObs9UELo50OMOjUqBXROYCHls7Ks/Jgl6OBur7yL1i2hbk8A6CXAM0dIFM
         FNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i36Pm00DsGO/5ZcssBo+hCuQzpo+lYCkZTs5S1qBdoA=;
        b=AdtRDNuRL/5tnxr6p7gfdVzro6TbhgcTUxSLf/MruoV/Rh0zl6PcnRx1yQzs/Dr4XW
         0lRR6FeG4FFTkAeZrQdrs8fKRAFIhUx1r9SmwFaFbJdJTFQeZYcoAtFYw/KwV8GmTJqs
         ILbfsPofi0JrNpHKWMSgDV086tQCikXGsbzpOV1pVHg5Rs3+D/fR1qtSqTeAswoLKegz
         KtFIitvSBpJUwHFMdwtkeYSLPuW21VlzwgeK8XEXzbKjkCTrT69QsawpLkncf+2SjLcU
         XIltZK46UKVYQSLD/PtdbvHxtAFTy1dI+6BcxJr4jvaqoo46t0CL5hhgr6QMl1xubLGd
         bjWQ==
X-Gm-Message-State: AOAM532bXxn+g7chjG4JBSntEV8cdHMXDmt+p2FwTwwMs2P5THem2alU
	sDpiSU06VP/UEE9JS6onCu4=
X-Google-Smtp-Source: ABdhPJz6dH4/21CGnDX8OUCXInxwgRczFOgoOJmcYSlk+3zuwnpoNY4UppNVXVr/IAV2giWheBgcjg==
X-Received: by 2002:ad4:424b:: with SMTP id l11mr285572qvq.58.1623340360492;
        Thu, 10 Jun 2021 08:52:40 -0700 (PDT)
Received: from ubuntu ([191.96.170.82])
        by smtp.gmail.com with ESMTPSA id s6sm2418686qks.102.2021.06.10.08.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 08:52:40 -0700 (PDT)
From: Philippe Dixon <philippesdixon@gmail.com>
To: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net
Cc: Philippe Dixon <philippesdixon@gmail.com>,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] staging: rtl8723bs: core: add * to each line of block comment
Date: Thu, 10 Jun 2021 08:51:16 -0700
Message-Id: <78327f95c53658aebfd51f7947ec44ebd36ca763.1623339773.git.philippesdixon@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623339773.git.philippesdixon@gmail.com>
References: <cover.1623339773.git.philippesdixon@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes the following checkpatch.pl warning:

WARNING: Block comments use * on subsequent lines

Signed-off-by: Philippe Dixon <philippesdixon@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 31 ++++++++++++------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 3199386f5850..347c043f5305 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -155,9 +155,9 @@ static struct cmd_hdl wlancmds[] = {
 };
 
 /*
-Caller and the rtw_cmd_thread can protect cmd_q by spin_lock.
-No irqsave is necessary.
-*/
+ * Caller and the rtw_cmd_thread can protect cmd_q by spin_lock.
+ * No irqsave is necessary.
+ */
 
 int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
 {
@@ -242,14 +242,14 @@ void _rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv)
 }
 
 /*
-Calling Context:
-
-rtw_enqueue_cmd can only be called between kernel thread,
-since only spin_lock is used.
-
-ISR/Call-Back functions can't call this sub-function.
-
-*/
+ * Calling Context:
+ *
+ * rtw_enqueue_cmd can only be called between kernel thread,
+ * since only spin_lock is used.
+ *
+ * ISR/Call-Back functions can't call this sub-function.
+ *
+ */
 
 int _rtw_enqueue_cmd(struct __queue *queue, struct cmd_obj *obj)
 {
@@ -528,10 +528,11 @@ int rtw_cmd_thread(void *context)
 }
 
 /*
-rtw_sitesurvey_cmd(~)
-	### NOTE:#### (!!!!)
-	MUST TAKE CARE THAT BEFORE CALLING THIS FUNC, YOU SHOULD HAVE LOCKED pmlmepriv->lock
-*/
+ * rtw_sitesurvey_cmd(~)
+ *	### NOTE:#### (!!!!)
+ *	MUST TAKE CARE THAT BEFORE CALLING THIS FUNC, YOU SHOULD HAVE LOCKED pmlmepriv->lock
+ */
+
 u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid, int ssid_num,
 	struct rtw_ieee80211_channel *ch, int ch_num)
 {
-- 
2.25.1

