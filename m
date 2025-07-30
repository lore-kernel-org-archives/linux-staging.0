Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8FF290BB0
	for <linux-staging@lists.linux.dev>; Wed, 30 Jul 2025 10:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753872314; cv=none; b=DTaox2GYnyGt2Z5oGIXRaw0kHG6IA4XuFtPnOLjB3EuOzNIOHhevihiq7qSJTnpCs33Z9YD66V5t5j3F1QXEvTp990A8xN/pnyqVjxQ+VGQJJ1Mm0d+Bo9vySjNc1Af3HO3dXhD4w6unhauW1NL5Rj+JIC8u2BO4+uMEigPlxx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753872314; c=relaxed/simple;
	bh=8qVfwXrBqCmLZDZqxF4HwJyyC4wmuBrsGi+vbFP9NzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MWbiQCPJRTC31ODW7uB9MhgmGb3D3uhWoyvBnOl5KIQ6dEFhrBzLeG0ghw9E9PV6QimPQSEe4VyN88Azp685HNJPP1YyOdrVEh/fKGay55ri9MhLwUDhfwfhKPMiJtCdsvWVWYqBicVgLwjoMfDogvtwtjW5PV12tSQcXrzBjjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mhQDGGaW; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mhQDGGaW"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6157ed5dc51so2167915a12.1
        for <linux-staging@lists.linux.dev>; Wed, 30 Jul 2025 03:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753872311; x=1754477111; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pnv2SMLij4R2x+6MFia53n0KBrG4Etb1tcinc9nWT1k=;
        b=mhQDGGaWmyed466HENyOPCbNzzH4BX4SOOvoHH1Xe3XV3Od5dU+2FsyyOLw0GwWNuc
         3/1RmpqsPl6mtv84ZtsutEHOvAmOcgAaUYH/w5cnyD5ActJqVKUoS7J1uknIo3p0LjbB
         e1/yiDp/dctQlTCkbFRf6w6NVLooZOwOhBAzLrrf9eeZnwhVgvbso2+hyJrM2AXQBbQF
         dkfEJJy0PjVxPfoz0I1XgNqHGkLHMIpuvp2WyAZO5t+MeLyZ190n09F0WJerZdJZ4ACs
         AJ2wdvjuEc395CYYTnjYdICl3r2Vt0UWGQ+3hgWWPQJ8yStID9M8c5ILXZHIraBrF6GH
         nmzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753872311; x=1754477111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pnv2SMLij4R2x+6MFia53n0KBrG4Etb1tcinc9nWT1k=;
        b=j9KiGas8+r6NBfWd/XJWgaHm0amqvEsvZYBsdr6VYmOvPNn7au+bh1DWW6gC3lvQB6
         OhPE+VscPwCvgeKKls28j0fdh8BfU2y1PTVB8ZkuoZhr1oJU5QWH8x65CDOz57O4Znd0
         xgmLtWYT1llo86w6caa+RzvLwgrHDNLpLAkLWVMFOH6jcybLn+tBAQlCUJJHSlgU/hUM
         3EuQ+71M/Jemc6MJmvHA0rMkkA1P8WmS3zDb4J5ld55RPJ8fHDqCil15ig24JQzxmDO6
         bN2qQ/4fk8JexEy2jmTzzqnlDonKiJMNicaSUoepGEwM0IP69u05g00PsKzm+R8fI38z
         PEuw==
X-Forwarded-Encrypted: i=1; AJvYcCU7eurgRri5GKxkyjjguuklDW+twBHkhU49v+gA2iVEmNKhg/d4CrrZfvot0kcYrgtkBnbIf+lPgnB5ZbKz@lists.linux.dev
X-Gm-Message-State: AOJu0YyB282aFdgPn0E2WWqtewWjaml/i676qwVwS0slT0Ut1j58niep
	tTq9KxnsHSVg0Qz8BCf60aqzyrjVndGasTqt1GIv6a1u8uq1dSCEm7TF
