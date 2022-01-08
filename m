Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726E52C9D
	for <linux-staging@lists.linux.dev>; Sat,  8 Jan 2022 08:27:47 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id v6so15594135wra.8
        for <linux-staging@lists.linux.dev>; Sat, 08 Jan 2022 00:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=avAv+SjmzSPk3oTkCTZAzHE4JzLH4DnHeEbaVJD8pf4=;
        b=lAOtfrSUhTIldjcpHxr7p8tG44vGhspLxjVquuuVLTlKNMLbKDENid1yNs2h5ceSOr
         FKd38fGV76Q59suDPEo/hXvva0fCdMdZJONnhFp6Ugj/HSIU/Po90PxYDWB10n4cRAzt
         wpVOgLROa2IJREYON/alDuAEYI7NsbmBpx8Re+2EfWj25pDtAGjcR4p5makvrIhWirOx
         n/VMuERtOMlDJTSVO/ufFvA9EekyDHNwW2hMAwzA+3jZvA7dnqy5QFmqSCcx5JPHqtFr
         eMSuT72FiIZWfj3RYBwc1Z+p14fUf9NMJOFP9mmF3MKy4+ouf+J6/EM+1G9uen4ESrJm
         MBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=avAv+SjmzSPk3oTkCTZAzHE4JzLH4DnHeEbaVJD8pf4=;
        b=w4d4V1VlE6gZ/fyLG1dbP026KEKUhQUU7RB2weoHebVQ0V6kXZhk6Chtc9kW0KD/nL
         g/kV8c/ChVXhe/bHcuBhw2PKwelCm/S6Uw21+s3kz35efFaVoDoZ5aDhXq0MnisERbrH
         IMQkOlMSFAKovRfqimiIXccTfGFhvpzU24aFq9B6YKstSbDt4YnIfqIDd4i0ddXW1sQR
         QQo3OhcJt2SIoouyHByx+9NelVCEtFf6Qg6CYAXaK5XC4IvfL6lpxWUqN2CvuvVt5YPp
         l0xhulfmZCMTssQepPXtmbeGGebBY7KaKkUHp5+gR6AtUppP7ctCGTV8wUmEbtRdpOnQ
         UhCg==
X-Gm-Message-State: AOAM532b08pvAnDegI1F9CPwE44A/OgoFJ/I/oF8lsoS8j1KTosAXYzq
	TyySJWaOurJcg0N17GC7E+s=
X-Google-Smtp-Source: ABdhPJzUwTCfBbq+Z6JY2QNO4VXXTtvIMXsOJshn6iiVvdXOZUX67Uf131NQOD+3zrl32D/XQAsM3w==
X-Received: by 2002:a5d:4c82:: with SMTP id z2mr8270620wrs.605.1641630465879;
        Sat, 08 Jan 2022 00:27:45 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::51e2])
        by smtp.gmail.com with ESMTPSA id az1sm964536wrb.104.2022.01.08.00.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jan 2022 00:27:45 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/5] staging: r8188eu: rtw_os_recv_resource_init() does nothing
Date: Sat,  8 Jan 2022 09:27:35 +0100
Message-Id: <20220108082736.16788-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220108082736.16788-1-straube.linux@gmail.com>
References: <20220108082736.16788-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function rtw_os_recv_resource_init() just returns _SUCCESS and
the return value is not checked by the caller. Remove the function.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_recv.c      | 2 --
 drivers/staging/r8188eu/include/recv_osdep.h | 1 -
 drivers/staging/r8188eu/os_dep/recv_linux.c  | 7 -------
 3 files changed, 10 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 72007952ee74..26893f36d1ff 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -54,8 +54,6 @@ int _rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *padapter)
 
 	precvpriv->free_recvframe_cnt = NR_RECVFRAME;
 
-	rtw_os_recv_resource_init(precvpriv, padapter);
-
 	precvpriv->pallocated_frame_buf = vzalloc(NR_RECVFRAME * sizeof(struct recv_frame) + RXFRAME_ALIGN_SZ);
 
 	if (!precvpriv->pallocated_frame_buf) {
diff --git a/drivers/staging/r8188eu/include/recv_osdep.h b/drivers/staging/r8188eu/include/recv_osdep.h
index 4c6cf5b1ac76..71fe581fbc85 100644
--- a/drivers/staging/r8188eu/include/recv_osdep.h
+++ b/drivers/staging/r8188eu/include/recv_osdep.h
@@ -19,7 +19,6 @@ void rtw_handle_tkip_mic_err(struct adapter *padapter, u8 bgroup);
 int rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *padapter);
 void rtw_free_recv_priv(struct recv_priv *precvpriv);
 
-int rtw_os_recv_resource_init(struct recv_priv *recvpr, struct adapter *adapt);
 int rtw_os_recv_resource_alloc(struct adapter *adapt, struct recv_frame *recvfr);
 
 int rtw_os_recvbuf_resource_alloc(struct adapter *adapt, struct recv_buf *buf);
diff --git a/drivers/staging/r8188eu/os_dep/recv_linux.c b/drivers/staging/r8188eu/os_dep/recv_linux.c
index 0d3110a4c3d2..da21490fe168 100644
--- a/drivers/staging/r8188eu/os_dep/recv_linux.c
+++ b/drivers/staging/r8188eu/os_dep/recv_linux.c
@@ -12,13 +12,6 @@
 #include "../include/osdep_intf.h"
 #include "../include/usb_ops.h"
 
-/* init os related resource in struct recv_priv */
-int rtw_os_recv_resource_init(struct recv_priv *precvpriv,
-		struct adapter *padapter)
-{
-	return _SUCCESS;
-}
-
 /* alloc os related resource in struct recv_frame */
 int rtw_os_recv_resource_alloc(struct adapter *padapter,
 		struct recv_frame *precvframe)
-- 
2.34.1

