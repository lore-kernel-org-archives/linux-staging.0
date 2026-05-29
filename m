Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC5F3A8FE6
	for <linux-staging@lists.linux.dev>; Fri, 29 May 2026 09:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780048797; cv=none; b=oy+JHeZK8/c0ew6fAe0BoBjKVUftckRLYDhw09SLuyyllr7q1TM+sjnDpMfmFg9498EgZVlEW43zYnEB92bRgXkW+VBmYNMcg2YomcTzUZg2NYEJpWVZsQ3FAghJSyJlWYJeIgj/mDDAuHKqmTaQDHJzqtLsg02MN2VPW4JBWd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780048797; c=relaxed/simple;
	bh=2PYenwL8g65DOYD+noR4eYtjTtWCW7gKCJr3QW2FLpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d9hvBAh37nK2P72692vf9FZTngyKZtG5mTNC5CmArejBbstpTEtxGLEw7GgYjfac5QhyoXGOWfPG56nT9MbCjR7gD+13DiQo6G0pnKiGDkBETzQUq4iWXUwHlP9p23N2pSDPkwVNyaQ+q2hGKLwE3sXR1aRy1Mv2DgdrkFdzW38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oOYzuaQz; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oOYzuaQz"
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-bd4f8260e4eso2406819266b.1
        for <linux-staging@lists.linux.dev>; Fri, 29 May 2026 02:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780048793; x=1780653593; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lIqTQtpqXeuF8qRuB5nhDhgEQ11lbarGGqMRZu2XLaY=;
        b=oOYzuaQzqsZQMoCNuylcpsQTb/85+0t3mkuam1UoiOZZ0ENDQbnd856Ei5l/qEBAx1
         gWKou4NBfYqi7TXtgQ/Hm95EK9glZiFpNxDDfuRlQO/h1CEI/hnp+l8orgJOFl57OwSW
         zB6nQcUQkzoX/axSAsN6y6vbFKLbPrB2RACBhqEw3s37HbbktMGGDWpRyHAkaq7jqm25
         vperz/oOYlsqFA3LBfTmNivl3f5ezwDXq//kh5CVcZyI1FAi91E/e6vS02o9UNp+fVkx
         O81CznCMCUHbImrRX03t8NkuCzKc1/TWpEBC/sB4V/vAwNMqI6qbHJUyUXd/DY1yRwyO
         /u6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780048793; x=1780653593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lIqTQtpqXeuF8qRuB5nhDhgEQ11lbarGGqMRZu2XLaY=;
        b=KDxe6ZgvSN+UcOjku8iB3l1WcH4aQbAaUAuxB81hkLV2AzS1yn+cORzZfcPq8Ht8K1
         uTGYTKfra0hGqgkjdLTZTY8lk7V2e3opp/5wKob9myH7or1exE+hbtgMgcbNhmHACUJD
         SNdf+wCQLDoVGaN8kE9s5YY3Xqfd2nD66g0cpIAFh6pBz7pCYx+9bIWZ+B3RarWIS6LP
         IJauk+A2RmeTmrjIwLJRI7AVme2sPokXNI4ItwcZ1Ne8bL6ydwWqHb+eLZ8qG6v+qIrL
         Btw8hU5iDRLxrKdT9if69JW7XozWNCH5WCpY5omoHTDYDeEv5K8yeRBBVEry4VeQsUYj
         b9LA==
X-Gm-Message-State: AOJu0YylcpV6nIcuzm0SEy7wzXq2T814dB4Dlamqd8A4qLBec1x6VfTN
	Hte1ZskFMylDvprE6wnSppi+N4KkTvyGkKSBvnit7b5As92NR83c+uQ=
