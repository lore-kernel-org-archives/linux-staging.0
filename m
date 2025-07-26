Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA4421C16A
	for <linux-staging@lists.linux.dev>; Sat, 26 Jul 2025 04:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753504445; cv=none; b=H8iMFail62WqsictAmzQR90PkezatDAJC/uC0GlGcxhRO2MY8K3bk11NQJdzPm4KFlX+0rMOxbGwx67tRDdHiQQ/KscTFRGbcu+5RpcS0ZmH7UXzyVjJz1W+G46TjSUbpk518XMp9Jr7Ba7d/y8VXeTlaAaAXeFvaeRWbECMvZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753504445; c=relaxed/simple;
	bh=bM0Vvx92cKEQOLfqkhukRo406X8XLDfUAl5uTTOBuYs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g6H2Qv7wPstaIG0CJ7IBOB8uH+diQcHMeOCMIsuMf2aaS85HBEM0LBdfYhWp+wnO8NuYX7/zPQFJ08MHZNuA8qa76L/n7EigQwCoW9x1R9wszwF5xZCfOpXUsiIcEplsCsUvW2/l/eJPYJv4+qA9Wml5aoVIZib80/72eEj7Vww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LYcvAeNA; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LYcvAeNA"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7e32c95778aso138632385a.3
        for <linux-staging@lists.linux.dev>; Fri, 25 Jul 2025 21:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753504442; x=1754109242; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFyIKyxFfSvkenjutTa3WXgF+K78uS/6Wm5w41WWk5k=;
        b=LYcvAeNA+yVAAZtsa949jYwDZd0Vr80d3BIMYS+ddiMdzm1C6afRkk+7LGsckCxvF/
         FdvQYeqskcirKGe9OV85ORKG2cPbcW/ZjH0++jfpJKtgHoA8sHcndeMokUI4juL93fy6
         e1SDWGB51HoyfSAtMO9/SqrfwVw6FkNq39xy4I85bKEKEaUybAJDRnnhNqGNK8MrhnDn
         hy8I4gJPVfd3pY7pfj/s/EOgdYyg7BpN36Q1IHk+M/L33uGbHBRJDl6i+LikWf5bPGjl
         tQ5E4g6Ez81kyD8XCV3BoQkJMvSCAG6KnYHJL1Vob9hJEY/OxnvTDREZIl5ONeOIPpLa
         dUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753504442; x=1754109242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AFyIKyxFfSvkenjutTa3WXgF+K78uS/6Wm5w41WWk5k=;
        b=lyoeb2H0yPmz3CJK1+G/mWMPL6DpJtby83oz7+UZRM5ih97mIw/DpAMaf4qdtTx3BV
         AP97hhD/Qgcq7oWoJ5Hhvoiew3kzBSgDUKgCPUS0MOGpK52riO84KQOtylYFKgcan9iL
         AcLTQXh3XZDq3Ob4HMMpPRukrkN9zNMcQ2jC/r4wtLtZC6fH3Rgk8c6h5kK/fpClka5f
         h0fGUTVCJ1/Yk6WRe2ll5McD+dEuGocdURV0dtoGVh5mxNillUaWFpYdfbOvwseXvp14
         YBn4hTTM1CT9AKMoE17JY2VuG2YCA5cOaH6ARD5Kj+YhGGIQqCjCCm+8nbTOWuA0qaXi
         50DA==
X-Gm-Message-State: AOJu0YyGRumnbtkLuJ7mwp3973u5b0MzinX6vOtG0YNxG8FmyOlzivBw
	VIQgd7DTIK3Fh6tv2SiVnmm7X+/rLRQwSgH7cnHZomyx51jzsDa/puOJ
X-Gm-Gg: ASbGnctd/iXnNEoTiU6/ppctX44rVI+259M4n11lF45ScLO9uUJv/L9ScrqdJcKb12o
	wbnpDTr4oM8xUaXzTQjTRxQ/RbtM+YvnAGImaWfmC9a1+laF6VXT7whMFy0Idrq1lpTCBJUr4Pg
	TDQMMQLtPaS1kHvjwxzZodE5XdXeNH9yJeF+ftJTmQSkaLucDZ1dySwaS8BMlVGjg+zI9tMtxsV
	DsFicGZz7r4ZnDLv45jUQMYy6twSIbMzI+u4gJfMTKiXtifTZA87zsksQ+gyKyqKUa3dG2mApbY
	1wCfzpx7E5yzTKlsZmqA7RsdrSOfsH7ANgodBkPDOjQVrq6lUfRDCOx7K/WIstgOWgHJhkZofiE
	jAxDN3mp6lLnO28+sZc6JcxXpLY6iY3ZaQpNPNryDd4hyvsXo6XI=
X-Google-Smtp-Source: AGHT+IFpFHZe0lJfxuzoFTC3VS+z3g4wsWyK4qBicXrUgk9/6HYdXvu+ijC0mv83e++I4g7KoxuBsw==
X-Received: by 2002:a05:620a:2552:b0:7e3:426d:f45f with SMTP id af79cd13be357-7e63bfb09b8mr357945985a.34.1753504442457;
        Fri, 25 Jul 2025 21:34:02 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e6432a885asm70322185a.36.2025.07.25.21.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 21:34:02 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH 15/20] staging: rtl8723bs: remove unnecessary braces for single statement blocks
Date: Sat, 26 Jul 2025 04:32:13 +0000
Message-Id: <20250726043218.386738-16-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250726043218.386738-1-vivek.balachandhar@gmail.com>
References: <20250726043218.386738-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed braces from conditional blocks that contain only a single statement,
as per Linux kernel coding style guidelines. This enhances code clarity
and reduces visual clutter.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index d845eaecd615..fb7ab7eceb54 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -487,9 +487,8 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 			break;
 		}
 
-		if (rtw_roam_flags(adapter)) {
+		if (rtw_roam_flags(adapter))
 			/* TODO: don't select network in the same ess as oldest if it's new enough*/
-		}
 
 		if (!oldest || time_after(oldest->last_scanned, pnetwork->last_scanned))
 			oldest = pnetwork;
@@ -2415,9 +2414,8 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
 	len = 0;
 	p = rtw_get_ie(pie + sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_OPERATION, &len,
 		       ie_len - sizeof(struct ndis_802_11_fix_ie));
-	if (p && len > 0) {
+	if (p && len > 0)
 		/* todo: */
-	}
 
 	if ((pregistrypriv->bw_mode & 0x0f) > 0)
 		cbw40_enable = 1;
-- 
2.39.5

