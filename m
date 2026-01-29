Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B452131355C
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 14:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769698602; cv=none; b=I8Fr/JinozQQIISfxONOORaYFs/AkQbG79S/CQmsE49NJa3rESdaVDIaO/u479VkCeB/GutZe/EGH1zgCUI1UgzRsbhqx0H2ywQT9p8elHM+QiRzbJpnj0bjR0PHMqJIb67j7L23xHJKTF6DiFZmuNQd7RJLmzzgiHHCmbbR6Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769698602; c=relaxed/simple;
	bh=uYLqiKrJcbQ0bQ4nWC14D7KZmnxEM4ZpY+74Yf4zxvo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KOT4v6jZNysw/yUleofKJSvKRrQgyutvWqrRofiieuTPqE76ei+kSRMvjzq2gaZsDWhUeoFWVTb9JtP2MIU0RevMvULcvW5YdQCAR1G+OzR/hpec7fHA+MKeqKInpo8Lo5NqzBw/bLd3dCLr1BXgzZjwwCxIIKz6Gk1H64Ox0cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P/wWeqJZ; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P/wWeqJZ"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-34c7d0c5ddaso810846a91.0
        for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 06:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769698598; x=1770303398; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q0J9gWDpo8IUW6loKuQgPj6hU/wWPMIGMCmn1iFBlAI=;
        b=P/wWeqJZ+I+Lc0GaKDCoXrvTqj8auURDT+Sk9RsyttpEfixJleb9JZK9SMNRoTLhKe
         auEQcLcmwX4kuS9vpndtnq8BoZx4kuxnSrkfwpKqG6Qwr54RvPKtshHuJiJNTGAvp5NX
         FzWs2Pt/1fVkpA5xjIGRRu6zTO6ftt+NeTsobMqSvQJIbiGJKVsFcEz7Rj4pA58R28OM
         CayeKj5Pfl4L3U665mTFerhcjIFprgwwPsAAtVQsKxtiRmgF/tfYzi4cs5eAK8MRt7lz
         0sDy0Qgd/28MsIQutQxtIgjq+TmP5zIbOsaOHMlEgwXNICGYRAZpQryAC+kjccYs9l0Q
         7tAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769698598; x=1770303398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0J9gWDpo8IUW6loKuQgPj6hU/wWPMIGMCmn1iFBlAI=;
        b=F8gArLh0yqHrMDjHNTm/T5fQ61IMadgNr+3Q165HiN/rzV2Yx/Dz30P0zZgAqVb0OV
         hpJxI/Xat3W3PK08XsoHA3bDqi1+H9e2l2QbPuPxGEBg7QCcIRNFbpuM3bEUAnhXIcA0
         rlovGljF2owfjPZLnk9NAjXJd5lQ+s/o3CWxyz56vJH9dKFCMpuZezC3/QWZmR1q+8rm
         criEOCEWXAyVmxxosJ/Xc/czCOQpFOuIYu7IJ1DY8APJXCrRzYT4xmJx0txQvsaluQju
         gcDcu1cRLG859/x9AkcRWe6Xrw+bJiaBk3mO3z69R4GTW7tzN/1tehtBWcmzotEatXyP
         JmcQ==
X-Gm-Message-State: AOJu0YzxLZNMbxpxo6fj7jGb7KC6GpqU6lDS0GHVIOlptBi1SzqW+soz
	/YYzsAYlr1W427YRXqvNIxBwiF5F6fbxnE0HNYe9h+AevT25FlzYSZMu
X-Gm-Gg: AZuq6aLLhOsCqoNq18WMtl8BiK2bKyKWlcV7wowtgjXtUDjWzZF34c9JK4eJtgMoFge
	EwgfdowUaxO1/B3ys4dATA6ycNCs+b2W/zBiGkpj3bDD3Vzwtp1uDqvpkzfhcCt/k2I2JnsvS4G
	moYvMfU0F2Dyop2JzD3U1Ncz9ns6Tj4nKEVPKe8aHWaHvzi6teyFI6xiCz7iXiQIVJNUXKGsL//
	zzDSXBk8Xx4RZ6emq8UAoUJ1wI4vHGqXOWVqre3YKwiWBQKDzHsvme2NjT+5hIhjNOcW+iLr0Pq
	/Bc+YFW854eaudx5yOKMqZBs4zUvAtgONit7JbCKoow84XavZhQQH4Yh36OsKOHPkx92qt7r0lz
	/cerFGYdXjMNvB83kpMYMV1XLJd1MQPsddi+zDo5W7m+zaOJrkJ6m1UsMZb5dfRYpeEe4398VIU
	QfxdJ7m+h4PlSQkTF27BoJ3OJYJFfSPcYQ
X-Received: by 2002:a17:90b:3c10:b0:353:2972:74a4 with SMTP id 98e67ed59e1d1-35429af8f7amr2594573a91.13.1769698597724;
        Thu, 29 Jan 2026 06:56:37 -0800 (PST)
Received: from madrajiblab.localdomain ([122.177.241.85])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3542dbccac6sm435904a91.0.2026.01.29.06.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 06:56:37 -0800 (PST)
From: Madhab Sharma <madhabsharma94@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Madhab Sharma <madhabsharma94@gmail.com>
Subject: [PATCH] staging: rtl8723bs: use usleep_range over msleep for short delays
Date: Thu, 29 Jan 2026 14:56:25 +0000
Message-ID: <20260129145625.17918-1-madhabsharma94@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

msleep() is not suitable for short delays. Use usleep_range()
to avoid excessive sleep time.

Signed-off-by: Madhab Sharma <madhabsharma94@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 21690857f..6a8b57564 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -128,7 +128,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 		/* Tx buf allocation may fail sometimes, so sleep and retry. */
 		res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ), true);
 		if (res == _FAIL) {
-			msleep(10);
+			usleep_range(10000, 11000);
 			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ), true);
 			if (res == _FAIL)
 				goto exit;
-- 
2.43.0

