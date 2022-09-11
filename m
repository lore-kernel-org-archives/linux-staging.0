Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBBA1872
	for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 17:49:44 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id z21so9737185edi.1
        for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 10:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=y24/RvSJFD8cj8h+YiCKjB2PoZPXleU4CbfhX08+KNs=;
        b=IHMNQxrt+rOP0k2us6CAbp0ky7uq7haAPtxhLdt9gQ4ZNiXxC5zP6WhGPiuC8tFmn+
         6wPNfbkYBb/F71//EvB37wJSC+kYuvbI2rGBP2Nu8VBn/BbqvpeX27dFJ1KqoKKBSDtD
         F3l+t+vRuuar3aHEqKWoRZzP0k2zh9baghBW9+Mpyc+zmhXgKns/rjuxgDjOdecFDfbE
         +YL/w0M/Jgygh48txfZ+OYnL2B32GhmFDBF9SSEbYAg5ZgYYOjM3HwG4qyOra6poVvPq
         wqTHUa7ZKau4q0DFnJxLg+fmQoem1wA4sd/2yexlXcP4kOak3aBgjLZPPjP+rkVgaPIH
         uVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=y24/RvSJFD8cj8h+YiCKjB2PoZPXleU4CbfhX08+KNs=;
        b=MuZjPR7vO+QsslqzDR69YbOFfeVAg0sCMTJhIFnfKCDfidSDOsY9Z3BK1/jbrdXD1P
         tbnR8rptAK7f40Ku0ZEphfl/gpTM9NMtx+Xa4OcT7Ch7QrQ2k0fD+1z/AmLqEazwRi+S
         2xBmbGNCGZ4/CKwneql6KXCIXy5RfDtBIhNDdUqowtCiUfNsuv6stPhyK+v+kd+IpBnh
         31vk27Fxv8QfSfSZuLNo9jiB2h9h+mFCQ9W2RFXtpR/LbTCzPyfc8+gzEAKDr0rApcsQ
         lCYa++8jne1ZkmCw3rEIpYjYegrAZox6yW3DoHAgfLdFtMWYVw+MuuG6jnnENZ0xOSiz
         TMzQ==
X-Gm-Message-State: ACgBeo2edZ84+iJ7ONLaaxK5A0l2TK2rVCi0C7Uz1IfMqnzfqKjeDtGl
	QYenb99KRJpi1cD/WKs+MlM=
X-Google-Smtp-Source: AA6agR4P6WLavtNycwITioe3FMpiPSN01ZSqAggy6dj6KfJMhggxJZjKGevExPsx0QU3OiyyHXUWpg==
X-Received: by 2002:aa7:d34e:0:b0:44e:8d4b:6e02 with SMTP id m14-20020aa7d34e000000b0044e8d4b6e02mr19887131edr.306.1662918582972;
        Sun, 11 Sep 2022 10:49:42 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb6b.dynamic.kabel-deutschland.de. [95.90.187.107])
        by smtp.gmail.com with ESMTPSA id u5-20020a1709063b8500b007336c3f05bdsm3265393ejf.178.2022.09.11.10.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 10:49:42 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/3] staging: r8188eu: remove unused prototypes from recv_osdep.h
Date: Sun, 11 Sep 2022 19:49:32 +0200
Message-Id: <20220911174933.3784-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220911174933.3784-1-straube.linux@gmail.com>
References: <20220911174933.3784-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function prototypes rtw_recv_returnpacket(), rtw_init_recv_priv()
and rtw_free_recv_priv() are not used. Remove them.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/recv_osdep.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/r8188eu/include/recv_osdep.h b/drivers/staging/r8188eu/include/recv_osdep.h
index c01943f4f845..437880629a25 100644
--- a/drivers/staging/r8188eu/include/recv_osdep.h
+++ b/drivers/staging/r8188eu/include/recv_osdep.h
@@ -11,10 +11,6 @@ int _rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *padapter);
 void _rtw_free_recv_priv(struct recv_priv *precvpriv);
 
 s32  rtw_recv_entry(struct recv_frame *precv_frame);
-void rtw_recv_returnpacket(struct  net_device *cnxt, struct sk_buff *retpkt);
-
-int rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *padapter);
-void rtw_free_recv_priv(struct recv_priv *precvpriv);
 
 int netdev_open(struct net_device *pnetdev);
 int netdev_close(struct net_device *pnetdev);
-- 
2.37.3

