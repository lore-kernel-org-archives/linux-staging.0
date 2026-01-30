Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC5A314D13
	for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 06:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769754604; cv=none; b=DXfdjVEt4u3NLpn4sTwYYLjzw41bAzr6zNMZTykvt6dL1TYUI1jf/KIio1ySrE2ZXc9Zoa6z8DE6f1RhTpqw1Ocm0uB7wXv7O5hbKA1nHHx9Ig5J9IuBCOfS0Q9do74vJSa20jNloXH/OzflewYe+5HfW9t9mkH8c/4w4I+rNOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769754604; c=relaxed/simple;
	bh=luKg2rPccXkMSm2DXOG4nKyRbpN7n5zUL/FPEr5ON2A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SwNyKrCrqJX63klQivf8vjuaGqmH1hE4S7fRzE2EEEpQumbBV9FMc4YYoatOGi4rJ/7I//bIdoqsaASjES5F2ID1dF80aLskzofDZ8TBqSKfyudMfr66d2B/TyM8D71IEnK+HQVO0s+McvE44dgG+yBdDgsU9qAoSm42XN8uDBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/xjzz/r; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/xjzz/r"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-bc274b8b15bso1086397a12.1
        for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 22:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769754602; x=1770359402; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J/4+1PVcQhbj6w16OFbfJbHh4sy2KCb0pvSfpYkTV8k=;
        b=A/xjzz/rk9yZfOm/3loK2qXLAJYUdCzbzrU4X8Lld4sFSUh/lX6DrssvJqP5aKG/53
         oCbicpAwTKNvLSrrUUMBeKDMLDrUPtRjpAOd+cXBgdaOgfstJh+Ifjw16f39c0XGpAPt
         Lph+5O/BIJr7uX5nX5QSPLSbadRgFyd34uPiv6Rdhi/gb2RAaSxWGZfSiK0VPkyaaxTS
         VNLVSg0AsMtWc2vc9NXU2AC7DG9BgZpGcNgiwYImqgeJafEAq9qY3o/ScLcCKtEHClax
         w71HXEDLTIi+ktjBsvK1f1pTUM2I92dN3wjgP8WtBzwFdNLfb2sDn6Y7l05+loT/Ja0a
         cs8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769754602; x=1770359402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/4+1PVcQhbj6w16OFbfJbHh4sy2KCb0pvSfpYkTV8k=;
        b=R3XPeW7b7crGtMvZTiUZJsSNXmbVTcBsNH7rnOtv6PWeYk7bkJlnv+gQxWa+pePTP6
         yUkbWtpR6UghlS0dmkl+If/JVeUcgNzHoHqpTF6aKivkPDqtyOFk2Nxp7Y8AFS91+aei
         qnfApHkDvE0NJs8i/ehuO1ukCFShJh9/QL+445SpyT4buQezDDpwxzyWKpRoyph0GRfk
         ba4lbCnssRjG4owHRw5h5BWkhE5J+j+qNPTj8HROjHgBa+rDoKCqG/zHcLROOoCfJmNq
         9LmFx3f8e5p3GrEu6l5ZV8itHL0MdZmk1hpy9jRxWSBx3JJwSa/w6v9iOHNkXeUFM771
         rwnw==
X-Gm-Message-State: AOJu0YxYV+8O7INVaU3b5vamrDaGOfg6/MXQojiGAeEQMuiGFQsfowz6
	4C+ZvkmLl6r4J4HqFMd/t+c/OQXvGhgKn0Sm3AxBt3BhcG9NujZm6sZ2
X-Gm-Gg: AZuq6aLVMlS87zq2Cs91ADBUHmcsZkQ14FidQIdWbSeLeswHdMT89jtZVnH2IapRgnT
	p5t8SQz+qB7cN4ylRX674hamHwOOid9klABJf0e5TWNBnmHYD4KP2wvn5ZqR4HZ+NnwCNuzRNuU
	gwpr+9DLjoHMgLigmPMdqPkTcqQTxRZJ7JbY6rVVVACd7k5L6zkEX5B6CHRoe381h0ejsrOi34O
	tAvbY1CJENfbWDas+dznYLj72j4aUS8icIe0SR0C8Z7VVZZ6IylTyWQMyPrFJoM6R+YOLAL2Se9
	Lcj5D6hhpgrSGsfyRg7EKDvO7HT2lUEvP2R+0wSNCUdo7eYoZSSe1HCJqu7WJTHJPD+NlFEFYFd
	cqf9pB8aFqxSuUe5EW+LzPybhe16L/M+g7yjSGJwMYawyUkhxduSAGWcfUu0hp1SqYt8WnEMP7c
	h+9qylhacXNJ1AGpB5Lw==
X-Received: by 2002:a05:6a21:9d91:b0:38d:fde5:24af with SMTP id adf61e73a8af0-392e016ebcbmr1710627637.64.1769754602353;
        Thu, 29 Jan 2026 22:30:02 -0800 (PST)
Received: from HPVictus15 ([2401:4900:1cb2:d02b:4761:c62a:859e:e20e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379b1bc68sm7212814b3a.2.2026.01.29.22.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 22:30:02 -0800 (PST)
From: SAJJA EASWAR SAI <eshwarsajja20@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	eshwarsajja20@gmail.com
Subject: [PATCH] staging: rtw_mlme_ext: remove hardcoded dead debug code
Date: Fri, 30 Jan 2026 11:59:56 +0530
Message-ID: <20260130062956.858992-1-eshwarsajja20@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The debug code is guarded by a constant false condition and is
never executed. Remove it to simplify the code.

No functional change.

Signed-off-by: SAJJA EASWAR SAI <eshwarsajja20@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index ac49bfbaa..4e43c8756 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1865,15 +1865,6 @@ unsigned int OnAction_sa_query(struct adapter *padapter, union recv_frame *precv
 	default:
 		break;
 	}
-	if (0) {
-		int pp;
-
-		netdev_dbg(padapter->pnetdev, "pattrib->pktlen = %d =>", pattrib->pkt_len);
-		for (pp = 0; pp < pattrib->pkt_len; pp++)
-			pr_cont(" %02x ", pframe[pp]);
-		pr_cont("\n");
-	}
-
 	return _SUCCESS;
 }
 
-- 
2.52.0

