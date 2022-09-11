Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DC51871
	for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 17:49:43 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id y3so15330520ejc.1
        for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 10:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=EnC0I3ssb1d4+KdXF1mpvMOnSapwEBhhB/jhImTDfv0=;
        b=VKoZqEkNcj2EYBCS7Fn5nGyqj0Ltff1/oiZlfdvbQ+RiWV51yXgy6wNDZVwqnNs8TK
         HUW++0s/QEIJiXkfx7spfSWFp9ENbmXDXhdIGEm2Tm1jhs6DqS2yJqesBG5+fdWC2D0/
         yU41+mTRm+sFaiw3xc9pmIpcPrUchtUeSbuEqYB+Fbkww/mh39kh7jCbv/LM3HCRt8nN
         9qfDVLlCVxcBlgf4bXFm0q/nwQST7XU0U1+w3P5LWqUke6mxctaaOQyjV4U5JBVuOOaJ
         KwuYIi/C9qbUgbToyOaFRPJ2Gu6Spll5+N59LzCffjktp7gQY7xOzde8Tzw0HSGh1tMG
         6amQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=EnC0I3ssb1d4+KdXF1mpvMOnSapwEBhhB/jhImTDfv0=;
        b=7DWDAk8+rrVFOqZENG91IXQJnKGBzFDko1L1kUgWQrNnUgIVsPSGMNLLlgwRyQRaSr
         QN7EZhR5ImyZpRfihgjELKshahyPVmZtdcVAwiejsLZ2YDfpzO5uSqNaJqOQiHSekqwb
         xK4D97bCMYdRPXGhUG+v9bmgONp6rZkKtxGDRvGBYu6koCqkRlk99QT21jEEW1QSbHwv
         tgsZglDZ55YJqPRIIIOdx48fvIiyjEFTZcvPDeVPmmDdg1DKhBSdtLZKZ9RgrWqfNScl
         Qmpe6o3s5+C2OxI3HXeydppJLOiErZ6u2LeVXyKiXygKzN+b6cPEEIYd6NJcVy7yE7s1
         zhPQ==
X-Gm-Message-State: ACgBeo1ZRLOW+yD/j7ILnwgaoKXOTIyE5kpSk+WyQ9sCS14Vm+sB0vyr
	M+X2jzUf1yO/1GEeIVrG7dHeAoFTMcQ=
X-Google-Smtp-Source: AA6agR7OiNxYufQL1u3nbj/ZvTGPUeBvEr6GKaz8Uet4G3oKVvApEqv440fDx1gA8T0Z25HmWuCI8A==
X-Received: by 2002:a17:907:2da1:b0:773:dc01:877a with SMTP id gt33-20020a1709072da100b00773dc01877amr12415039ejc.567.1662918582262;
        Sun, 11 Sep 2022 10:49:42 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb6b.dynamic.kabel-deutschland.de. [95.90.187.107])
        by smtp.gmail.com with ESMTPSA id u5-20020a1709063b8500b007336c3f05bdsm3265393ejf.178.2022.09.11.10.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 10:49:41 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/3] staging: r8188eu: make _netdev_open() static
Date: Sun, 11 Sep 2022 19:49:31 +0200
Message-Id: <20220911174933.3784-2-straube.linux@gmail.com>
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

The function _netdev_open() is only used in os_intfs.c.
Make it static.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/recv_osdep.h | 1 -
 drivers/staging/r8188eu/os_dep/os_intfs.c    | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/include/recv_osdep.h b/drivers/staging/r8188eu/include/recv_osdep.h
index d88fd6058a62..c01943f4f845 100644
--- a/drivers/staging/r8188eu/include/recv_osdep.h
+++ b/drivers/staging/r8188eu/include/recv_osdep.h
@@ -16,7 +16,6 @@ void rtw_recv_returnpacket(struct  net_device *cnxt, struct sk_buff *retpkt);
 int rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *padapter);
 void rtw_free_recv_priv(struct recv_priv *precvpriv);
 
-int _netdev_open(struct net_device *pnetdev);
 int netdev_open(struct net_device *pnetdev);
 int netdev_close(struct net_device *pnetdev);
 
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index dd4e6aac3509..55bfca779b7d 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -617,7 +617,7 @@ void netdev_br_init(struct net_device *netdev)
 	rcu_read_unlock();
 }
 
-int _netdev_open(struct net_device *pnetdev)
+static int _netdev_open(struct net_device *pnetdev)
 {
 	uint status;
 	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(pnetdev);
-- 
2.37.3

