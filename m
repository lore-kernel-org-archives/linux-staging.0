Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3A924113D
	for <linux-staging@lists.linux.dev>; Sat, 27 Dec 2025 11:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766835248; cv=none; b=M/SKbC+U08J0/ad8gzOh/W2fkGiiAhYmT+4ZNJkP4jVCS43s5xKoxmATgGUpji0QcCI0yLp0lNNpS52Xvzhj1KhKLTHLg1LWF1ixD/u2Bl0xyM5Su6f9EljpGAvwJXdtcXgy2Ax55bw3QYKQstlLu1h9J0K9dZphQS1fHwM8MTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766835248; c=relaxed/simple;
	bh=IbETXDuuCJUAhe39/dgny2zVW9vK0dT/ZG3WkpVVfxE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=scucEP3Vxuz/BB87CR0e6Ob5vNtOCegL/EtkdDE9yhVyaoyD5iR7AwblCeTKH+S5NcZkg996KrDAuZFYvCA0yggo+yA/gtHE4SYIdorHpOEwVF+gW4D7gufaw9UyLl3IX9XGSvJi1TTr+WWHFrcnS9UCoc6vHVFrjXru8KflDnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lmb7nzqH; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmb7nzqH"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7b8eff36e3bso12440722b3a.2
        for <linux-staging@lists.linux.dev>; Sat, 27 Dec 2025 03:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766835246; x=1767440046; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sl10PyASTrPvts2CGD791OiWHhRS9HrDmSZd1Cd9MuA=;
        b=lmb7nzqHh/0St9Mh2OhZ3rC15/1xV3QPshpQoGe9A0fq3x4QoXg4sh/KB8QuQ8woqc
         +WqcW2kIjGX8dMgwUYloFlP7UeQRzO6hB0fNxb0LLoRHr/i9U19iNsKLpNydxtK8WMcd
         w6J9uDv94XEQWdohImqs9qQPJSk8IOTD53y6gO+VVvaNZIIpkQZNNcV5u7vu8ZxIgvAG
         kXSj8ZpDtNBNcrekyhVtCYoGoGLafmTJlIdU1E35Sp89dB5MSCQ54lflrforbQimNaHl
         LUeetH1zv93lfAfCFq7ywR93suFKI1Z0wRbJbWJdw7IhXxhNWu3cJOnSf15VOGMUx0dl
         404w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766835246; x=1767440046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sl10PyASTrPvts2CGD791OiWHhRS9HrDmSZd1Cd9MuA=;
        b=h1UWECwqcFaZAps0gQOSHQcXZLP95B5E/++7lBdmIPEebQ1qI3Gsq5UO7XUPx8taqQ
         sin4/2nHaebGRRoI6kdu3WyTdnpRReNHB00iifTp8E8zuVpzUX2TOzi9ePFg8zVRswaA
         lqqPx2BkuVQ+BPgwWQe4IQhYDtzKjTq5RNnrPOFx/OuQMblPV+Aif3NeCWWU/BdB72eb
         +/ag3z4u1Ca1xJZk7pDd6PrCW3jIz36fU6teqeVIkoJ5RlGeP9H6QK0ghvloiW6EgarN
         Izgt6e7RWtTKPegUS9Devc0RPdsbTEWtVFFij18ihWFE9StqjNstLR+7jRYRoE3LRh2c
         WZ4w==
X-Gm-Message-State: AOJu0YzxlKcMTl1g4wV+7yYHXFwHm2qtyN6sg9uMEOCPmqAw+ikeFjB+
	/tEQ5aWnnIC9ixvfFr4Tp52gndmOB/EWDgLKjXWWfO01OzxyYY0JRLCzsGnhvg==
X-Gm-Gg: AY/fxX7TXySz6vEYZY3efunJFhiiDX1FjloBpKIrCZ25wAcksYGTP+SPnXboutCSxHD
	UZ3lYqeS3SfrN2HqUG9wrasb5hDsM2Vh9UPf+OYsAiFEMjnoX4X+L0wqh2dsqnIF79BKh0MCony
	LAYvSjUmBIDovtlZtWsxzljTrQGJ7HUyogE9YTl0U6qgazg4Xx6MDaNvKgFqBzIDMcvZ3CGUJL/
	3wW7QhiXMwAPEtnt8YyUpcnSDFm23L/aXdLGPry2/LKmQtN89hF62ZZODO1xP3oEBhlIX8psbS/
	QmaLI0jmVWu4/AuJkKRW6YpKtXi4fCrQF72qxSPJ8Jfi/Hq2TABHLRD+suWHtatrmxRyw5ZBOYM
	JdZYaNgMkYrwLhv78IynO/Pz9E4LQvn42BPo2FYc9SrWxFw0lzJZsuFxChP6UNASrcag1sQErae
	ouwGX0bPON6tB/l7VMEd3V5A==
X-Google-Smtp-Source: AGHT+IG8n+CGndJluKrsW7TOzwprYZpSjV8sCb6MR+wsZbDK7EqUsswEX9DbCxLyZs8gTvaKvCHRfw==
X-Received: by 2002:a05:6a00:ac08:b0:7e8:450c:618c with SMTP id d2e1a72fcca58-7ff664814e0mr24628746b3a.35.1766835244713;
        Sat, 27 Dec 2025 03:34:04 -0800 (PST)
Received: from karthik.. ([43.247.159.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7ae354easm24434239b3a.16.2025.12.27.03.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 03:34:04 -0800 (PST)
From: Karthikey D Kadati <karthikey3608@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey D Kadati <karthikey3608@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix missing transmission lock in rtw_xmit
Date: Sat, 27 Dec 2025 17:03:48 +0530
Message-ID: <20251227113348.26272-1-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The packet transmission path in rtw_xmit.c contained TODO comments
indicating a missing lock. This patch implements spin_lock_bh and
spin_unlock_bh around the station attribute update section.

This prevents a potential race condition where station security and
PHY information could be modified on another CPU core during
transmission. The use of _bh variants ensures safety in bottom-half
contexts common in network transmit paths.

Verified that psta is NULL-checked prior to acquisition and that no
double-unlocks occur on the exit path.

Signed-off-by: Karthikey D Kadati <karthikey3608@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 21690857f..5f11afb63 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -715,8 +715,9 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	if (!(psta->state & _FW_LINKED))
 		return _FAIL;
 
-	/* TODO:_lock */
+	spin_lock_bh(&psta->lock);
 	if (update_attrib_sec_info(padapter, pattrib, psta) == _FAIL) {
+		spin_unlock_bh(&psta->lock);
 		res = _FAIL;
 		goto exit;
 	}
@@ -724,7 +725,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	update_attrib_phy_info(padapter, pattrib, psta);
 
 	pattrib->psta = psta;
-	/* TODO:_unlock */
+	spin_unlock_bh(&psta->lock);
 
 	pattrib->pctrl = 0;
 
-- 
2.43.0

