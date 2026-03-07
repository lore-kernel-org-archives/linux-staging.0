Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9704C92
	for <linux-staging@lists.linux.dev>; Sat,  7 Mar 2026 16:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772899308; cv=none; b=ivAtpUhpYwIZRap380Q9lyU+HFtWaSZ9fiBZnmN6k20kJlENa2+XYBPQYPkcxJmUfl4O5qyp88Fj0Ay0rF+qhzCQOhjOCF0wh1KBhfCDGIcZgUJqR2oSIAxgPmLp3WTMPsonMrPYN0qVpnmJtU28i8K1thUwSkeJHMD2Qq7UmBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772899308; c=relaxed/simple;
	bh=f2Y2mMnspDIpFL2fyRkLONK035NzlGH0ak0+3fN2+14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZQGM8Yv9EPKm06p814ALUIp7yEPgMe0ig+81lO1DcCXQCXH2gSXIpPrsiBTsCUANXB+aN3hJmvl8jg/IyFBXxJQn4dd4NO5ouAG5htA4/R4AEKJYeRLIjBd7QNn4rsoc2qPojyq4p36dNr/XrAcDXeD7DlGCFH299HPQvEv5rJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kXEi5oSG; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kXEi5oSG"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64c9a6d68e5so7672185d50.3
        for <linux-staging@lists.linux.dev>; Sat, 07 Mar 2026 08:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772899307; x=1773504107; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0m43vgrrs6hdW1TjvW00AttfkJcpoTGrur5sX+xvwI=;
        b=kXEi5oSGVIiJzum8Kozom+0pWXlqp/sd8BiwdrSHmikedE3ecIXBiZmYSJaVLGUCZN
         g5g19jFklLOzWd85YcYztDQbKkyDBHg946vCQZArp4bLFlVl+0810Ckbjvcf6yFkRYa6
         sP9cqV2wbLzUi++w0QurDKG/0mWz2jGn1kAiNxJRxhPf4vh7xRdBQwiVsrlFKpBe5vJZ
         dEwrTshE43IKfbum3QVaBn+o9SoqjZYDmdL5dw7fLclOf1jYC5CZQm2PenYfpB2J6IXL
         seOtbT/xHbG8e62gl/yvQAJUpPN+Zv+iOpGSwlav5HsKzv3smwEgW49M2TuZG1pC+wUN
         dr0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772899307; x=1773504107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/0m43vgrrs6hdW1TjvW00AttfkJcpoTGrur5sX+xvwI=;
        b=pGUsM7OfTVCK9YWQGHzRb7HbYAciwESQj1kDDEsPRWkFfSioujPWlGnmKHpQlC/nuj
         +vD3c9Mxx+wcu6mXo5T/a4532xjWu/sq/hGH4f+JPkljxwY5u6oMzSchLzKLIhRLO+wr
         8+euMH+Xtr/oplkL0eQhIaCKbM+U2VyyC/KuT5tzxAsIw7zjeSLRFwlicpDgPq5lH5kp
         sg++gZlXuKtCP5Tfzi8dOy/1RgHD2PmcZkf2iQUk6sxVOG0giHOG0G9tCqPdQbm/O3Mq
         CMP2TSLVI7vRTNHzaRLbGi/Vp1Zdkv6pFJ4K7hW34T0BP5Eyjh7qhGcq7RjMbee2fXi8
         5uQA==
X-Gm-Message-State: AOJu0YziJPwQyrGseQYfgUbZVp4emMmtREy8URNvVMu+ClvaHpwQQ3aV
	nvJfMvGEYOW92tQxmYUbxPTNRZQ+qN5KUQcxKFhdn5Co9LxzYpPeFDAh
X-Gm-Gg: ATEYQzyekic8PHbRJ7xOchZWhRyGNoBs5PUuWK1Q8EukphdKPDW/4beCAdlnowu2Wl5
	F2nVCYAVdauotIm1S56rH3em/alKarqoLxj90v04KUcDE2O8dzEERLxR+4eRcIZuoGp7pprCyzj
	F/9EdSY9LC7/Qk58O2cDWk4Kiv3Q8DKc0F6bRvaVbUHx0hHi/eNFaaIsQdEqlBsX7ov02vdxIpf
	XJg78oU9EnCugDswyy5WqoOwaIOjhDcIfiUJlm3Iy12fEmEktNEIBX+d3M1+OihKsqmc7OaL+9R
	fJxWoe1FXpfmjPW/kAYn1jNoXDPJybWbImSRYx31yWn/7fD+UmnQkRu+Z2aU6IWvKm9TXY9bfQ5
	bOom1A4QVshTB8wNdSzaI3oZHYCC0/bZbqPMSylu+Av5myZWlbqHXBrTwZRYrxQNI4UqIP0cemu
	HqB9suOrohkQ9Uvc8xhRqVyExq
X-Received: by 2002:a05:690e:4466:b0:64c:a2f7:b497 with SMTP id 956f58d0204a3-64d14280f48mr4387912d50.50.1772899306396;
        Sat, 07 Mar 2026 08:01:46 -0800 (PST)
Received: from archlinux ([185.140.162.146])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64d175d2f31sm2232160d50.5.2026.03.07.08.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 08:01:46 -0800 (PST)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	ethantidmore06@gmail.com,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 3/4] staging: rtl8723bs: replace rtw_is_desired_network() return type to bool
Date: Sat,  7 Mar 2026 18:58:32 +0300
Message-ID: <20260307160024.18039-4-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260307160024.18039-1-nikolayof23@gmail.com>
References: <20260307160024.18039-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_is_desired_network() used only in rtw_mlme.c file and
always return 'true' or 'false', so it's type can be replaced
with 'static bool'.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 3f8ccedbd85f..a8ca69260ae7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -591,15 +591,14 @@ void rtw_add_network(struct adapter *adapter, struct wlan_bssid_ex *pnetwork)
  * (4) HT
  * (5) others
  */
-int rtw_is_desired_network(struct adapter *adapter, struct wlan_network *pnetwork);
-int rtw_is_desired_network(struct adapter *adapter, struct wlan_network *pnetwork)
+static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network *pnetwork)
 {
 	struct security_priv *psecuritypriv = &adapter->securitypriv;
 	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
 	u32 desired_encmode;
 	u32 privacy;
 	uint wps_ielen;
-	int bselected = true;
+	bool bselected = true;
 
 	desired_encmode = psecuritypriv->ndisencryptstatus;
 	privacy = pnetwork->network.privacy;
-- 
2.53.0

