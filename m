Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD273FC2
	for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 08:29:25 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id g14so1251382pfm.1
        for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 01:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=X1Ka596D4T+qrQ3x64aHg+vCGr4l6bDdJYBtf2qGrO0=;
        b=HaNdN2FTqndKVudMjlQwIWFnOE/CqokRoRHKeHRkWRZJOkVkT8frSZro/BHaU/8/WX
         9okM67qatIZ2cejk9JOyFtzLL05Ig81xOYtjhXO02hQGOvoaA8fKBgfOr9QHSiRQmCkA
         HTz740YYD2GgUEMj9GE3bBi5k9qnH3PGDXa2pfRoB0twhbxs9+Ha6nCh9OdTizR6Izw/
         bQnZYOVVLAWGR8hvvseHVgrt+X/9Z+qLu1rpKLPai5BxkF/+7sIZLyBveNlOqZTWdU7e
         feaOg027OQiJRgIwMpHCaBewP0Jv9YD7FvvJrgSb+6WJuUMmEubQVp9mfD5aEeBHdCsu
         d+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=X1Ka596D4T+qrQ3x64aHg+vCGr4l6bDdJYBtf2qGrO0=;
        b=tJkMBIbLW7n6R+6Kgujp/j3G8QDvbVlaD5cTRp0ayAZeJgCkLdIudXaQyTEvMpY7KY
         r6l3chHJFydgZM2epXn4mxnAIhoPsdLoO5vZ4MIXdFOFHwd5EqE8B2OOafmxy+hy4bif
         e8n0SpbfrBGcdEQu3QwK8DWrWZLo6J3q2MkRb5EwpzrwQzJ/rvXv5Z40IjZWsZyc4KYx
         QGTaehJnDYu9r+7pUbzZDAHuDRjzaMIw7qKtoyJtxprwyCZlN02uJSSSNQFPQFG7x34u
         QZFLOLakAhN1fZ7fPRX05injBHGsl2EBZkUydroDYnfK9O7ti0mCLUaN47CVlTfzzxgz
         ZQqQ==
X-Gm-Message-State: AOAM531uFkXcs0P+nLKpbbH/7gWua2RzLPa4/E5oMyukS8+dTkZ3HQRB
	M3TnqLrgaJ1SUAMf12EiW+M=
X-Google-Smtp-Source: ABdhPJx+y/VBPKdyWT1FN19oFSjXlOnff4HzZHsc8WE0QCRAD91fR8f/qNwy27Bha2ytjOPpbg/2Eg==
X-Received: by 2002:a63:b007:: with SMTP id h7mr6222926pgf.443.1631262565075;
        Fri, 10 Sep 2021 01:29:25 -0700 (PDT)
Received: from user ([117.98.200.228])
        by smtp.gmail.com with ESMTPSA id y8sm4628496pfe.162.2021.09.10.01.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 01:29:24 -0700 (PDT)
Date: Fri, 10 Sep 2021 13:59:19 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, fmdefrancesco@gmail.com,
	saurav.girepunje@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH v2] staging: rtl8712: Move similar execution in to a function.
Message-ID: <YTsXXxtQn7QN6nIm@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In rtl8712_cmd.c function read_macreg_hdl,write_macreg_hdl,write_bbreg_hdl
and write_rfreg_hdl all are having same execution.

Move this common execution in to a new function common_read_write_hdl().
Call common_read_write_hdl() from read_macreg_hdl,write_macreg_hdl,
write_bbreg_hdlhis and write_rfreg_hdl.This will reduce duplicate code.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---

ChangeLog V2:
- Add more explanation about the patch

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

