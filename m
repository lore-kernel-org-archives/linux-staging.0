Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142FC70
	for <linux-staging@lists.linux.dev>; Fri, 21 May 2021 15:40:37 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id s19so12932672pfe.8
        for <linux-staging@lists.linux.dev>; Fri, 21 May 2021 08:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UA6xPv5LeF6SOpRV6Qraytl+bpMd+qdk0hK3e5B3Cgk=;
        b=DJ1JKnVAIZLi4G4kVfvqb4K6CKLVprfGDIWjF0zBF2KsJY2vYlobcUmk7Vp4PX3Oe3
         4mHVgvKSCMx5626xGz+G8SyseUh5WaeP7dT/uVz9jJYBFJNDEAeOyPAx+Lgmm+zzC+3c
         jaOPulK4ux2t4KW5XAuI9Aop0W39QllbV3ZIFZMda5/Kl7N86CLyAW0jNAj3DtF4SB4I
         98BohEy4zn69DXpG4vTofAGZtTUVRTwL54lHUqd6fS8QR54+zXcMUCJDXhJfcNrUNA3k
         bodQqpHekIRTtyzLUknQjot6nk7qbNzqK9d8ghVvZn0FUqLKtTBgAdauVwH2Mp/0AGNb
         o9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UA6xPv5LeF6SOpRV6Qraytl+bpMd+qdk0hK3e5B3Cgk=;
        b=kJc/7K51a5A8pOUMG/QID5C3KhoE8zd+K8fjDQilo8AX9cv4I1LLurqMwgE8tZyZ7g
         IuV2sydzvorp9Mlx/Qh4PQNa2tIFJVjpcmtbpogSe8F7zCoDg8mgQCzzj+/0WzkFQ6Qw
         D+g95WmN+kS8S3Eve+oNiN1z8JT+BkBMK81Pz5JQ8Ltq6V6F0UOWWMwmiKWly5wIBVCH
         XwmAlqtGS5fKgaV8Kpc5W+p0ELGbW+s25OpBfbQP3ssSXHuK+c3Fslg7Z4PMy51Bu8OU
         lNwHxd4+bXRQbVQcDiJVfLxlTVmm407FTXd7zpTD0Uw5shUjB1q9JkjU6a9gBM+s8ZFV
         8Xzg==
X-Gm-Message-State: AOAM533wRgg4DNLnckJaJLeqhiWZuAqcbj4pkrcBoTHFgpGm2IdhYoEb
	xX/qfiA7rQuZv+GZ+pkCvhE=
X-Google-Smtp-Source: ABdhPJxRwUy54XtclIe/o3gLoWcXF0/Cg63DARPEjjF+8/keJHdx7jOIP1L62Lq8Xp/TKS0HBFwZ9g==
X-Received: by 2002:a62:3106:0:b029:25c:cd66:3be1 with SMTP id x6-20020a6231060000b029025ccd663be1mr10619026pfx.29.1621611636503;
        Fri, 21 May 2021 08:40:36 -0700 (PDT)
Received: from ubuntu.localdomain ([103.196.78.23])
        by smtp.googlemail.com with ESMTPSA id u7sm4627212pfi.104.2021.05.21.08.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 08:40:35 -0700 (PDT)
From: Hriday Hegde <hridayhegde1999@gmail.com>
To: 
Cc: hridayhegde1999@gmail.com,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Romain Perier <romain.perier@gmail.com>,
	Pascal Terjan <pterjan@google.com>,
	Allen Pais <apais@linux.microsoft.com>,
	Rustam Kovhaev <rkovhaev@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8712: Removed unnecessary blank lines
Date: Fri, 21 May 2021 08:39:16 -0700
Message-Id: <20210521153924.22843-1-hridayhegde1999@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following lines were fixed as dictated by running checkpatch

CHECK: Please don't use multiple blank lines
65: FILE: drivers/staging/rtl8712/xmit_linux.c:65:
+

CHECK: Blank lines aren't necessary after an open brace '{'
39: FILE: drivers/staging/rtl8712/usb_intf.c:39:
+static const struct usb_device_id rtl871x_usb_id_tbl[] = {

CHECK: Blank lines aren't necessary after an open brace '{'
849: FILE: drivers/staging/rtl8712/rtl871x_xmit.c:849:
+{

CHECK: Please don't use multiple blank lines
260: FILE: drivers/staging/rtl8712/rtl871x_sta_mgt.c:260:
+

Signed-off-by: Hriday Hegde <hridayhegde1999@gmail.com>
---
 drivers/staging/rtl8712/rtl871x_sta_mgt.c | 1 -
 drivers/staging/rtl8712/rtl871x_xmit.c    | 1 -
 drivers/staging/rtl8712/usb_intf.c        | 1 -
 drivers/staging/rtl8712/xmit_linux.c      | 1 -
 4 files changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl871x_sta_mgt.c b/drivers/staging/rtl8712/rtl871x_sta_mgt.c
index 706e9db0fc5b..2c806a0105bf 100644
--- a/drivers/staging/rtl8712/rtl871x_sta_mgt.c
+++ b/drivers/staging/rtl8712/rtl871x_sta_mgt.c
@@ -257,7 +257,6 @@ struct sta_info *r8712_get_bcmc_stainfo(struct _adapter *padapter)
 	return r8712_get_stainfo(pstapriv, bc_addr);
 }
 
-
 u8 r8712_access_ctrl(struct wlan_acl_pool *pacl_list, u8 *mac_addr)
 {
 	return true;
diff --git a/drivers/staging/rtl8712/rtl871x_xmit.c b/drivers/staging/rtl8712/rtl871x_xmit.c
index bb4de927fb02..090345bad223 100644
--- a/drivers/staging/rtl8712/rtl871x_xmit.c
+++ b/drivers/staging/rtl8712/rtl871x_xmit.c
@@ -846,7 +846,6 @@ static inline struct tx_servq *get_sta_pending(struct _adapter *padapter,
 					       struct  __queue **ppstapending,
 					       struct sta_info *psta, sint up)
 {
-
 	struct tx_servq *ptxservq;
 	struct hw_xmit *phwxmits =  padapter->xmitpriv.hwxmits;
 
diff --git a/drivers/staging/rtl8712/usb_intf.c b/drivers/staging/rtl8712/usb_intf.c
index dc21e7743349..64ddbd483a23 100644
--- a/drivers/staging/rtl8712/usb_intf.c
+++ b/drivers/staging/rtl8712/usb_intf.c
@@ -36,7 +36,6 @@ static int r871xu_drv_init(struct usb_interface *pusb_intf,
 static void r871xu_dev_remove(struct usb_interface *pusb_intf);
 
 static const struct usb_device_id rtl871x_usb_id_tbl[] = {
-
 /* RTL8188SU */
 	/* Realtek */
 	{USB_DEVICE(0x0BDA, 0x8171)},
diff --git a/drivers/staging/rtl8712/xmit_linux.c b/drivers/staging/rtl8712/xmit_linux.c
index 1f67d86c606f..90d34cf9d2ff 100644
--- a/drivers/staging/rtl8712/xmit_linux.c
+++ b/drivers/staging/rtl8712/xmit_linux.c
@@ -62,7 +62,6 @@ sint r8712_endofpktfile(struct pkt_file *pfile)
 	return (pfile->pkt_len == 0);
 }
 
-
 void r8712_set_qos(struct pkt_file *ppktfile, struct pkt_attrib *pattrib)
 {
 	struct ethhdr etherhdr;
-- 
2.25.1

