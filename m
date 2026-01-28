Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9367720C48A
	for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 00:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769560826; cv=none; b=bFhfIlYMLjcV9JL2jarOBOLwop55lQj35H1Ys1kAh8nUY3UuBwijUrb+7gJTMHAQQ+RCrvyY47PUjXiZZdBZRxF9UhqTQqnb5kaguG73u9zmRoZzhtPrlw81AsS32uK91p5sHIVJ+0YgnYdSz6RrmkgWYBml5wzWNbajC1TMTAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769560826; c=relaxed/simple;
	bh=pg10IFD9xW4anBBGevy8oZPn/7DCCR1KJZFtMDvNYt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bqb0VHf0N6n3YZv+KBzykZJIOfE+XxoWh6cs/talTDwr0+Y/kFg7sVaTNY7n1l7POtjFlMsRW5QSZpXQg+uNKKIU7TZ+2QT/62aoL71MTxsLNRSJ9agk0KHHaoxbNG/RH8teiQffsrQxFsbiuH62PkcCoXw6XglLf/Ibgp4Jdow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O8oFilmc; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O8oFilmc"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-78fba1a1b1eso6527657b3.1
        for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 16:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769560824; x=1770165624; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rrjnifs8RsgxO4B9HiFkAzePPs7gTMNCcLwx6At5eJ8=;
        b=O8oFilmc+K5QjA6b+7R0XelUVRR7e1WAROCB+DFNno/W8qzZsbod8TKRxwjK4FHh7t
         7iWQmrGVm1PhYWRIuI81VGAdYtFDrSeB91dlOhjVNnHCfEOA3ccgccv0QDk8wLnHQfyi
         EVND7TTTv3A4FqrWsUTeerKNA4kq4DBhOQAceybKm6Q8mlkdTSQOPN9iFk/zMMoVLbxY
         n8s7pj2L6QpVu1Hq3uYAaSa6cjnaj4+OgjqiZNj8qqhHjknx5LH1Keurr6hSDZSynklv
         uAnsVkdjXo+1U5uJGba0oEWqvgceGIFf/i5V1nCnKqWsG9wVdAMAJoMCf/UppjGZfgIA
         GEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769560825; x=1770165625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rrjnifs8RsgxO4B9HiFkAzePPs7gTMNCcLwx6At5eJ8=;
        b=r87bX9JThq3TsrXIrMdIpcTC/TiWokw45W9C9eGkzmKDe41RrueH2JuQkh3MA3j+GR
         yFaGRCvujG0w0RTd4C1sEDA2gt+dQZ/Hxi3yKh8zOLv6n3UUBWrff6QHCY6XkSxHKy6Y
         qwYifGnWgF2qYBSFMbswTbMm5BkVB48ocFHTdjnOPt78ZwX9pYPaHlf15vicHVf6X2wz
         /AcGgvZgQbFKqyJ8+cOniA/UeO7MAprUGcB94m3kFDtWxemVQ/kmJ9gXHx4SEwlr0V+k
         s6EH24me68/81VwTqScOQHCdNPALTv8ZK5fwdgU3NfdsmX7Ui3Enk0Y2AfMdNHfHpL6y
         z5og==
X-Forwarded-Encrypted: i=1; AJvYcCWX9fsuHgJ7ww9tKU542bvLN4hLEFXDSZgljTDN/TAtY8T4SlTqmEfIJV54YKVHhQM33CZhWcUB7pinGqdU@lists.linux.dev
X-Gm-Message-State: AOJu0YywW/HrcoFIWywg2Mo3929dA59L8Cf80U3mNePkpdXTiSOLMRLU
	aNUfP1e3UpLJC3CRAjkMFJj82i/96HlUNLkVf5sfOYNWAQgOHbUbTxgJBAZVnA==
X-Gm-Gg: AZuq6aIATPk+M0t48N6qnUi6UBav0Z33f1VNDAA1h4ewC5et/IZZk2BK7XO5xsSOrsb
	3cibcceC7+LfEqH6iIDFpkPtfKJ67916tf9nIPeth/+lhLiwvXUsHVBPsAT/27orv6nlW0cvlJ0
	g6xr+CnfDgrDJ93+owTbYdWvTkmc6bdYUvqcDhaSHCR0WHmDqH0wWwIe+jIDC72xf3BJcIHXHCv
	zcaFYNhED1iwYDpwChbQrv6POhLvrIZ/6dDYm3Je/YwW3AN/052ghL4LF9FSPk7LL1ansXTL+hI
	V1HkZK+bRrnJFuUtzqO4VmpaU1u59GQ+xn38m9xxt6GIMie5SRYV0KTN4H7adA+e0dtNtngwPGu
	epDgTpq2ymIGp9b3yZEAjv/oDVbb/2wrHaAYnAT6rxsW/ZM+v2LyZ19FFAJumyWVtgZCm1veCjo
	vrnQ==
X-Received: by 2002:a05:690c:7308:b0:78c:2c2a:fc53 with SMTP id 00721157ae682-7947ac18466mr29150807b3.15.1769560824588;
        Tue, 27 Jan 2026 16:40:24 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-794827625d3sm4791867b3.11.2026.01.27.16.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 16:40:24 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH v2 1/4] staging: rtl8723bs: remove dead RX info reset logic
Date: Tue, 27 Jan 2026 18:40:05 -0600
Message-ID: <20260128004009.51095-2-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128004009.51095-1-ethantidmore06@gmail.com>
References: <20260128004009.51095-1-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function rtw_reset_rx_info() and its associated counters in
struct debug_priv are used to track AMPDU and management frame
statistics that are never read by the driver.

Remove the unused function, the write-only struct members, and the
now-unused pdbgpriv/psdpriv pointers in rtw_free_assoc_resources()
to clean up the MLME code

Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index f81a29cd6a78..411339ebab7e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -819,15 +819,6 @@ static void free_scanqueue(struct	mlme_priv *pmlmepriv)
 	spin_unlock_bh(&scan_queue->lock);
 }
 
-static void rtw_reset_rx_info(struct debug_priv *pdbgpriv)
-{
-	pdbgpriv->dbg_rx_ampdu_drop_count = 0;
-	pdbgpriv->dbg_rx_ampdu_forced_indicate_count = 0;
-	pdbgpriv->dbg_rx_ampdu_loss_count = 0;
-	pdbgpriv->dbg_rx_dup_mgt_frame_drop_count = 0;
-	pdbgpriv->dbg_rx_ampdu_window_shift_cnt = 0;
-}
-
 static void find_network(struct adapter *adapter)
 {
 	struct wlan_network *pwlan = NULL;
@@ -848,8 +839,6 @@ void rtw_free_assoc_resources(struct adapter *adapter, int lock_scanned_queue)
 {
 	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
 	struct wlan_network *tgt_network = &pmlmepriv->cur_network;
-	struct dvobj_priv *psdpriv = adapter->dvobj;
-	struct debug_priv *pdbgpriv = &psdpriv->drv_dbg;
 
 	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE | WIFI_AP_STATE)) {
 		struct sta_info *psta;
@@ -874,7 +863,6 @@ void rtw_free_assoc_resources(struct adapter *adapter, int lock_scanned_queue)
 	if (lock_scanned_queue)
 		adapter->securitypriv.key_mask = 0;
 
-	rtw_reset_rx_info(pdbgpriv);
 }
 
 /* rtw_indicate_connect: the caller has to lock pmlmepriv->lock */
-- 
2.52.0

