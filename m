Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CD32135B8
	for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 00:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769560828; cv=none; b=Nv6BpZep90JcITA1hCHufdBoOSCAD6jHAKU5G2faU6q51kQgVRCyrH84DISf472nXfwkvk8eZXTFV+o55EMDBjw4ZVmQfFzBFpsHCJrP2+MLvkQkIqxyjNA15T/tq5t4YCYZgRmP4zaqvmrqyWw9o4y0BBakKtJpwb+kOJvKaSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769560828; c=relaxed/simple;
	bh=tL/wQ3w50xZUcCVSNUiUlEs+YdKe8EgtJihMrXX7ylQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ssANUurL850LFGRh3E6fbX4FqbvpTpn4WkwgPtkMDAIV2duVbBY+vAqaNcmp+VGnMWc8l6MZI7klAwRRH2LrXf2hAShQ+YPCW86vTLKmc4OOloB5zIRZ0oB53WSJgm/ySB4nugEs6/fujKErH4hbbRAocNNRogbVmDNmDL01CAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SVFxU0TX; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVFxU0TX"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7947ad38d75so13044237b3.3
        for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 16:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769560826; x=1770165626; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MCz5fhHGNzoQjNWokMKF0CEanvAxqViLRBCIm5sjxKU=;
        b=SVFxU0TXjBprUblK/9DreWMI+7JLN4smYaCTB5ALr15mKUxnrpdeWEI+ConKUXKzeg
         gMdGspLGvlwCNwws5/305y6Ch/r+AXbx3clnEg1xKCvIOKIbkMQh9e7U/SGzK+XqjRf8
         MPQ2TRubW0x69/2xdI1w8FN0A26XCyzaNpXQRjCCDMjoPvSyaKcJvXoD2Net4EUA0uP2
         VBmldiKqeDPCVIZ+j+Q7mdiZEN5O52oo+w9kJP73Bsjg4sfB4CgosRPpGfKeRv0BCiNN
         kAL8DRqFbfqaqw2oidvaeYQv0C46sifn1MNc5f8Lj4suN4t5eiGJy0p1Ag3U9p0iJpD2
         R4QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769560826; x=1770165626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MCz5fhHGNzoQjNWokMKF0CEanvAxqViLRBCIm5sjxKU=;
        b=Xu+sLocSVjDawxlPW7LhsPg8dpR/Q0lPKDFi7bUFG6bzDH+mIKMH7rOrbRoy+MZn76
         xgwcp7jpVZCyMIKx8xT+1bmhHJx6P4A5TzE8U+EBPTnX/OL9llTvwnam7UfKbUZ2fyI0
         gXn5vMJiemwhTXRuuxzid+30MO7eA2e5YHDwlkKeL2UkEUT4FcnMqma0aO1Ap0TQNWpg
         iuwsr/0Jq9TMxR0oAUxTFWCSx6+C2nmdhCwzGgx490DQK1U8PDsvKbe95ByNP6JdueNg
         Ht0TK0scJ4IpkKoxzehMiaUrlpoKpIJnEW7RGsw86q+bscvIbyGnhzDeDS7fHYnmOI2a
         vrmw==
X-Forwarded-Encrypted: i=1; AJvYcCVW+n/bTNkDRkkcLlzIRvSuZ3ziD8d4MeBXSTxaTiThDoRPAcBohMhLJtpil1qOMOWtvifY2FphAOI8dvad@lists.linux.dev
X-Gm-Message-State: AOJu0YxwjmgPLFKLSlJDhKViKAYiaoDTk1ICk+1bWAlXJaAi1ZshSLaK
	MfPmcLtFBqnmRcTPOFzEu8Y4bsNBbqEAVL/N/Js20tyv1Yo6cBQmxCO1
X-Gm-Gg: AZuq6aLCtLs+6dLs8xW+5sCFtRa/gjMejUSXhck9sV9cirV3hg9ERUTAMoebgNsW7/K
	x5VQwLrqXJzdDYz+HonRDf8xmas+gCZUppST5PRLDmIw8rR20DFOS+cS7VZ/bDLxlr4Rgq/I9Ny
	kQIPlcze4ZuYb7GQFRo9B515IXKsGSz5w17NvMoWWbXXj1SffFsOirrcibzxVFdRm1oPEBUWfn5
	rNLSBY8yzMDLqAj12gBQODdnR/3wyNGSxuGdHW65HvXLV2Dke/jxR+JUjBm3WwQ5I4uJJNBU/X6
	v/WoQAhKB/usNRNVJ1e4rPGhnHAZa40Rx2hbOloRbyHV7lB1Zsv+8cHhDagFx0cGegloVLJ8CTy
	Kl3slhaCXWsQ5158dOJKRTZ+TCUzdj2V7bQg5fIrQAgDKUo6pn3exTqL9L7IGUwhf7dc=
X-Received: by 2002:a05:690c:e3c7:b0:794:1ab3:3e6f with SMTP id 00721157ae682-7947ab71beamr27954627b3.31.1769560826001;
        Tue, 27 Jan 2026 16:40:26 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-794827625d3sm4791867b3.11.2026.01.27.16.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 16:40:25 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH v2 3/4] staging: rtl8723bs: remove dead RX sequence logic
Date: Tue, 27 Jan 2026 18:40:07 -0600
Message-ID: <20260128004009.51095-4-ethantidmore06@gmail.com>
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

The function recv_indicatepkts_pkt_loss_cnt() is used to calculate
values for dbg_rx_ampdu_loss_count, but this variable is never
used anywhere in the driver.

Remove the function and its call site.

Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 24cc4a9e0445..cc824427f9a8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1861,15 +1861,6 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
 
 }
 
-static void recv_indicatepkts_pkt_loss_cnt(struct debug_priv *pdbgpriv, u64 prev_seq, u64 current_seq)
-{
-	if (current_seq < prev_seq)
-		pdbgpriv->dbg_rx_ampdu_loss_count += (4096 + current_seq - prev_seq);
-	else
-		pdbgpriv->dbg_rx_ampdu_loss_count += (current_seq - prev_seq);
-
-}
-
 static int rtw_recv_indicatepkt(struct adapter *padapter, union recv_frame *precv_frame)
 {
 	struct recv_priv *precvpriv;
@@ -1937,7 +1928,6 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor
 		prframe = (union recv_frame *)plist;
 		pattrib = &prframe->u.hdr.attrib;
 
-		recv_indicatepkts_pkt_loss_cnt(pdbgpriv, preorder_ctrl->indicate_seq, pattrib->seq_num);
 		preorder_ctrl->indicate_seq = pattrib->seq_num;
 
 	}
-- 
2.52.0