X-Gm-Gg: ASbGncv8W2p0wgw1GTneVabuAK0Gm5xzJ6HA7D5GZjwLVxPeVY9cebDZ51pAlWmvrmm
	6zb0ESZSBlh9szJrewmMML5XmtX414zRhjKt0UrISRplhNy+kyu4IQ/YD9YIytaMCwt7hFwUVhI
	+K8vd4LPipgD0WW9SiD8fJMQ3UrdiTzEA9cLrxRrOZTUqXeh2Bh3N8weaHhp9EscnERZMnckQr9
	MRaZZWpWik/Tw7kWdVbD8q99ZrN9WpfSKlGxgOjpEZcVfMCoTh48/dTSz4kyqPhnmaUiTT/1P8q
	1jxYdKANDgFLRptbQdDFIGuJD5NLyH+fjarRhvAwtx8AUAwdZfn5w/v2H6HQnszwWWCKf3u6+fK
	y8day4k4IZfOKsDCz30LEh/nAoEtMKIKF5RU1yc5KsGoYPfh4NHctyZbK
X-Google-Smtp-Source: AGHT+IGwYX8VOf2KNXwLlB+LqJ+dsXg5j0rCI21X0ePacfGNTJrhJYQk2+N4KAF/yr+aPDRG65amfA==
X-Received: by 2002:aa7:c453:0:b0:615:6138:f702 with SMTP id 4fb4d7f45d1cf-615871d33e4mr2720671a12.26.1753872310976;
        Wed, 30 Jul 2025 03:45:10 -0700 (PDT)
Received: from tumbleweed (ip-77-25-32-208.web.vodafone.de. [77.25.32.208])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6157974fde0sm1582734a12.7.2025.07.30.03.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 03:45:10 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/8] staging: rtl8723bs: remove wrapper init_addba_retry_timer
Date: Wed, 30 Jul 2025 12:44:57 +0200
Message-ID: <20250730104501.150270-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250730104501.150270-1-straube.linux@gmail.com>
References: <20250730104501.150270-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function init_addba_retry_timer is just a wrapper around timer_setup.
Remove the wrapper and use timer_setup directly.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c     | 2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 1 -
 drivers/staging/rtl8723bs/os_dep/mlme_linux.c    | 6 ------
 3 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index 1d2b53c76afc..4d51e6993ca2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -229,7 +229,7 @@ struct	sta_info *rtw_alloc_stainfo(struct	sta_priv *pstapriv, u8 *hwaddr)
 		for (i = 0; i < 16; i++)
 			memcpy(&psta->sta_recvpriv.rxcache.tid_rxseq[i], &wRxSeqInitialValue, 2);
 
-		init_addba_retry_timer(pstapriv->padapter, psta);
+		timer_setup(&psta->addba_retry_timer, addba_timer_hdl, 0);
 
 		/* for A-MPDU Rx reordering buffer control */
 		for (i = 0; i < 16 ; i++) {
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 58e2d8e159d6..53fac838c36a 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -426,7 +426,6 @@ void init_mlme_default_rate_set(struct adapter *padapter);
 void init_mlme_ext_priv(struct adapter *padapter);
 int init_hw_mlme_ext(struct adapter *padapter);
 void free_mlme_ext_priv(struct mlme_ext_priv *pmlmeext);
-extern void init_addba_retry_timer(struct adapter *padapter, struct sta_info *psta);
 extern struct xmit_frame *alloc_mgtxmitframe(struct xmit_priv *pxmitpriv);
 
 /* void fill_fwpriv(struct adapter *padapter, struct fw_priv *pfwpriv); */
diff --git a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
index 5cb27ddab769..f85e17ae0e7f 100644
--- a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
@@ -128,9 +128,3 @@ void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
 		kfree(buff);
 	}
 }
-
-void init_addba_retry_timer(struct adapter *padapter, struct sta_info *psta)
-{
-	timer_setup(&psta->addba_retry_timer, addba_timer_hdl, 0);
-}
-
-- 
2.50.1

