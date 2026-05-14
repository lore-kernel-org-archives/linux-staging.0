Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26183C2768
	for <linux-staging@lists.linux.dev>; Thu, 14 May 2026 06:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778738638; cv=none; b=gOCkIQpgqRyiIEWps9+N6TN/RdQtKrG71rOjDDr6oJ33dx6FJbnGvKbTTbHlNamVt8R3OkPCWH22CTwNkPZxiJWWj2hjatpTlNM8BVJ4TIlCVj+PLQWYtGBrdXh4vnpYlsJaTotSNny4QUbZjDZK2EYYa2NIL0qLcR4XmHswi9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778738638; c=relaxed/simple;
	bh=Lx8tjc2hi/BxnlTzuA9QV3HwAbmze/Wwgnxtiq84N/A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jMw+PHRviaVMJ1UFB8rer64aHC9ECJ0C0jHxMUc/7cY8L3eOLPszE4Cc97nfj5UjKM/jbRzBYJRnqHLuhWFMW2zsy0CfUHjveli4Vb6+hAM8Xsi4ebUYHiHdxYGjYZsx7u+kxrelyEeuBpTJVMm6cyN3jDhpshnyvc1LzoO+jHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oJ3f0X1Z; arc=none smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oJ3f0X1Z"
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-2ff5472f263so3889708eec.1
        for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 23:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778738636; x=1779343436; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4JlJ+zwzmXqUTxE6mP3nEpdnrhD+xyjOREjmHfGZCMw=;
        b=oJ3f0X1ZKnmhoRxt9ivIyzzbbY40ZoM+EcT1Rq3E9D5YNUik1uSh8lval9G6LiVpjP
         B5e1UW6Hn8Vnv+h1Wd74eNlAUMmzifzt69ZAl0C9ozJWaeDDPMle06lWSbx1H16bIUmy
         JResDmpKUtRXmp5+9ZyMkxQ2UoVwWJTms5ucWLOeXpnT27eKFJL/b3GtpXmbV1OChp16
         AJUFIcrklri8/dxbfCx0eyrLHMPQHynzQUb+kMaAoVtBER8p9jXJ8h5657fQUwQzQ7z3
         +WvQpFtj3y4xtb5yHnd+Qk7pKW1VsI7FJPQ9I6pLJxhZL0s4NdjHK79Sb9B8Wq8okTVj
         IozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778738636; x=1779343436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4JlJ+zwzmXqUTxE6mP3nEpdnrhD+xyjOREjmHfGZCMw=;
        b=Q8vHFTdtUA0ui6cdiFPjxGFYSjutQONSPKbxeuhraev5Seq+//Bb1JbatpizLBTJ3L
         JawznJguYCYzJ4aR3UldeHW96212FGxA6Cj6RC4Ik1alEkWrwtq2KmRW6x2UGl64VS20
         4YSZIa+rfMkj4g7w/mLfQv1FVSVzz6PzZxLZPX1CgrttsBA7YkkvdVXdc7201M3MIxxs
         tLnoBb/fIokBwZ9VUScKrE334Qp5TnwJg9xW8XCcibDH+mZgoUZL7UJWIU8Yqse6t+Mh
         Jnhb+fHfZLgrgVQrrFYh7HdtgNad0GBkHyA8h3+xMoa+ElDcFf4LSFDiSJxqkLKGb2HM
         zBGA==
X-Forwarded-Encrypted: i=1; AFNElJ9NOiTl5gT8OtFcyjLw0wxV0opmqxl7PDlx/0eJjUQOWNGYeEOiuKsFNrh3PXUHCDaIw5lYxqTNJOkPKJ16@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3BmdslYUqGIMkkzzIcAjWoLy4G59Z8Cnw6YIpGfXDVbxxddUZ
	s9xl0Y0YjXWqEuBJKr2xvRpMSuH9xOLoryKaFKsyv7nWFOanhGBMtXB3
X-Gm-Gg: Acq92OFvkoKqRvijfhyfYHcawx5WkkkNOcRpIyyM5s01MqG9RcAeDVEQ88CmwzsLXp7
	Ya6kDtoNFjG7sLARQz3pAw1S2FlZOW9dRsD4j6tmAladPGmvU5DmRLpDl+N9sJMxSKILOg1wKZe
	nTDMxZzVh7ejYrZZYJm5Iro4qKrNwquZ9xqoNYnsXqydMID9/lq/knzYwIamWS89eXU/oYuAOdw
	TXRVVNY5z9GMNZPAPPq0oBjCqU5TGxn1R5WPeEHv8dAHSIZpWgAU3CyfyzMT2ZV/+CU1DKGyWCw
	JGBLVhzTRmumZnowgRaeJ2/6Xytd7N4fuKyCh/W5i59HWMC1VrwoIUc2zxK37wki+yNsqrvgwQx
	oaocspW275g9lBj2ANatBC7hTStFADJb3SChV/EQHm+fC5bFb5K/FtRCl9lxtAIl392lLqIgu31
	QAaSWB2V4yNcTFkoxYFQVnfRxWf8omm5LcaGY++Yrtg+qq7x8wX+0rxpDHpGs9uwAS8g==
