Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E095445014
	for <linux-staging@lists.linux.dev>; Wed, 15 May 2024 04:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715748765; cv=none; b=r9TOPIj09TOYzKyiDIOo3KhYCouD79EYpKlgosJ5PgEqoqTDJ3/Wr57RqeRu/RodYQZdui42yGAZ7jKSfOQTFMMVuVNCxJbYfkDi6/8mQDzXMJNpYo+qNhgAhfpoaxruhdDD2JJc4d+wrQTZWaaoFtN/QM9GLEi5NZSj4Ybe2E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715748765; c=relaxed/simple;
	bh=DmObfZNzwdYgt04bsxgzsoK/GbrzelmZCNjUcQcSOcA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YvRjYySMHA7q3gt9mHV3UsA7hIn31ofg7XGe/FgJMO66kVXaJPwK5RrmCN3ds777gQDtFIl9GZr1YIh8flUQU49/mopdtQo2R4JnOdoJn5MpliVBm420Oyd8XdsG5PuOuT/lg543WZKNfQOUYC1Ptz80JN9YL3aNIrtGyiNYelA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=K84DPUKb; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="K84DPUKb"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6f4603237e0so4475934b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 14 May 2024 21:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1715748763; x=1716353563; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cyl0QsC5Ap3g+wagqtAYIpo5rRqxsaw1p1+//Gi2eH8=;
        b=K84DPUKbys1BuY0N80jeC/hg1iw/Ne79xlPRM83dg1iaFeR10k5kDlE66VxR7juoM2
         q5dVHzy9Ao3fAhmRwJB9f7+q3YDDvIct0htfWf1Dgo65KZPqAWTsQ3TgxgkLeY9i/zR+
         rSzordBcgP7yLRYQVC2Spn4ya7raRc57AYOytldRYs4HdElEFGnMHl5KrCr+kCjJbxNb
         EAQxgm79iJfm1Zp6hqG7UDRAR2sCeQ6t76YHx3+cSyhQNdbXJ3UhL4VT4yx0K2OPIsGB
         meFMaSG1ei+wvInsRxAq5tWMAWkU+uIhKmYJCinpxFeM/3qEQbN+RKIGsvipoYkE5w3I
         eA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715748763; x=1716353563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cyl0QsC5Ap3g+wagqtAYIpo5rRqxsaw1p1+//Gi2eH8=;
        b=wyVavcMcOKMQQGRqdXE4GBCPHAlqSC8PXbHAixRi2HTnEMs8eDaDXKdnIer3mZh4At
         MlNcKXzOzPr37ApIJ7nrK19VcdpStfUJMjd+i3Eyf+0kwNbu5MXzNI79hm1FaCDanl7d
         MxZqDflxho+cp/hYag2EL/OvjisTd5G4R/nrbo2s+OuIu58F3RcBkC8UNYaXlGk15GSm
         VXG/wMtqaxxDS32dulLEM8j1Z0D2Nh4GeQ9GDsgvRCSJYfT7r7PW7HHn5jL7iaeAKd2p
         V7DuoXdsvr+E4Uc2V9boBmVm/aKZ5c2VSuvKDUx+N6GUWd1X0Wjr3sH6vmaI4kyB/vLA
         YfHA==
X-Gm-Message-State: AOJu0YwSXx2/fAMn8LD+G4v5inKN8uhb5awXGmyMd3AjUQ6jQvd5RwYi
	LsXcneuZuhQCx+ul081Uz9PN9okxF4i4ds/RnLIK4ZX8QWNQgVB4Gm5IH/wU1YZbxtGi+h6FeZN
	I
X-Google-Smtp-Source: AGHT+IEsbfwWMrJu0U0a4gTnEe47UNpTiErx0Pirv7+nv+dGZhrMoATrgi71M6lulaQqn9azCX2O2A==
X-Received: by 2002:a05:6a00:9288:b0:6f4:b54b:e4fe with SMTP id d2e1a72fcca58-6f4c908aee4mr28858539b3a.2.1715748763181;
        Tue, 14 May 2024 21:52:43 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a827fdsm10135035b3a.60.2024.05.14.21.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 21:52:42 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 12/31] Staging: rtl8192e: Rename variable RxReorderIndicatePacket
Date: Tue, 14 May 2024 21:52:09 -0700
Message-Id: <20240515045228.35928-13-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240515045228.35928-1-tdavies@darkphysics.net>
References: <20240515045228.35928-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable RxReorderIndicatePacket to
rx_reorder_indicate_packet to fix checkpatch warning
Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 24136bba64b6..a30945f30e14 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -520,7 +520,7 @@ void rtllib_flush_rx_ts_pending_pkts(struct rtllib_device *ieee,
 	ts->rx_indicate_seq = 0xffff;
 }
 
-static void RxReorderIndicatePacket(struct rtllib_device *ieee,
+static void rx_reorder_indicate_packet(struct rtllib_device *ieee,
 				    struct rtllib_rxb *prxb,
 				    struct rx_ts_record *ts, u16 SeqNum)
 {
@@ -1366,7 +1366,7 @@ static int rtllib_rx_infra_adhoc(struct rtllib_device *ieee, struct sk_buff *skb
 	if (!ieee->ht_info->cur_rx_reorder_enable || !ts)
 		rtllib_rx_indicate_pkt_legacy(ieee, rx_stats, rxb, dst, src);
 	else
-		RxReorderIndicatePacket(ieee, rxb, ts, SeqNum);
+		rx_reorder_indicate_packet(ieee, rxb, ts, SeqNum);
 
 	dev_kfree_skb(skb);
 
-- 
2.30.2