X-Gm-Gg: Acq92OHZJN0TNVTDwIXxUZBRZ6WYMpAKHfQgh7GGweCciYBsY5WTwIGeU1nJXYocbPS
	EQ2OsvDJbSVGcAonXYdxmZiW51O06tla8bVZpi9iPO//dwPPWsn3CpNXK3y+uH0aUidQmEi8gkc
	PwMgrheWs/ODn2V2WjiFBwLVA/Vq5Yuhgbydbc5mqnjm9VHOYJHCmQbj6mTdipR2NyHtqsLvpD3
	Y1R8reEFfW7l2uzkE7FbaOch4eqJGZ3CoZPkNz2xQxJRRQvVgmccfeWT3Iu7ryrA/TxFapgLF2O
	BXr6NFd4uoPiMIxyFot1eJ3eTZH+W4CR4a7Hl+8smIjzkzgReoBXUVK0oq6jHjMhdty1dp2EV6q
	UXF5NjMCwLlJ7Epozjb7cGm/e+uesSkvryFjwxHsxWuDPp178GTBs06gpeS50LUi5bQr+Sut7td
	2VD7FNugFdpat7YY4LINp44PISHyXo91pnqBEIjKNe2Wd/WHR1yvlblWpU6Nw=
X-Received: by 2002:a17:906:9c8d:b0:bd5:7c2:7621 with SMTP id a640c23a62f3a-be9ccd7c53emr114543366b.48.1780048792852;
        Fri, 29 May 2026 02:59:52 -0700 (PDT)
Received: from archlinux.itotolink.net ([217.196.163.117])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-be9d2de53dasm52479366b.14.2026.05.29.02.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 02:59:52 -0700 (PDT)
From: Vitaliy Slivinskiy <phant0m.mail2023@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	Vitaliy Slivinskiy <phant0m.mail2023@gmail.com>
Subject: [PATCH v2 3/3] staging: rtl8723bs: clean up blank lines and function formatting
Date: Fri, 29 May 2026 12:55:03 +0300
Message-ID: <20260529095503.130909-4-phant0m.mail2023@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529095503.130909-1-phant0m.mail2023@gmail.com>
References: <20260529095503.130909-1-phant0m.mail2023@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl checks regarding multiple blank lines, missing blank lines after functions, and function declarations ending with an open parenthesis.

Signed-off-by: Vitaliy Slivinskiy <phant0m.mail2023@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index 9d936b834..06f1b2ff0 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -48,7 +48,6 @@ static void sd_sync_int_hdl(struct sdio_func *func)
 {
 	struct dvobj_priv *psdpriv;
 
-
 	psdpriv = sdio_get_drvdata(func);
 
 	if (!psdpriv->if1)
@@ -151,6 +150,7 @@ static void sdio_deinit(struct dvobj_priv *dvobj)
 		sdio_release_host(func);
 	}
 }
+
 static struct dvobj_priv *sdio_dvobj_init(struct sdio_func *func)
 {
 	struct dvobj_priv *dvobj = NULL;
@@ -214,8 +214,7 @@ static void sd_intf_stop(struct adapter *padapter)
 	rtw_sdio_disable_interrupt(padapter);
 }
 
-
-static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct sdio_device_id  *pdid)
+static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct sdio_device_id *pdid)
 {
 	int status = _FAIL;
 	struct net_device *pnetdev;
@@ -248,7 +247,6 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
 	/* 4 3.1 set hardware operation functions */
 	rtw_set_hal_ops(padapter);
 
-
 	/* 3 5. initialize Chip version */
 	padapter->intf_start = &sd_intf_start;
 	padapter->intf_stop = &sd_intf_stop;
@@ -334,9 +332,7 @@ static void rtw_sdio_if1_deinit(struct adapter *if1)
  * notes: drv_init() is called when the bus driver has located a card for us to support.
  *        We accept the new device by returning 0.
  */
-static int rtw_drv_init(
-	struct sdio_func *func,
-	const struct sdio_device_id *id)
+static int rtw_drv_init(struct sdio_func *func, const struct sdio_device_id *id)
 {
 	int status = _FAIL;
 	struct adapter *if1 = NULL;
-- 
2.53.0

