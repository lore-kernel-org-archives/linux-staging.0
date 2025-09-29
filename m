Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EE12C0F61
	for <linux-staging@lists.linux.dev>; Mon, 29 Sep 2025 06:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759128648; cv=none; b=irRhgGbcOxk7zs2yqHJSVYliVKZH9wmfRGSWJ4XS3Fnrl1r3xWYKwmudpae4DSfPpJtnMkOcYBkS2aQ7a9uz5kdiGBAM7gwAQ0wa59UZIqwqqlwf1tqYXNuPvy+aO8BbW9CQcloiDNcaY9/pKzen7U+fPQp6gPtONO4NzoQcGyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759128648; c=relaxed/simple;
	bh=WvsYf4htlmaRnQimGmB6zOdcA6l8TLaYGHRCyCVqilw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jrc2WfDYBoBV/zxb+UYpxsXrEC7ZgExlH9JNLFoDf8DBA7D1wy3oH9v49NT7eKWU8/zpStfra9AMI+nFZiKwMkfiMQkFxDPerlTzfSGKzIzcpNWltOS1PXcZ+IU7DHco0bvqpTNUVTfZLbbPY8TbfW92w48tDmOIcvnVfWHKFaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RYqIW1wN; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYqIW1wN"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-854cfde0ca2so572274185a.3
        for <linux-staging@lists.linux.dev>; Sun, 28 Sep 2025 23:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759128644; x=1759733444; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FgytSi7eWruZ4IgCQ9+woJWiBKve9B/1Gpbx5IGpnoY=;
        b=RYqIW1wNJgYgDyUx8VPFyBXXLq+swM/FIaOC5nA/oiNUWg2JVFZ70T+9rHQYz+Vbk1
         jDY85CZFcSPzUARWTha2U0Mjq5cY0SJ6nwzHgcevE/zRrcDxHZSEYEketKiUxZ/XbrWa
         oXvNHOtnbJJlQl+NoxuaIaleOy8aG2OXV3jvridzilKAHv0cOSkbttxMCg76+Nqv0dB1
         ABmeSNsJBmRohmdYu0eXn1Na/r8mA3rKbAIVv+Fsj/NzWfM8M1P2da/Wy8Qnwlz3u44B
         UL4HnZcF8EHReVyrxdds9Pr+zGi35kirSgo+GiaPXUYDzFEfW0KO1UpNPMET3lpgwdti
         YZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759128644; x=1759733444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FgytSi7eWruZ4IgCQ9+woJWiBKve9B/1Gpbx5IGpnoY=;
        b=XQLZT2qBiWir8a+mCRn80DaVgnGAwtpc4/qTGxn4fpPMTvSeju1jLGu8oWdYSmft8S
         KRXxgdXnPJZUVOnqg6GuovEshrjd0mzKxGpawagqOsU6FAjcSEW2u0xqpEidbTAz2iL8
         nJWafxwcolzvUMaPB/FADxkhbCSJI1G0aHX61UqdoYfBTz+4OD3f5Dnhz+KWvQyd8KE+
         nBTg0AvPTrCmy/fT9q0x0ZpSAvoEywB1qTzHtRHTao43UkV908GHbTSsRXlbV6kmkFq6
         mJsrmdEefTpMYWdmNkG4IwTeV9gQGkKZcH226wbfJAzzGbLBydfLqVypfI/viWuhkv/B
         1wyQ==
X-Gm-Message-State: AOJu0YxrI0FaLia9oKNipVf+UsDvh95lzuc3zavgdTfXDyoPwpycGHL6
	3oJxlrq6f3Hz/vVm2KVRaI6IoEJvvwUntGJP5i6oWsq26tRQCYW/aIgNza2vYw==
