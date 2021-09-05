Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1763FC0
	for <linux-staging@lists.linux.dev>; Sun,  5 Sep 2021 20:42:21 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id i28so7747801ljm.7
        for <linux-staging@lists.linux.dev>; Sun, 05 Sep 2021 13:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7sHgNwoOa9//VFt2qH71qaB4nY0YqNgFxnvDIKi9n7A=;
        b=ewz96NKaP0huTasPQ+6dlHcI+kGp/c+PQbklf9XQ8n23FwKVAVteMg0/Obqlz3q38K
         mmdq5T7vTz+tEa85vpuQTgH8V9d0QAO5/ayY6P0or+hjJivVYlwMMZjYOEBEyjBk/lde
         Ts/fPxRZ9nhZmY6DXjkjAZoeWcIz5JNeCGlzdjCk+vgFl/bzlNAYneTVuK36BRUiDPr2
         oCOiEvfCx2mcGQpmyEZpivNKYAipyK2IKOqV/6SxkeypSGU95mDIFujjyQYKhjfFPrY8
         6slDThKBy8EfKAMZ6YIvj6SSd49ltmdXu6Z1f3GcDRJT732F3tB2va+JqUHpKLxSMTlN
         d3EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7sHgNwoOa9//VFt2qH71qaB4nY0YqNgFxnvDIKi9n7A=;
        b=WmFki+r1nHVMpECs2593SX56UL1u89Wf892rhRHAspkUPiBp2j9xK7eQ2995qqkNKm
         9SsYgXGrwjltg3yLQQ+uGbeJcHq4LqSTvoQTFsi4UZBKuG7g6PU1Ha38yR8PRV9bCCi5
         GTTWR4emQgS7tYAEs3zCkyaCNhSJS5Q+Mgt7CLCAKWsj6GcBO/rhagc50pO7bohOX2go
         Sv7Y2tR4iG0dvkATZ0AgaB7l/yHjdUofC4XM/hG84DJlSar0nloXvF9R2MDjQ7YSN0Vq
         DohIpY5OuUTwfRsBXk+4IJk+82lOSQh4gaShSF1vQds0lxoJQMv0TgSZs4vMCcEF7V+G
         YKIA==
X-Gm-Message-State: AOAM531iBaNZTLz4uQE1fBKXQPAGOwNi6HWJYfiIKr1IyzGwL8F734Lf
	bWniUBmAopbJ79HJZKlilHY=
X-Google-Smtp-Source: ABdhPJz/qdW1J7jjebgPt5QJ5gpHlQrlz0UYgMQ+DxeRzTDU5SjvS2I6qR8QELzL0a9z7YaKLrZoJg==
X-Received: by 2002:a2e:a809:: with SMTP id l9mr7934205ljq.147.1630874539904;
        Sun, 05 Sep 2021 13:42:19 -0700 (PDT)
Received: from localhost.localdomain ([46.235.67.70])
        by smtp.gmail.com with ESMTPSA id y9sm774633ljm.5.2021.09.05.13.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 13:42:19 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	straube.linux@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH] staging: r8188eu: remove useless check
Date: Sun,  5 Sep 2021 23:42:18 +0300
Message-Id: <20210905204218.19317-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

smatch says:
usb_intf.c:326 rtw_hw_suspend() warn: variable dereferenced before check 'padapter' (see line 323)
usb_intf.c:387 rtw_hw_resume() warn: variable dereferenced before check 'padapter' (see line 385)

There is only one caller of rtw_hw_suspend() and it does not check
padapter pointer, so let's just omit this check to make smatch happy.

Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/staging/r8188eu/os_dep/usb_intf.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index bb85ab77fd26..42a375e7345c 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -322,9 +322,6 @@ int rtw_hw_suspend(struct adapter *padapter)
 	struct pwrctrl_priv *pwrpriv = &padapter->pwrctrlpriv;
 	struct net_device *pnetdev = padapter->pnetdev;
 
-
-	if (!padapter)
-		goto error_exit;
 	if ((!padapter->bup) || (padapter->bDriverStopped) ||
 	    (padapter->bSurpriseRemoved)) {
 		DBG_88E("padapter->bup=%d bDriverStopped=%d bSurpriseRemoved = %d\n",
-- 
2.33.0

