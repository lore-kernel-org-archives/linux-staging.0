Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5030872
	for <linux-staging@lists.linux.dev>; Sun,  5 Sep 2021 18:46:04 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id v1so2604939plo.10
        for <linux-staging@lists.linux.dev>; Sun, 05 Sep 2021 11:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=A0AxMO/6mnm7mS5tH8sAepDPtEJ/6RXbzlmGEKvemFk=;
        b=pUe/G4l2M97MzDY/AvQlXjKYHrV+zgLd2iD/nheKBAJwy7DsLqnmVdDCASNJz/nbjE
         pZN9iNMNILTPqIpPU8fKAsAwUm7104hYcgbmwgnFL9T4bFB7Fy+Cr9+JpJ6P1T7gcnAA
         FFtu1bSlmPG5yz5/2TLq8QqUSyAnNWuoeUNOMORF+RxCJXQA0j1LzacXaJDraH8HbpLg
         TF6dOXKG2SIY/IpQNnVRz4ak2CkCJ+h4w4AAnQ1Bu+hkh6ZrhdJSXEaednmRkeEvdB+s
         Lfvv5nDaJoY5e2mUz/6q8now37T05H4FNivL/aFF+AMXX1UVhZtwKqg0y1Ns6cO78GSH
         +Byg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=A0AxMO/6mnm7mS5tH8sAepDPtEJ/6RXbzlmGEKvemFk=;
        b=Y+T+z5JAgHXgb2sh5aDbPVaEa7f4L+fbRpO1LJGyT/NWcMHmSUu+aNEH2TAVx5c3q/
         UTZQCXRsDgufcybaV5YCG8pLzAyWiF7culzsBoHJTsuUPpPz7Lsd37uG2CGAnnEFySQ3
         gyAK5NGWkwERy4YSD0gbLKbu4z7puRI4CyVnL3nt9LX8NY147nZIqYBOmU7XQLZHIj9e
         BRkh0BJldVBBEH6Btmx9AgDARn1kPQTTuSb2D4i5NWZLJcQnIJl9AVhcihTptSRALUK0
         NfipDYWu9hHIHyQfy69TfMHUxLtizem02YJVvJ33OBlRvSSH4uIsmNlC3YWwxP8crPXC
         kvEA==
X-Gm-Message-State: AOAM530C3u8ylyrz/V9/Wihd46PpRENHavr51YAC6bSa7hm/hIa8oqvL
	HZUlSgrjiCEkqlwJhqQXadA=
X-Google-Smtp-Source: ABdhPJydT3MHzK+39z8my7P2lPiqSumjTIndk0xWZx3a5mdR/UDaskAgbHLflL5vb/OPOI24cbwB8A==
X-Received: by 2002:a17:90a:7345:: with SMTP id j5mr10225819pjs.48.1630867563685;
        Sun, 05 Sep 2021 11:46:03 -0700 (PDT)
Received: from user ([117.98.200.228])
        by smtp.gmail.com with ESMTPSA id c24sm6388677pgj.63.2021.09.05.11.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 11:46:03 -0700 (PDT)
Date: Mon, 6 Sep 2021 00:15:57 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, fmdefrancesco@gmail.com,
	saurav.girepunje@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: rtl8712: Move similar execution in to a function.
Message-ID: <YTUQZdPiYFscIsvU@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Move the common execution for read_macreg_hdl, write_macreg_hdl,
write_bbreg_hdl and write_rfreg_hdl in to a new function
common_read_write_hdl.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/rtl8712/rtl8712_cmd.c | 41 +++++++--------------------
 1 file changed, 11 insertions(+), 30 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl8712_cmd.c b/drivers/staging/rtl8712/rtl8712_cmd.c
index e9294e1ed06e..9bc0588be04b 100644
--- a/drivers/staging/rtl8712/rtl8712_cmd.c
+++ b/drivers/staging/rtl8712/rtl8712_cmd.c
@@ -117,9 +117,9 @@ static void r871x_internal_cmd_hdl(struct _adapter *padapter, u8 *pbuf)
 	kfree(pdrvcmd->pbuf);
 }

-static u8 read_macreg_hdl(struct _adapter *padapter, u8 *pbuf)
+static u8 common_read_write_hdl(struct _adapter *padapter, u8 *pbuf)
 {
-	void (*pcmd_callback)(struct _adapter *dev, struct cmd_obj	*pcmd);
+	void (*pcmd_callback)(struct _adapter *dev, struct cmd_obj *pcmd);
 	struct cmd_obj *pcmd  = (struct cmd_obj *)pbuf;

 	/*  invoke cmd->callback function */
@@ -129,20 +129,17 @@ static u8 read_macreg_hdl(struct _adapter *padapter, u8 *pbuf)
 	else
 		pcmd_callback(padapter, pcmd);
 	return H2C_SUCCESS;
+
 }

-static u8 write_macreg_hdl(struct _adapter *padapter, u8 *pbuf)
+static u8 read_macreg_hdl(struct _adapter *padapter, u8 *pbuf)
 {
-	void (*pcmd_callback)(struct _adapter *dev, struct cmd_obj	*pcmd);
-	struct cmd_obj *pcmd  = (struct cmd_obj *)pbuf;
+	return common_read_write_hdl(padapter, pbuf);
+}

-	/*  invoke cmd->callback function */
-	pcmd_callback = cmd_callback[pcmd->cmdcode].callback;
-	if (!pcmd_callback)
-		r8712_free_cmd_obj(pcmd);
-	else
-		pcmd_callback(padapter, pcmd);
-	return H2C_SUCCESS;
+static u8 write_macreg_hdl(struct _adapter *padapter, u8 *pbuf)
+{
+	return common_read_write_hdl(padapter, pbuf);
 }

 static u8 read_bbreg_hdl(struct _adapter *padapter, u8 *pbuf)
@@ -155,15 +152,7 @@ static u8 read_bbreg_hdl(struct _adapter *padapter, u8 *pbuf)

 static u8 write_bbreg_hdl(struct _adapter *padapter, u8 *pbuf)
 {
-	void (*pcmd_callback)(struct _adapter *dev, struct cmd_obj *pcmd);
-	struct cmd_obj *pcmd  = (struct cmd_obj *)pbuf;
-
-	pcmd_callback = cmd_callback[pcmd->cmdcode].callback;
-	if (!pcmd_callback)
-		r8712_free_cmd_obj(pcmd);
-	else
-		pcmd_callback(padapter, pcmd);
-	return H2C_SUCCESS;
+	return common_read_write_hdl(padapter, pbuf);
 }

 static u8 read_rfreg_hdl(struct _adapter *padapter, u8 *pbuf)
@@ -184,15 +173,7 @@ static u8 read_rfreg_hdl(struct _adapter *padapter, u8 *pbuf)

 static u8 write_rfreg_hdl(struct _adapter *padapter, u8 *pbuf)
 {
-	void (*pcmd_callback)(struct _adapter *dev, struct cmd_obj *pcmd);
-	struct cmd_obj *pcmd  = (struct cmd_obj *)pbuf;
-
-	pcmd_callback = cmd_callback[pcmd->cmdcode].callback;
-	if (!pcmd_callback)
-		r8712_free_cmd_obj(pcmd);
-	else
-		pcmd_callback(padapter, pcmd);
-	return H2C_SUCCESS;
+	return common_read_write_hdl(padapter, pbuf);
 }

 static u8 sys_suspend_hdl(struct _adapter *padapter, u8 *pbuf)
--
2.32.0

