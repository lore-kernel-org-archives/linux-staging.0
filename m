Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79309326939
	for <linux-staging@lists.linux.dev>; Mon,  9 Feb 2026 23:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770678595; cv=none; b=nf7GAblFiXskvzECD3Fof0O9qrIRH07mm+DnTzRD+jeYEsJw91Je8jrVUhM8hDviwJO2dL5b6dMoqLMk155xmWGktn8QimwNGhqqbpvhTzXkv7dLAsyu/haqGw1DMbAwMWM9NBJG0iCjGjtwROZkJ0lqa0ztn7Md7NbQDuTc1nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770678595; c=relaxed/simple;
	bh=PljERaLj3ZmssqsP1YjwJ1lBY1KLQY8BDdy6mJ6h9oQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cfcrskIIYiyC0oTsLQ54QwZyluvL9Gag7anPO9ug9JVp/SlztdgOeJ7cbTt5VF2P3lbjB7OdOMdGyL0yC+G8UmN+JKqqmzQidQZ944oOJ0K4ZXm24UfL+aEuDs/E+UYrjPEArjToopApnxl2D1fupJbCKlghOCpfz11GAXUXPfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j3d78H7a; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3d78H7a"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7963af509f0so2624447b3.2
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 15:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770678593; x=1771283393; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xV6JdIFzxw0+Ceosjiyj510JfUFTdknRIR20OTbTjoc=;
        b=j3d78H7at7GKZCDUTvOyltAAb9robzg+7p8OAOPg3TQscNxgv3YT4H7fQuFTW+fG5p
         JIo7l+YHQzIRBuL+gDLUq/iwen2bBLbhA8BI1dfkf4iX7fftVSmPMIATFjxCK4z4Noy0
         ed5Imo3fGIpYeV36bYIT4tHDDv5B2ikIP6Yf6bm7BIOq5ZB/kyzXSsTIPuGIUgPVJalp
         pOR3oi4i3fyzCWd3vRazuS9xWVxDoCVrDFGYm/gn1bZHw+FtLL6QIOwVeLexTAgvaJ6r
         MA9A9vk46lFT3zNHtnAIQL7ATget8ZZ7obLEETyyd6iSeGGKJHhCCP1o93qhcYx3X7cR
         eCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770678593; x=1771283393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xV6JdIFzxw0+Ceosjiyj510JfUFTdknRIR20OTbTjoc=;
        b=eU5zo9qymSCzAq2UUXbwKHfnULQbb2UgSL+oYIkwtgxDXN2Ug62Mxx/T086LQmmMSj
         W14UtrSthVhMfK4m/v6FWpSpOmC7c3EpVJw4ak8ahyl3ksv/qXEUJ6z31ntn40NK6E4t
         +x5c2KNBARmsCzXkz6dRsiUsuSoZW06oFOXgoppYKHtvAFEOLk74tC2pMqkFBRWEyvdT
         Eb8EUDpoip1Vhhiq2oOlBX8SC7mkiKUDzui92R/+WWpj5FsI2nzUm8TNsNknoTQ7z4xy
         KaxbTZqmM1KRgSATZjjZXU+5wzesVvDcR8HocxpXUy6CP5jrNGW8dyRYeJSt3SLko5NV
         Hk0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUMkCkZVRvimHwuirmJmZmwoEIQRCIHuajz03Y5P4eCFk+m4FbkSvpAUmJ4wemKFVIqEgtXvhWhTh2Tl+Cl@lists.linux.dev
X-Gm-Message-State: AOJu0YybQ0sooRkXKv/PmNR7dCeVehbRIIrN8vdPeXCMBPOpvyfareZb
	VI2wBzSNmDVA4g+3m/+2PBHm0G6nLEF9L9Qir4eAgSToH9f/hgmaOC8C
X-Gm-Gg: AZuq6aI6PdiLVplKGUCq8Hv/POKlXzqRiuzaucTpXIFnl2dTdSNLXzy44X6vi9w1by9
	ZzpF4gcLIMHtwKDTLPQF1XNTdlJmrwYoXT+Tn7KPQdNm6GWxkd7ewFE/QzMNgHaJoFTzNzwkwxH
	cgQC88+Ho1BDz2Pxurp/aNj6RYMvYs2coxg/jjcd8Om4lAnQKgvn6ndqia1qfu9u73XnizGi14K
	8GqDqL30/+BXcA5gH4ITUOlc76USRHD0ZNsR2d6pUmK8FOyuJibkaGanJ6YPNTkERx+vUY6YVMP
	1l8xQt9hLxpRe/PCfV+2MAfnADO/8a/HQbCOi0ykmZocSFXAdXZw5JfxnmYu4YVnOFrUc/0yXvi
	QhU7mdHOSH/aqkLlGeSyKX2mQ8/QxB2eM7OAeWWugT4ksGwOTxg2DwhHsdY6yIGYEfLuFtQfG1U
	I4UEN2xe083A+DlOkCaH3SbLyPFSCgFItuM7VY9dC3XDR+7ZWm6Zt46wIer/E7UrQc18RvhLsZh
	H2bcWqI+Nvb