X-Gm-Gg: ASbGnctiO1Cxa1A2wZPBZqRM+hzbfwUz8s4TjbBakowr534+yZfIHgVQ9jb7R7pp0+i
	OAP68WPcJT49xPWY/v2jQQaUAfgrG4xo2dQW28Fj6y3I7M+qrB81OqMrz0PRfX1cx90SZHLEvVN
	bey6r+ZDkxAtqvskQ5B9PZOKU4IYz2BXvJCngrsaF6kEDmxJPaGBFjXpKY3XZP9/JckbSJeC9Kr
	Hc8vDqY09IktaU7+XllSyH2ST0SEfr2Kw4zNCMS4m6OXy+VOoTa6jXOMpUihdo6tNjulDmWMno2
	XmE+PtrQ9bRUvZoZbOVx/Z4GQ7qTfsbnZASTwO5PNwqznA46Fm8ET8TC5ni6cvxjWB/TuPI15Rs
	PBJjNbg3WgKMmxj/Wl46E3pSdjqNfDtExemtkyoiI/YsYn/K9los=
X-Google-Smtp-Source: AGHT+IHSra+J8XmrdkJXal7HIXXGUrIc2BNqj+IcsYKupPcSVxWC2FXEcXs7hQkwzDPqFjgbu8Vavw==
X-Received: by 2002:a05:620a:6281:b0:855:ad28:7931 with SMTP id af79cd13be357-85aec2bec40mr2283842385a.39.1759128644013;
        Sun, 28 Sep 2025 23:50:44 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4db10874bb9sm69517671cf.24.2025.09.28.23.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 23:50:43 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH v3 07/15] staging: rtl8723bs: adding asterisks in multi-line block comments
Date: Mon, 29 Sep 2025 06:49:52 +0000
Message-Id: <20250929065000.1010848-8-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250929065000.1010848-1-vivek.balachandhar@gmail.com>
References: <20250929065000.1010848-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Format multi-line block comments with leading asterisks

Add leading asterisks (*) on each line of multi-line block comments,
in accordance with kernel coding style. This improves consistency
and readability of the comments.

No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 33 ++++++++++++-----------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 19bf6bb360f9..ab626c88e7dd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -217,10 +217,10 @@ void _rtw_free_network_nolock(struct	mlme_priv *pmlmepriv, struct wlan_network *
 }
 
 /*
-	return the wlan_network with the matching addr
-
-	Shall be called under atomic context... to avoid possible racing condition...
-*/
+ *	return the wlan_network with the matching addr
+ *
+ *	Shall be called under atomic context... to avoid possible racing condition...
+ */
 struct wlan_network *_rtw_find_network(struct __queue *scanned_queue, u8 *addr)
 {
 	struct list_head	*phead, *plist;
@@ -322,10 +322,10 @@ void rtw_free_network_nolock(struct adapter *padapter, struct wlan_network *pnet
 }
 
 /*
-	return the wlan_network with the matching addr
-
-	Shall be called under atomic context... to avoid possible racing condition...
-*/
+ *	return the wlan_network with the matching addr
+ *
+ *	Shall be called under atomic context... to avoid possible racing condition...
+ */
 struct	wlan_network *rtw_find_network(struct __queue *scanned_queue, u8 *addr)
 {
 	struct	wlan_network *pnetwork = _rtw_find_network(scanned_queue, addr);
@@ -489,8 +489,8 @@ static void update_current_network(struct adapter *adapter, struct wlan_bssid_ex
 }
 
 /*
-Caller must hold pmlmepriv->lock first.
-*/
+ * Caller must hold pmlmepriv->lock first.
+ */
 void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *target)
 {
 	struct list_head	*plist, *phead;
@@ -523,7 +523,8 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 	}
 
 	/* If we didn't find a match, then get a new network slot to initialize
-	 * with this beacon's information */
+	 * with this beacon's information
+	 */
 	if (!target_find) {
 		if (list_empty(&pmlmepriv->free_bss_pool.queue)) {
 			/* If there are no more slots, expire the oldest */
@@ -1891,11 +1892,11 @@ static int rtw_check_join_candidate(struct mlme_priv *mlme
 }
 
 /*
-Calling context:
-The caller of the sub-routine will be in critical section...
-The caller must hold the following spinlock
-pmlmepriv->lock
-*/
+ * Calling context:
+ * The caller of the sub-routine will be in critical section...
+ * The caller must hold the following spinlock
+ * pmlmepriv->lock
+ */
 
 int rtw_select_and_join_from_scanned_queue(struct mlme_priv *pmlmepriv)
 {
-- 
2.39.5

