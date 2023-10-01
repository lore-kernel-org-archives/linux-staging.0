Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F175D17724
	for <linux-staging@lists.linux.dev>; Sun,  1 Oct 2023 13:45:10 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3233799e7b8so1544555f8f.0
        for <linux-staging@lists.linux.dev>; Sun, 01 Oct 2023 06:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696167909; x=1696772709; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+SB15LjBo6aILGXM+nVMfGuTrZhkGA5r6PNyI0UWDI=;
        b=SYq55xUW/eKr1pYExhNGJAPj9q9T1mJRWsS2BWTCLe8+dk1UkwlSlTKEqUmHxofqv9
         XMTfyzLaTj+LvHai+RnkrzTzt9yZ3DpXQ14AOvsoT/JjerCLKbpDGIV0c591HdJO80FR
         BEeI7VMn+COaLqtmcu2odeboQ1UbyeHMj7kfVm9BPZ4Y5c4E47w9halSe9cIZqYNBMEJ
         VNwPUcZHAFBNKG/Nvjtz0lA2xX9W+hyzGxXNL94jqUwyES8OLwnKsS/eQEqpXCbRJhuq
         xY07QyyJF84j7ruBul5+p9P8aktWlvv67YYFXaNm8VfZSqRfhCkEM8LkHuIWujB0P9P7
         Q0HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696167909; x=1696772709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+SB15LjBo6aILGXM+nVMfGuTrZhkGA5r6PNyI0UWDI=;
        b=F9Ki7jgRDzBHffvyKFsCLW5QSvisPD4vJ2q1LK8Uvn5Yx1v0v7SgmipxPKh7t+p47K
         kPdiflTlOQSu4SysGyE+lEdNaL6ilZ52F1VMahAXuiq0WRlaDWtPpDaLAqCXLK7vbZmN
         wdNV3PyhyaTapdOm85JAXPA+dde89WNVdZbo5TxMDKR12Ci/nAy9MDChSuygeX4HFXXi
         0DkkLqy5+GmOwsqDDJyEaoaDUFEi4lSFV0UO2nAipU150GB+0Em/vY779y4cqokHO8/A
         mWy1Bnlc8FSmeuRnE8y4xZniRRboklFHuBxOn+NTHAXvCHGmeW9lACqBK9YspdraR6YP
         iWPw==
X-Gm-Message-State: AOJu0Yx7/VC3zwCqPqZTqMubFwzM8z2nURcsFPKyuzNN6wkZ1FlWY86a
	m11uBfj8/g/M51jM1PQ1tjZBs+9POpo=
X-Google-Smtp-Source: AGHT+IHFqni/ARgFFk2kkfNXSK4L4Jqc3PQeph4iWUAVQ0S82xK5l5NBfqntOWP0BKc6i3q71NwFpA==
X-Received: by 2002:adf:dd91:0:b0:317:3da0:7606 with SMTP id x17-20020adfdd91000000b003173da07606mr7784635wrl.4.1696167909191;
        Sun, 01 Oct 2023 06:45:09 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id t21-20020a170906179500b00988e953a586sm15516694eje.61.2023.10.01.06.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 06:45:08 -0700 (PDT)
Date: Sun, 1 Oct 2023 15:45:07 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 08/11] staging: rtl8192e: Remove unused parameter from
 _rtl92e_up()
Message-ID: <24f221c44beae8e6fbf895f82fe04b082f8679d5.1696165351.git.philipp.g.hortmann@gmail.com>
References: <cover.1696165351.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1696165351.git.philipp.g.hortmann@gmail.com>

Remove unused parameter is_silent_reset from _rtl92e_up().

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 94a73f9cf888..2b91c481df93 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -61,7 +61,7 @@ static short _rtl92e_pci_initdescring(struct net_device *dev);
 static void _rtl92e_irq_tx_tasklet(struct tasklet_struct *t);
 static void _rtl92e_irq_rx_tasklet(struct tasklet_struct *t);
 static void _rtl92e_cancel_deferred_work(struct r8192_priv *priv);
-static int _rtl92e_up(struct net_device *dev, bool is_silent_reset);
+static int _rtl92e_up(struct net_device *dev);
 static int _rtl92e_try_up(struct net_device *dev);
 static int _rtl92e_down(struct net_device *dev, bool shutdownrf);
 static void _rtl92e_restart(void *data);
@@ -1707,7 +1707,7 @@ static void _rtl92e_cancel_deferred_work(struct r8192_priv *priv)
 	cancel_work_sync(&priv->qos_activate);
 }
 
-static int _rtl92e_up(struct net_device *dev, bool is_silent_reset)
+static int _rtl92e_up(struct net_device *dev)
 {
 	if (_rtl92e_sta_up(dev) == -1)
 		return -1;
@@ -1731,7 +1731,7 @@ static int _rtl92e_try_up(struct net_device *dev)
 
 	if (priv->up == 1)
 		return -1;
-	return _rtl92e_up(dev, false);
+	return _rtl92e_up(dev);
 }
 
 static int _rtl92e_close(struct net_device *dev)
@@ -1770,7 +1770,7 @@ void rtl92e_commit(struct net_device *dev)
 	rtllib_softmac_stop_protocol(priv->rtllib, 0, true);
 	rtl92e_irq_disable(dev);
 	rtl92e_stop_adapter(dev, true);
-	_rtl92e_up(dev, false);
+	_rtl92e_up(dev);
 }
 
 static void _rtl92e_restart(void *data)
-- 
2.42.0

