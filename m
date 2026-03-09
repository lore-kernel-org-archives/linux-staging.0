Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614563314C5
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 20:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773087284; cv=none; b=phau0uFtbMtsB9ttGAM6CQSF+Jxj6sLJJTpNDOhJ91lPUuj2Uca7eWuHCgS8C3x/5WgzBrN8EV5kQyKAuhUKHaxKXvR8HmhbGNt3qlN748qwP+BArD4G0vCtodBal3Rp+G2IGw5oi/rloJvVNfWquolNnY+ncFOvSuwVzwmWup0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773087284; c=relaxed/simple;
	bh=kTQykVjuG4WHLyUn8nQvuDiaX2t11jqffrxsoShM3F0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LQoDp+KU6C1U0TiKACgp7fgmcSRJ7Da9dXLvwYzCtHz7jlahvyEnwtrn4tXnvqkhlQA2i3ShCDtilTQrqYXPkQcL9I0v3SP2KWIzL3V8NTLXr/DFiotUafSb8aDvb5nRgfsDLNEG8hJWbrAVLVFCGgsKprNXVoHplOnydxmftrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=di8+uOlQ; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="di8+uOlQ"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64d5a7926cfso277272d50.2
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 13:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773087282; x=1773692082; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+bpszLUrWctABCXYsqB0FqwYPsREB8/bNJRPMob8rk=;
        b=di8+uOlQHy9m2v37Ee2ssAFRtPL9Dz3lms180cMenX0hy08qE2POXCCoNtz93GPEsL
         ZOLQN9e0j3q+TkIYfW1S6BSijE+i8ibR2O2uAIXho44BrRkL8VOTUblxd9yQ1xwHK0NZ
         4S0kiJpp5eRqRAeaJOMzpZzICQnJRP8nQQT6NDmrAtbSFk+yTNNXP2UTA+tfd2x3jhXp
         wpeVZAaL/PpcbW66JdFy4uePCYEMpv7DtavwkVysVMu2xVN7KzBKLe4iGp7np8hJaaZx
         j84IFfZ5LjKgYEXsBlhX72Z1qivpVh7wq3Vw8XU+aqQvVIopTpLD+zfPwxkwhfRXPJA4
         nwzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773087282; x=1773692082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L+bpszLUrWctABCXYsqB0FqwYPsREB8/bNJRPMob8rk=;
        b=lN5PuSG1w1R9RCZIF50Oirt6W6DM3ggV7DSEiojQthHrKHZdVKdBaEvs8eBY+3BJ5q
         ZykwW1Cky74KbMasSicKgF2pRChLdXxZrcwxDL8rK3vCOiCwK1nvzxP8sDTLh39LcZIG
         ap02hkp/mOCZ81UKtCAVHubazbtaouRtveVTVsxCdDu7Praya1mXl2goACjcuz4xZArq
         bBLDcoaXvT4oZ26Ic68OtO0hFmk2ksvOCQxP61iY3SPwQUMGjtB2x/gUo/735l7jrAUH
         OVjCOi6HyUUykF2UUUirM5IUyjOU8nwizXeRXt1DZKNeaWzNOFsohd+Q42CJfYY2oDN5
         AYcQ==
X-Gm-Message-State: AOJu0Yx06eNmq9TMgwdeUpcBz81tsLSPE8S4v+6fJBvzC0yba7yKmHy4
	eK/D9Bo5Q3BAM677poF3NvBso+Bk9jwPkZqmrPaW5PZdxdYcjuoKQRLf
X-Gm-Gg: ATEYQzwI9kiICbG0RQRibXJ1Mi5lxhlvDM/yLRmAWWJxsQGP4+kao11XSI4DAFm6U9E
	eJpNKRKM3p63X4q+pGuaS3OjHBEIeljJwNCrVySqNU52jt821qoVc9jfMGECfk4pXVzOp5aM6B6
	5ogo2+s96R+cJs2j3bmobbPfIeQOpLUYNq5X85diJORCa5FfEhi9gsbT/zMnIx5sWl1xF7IgBFA
	Lzt99yCztoArrn37XEroUIlFH/cFAcyk4QPxkaDjG0uHdcUh8pHxd77VD7tnRc+z6Qlj2QD1mME
	hGwXkcolk3PYtK3mfPSH8JoKbs/26lADWyI5HTCYG62lDRGL9C9X83MoXUYP7RnA0UkqH6FKpFd
	bAk9ew+WwIJNxMApN7rQyP+RriZxWSmyiVxQyQquBLHz+loOI1kV9pLEtZgjoURNQkrxpzy6OB3
	AeSNp2WqZkBvp1srcIFF39XgOd
X-Received: by 2002:a53:b467:0:b0:64c:e81b:1193 with SMTP id 956f58d0204a3-64d14065ee9mr9343578d50.2.1773087282256;
        Mon, 09 Mar 2026 13:14:42 -0700 (PDT)
Received: from archlinux ([185.140.162.146])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64d175e8300sm5182999d50.7.2026.03.09.13.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:14:41 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	ethantidmore06@gmail.com,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v2 1/4] staging: rtl8723bs: replace rtw_if_up() return type to bool
Date: Mon,  9 Mar 2026 23:12:18 +0300
Message-ID: <20260309201257.16984-2-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309201257.16984-1-nikolayof23@gmail.com>
References: <20260307160024.18039-1-nikolayof23@gmail.com>
 <20260309201257.16984-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_if_up() actually return 'bool' value, but it's type is
'signed int'. Replace 'signed int' with 'bool' to make it more accurate.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c    | 10 +++-------
 drivers/staging/rtl8723bs/include/rtw_mlme.h |  2 +-
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 2adc98c955fd..f6ee2a2e595f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -262,17 +262,13 @@ void rtw_free_network_queue(struct adapter *padapter, u8 isfreeall)
 	spin_unlock_bh(&scanned_queue->lock);
 }
 
-signed int rtw_if_up(struct adapter *padapter)
+bool rtw_if_up(struct adapter *padapter)
 {
-	signed int res;
-
 	if (padapter->bDriverStopped || padapter->bSurpriseRemoved ||
 		!check_fwstate(&padapter->mlmepriv, _FW_LINKED))
-		res = false;
-	else
-		res =  true;
+		return false;
 
-	return res;
+	return true;
 }
 
 void rtw_generate_random_ibss(u8 *pibss)
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 0bdb204b85ba..96a402328398 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -362,7 +362,7 @@ extern void _rtw_free_network_nolock(struct mlme_priv *pmlmepriv, struct wlan_ne
 
 extern struct wlan_network *_rtw_find_network(struct __queue *scanned_queue, u8 *addr);
 
-extern signed int rtw_if_up(struct adapter *padapter);
+bool rtw_if_up(struct adapter *padapter);
 
 signed int rtw_linked_check(struct adapter *padapter);
 
-- 
2.53.0