X-Received: by 2002:a05:690c:6612:b0:796:3079:a84 with SMTP id 00721157ae682-79630791bd2mr71735297b3.15.1770678593462;
        Mon, 09 Feb 2026 15:09:53 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7964a783a03sm34544197b3.49.2026.02.09.15.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 15:09:53 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH 1/2] staging: rtl8723bs: Remove unused structs and helper functions
Date: Mon,  9 Feb 2026 17:09:35 -0600
Message-ID: <20260209230936.37385-2-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260209230936.37385-1-ethantidmore06@gmail.com>
References: <20260209230936.37385-1-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove structs rtw_wdev_invit_info and rtw_wdev_nego_info along with 
their initializer macros as they are never used anywhere in the driver.

Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 .../rtl8723bs/include/ioctl_cfg80211.h        | 55 -------------------
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  2 -
 2 files changed, 57 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/ioctl_cfg80211.h b/drivers/staging/rtl8723bs/include/ioctl_cfg80211.h
index 753009b07451..782f79e9228a 100644
--- a/drivers/staging/rtl8723bs/include/ioctl_cfg80211.h
+++ b/drivers/staging/rtl8723bs/include/ioctl_cfg80211.h
@@ -7,58 +7,6 @@
 #ifndef __IOCTL_CFG80211_H__
 #define __IOCTL_CFG80211_H__
 
-struct rtw_wdev_invit_info {
-	u8 state; /* 0: req, 1:rep */
-	u8 peer_mac[ETH_ALEN];
-	u8 active;
-	u8 token;
-	u8 flags;
-	u8 status;
-	u8 req_op_ch;
-	u8 rsp_op_ch;
-};
-
-#define rtw_wdev_invit_info_init(invit_info) \
-	do { \
-		(invit_info)->state = 0xff; \
-		memset((invit_info)->peer_mac, 0, ETH_ALEN); \
-		(invit_info)->active = 0xff; \
-		(invit_info)->token = 0; \
-		(invit_info)->flags = 0x00; \
-		(invit_info)->status = 0xff; \
-		(invit_info)->req_op_ch = 0; \
-		(invit_info)->rsp_op_ch = 0; \
-	} while (0)
-
-struct rtw_wdev_nego_info {
-	u8 state; /* 0: req, 1:rep, 2:conf */
-	u8 peer_mac[ETH_ALEN];
-	u8 active;
-	u8 token;
-	u8 status;
-	u8 req_intent;
-	u8 req_op_ch;
-	u8 req_listen_ch;
-	u8 rsp_intent;
-	u8 rsp_op_ch;
-	u8 conf_op_ch;
-};
-
-#define rtw_wdev_nego_info_init(nego_info) \
-	do { \
-		(nego_info)->state = 0xff; \
-		memset((nego_info)->peer_mac, 0, ETH_ALEN); \
-		(nego_info)->active = 0xff; \
-		(nego_info)->token = 0; \
-		(nego_info)->status = 0xff; \
-		(nego_info)->req_intent = 0xff; \
-		(nego_info)->req_op_ch = 0; \
-		(nego_info)->req_listen_ch = 0; \
-		(nego_info)->rsp_intent = 0xff; \
-		(nego_info)->rsp_op_ch = 0; \
-		(nego_info)->conf_op_ch = 0; \
-	} while (0)
-
 struct rtw_wdev_priv {
 	struct wireless_dev *rtw_wdev;
 
@@ -74,9 +22,6 @@ struct rtw_wdev_priv {
 
 	u8 provdisc_req_issued;
 
-	struct rtw_wdev_invit_info invit_info;
-	struct rtw_wdev_nego_info nego_info;
-
 	u8 bandroid_scan;
 	bool block;
 	bool power_mgmt;
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index a47d0d3fa2b7..21b1487d32ae 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -2751,8 +2751,6 @@ int rtw_wdev_alloc(struct adapter *padapter, struct device *dev)
 
 	pwdev_priv->p2p_enabled = false;
 	pwdev_priv->provdisc_req_issued = false;
-	rtw_wdev_invit_info_init(&pwdev_priv->invit_info);
-	rtw_wdev_nego_info_init(&pwdev_priv->nego_info);
 
 	pwdev_priv->bandroid_scan = false;
 
-- 
2.53.0

