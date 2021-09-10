Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737EC3FC3
	for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 18:31:32 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id n18so1696571plp.7
        for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 11:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=+yaW+MnHcAMiT6v5gmW51Vj6i+pKWcS5CVSB30Jf6AI=;
        b=nakKVtF10W5ZLh3ZQuvaFCrOERBll0sHW6txMBWA06B7ZQLjT9cTYD7VBaN2nk6/Bp
         m56C1nCb4DHZC1jYAFTn/HQnkyua7GvceZ1L2i/fExbirhQNXxH+dgZbWQ6hrY0xr8C5
         XhNjVwHjBgqXt3QOrl6lcmlIETgNyOmbHTMb+iY+0qyo+gdiYUEE+Z+5iyDv43CV+8xo
         Mt5mfOTTNcp0HbOhp9YJKAh7L+RzmnJ0uJ8tJp5zsfcNgIls/GM2ioNTQt7/g6STi5nB
         duMHcjLmA0PEDow1bmDnGWgasXBrPqzpSkoR5GOsKGkACg9MMfXrRr3liWJspzHnU8Xf
         mq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=+yaW+MnHcAMiT6v5gmW51Vj6i+pKWcS5CVSB30Jf6AI=;
        b=AKSnNr2KHRl0knAttLt7fpOiKrQGsMEg9em9WyyVCvLbi65JRTh6raXxznStLktFSr
         0BQi2oIW348TzoJOhWnd/gYbieatFBjEbn66Pjd8Vh7tdJYF7Fg3m+vFt7/9Uzz6ZHVh
         Rp0RWy2QUr9K4zqGGgnjI+0AI/ofsLQTel1691E+FxHiJ0JbFtuVrkaayRa9PbZXlhw2
         mphU4KuoFWWiEu5OL82aZ69C4YSoObT64iu1rPYup1cf/wiUTrbu+sX6pkMK9mZEmEkV
         6XeOssyidHDBO3IotwXxUOuwO+We/NhmuhJFQlQehA8RuJ3o7Q/juUh4ebyx4dmIrODa
         5nVQ==
X-Gm-Message-State: AOAM532uVO4PD2aDF6RemDJllD8zBa5ART2JbvaN2MVKaNlGy+zyxEvd
	TqI0xcmjJ8xZ0c3zCn+Pva0=
X-Google-Smtp-Source: ABdhPJzngmOnd6/YIM7th9A+yrTjtDG3Q1DFpNjaxxRMcYhRh/QqqTq+6WCkCDz8IdHMYAc7G4cp8A==
X-Received: by 2002:a17:902:b20e:b029:12b:fd6f:44c3 with SMTP id t14-20020a170902b20eb029012bfd6f44c3mr8977203plr.36.1631298691801;
        Fri, 10 Sep 2021 11:31:31 -0700 (PDT)
Received: from user ([117.98.200.228])
        by smtp.gmail.com with ESMTPSA id y126sm5839794pfy.88.2021.09.10.11.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 11:31:31 -0700 (PDT)
Date: Sat, 11 Sep 2021 00:01:25 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, straube.linux@gmail.com,
	fmdefrancesco@gmail.com, paskripkin@gmail.com,
	saurav.girepunje@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: r8188eu: core: remove unused variable padapter
Message-ID: <YTukfSY0CxowGXlQ@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unused variable padapter from mp_init_xmit_attrib().

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mp.c b/drivers/staging/r8188eu/core/rtw_mp.c
index dabdd0406f30..8ac23d2112fb 100644
--- a/drivers/staging/r8188eu/core/rtw_mp.c
+++ b/drivers/staging/r8188eu/core/rtw_mp.c
@@ -75,7 +75,7 @@ static void _init_mp_priv_(struct mp_priv *pmp_priv)
 	memcpy(pnetwork->Ssid.Ssid, "mp_871x", pnetwork->Ssid.SsidLength);
 }

-static void mp_init_xmit_attrib(struct mp_tx *pmptx, struct adapter *padapter)
+static void mp_init_xmit_attrib(struct mp_tx *pmptx)
 {
 	struct pkt_attrib *pattrib;
 	struct tx_desc *desc;
@@ -107,7 +107,7 @@ s32 init_mp_priv(struct adapter *padapter)
 	pmppriv->papdater = padapter;

 	pmppriv->tx.stop = 1;
-	mp_init_xmit_attrib(&pmppriv->tx, padapter);
+	mp_init_xmit_attrib(&pmppriv->tx);

 	switch (padapter->registrypriv.rf_config) {
 	case RF_1T1R:
--
2.32.0

