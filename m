Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E033970
	for <linux-staging@lists.linux.dev>; Wed,  4 Aug 2021 14:32:24 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id gs8so3981150ejc.13
        for <linux-staging@lists.linux.dev>; Wed, 04 Aug 2021 07:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wh7D8LABJ00AGBeGW6Pv8KXUbKWQ/bcBiYL57PSEtj0=;
        b=IXBa7dfqQgn/OsIIUSauszYj1NFKh1InFqi9hf++RU0gs2u3QjN5DHibsmAZeBx9Rg
         pACokMLMkaD2cplXE0jYtinCxlHilrvUgOqQgYa0DWcGUsQe1GgL/zwDEVZU23uEXT7B
         Kee5U5GIpfRFZYeJK1jcw359YjSSK6rM2CvkG1Wwwp2L7JODCW6mdYZI9ER1rFJyT7+Q
         PVaRbwlHoKxuSKcbzEiqIK2026MBnk/N5lDN5cOKzO83l8O8NZz3ZpCTEVPqW6QISNla
         R3R1VN3lY+/cAzdJ3HkVVAPnxPKuY17+1omTv67YvpA26FX8k6FYRw/L6j/9SwFL0FKk
         GQtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wh7D8LABJ00AGBeGW6Pv8KXUbKWQ/bcBiYL57PSEtj0=;
        b=Q29GVOCqjotj5gExT+6SxwD7+wW5aTIpeXQq1yiPhybfOx5JB8O0Ui/9fjufpt0Hm+
         14klf7NQIYxQKIAfaow4X5LPeQRa/Qee8VT2adO0yBI3fBSYGh7Sxfl9CnZ/Wob8vp5M
         a/zV3zMzq5dwHUAme9FzD5jYEWbgK8EJXQ6y3ZWNCmvIpL288OMBHC3aB15yeVYIZabu
         +P2ZIlFTjpV54R3Z8xBGH5Ezq8zL2Y/RIRZr5CiQxNrL8qOvYy5MHzSCUi/92uSnJuXM
         03Ob5qa+HPVRS1ST4wHSibWbd7rIVXXT0SK/rjvhA9pn3wXb3OIZSW9MMlHzz2TEEukI
         m66g==
X-Gm-Message-State: AOAM533nEzCXNDSnJYDJp+Kovq6ApEvNwzUUNae3m2p8sZRJuIsme1uA
	gbjV86m36YAjZ9wdyuRLtnU=
X-Google-Smtp-Source: ABdhPJwHghnztlq4JpKkAD3dufINYwXOjofjkAn9AyfpE1CDk2x8QRgditoL1mcEUXKGvsZPh/1aOQ==
X-Received: by 2002:a17:906:a298:: with SMTP id i24mr2739803ejz.151.1628087543244;
        Wed, 04 Aug 2021 07:32:23 -0700 (PDT)
Received: from localhost.localdomain (host-82-51-42-96.retail.telecomitalia.it. [82.51.42.96])
        by smtp.gmail.com with ESMTPSA id j23sm1016142eds.21.2021.08.04.07.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 07:32:22 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v2] staging: r8188eu: Fix cast between incompatible function type
Date: Wed,  4 Aug 2021 16:32:18 +0200
Message-Id: <20210804143218.13665-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix sparse warnings of casts between incompatible function
types from ‘void (*)(void *)’ to ‘void (*)(long unsigned int)’
[-Wcast-function-type].

Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

v1 -> v2:
	According to a suggestion by Dan Carpenter, fix this issue by having
	functions to take an unsigned long instead of a pointer to void.

 drivers/staging/r8188eu/hal/rtl8188eu_recv.c    | 2 +-
 drivers/staging/r8188eu/hal/rtl8188eu_xmit.c    | 2 +-
 drivers/staging/r8188eu/hal/usb_ops_linux.c     | 4 ++--
 drivers/staging/r8188eu/include/rtl8188e_recv.h | 2 +-
 drivers/staging/r8188eu/include/rtl8188e_xmit.h | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188eu_recv.c b/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