X-Received: by 2002:a05:7300:572a:b0:2e6:fe90:27ad with SMTP id 5a478bee46e88-30116e95830mr3777818eec.7.1778738635996;
        Wed, 13 May 2026 23:03:55 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcb6adsm2034772eec.15.2026.05.13.23.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 23:03:55 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH 4/5] staging: rtl8723bs: propagate errno through xmit enqueue path
Date: Thu, 14 May 2026 06:03:22 +0000
Message-Id: <20260514060323.24895-5-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514060323.24895-1-dennylin0707@gmail.com>
References: <20260514060323.24895-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Propagate errno values from rtw_xmit_classifier() through
rtw_xmitframe_enqueue(), and update the local enqueue caller
to check for non-zero return values.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c      |  6 +++---
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c | 10 +++++-----
 drivers/staging/rtl8723bs/include/rtw_xmit.h   |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 80f3dfaf793d..054cb4c9d1de 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1855,15 +1855,15 @@ static int rtw_xmit_classifier(struct adapter *padapter, struct xmit_frame *pxmi
 	return 0;
 }
 
-s32 rtw_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitframe)
+int rtw_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitframe)
 {
 	int res;
 
 	res = rtw_xmit_classifier(padapter, pxmitframe);
 	if (res)
-		return _FAIL;
+		return res;
 
-	return _SUCCESS;
+	return 0;
 }
 
 struct tx_servq *rtw_get_sta_pending(struct adapter *padapter, struct sta_info *psta, signed int up, u8 *ac)
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index a7f23335cdd9..ff82b6efefc7 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -464,8 +464,8 @@ s32 rtl8723bs_mgnt_xmit(
  *Handle xmitframe(packet) come from rtw_xmit()
  *
  * Return:
- *true	dump packet directly ok
- *false	enqueue, temporary can't transmit packets to hardware
+ * true      dump packet directly ok
+ * false     enqueue, temporary can't transmit packets to hardware
  */
 s32 rtl8723bs_hal_xmit(
 	struct adapter *padapter, struct xmit_frame *pxmitframe
@@ -491,7 +491,7 @@ s32 rtl8723bs_hal_xmit(
 	spin_lock_bh(&pxmitpriv->lock);
 	err = rtw_xmitframe_enqueue(padapter, pxmitframe);
 	spin_unlock_bh(&pxmitpriv->lock);
-	if (err != _SUCCESS) {
+	if (err) {
 		rtw_free_xmitframe(pxmitpriv, pxmitframe);
 
 		pxmitpriv->tx_drop++;
@@ -511,7 +511,7 @@ s32	rtl8723bs_hal_xmitframe_enqueue(
 	s32 err;
 
 	err = rtw_xmitframe_enqueue(padapter, pxmitframe);
-	if (err != _SUCCESS) {
+	if (err) {
 		rtw_free_xmitframe(pxmitpriv, pxmitframe);
 
 		pxmitpriv->tx_drop++;
@@ -519,7 +519,7 @@ s32	rtl8723bs_hal_xmitframe_enqueue(
 		complete(&pxmitpriv->SdioXmitStart);
 	}
 
-	return err;
+	return err ? _FAIL : _SUCCESS;
 
 }
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging/rtl8723bs/include/rtw_xmit.h
index a2ff62182b97..b13f16716e98 100644
--- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
@@ -438,7 +438,7 @@ struct xmit_frame *rtw_alloc_xmitframe_once(struct xmit_priv *pxmitpriv);
 extern s32 rtw_free_xmitframe(struct xmit_priv *pxmitpriv, struct xmit_frame *pxmitframe);
 extern void rtw_free_xmitframe_queue(struct xmit_priv *pxmitpriv, struct __queue *pframequeue);
 struct tx_servq *rtw_get_sta_pending(struct adapter *padapter, struct sta_info *psta, signed int up, u8 *ac);
-extern s32 rtw_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitframe);
+int rtw_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitframe);
 
 extern u32 rtw_calculate_wlan_pkt_size_by_attribue(struct pkt_attrib *pattrib);
 #define rtw_wlan_pkt_size(f) rtw_calculate_wlan_pkt_size_by_attribue(&f->attrib)
-- 
2.34.1

