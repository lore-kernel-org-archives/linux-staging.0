Received: from mail-lr2-f10.google.com (mail-lr2-f10.google.com [74.125.230.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385E32E9EC7
	for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 13:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783862549; cv=none; b=j+NEb9CjkCsxYrpKRIoqXrDv3EKDhaYnRZq/2cbxKt92MajNV4TSQpaXuw0MXx2FiqC+x51gxkTueoJO21HEaIo86Gij5wf3QFHyjPGcuivBxzgLmmjZlAcwu6kKn4ui7eaL2FAVlPbJZMWkglG7I3ADoIQzOZYGRY+4fyccY38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783862549; c=relaxed/simple;
	bh=VBfxIf5jkurJsVY5ZJkdRl9bgpUoogL3E+gyVzR6DC4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hssHiu/zZoLfxKDPPePCdmIxSDiPD2yDpVY89SAH66T4QPPwPy+TYTXau4h5Iyn8cajyFyXMjz9+iDvidQOQRYpbrwU2qd3mUcqR8m0VSEAW6AF42VbhDZ625cPKEjfyyjSv8/6m2tPk8mBFuf9xstpfb6oympkwPmw10kga84U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ai8iiGJ0; arc=none smtp.client-ip=74.125.230.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ai8iiGJ0"
Received: by mail-lr2-f10.google.com with SMTP id 38308e7fff4ca-39c74e3e868so14576201fa.1
        for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 06:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783862546; x=1784467346; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HTTvljq+83n6uNWcxR3axW0QFj9YKsC9/Dy6VWE7Q6I=;
        b=ai8iiGJ00Oqet+nfwHXlus65MUDsP3BwKtnRdRK6yRyIbTzoTaATs0wrjNovMqJ9NF
         YyoilFaz/OMq5VaEXE5if1gU/9o9UeIwhmEDPBtlDRBGFSt0Esp7sGr18T9c9LGl7Bim
         7EUlAae7541wZm9dKqtiujHGjgIhc84HVIP9YpN8/1EUnf6Gq4pWyoZluVej3hTKUhgr
         Q73CztdhsUH08huTx89oADyAOPpu6dBTS0c0BtllPSbzqP+3qbL6xSZphRRdVXsY+U0K
         2YI1SkHYF3Ov3Gkot4MzKejspTeaTo9UgnFB0rLPHkykpBY5MTe0md8LMIoBLOQ8k1Mi
         t23g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783862546; x=1784467346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HTTvljq+83n6uNWcxR3axW0QFj9YKsC9/Dy6VWE7Q6I=;
        b=nNFiO33XwDMWyE9hR0vddJmfRbPyueFjSKVlHTq/rm899poXSjseF4Ibt7FKs2PmTd
         IAnlMM0IhTQjzvUnkPRwLMr4ApuBrNlAuaLvMbwN/pI0r+yeJrjyIZQVO1H7cSltDbyW
         mODTlR+MvQj6SxQbQzJc67pvBcWkb21k4Z18CuvMthmNHu4lbGZDeLcJ4+DUVgKsdjFe
         815hyrBI9XWCI34rkWjtsBjHy2WHol95kxk7kA9BabT77HyZ9KBFTy4lzhdnhbghmjXd
         DDgChM2pgUZwjA0dscPngyTOHLzWQMNbeNALcl2buIS2uLPYrdyZ78MYCjwT0JldlXCo
         HmVA==
X-Gm-Message-State: AOJu0YwKofTS3akekJEdRl6RM2KFU6SOkf+o+bPQ93Q9HaSS+q06hvRg
	vhrSHtVxxH0klW0SOG1uN+o/L1gARvSvGnz1hHRsV36t9x/oijATN6naQEsgGZH+r4vZ2g==
X-Gm-Gg: AfdE7cmvc0oaPj9WT/EMUB3AN05VfLtoQ2wMJzrZsC/7Wuf/E94Nafvay94pixx6TCd
	lk1402Nl3T1eGUCLUVEiYtUH4cyoW4dj62uJ+RnNKm0ImADLDheE6CPwAm1Zf1elnDdi1UT/3wc
	V8MVb1n/cyiOupdxUVgaw/rNl7SeHYx0pwS92l5dbonR+RhJ9j6sGyd4tpvCk3X9nJYmed0jjyp
	iTalrIjzg+jg/0GR/Yq4umcOY8bUC2K2f9ov+7K/cquOEKQO1GQrlLK4zF0gK3s6xNrP+rKkZdf
	aamGa68W+slm0HYoKGZZdLaAYbni2BxXC02yOod1nfYej1JlbCKVdbZD2nWd/1Ooa5x8gNrOzQd
	9ojUh4296d//gbDSDgJGQGf5G9s8kAan8fHjtybjW44/iAAu38Wrttw6lTKi7Ozx0/BaHv1Ho2Z
	yJKkbFR3foB6w=
X-Received: by 2002:ac2:5b8b:0:b0:5ae:c003:4b8b with SMTP id 2adb3069b0e04-5b0236c80eamr879836e87.59.1783862546111;
        Sun, 12 Jul 2026 06:22:26 -0700 (PDT)
Received: from fedora ([93.177.236.219])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01cab0ed9sm2118920e87.77.2026.07.12.06.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 06:22:25 -0700 (PDT)
From: "Bohdan D. Marcus" <bohdandmarcus@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Bohdan D. Marcus" <bohdandmarcus@gmail.com>
Subject: [PATCH] staging: rtl8723bs: rename MACREG macros to snake_case
Date: Sun, 12 Jul 2026 16:20:26 +0300
Message-ID: <20260712132026.8836-1-bohdandmarcus@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl warnings regarding CamelCase naming:
CHECK: Avoid CamelCase: <_Read_MACREG>
CHECK: Avoid CamelCase: <_Write_MACREG>

Rename _Read_MACREG and _Write_MACREG to read_macreg and
write_macreg respectively to comply with the Linux kernel
coding style.

Signed-off-by: Bohdan D. Marcus <bohdandmarcus@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c         | 4 ++--
 drivers/staging/rtl8723bs/include/rtw_cmd.h      | 4 ++--
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index b932670f5..f3b8a2bdf 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -11,8 +11,8 @@
 #include <linux/delay.h>
 
 static struct _cmd_callback rtw_cmd_callback[] = {
-	{GEN_CMD_CODE(_Read_MACREG), NULL}, /*0*/
-	{GEN_CMD_CODE(_Write_MACREG), NULL},
+	{GEN_CMD_CODE(read_macreg), NULL}, /*0*/
+	{GEN_CMD_CODE(write_macreg), NULL},
 	{GEN_CMD_CODE(_Read_BBREG), &rtw_getbbrfreg_cmdrsp_callback},
 	{GEN_CMD_CODE(_Write_BBREG), NULL},
 	{GEN_CMD_CODE(_Read_RFREG), &rtw_getbbrfreg_cmdrsp_callback},
diff --git a/drivers/staging/rtl8723bs/include/rtw_cmd.h b/drivers/staging/rtl8723bs/include/rtw_cmd.h
index f78aa0d7a..72403b96d 100644
--- a/drivers/staging/rtl8723bs/include/rtw_cmd.h
+++ b/drivers/staging/rtl8723bs/include/rtw_cmd.h
@@ -630,8 +630,8 @@ struct _cmd_callback {
 };
 
 enum {
-	GEN_CMD_CODE(_Read_MACREG),	/*0*/
-	GEN_CMD_CODE(_Write_MACREG),
+	GEN_CMD_CODE(read_macreg),	/*0*/
+	GEN_CMD_CODE(write_macreg),
 	GEN_CMD_CODE(_Read_BBREG),
 	GEN_CMD_CODE(_Write_BBREG),
 	GEN_CMD_CODE(_Read_RFREG),
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index cb23c6939..59d9d35e4 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -675,7 +675,7 @@ void rtw_dummy_event_callback(struct adapter *adapter, u8 *pbuf);
 void rtw_fwdbg_event_callback(struct adapter *adapter, u8 *pbuf);
 
 enum {
-	GEN_EVT_CODE(_Read_MACREG) = 0, /*0*/
+	GEN_EVT_CODE(read_macreg) = 0, /*0*/
 	GEN_EVT_CODE(_Read_BBREG),
 	GEN_EVT_CODE(_Read_RFREG),
 	GEN_EVT_CODE(_Read_EEPROM),
-- 
2.55.0