index 2e3f624d0f22..854377c9f0ab 100644
--- a/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
+++ b/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
@@ -38,7 +38,7 @@ int	rtl8188eu_init_recv_priv(struct adapter *padapter)
 	struct recv_buf *precvbuf;
 
 	tasklet_init(&precvpriv->recv_tasklet,
-		     (void(*)(unsigned long))rtl8188eu_recv_tasklet,
+		     rtl8188eu_recv_tasklet,
 		     (unsigned long)padapter);
 
 	/* init recv_buf */
diff --git a/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c b/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
index e44a01af7f5c..b0c4f5ed8a6a 100644
--- a/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
+++ b/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
@@ -14,7 +14,7 @@ s32	rtl8188eu_init_xmit_priv(struct adapter *adapt)
 	struct xmit_priv	*pxmitpriv = &adapt->xmitpriv;
 
 	tasklet_init(&pxmitpriv->xmit_tasklet,
-		     (void(*)(unsigned long))rtl8188eu_xmit_tasklet,
+		     rtl8188eu_xmit_tasklet,
 		     (unsigned long)adapt);
 	return _SUCCESS;
 }
diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 577090db84be..ffd2474a8760 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -459,7 +459,7 @@ static int recvbuf2recvframe(struct adapter *adapt, struct sk_buff *pskb)
 	return _SUCCESS;
 }
 
-void rtl8188eu_recv_tasklet(void *priv)
+void rtl8188eu_recv_tasklet(unsigned long priv)
 {
 	struct sk_buff *pskb;
 	struct adapter *adapt = (struct adapter *)priv;
@@ -649,7 +649,7 @@ static u32 usb_read_port(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *rmem)
 	return ret;
 }
 
-void rtl8188eu_xmit_tasklet(void *priv)
+void rtl8188eu_xmit_tasklet(unsigned long priv)
 {
 	int ret = false;
 	struct adapter *adapt = (struct adapter *)priv;
diff --git a/drivers/staging/r8188eu/include/rtl8188e_recv.h b/drivers/staging/r8188eu/include/rtl8188e_recv.h
index bc1d532592b9..a91daf84d6c3 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_recv.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_recv.h
@@ -44,7 +44,7 @@ void rtl8188eu_init_recvbuf(struct adapter *padapter, struct recv_buf *buf);
 s32 rtl8188eu_init_recv_priv(struct adapter *padapter);
 void rtl8188eu_free_recv_priv(struct adapter * padapter);
 void rtl8188eu_recv_hdl(struct adapter * padapter, struct recv_buf *precvbuf);
-void rtl8188eu_recv_tasklet(void *priv);
+void rtl8188eu_recv_tasklet(unsigned long priv);
 void rtl8188e_query_rx_phy_status(struct recv_frame *fr, struct phy_stat *phy);
 void rtl8188e_process_phy_info(struct adapter * padapter, void *prframe);
 void update_recvframe_phyinfo_88e(struct recv_frame *fra, struct phy_stat *phy);
diff --git a/drivers/staging/r8188eu/include/rtl8188e_xmit.h b/drivers/staging/r8188eu/include/rtl8188e_xmit.h
index e9b71de0d165..8adfa98f99d0 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_xmit.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_xmit.h
@@ -147,7 +147,7 @@ s32 rtl8188eu_hal_xmit(struct adapter *padapter, struct xmit_frame *frame);
 s32 rtl8188eu_mgnt_xmit(struct adapter *padapter, struct xmit_frame *frame);
 s32 rtl8188eu_xmit_buf_handler(struct adapter *padapter);
 #define hal_xmit_handler rtl8188eu_xmit_buf_handler
-void rtl8188eu_xmit_tasklet(void *priv);
+void rtl8188eu_xmit_tasklet(unsigned long priv);
 s32 rtl8188eu_xmitframe_complete(struct adapter *padapter,
 				 struct xmit_priv *pxmitpriv,
 				 struct xmit_buf *pxmitbuf);
-- 
2.32.0

