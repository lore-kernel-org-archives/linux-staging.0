Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94BD6F
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 12:44:50 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id j7so24321967wrd.1
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 05:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3bLbd5nQrJdRXKNb1ua8mMyuvfuMOoLhBqNQTBIay4I=;
        b=kXQ898MwpW6uFMjyDSeWBIKCjQs5YmdUXIS6hVylMENhOjBt58fne8xuaLIrupaVFs
         KVp4OJfbDgRRc1/LlMR2sNapdzdO+uUtLdPKultRzYA5tsqBftA6TFq5ptJCvgNC8vdk
         X+y/v3959Pju7ZbXPiVPKM7uYHx1VJkR14l4D8JQ+O7OxL/6ZnTJ1zH4EOJQDYl4QRO9
         VlItSHfXp07yJmjC60HgWE8q5pRxse/rZoX+ndSuLCkcIBvDGvngZcfeLosv1duOuJYI
         Ni4y3y0ONF5/J7LJVym7JoSXyb1perW7Cl/qXo9b5XaFjdB191ECsEZ+2xXMnZDVNYHy
         jxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3bLbd5nQrJdRXKNb1ua8mMyuvfuMOoLhBqNQTBIay4I=;
        b=tbkcHNMSoPNp+CU02UqDbm03sUNUj0eqsB+7i7eN0CPp/XomU6dnhOnFEEh7nF9nJd
         +EduyUX14adAfv5SFzd9a9Hf7/y8bYeo/nK2y2xYFAXRypkZr4Gnwm5des4y7KO1GUi5
         G9H24WhiMrfWvMdwIcvc7H0w+Fz8HRBjZBsWVdPK7KkzcOLXculdE7NFLgF+ozhqxVS6
         TXqTB0Yvqcf4BchfEQ6ZZqfeDgzsS/DlHOV3bh708nZwvh+nJfKtxMH/FApNhnU5eDsV
         hxnKHaHTrvEQCdVfICzxYzK9Sbn43oW2ymj1zdZjMloYPvu15hez5lIm368BYk0H/D/V
         1LLA==
X-Gm-Message-State: AOAM530Gb1P+1O/0R+arjAzT65klmRyPuLN3QE/6NyAoHs2r5JdpshyB
	2xA+WiuZlTH+sIutf8+4Icc=
X-Google-Smtp-Source: ABdhPJwKEWCWEtX1TJYZUFXrQPCUhvMKC3HCosMvzH2GTGdaOIJAodztiG5uyc19nCgQ4yRNJD42nQ==
X-Received: by 2002:adf:e3c9:: with SMTP id k9mr3468489wrm.308.1616589889220;
        Wed, 24 Mar 2021 05:44:49 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id s20sm2324005wmj.36.2021.03.24.05.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:44:48 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 02/33] Staging: rtl8723bs: remove named enums in rtw_cmd.h
Date: Wed, 24 Mar 2021 13:44:25 +0100
Message-Id: <20210324124456.25221-3-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324124456.25221-1-marcocesati@gmail.com>
References: <20210324124456.25221-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum names in
include/rtw_cmd.h:

	enum rtw_drvextra_cmd_id
	enum lps_ctrl_type
	enum rfintfs
	enum rtw_h2c_cmd

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_cmd.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_cmd.h b/drivers/staging/rtl8723bs/include/rtw_cmd.h
index 88cbc12ce5d4..87cbad525393 100644
--- a/drivers/staging/rtl8723bs/include/rtw_cmd.h
+++ b/drivers/staging/rtl8723bs/include/rtw_cmd.h
@@ -119,7 +119,7 @@ extern void rtw_free_cmd_priv(struct cmd_priv *pcmdpriv);
 extern void rtw_free_evt_priv(struct evt_priv *pevtpriv);
 extern void rtw_evt_notify_isr(struct evt_priv *pevtpriv);
 
-enum rtw_drvextra_cmd_id {
+enum {
 	NONE_WK_CID,
 	DYNAMIC_CHK_WK_CID,
 	DM_CTRL_WK_CID,
@@ -143,7 +143,7 @@ enum rtw_drvextra_cmd_id {
 	MAX_WK_CID
 };
 
-enum lps_ctrl_type {
+enum {
 	LPS_CTRL_SCAN = 0,
 	LPS_CTRL_JOINBSS = 1,
 	LPS_CTRL_CONNECT = 2,
@@ -153,7 +153,7 @@ enum lps_ctrl_type {
 	LPS_CTRL_TRAFFIC_BUSY = 6,
 };
 
-enum rfintfs {
+enum {
 	SWSI,
 	HWSI,
 	HWPI,
@@ -641,7 +641,7 @@ struct _cmd_callback {
 	void (*callback)(struct adapter  *padapter, struct cmd_obj *cmd);
 };
 
-enum rtw_h2c_cmd {
+enum {
 	GEN_CMD_CODE(_Read_MACREG),	/*0*/
 	GEN_CMD_CODE(_Write_MACREG),
 	GEN_CMD_CODE(_Read_BBREG),
-- 
2.30.2

