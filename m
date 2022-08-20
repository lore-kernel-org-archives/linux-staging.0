Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD44A3222
	for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 18:16:40 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id x21so9149791edd.3
        for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 11:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=usx92kQh3jBW+D0YFniMBn1+nXBeLsReCVppzHDQ5qI=;
        b=mk6o3CJIkSCm4NsgftksJW74mRbv5WJPO8PCzOjMG2Y7NbohRmXYqbNITTklnItzL6
         XoKXYlxpsmhRcsJKTLygo/XPi+Kc9IxOnZUoNm0GsqLXDEcpAGD5O0CQNQHQkQyKDci/
         0/1PUpgm+xb3Fs85jFSoGwo8e9T1MxR9fd3gfF5030qky17hIeuGAd2+gDxoQWEfHMZJ
         qnZmJYKHSRMmJP44heXN8gMKAE33WYqS2V7rM76b6rPvhpZVEikT5zMX2e9IOaiabG8P
         KA35TkZ5ZzqToqjKRm6RP8Gjg4TpbSlfrVlB4lTOmvlAcqTyxTTSZMhCKJTqyCvZ9vZD
         cJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=usx92kQh3jBW+D0YFniMBn1+nXBeLsReCVppzHDQ5qI=;
        b=VhfDC10HwPJJlrEKEgJoXcq4LFMum6yUQWSLoYv0faNwpU7TXD74TFLqvku0lTJjMV
         Lx8U2g8HAWjuDnxXXvcPROkKEj192u4bkCVzsZRSB3yLpJIPloYxD5B+4phBzsB9SaZg
         IaMnY6btHzXsJos2tf+XjzuvuQBYyDr2ZgRv1vEdcHoP85y0yZjuVpmmeeKEFFRbL/GX
         MpM9ltJcFFnE3E6r3iQ2mDgXuPDWlYMR2dtLkbB+qQ8MG5ynVakUvOoHr/D+uGft3ZMZ
         a8d8/ZtB+QXYJqMv3kSX7bH7jNL8eBVH4ykZFnoc8d+fKXog5XlYwd0RnYfVj9T5SVfM
         Mwpw==
X-Gm-Message-State: ACgBeo0XCgeNMiXWGiKtb8Pd+Kp1lTCYrruyWqa8nO0SzMXq0Qodzi3w
	ewWLcEMxhjonMk6pOvQ8mf4=
X-Google-Smtp-Source: AA6agR7BwHRL8xNifPEtOeVRycVZUhK4J6oOllu7LVNjcKLo/gyLZyufwERoq4qszDfKYVSLV61TIA==
X-Received: by 2002:a05:6402:4382:b0:43d:6fce:3f1b with SMTP id o2-20020a056402438200b0043d6fce3f1bmr10262690edc.361.1661019400298;
        Sat, 20 Aug 2022 11:16:40 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb77.dynamic.kabel-deutschland.de. [95.90.187.119])
        by smtp.gmail.com with ESMTPSA id g2-20020a17090604c200b0072af890f52dsm3887833eja.88.2022.08.20.11.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Aug 2022 11:16:39 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 06/19] staging: r8188eu: make rtw_os_xmit_resource_free() static
Date: Sat, 20 Aug 2022 20:16:10 +0200
Message-Id: <20220820181623.12497-7-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220820181623.12497-1-straube.linux@gmail.com>
References: <20220820181623.12497-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function rtw_os_xmit_resource_free() is only used in rtw_xmit.c.
Make it static.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_xmit.c      | 7 +++++++
 drivers/staging/r8188eu/include/xmit_osdep.h | 3 ---
 drivers/staging/r8188eu/os_dep/xmit_linux.c  | 8 --------
 3 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index a1d2c2f78044..426bf87a1404 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -50,6 +50,13 @@ static int rtw_xmit_resource_alloc(struct adapter *padapter, struct xmit_buf *px
 	return _SUCCESS;
 }
 
+static void rtw_os_xmit_resource_free(struct adapter *padapter, struct xmit_buf *pxmitbuf,
+				      u32 free_sz)
+{
+	usb_free_urb(pxmitbuf->pxmit_urb);
+	kfree(pxmitbuf->pallocated_buf);
+}
+
 s32	_rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 {
 	int i;
diff --git a/drivers/staging/r8188eu/include/xmit_osdep.h b/drivers/staging/r8188eu/include/xmit_osdep.h
index 82b47b38bafd..2c663c00b985 100644
--- a/drivers/staging/r8188eu/include/xmit_osdep.h
+++ b/drivers/staging/r8188eu/include/xmit_osdep.h
@@ -30,9 +30,6 @@ struct xmit_buf;
 
 int rtw_xmit_entry(struct sk_buff *pkt, struct  net_device *pnetdev);
 
-void rtw_os_xmit_resource_free(struct adapter *padapter,
-			       struct xmit_buf *pxmitbuf, u32 free_sz);
-
 void _rtw_open_pktfile(struct sk_buff *pkt, struct pkt_file *pfile);
 uint _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen);
 
diff --git a/drivers/staging/r8188eu/os_dep/xmit_linux.c b/drivers/staging/r8188eu/os_dep/xmit_linux.c
index fdecb5e1a784..3d298d8187d2 100644
--- a/drivers/staging/r8188eu/os_dep/xmit_linux.c
+++ b/drivers/staging/r8188eu/os_dep/xmit_linux.c
@@ -54,14 +54,6 @@ uint _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen)
 	return len;
 }
 
-void rtw_os_xmit_resource_free(struct adapter *padapter,
-			       struct xmit_buf *pxmitbuf, u32 free_sz)
-{
-	usb_free_urb(pxmitbuf->pxmit_urb);
-
-	kfree(pxmitbuf->pallocated_buf);
-}
-
 #define WMM_XMIT_THRESHOLD	(NR_XMITFRAME * 2 / 5)
 
 void rtw_os_pkt_complete(struct adapter *padapter, struct sk_buff *pkt)
-- 
2.37.2

