Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC45287247
	for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 22:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769554085; cv=none; b=rby8vZGxClTJNo+ME3ng9PEbp5IBxXvzG1ttKUxAXH9wohVMVan2LA6iqTXw8ptU4mEFGEiL8gTBTkA7ptzP8XD9azC1PhplIlVVXNIsdod4W5n5S1rwUbNBjX6MZmSmKN8XccVvKEbPGVOJ1V7TQCl6tOkiQLRc0fHXgZ7fBxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769554085; c=relaxed/simple;
	bh=tL/wQ3w50xZUcCVSNUiUlEs+YdKe8EgtJihMrXX7ylQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HWDwp6iNcQlEe0LQ+q7/LwpIxIYzDQNXIGk2NaQ46vsHXJ0/qPVZ2KqvSJrsF8YodYonaY5SktSwqJ53ZO44LiPQYI/KfXiZmRsqaOz1Mml/XB++B/aoMcTvx4qiakkctwPRk3JFd4uAsmUXtkXDgXXks8wzkdrPEj41YzNA9u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J9Nv/AwL; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J9Nv/AwL"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-649605d3664so4695623d50.3
        for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 14:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769554083; x=1770158883; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MCz5fhHGNzoQjNWokMKF0CEanvAxqViLRBCIm5sjxKU=;
        b=J9Nv/AwLxWziElGMQ1nzgg1o11pZ3Of0l7UFSuoJ4miaZVtLrdqze3hLQELNoTT0GA
         XdDd7xIdF136/x9dtzEhhIWOu+5U9mu1ckgx9bG7Wgrcm7tI474lhDvFwaLoWuk8K6FJ
         mCauqRzmf+BwFej5N20VeIlVv2kIfyiJ4lWdiGc3JudxUpog8kRo7nwaTsiEyT6bisIV
         MYnKYtrNaXLmgzy5EyJp/7N7rFNsTWtKYljiz3Z1qvslXGdYxqgJFplboIAKQoRa6Jtf
         wKOvcsU2gPgdXNxPhHY8tBx4W9XQcFM06/ajgWzTlkttTMf47KuIwSWUElFVAxzuV/d6
         HJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769554083; x=1770158883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MCz5fhHGNzoQjNWokMKF0CEanvAxqViLRBCIm5sjxKU=;
        b=mmuoBF5HOkdqoHf2VotQe/Pv5jnfbo9/p/DBEQ0qY8J/dzfLEZhrzkcRPdWzwg1lNh
         yB3w/zM3bsORntZBZJL2t+7Kd35DGGCxO2jFSKOTO2NCD9QTrmQA7FLmTzCwJKVogp2y
         7yOvZ+5BqXig8/a+ZzuC0ieZB5BzpZN7ldP7u/S/ed3Wn1zfMMRF4Kunqnrz88223EBv
         NwQOhXHdY9gddn8pPV5M49EfctNhafuLzk5eaPyzJF5nq5PB6RYCE67hpw7mofajgDPw
         2XkaVnUKJWv3QRCow9v0cKjmuzay9tAP6PXPBre9txxnni19bhslwfdDcwN5nbtahs3m
         CamQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyuZtRls8nafev93j+IoUiGN/SiuxIqNSy/2dQp7sbGxqHmu8HrrrVd4vHnhdyBh4O0U0GQehKjG10idTg@lists.linux.dev
X-Gm-Message-State: AOJu0YxPrwD76NHoEuTq6wiq/+A+BYNhOITI4Dmna1H3+iZc49AgNpe2
	zpTYCM/Ua6l7obcjh3YAgS7LXkDRDwnWJmX5GvDaq3xCyPDHiRgmLzMU
X-Gm-Gg: AZuq6aJV+Ogl+YoDeKzFs61yP4JicQAWzhUCI6VC9BTMWgCeAMcfdma6x+P1RVQ3j1r
	SC/Jj8B2p42W5UMJbIk/AjOGAlGDM3zy4/fY6XqvROE/9zVNPjwls7S3wBDE6B75jFv3QgRo7MT
	Po1r9Tm1byTaryFrv8Sg+nSlBMwmtBsM2QhEfpRH861u+K/f5yWuxT0t/OOcv4MsnWQF9FheLvD
	k/ABugNJs/+8UWrxSDVie6fqYWKNoZVNp63eXBPn2uSG4Kr3FJHjmP/yjW5jhHuks657eRWabiZ
	m20EOdAfNeHKyrO36L0ERrfgLy7KIQsPNbcL6fFNEgGTDVWRMxHb6l2u/P4QO/YdrtpgOloCz7b
	RHbI0RfPsn8lama+vvYih8YVpUQxPQHYoXL1GKri5jXZpt82k9Dp06Yrtq49V00USMoVM0+kQ4W
	NliA==
X-Received: by 2002:a05:690e:130c:b0:649:49ff:3a45 with SMTP id 956f58d0204a3-6498fbf9b64mr2467236d50.38.1769554083496;
        Tue, 27 Jan 2026 14:48:03 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649960788bbsm55250d50.9.2026.01.27.14.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 14:48:03 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH v1 2/3] staging: rtl8723bs: remove dead RX sequence logic
Date: Tue, 27 Jan 2026 16:47:37 -0600
Message-ID: <20260127224747.40305-3-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127224747.40305-1-ethantidmore06@gmail.com>
References: <20260127224747.40305-1-ethantidmore06@gmail.com>
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

