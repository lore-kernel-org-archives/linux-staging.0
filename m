Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8333043AB
	for <linux-staging@lists.linux.dev>; Fri, 22 Aug 2025 13:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755870916; cv=none; b=oM/qIjMpe/mAr1DLB86ptKWZJUJZZACCJ7ExO+E+ka5por5WKkQCUKiLk6N2wsyH56E6J5wCMumMxutEpMIStOZSDYo13sgWoI9hII0dc77Z0oXce76RLhYGWl2D2uLk8xMpKrVBl/5nDscHq/P1izo4C/Qshe71o7P8mpuOwrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755870916; c=relaxed/simple;
	bh=08jilncjBwuSDABEhZg6DFoFK3KpjK2lSsy5vYH0iT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ili20+ozm+VHaTuMQSloawvguy26+R7FvpYUUqVMoETf4aFNZutLScnpaXWMTiCO6mco29yubZyAQmEiqjvMdQng1QQFYX1ieeIlx26ogDHUlh4EKOdzxw4ucKpoT2W/RZjPu/vXULdrJfGMNR3tYf6aOuT7gOjJNi7/9BrJyMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H6XLDgPl; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H6XLDgPl"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-afcb78e70c5so319923766b.1
        for <linux-staging@lists.linux.dev>; Fri, 22 Aug 2025 06:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755870912; x=1756475712; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HEg7Yk8Jwp6gPwyCxwtglLl6F3s3lO1z3ZnEHF+g/4=;
        b=H6XLDgPlapqeZbX1UIzrlSZ5b7bfbIFN2y/NodbhhTXUl57qAw8qPHf/EorYDXyJTl
         vVPp2OEYqww/zv3XjCBTs+5IPILuHg28lDxK6vTOdpwVf3AKc5unOjr73GlFZymyPl5g
         c8HhKOFGnu3vvus4Z0xN+NpunaL5D7Lrolvx4bJYS45hPT8Qo0yjUFkQX8xQTv2xlkHh
         8yxk3Z2/T4SnDqFCvfWLY5DKcIRN8oXp5fo21QP2wglqdVOZONY/j1IGuBuUsYNk99hA
         EX8WstfLW0ZHAfZfc4+6cP4hFH4Ck+FDYUHcdktEU+RrbcgRr3M48JWRzlGKM4pJSncb
         pi4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755870912; x=1756475712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HEg7Yk8Jwp6gPwyCxwtglLl6F3s3lO1z3ZnEHF+g/4=;
        b=lkV6EUBK1jQwTJ3HlkjGxn/OeC5NOsjly7cNyXRwow0TW/zp6JVcSkOBpQNWrefRS+
         Yw76M3eUHaNJuJZy4zuG7bP7E7Dh5sDKmXYRtbbsf1emZGt5i6FPogG6t88J3CmqpG2i
         9jlakUlH+i6LlJGefY3VhGVRKifAIjBrpeWmsLy7soGgM3Uzet1ww9rKgy4gb7Ry87V5
         g7FUWFuJrGwQyKmjfmgTh6UGprrgsHIWRdI2wjqI1YDL+NJPH4H45QyrnrsF3NrYUSCx
         on4Nvvfj3Ib8yckqqep1BQgWOfk7+P/Bcu7EcPOBj8ZgXDC9PZedecWeAtsx+clHDVys
         ukvw==
X-Forwarded-Encrypted: i=1; AJvYcCWHbUCjiOxDayGot86Xn/siynm9oQd5r1h1o6AdzLL7udbEXQNKxKTQ6KT932dWetvTMcs7+UXhI87eKxJ/@lists.linux.dev
X-Gm-Message-State: AOJu0YzPAaVH34RvNpoqbQVl0Bfa3RrHzpciAcf1YF5dVbybOrvIveo6
	Ejoe9VzTGwuu7a6zogm6GSmnk1dHFW1UmGYd9gOgxJHSpjlOtjNwK/DEJWmKTQ==
X-Gm-Gg: ASbGncu1o2P6wccY7Q7GNvylCFSS2pHoYuKV0+hT8bii9iT/Ev72Yg1sxGhp9snzxkc
	ir2b1ifI/aCyBnvk+pnKTRjWrNKx9J6d3dvUORbnueQpAr3G0Gxo1KhGYti1c8f/aJ2NGluZLqH
	x+zoScGah61Q2VM+MVA7Vdx7OddO/GYf7R3MGKa+GWEWuyiYK3YvZ2DpRP9qpzqNNoABbApvuHz
	6CMu4Q2fV1c3kDYctpc+4ejZjxx2vxtLwJB/1XOTKbti0TisOFCpTzfJBKhXxoFaaLUZ2bTZoO+
	dNlX70oRWEMP9wCQqQozDflZsF2AczMldVo4GQCDhTpYRQkp7GXWCtAKdvVURh62eC7QhPHOv0K
	RHsZPRyLaRSzjVVxvAnyAVIM+0A==
X-Google-Smtp-Source: AGHT+IHUWGElOIDU+pZEZTNblktP4dokgeuz+6AiYAemB3XXEE3oLp7BHuDBUphjxf5soPjrh7t/eg==
X-Received: by 2002:a17:907:6094:b0:af1:8be4:768 with SMTP id a640c23a62f3a-afe29441368mr268181666b.5.1755870912272;
        Fri, 22 Aug 2025 06:55:12 -0700 (PDT)
Received: from tumbleweed ([95.90.184.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded307138sm612353866b.45.2025.08.22.06.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:55:11 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 03/13] staging: rtl8723bs: move rtw_handle_tkip_mic_err to rtw_recv.c
Date: Fri, 22 Aug 2025 15:54:08 +0200
Message-ID: <20250822135418.118115-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250822135418.118115-1-straube.linux@gmail.com>
References: <20250822135418.118115-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the function rtw_handle_tkip_mic_err from os_dep/recv_linux.c to
core/rtw_recv.c to reduce code in the os_dep directory.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 44 +++++++++++++++++++
 .../staging/rtl8723bs/include/recv_osdep.h    |  2 -
 drivers/staging/rtl8723bs/os_dep/recv_linux.c | 44 -------------------
 3 files changed, 44 insertions(+), 46 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index bc34cac8dabe..b043e3d1cd82 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -294,6 +294,50 @@ struct recv_buf *rtw_dequeue_recvbuf(struct __queue *queue)
 
 }
 
+static void rtw_handle_tkip_mic_err(struct adapter *padapter, u8 bgroup)
+{
+	enum nl80211_key_type key_type = 0;
+	union iwreq_data wrqu;
+	struct iw_michaelmicfailure    ev;
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
+	struct security_priv *psecuritypriv = &padapter->securitypriv;
+	unsigned long cur_time = 0;
+
+	if (psecuritypriv->last_mic_err_time == 0) {
+		psecuritypriv->last_mic_err_time = jiffies;
+	} else {
+		cur_time = jiffies;
+
+		if (cur_time - psecuritypriv->last_mic_err_time < 60*HZ) {
+			psecuritypriv->btkip_countermeasure = true;
+			psecuritypriv->last_mic_err_time = 0;
+			psecuritypriv->btkip_countermeasure_time = cur_time;
+		} else {
+			psecuritypriv->last_mic_err_time = jiffies;
+		}
+	}
+
+	if (bgroup)
+		key_type |= NL80211_KEYTYPE_GROUP;
+	else
+		key_type |= NL80211_KEYTYPE_PAIRWISE;
+
+	cfg80211_michael_mic_failure(padapter->pnetdev, (u8 *)&pmlmepriv->assoc_bssid[0], key_type, -1,
+		NULL, GFP_ATOMIC);
+
+	memset(&ev, 0x00, sizeof(ev));
+	if (bgroup)
+		ev.flags |= IW_MICFAILURE_GROUP;
+	else
+		ev.flags |= IW_MICFAILURE_PAIRWISE;
+
+	ev.src_addr.sa_family = ARPHRD_ETHER;
+	memcpy(ev.src_addr.sa_data, &pmlmepriv->assoc_bssid[0], ETH_ALEN);
+
+	memset(&wrqu, 0x00, sizeof(wrqu));
+	wrqu.data.length = sizeof(ev);
+}
+
 static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *precvframe)
 {
 
diff --git a/drivers/staging/rtl8723bs/include/recv_osdep.h b/drivers/staging/rtl8723bs/include/recv_osdep.h
index f31c87b21206..91fb275cbcaf 100644
--- a/drivers/staging/rtl8723bs/include/recv_osdep.h
+++ b/drivers/staging/rtl8723bs/include/recv_osdep.h
@@ -15,8 +15,6 @@ extern void _rtw_free_recv_priv(struct recv_priv *precvpriv);
 extern s32  rtw_recv_entry(union recv_frame *precv_frame);
 extern void rtw_recv_returnpacket(struct net_device *cnxt, struct sk_buff *preturnedpkt);
 
-extern void rtw_handle_tkip_mic_err(struct adapter *padapter, u8 bgroup);
-
 int	rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *padapter);
 void rtw_free_recv_priv(struct recv_priv *precvpriv);
 
diff --git a/drivers/staging/rtl8723bs/os_dep/recv_linux.c b/drivers/staging/rtl8723bs/os_dep/recv_linux.c
index ae396ccfd830..72fd86e03b5c 100644
--- a/drivers/staging/rtl8723bs/os_dep/recv_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/recv_linux.c
@@ -135,47 +135,3 @@ void rtw_os_recv_indicate_pkt(struct adapter *padapter, struct sk_buff *pkt, str
 		rtw_netif_rx(padapter->pnetdev, pkt);
 	}
 }
-
-void rtw_handle_tkip_mic_err(struct adapter *padapter, u8 bgroup)
-{
-	enum nl80211_key_type key_type = 0;
-	union iwreq_data wrqu;
-	struct iw_michaelmicfailure    ev;
-	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-	struct security_priv *psecuritypriv = &padapter->securitypriv;
-	unsigned long cur_time = 0;
-
-	if (psecuritypriv->last_mic_err_time == 0) {
-		psecuritypriv->last_mic_err_time = jiffies;
-	} else {
-		cur_time = jiffies;
-
-		if (cur_time - psecuritypriv->last_mic_err_time < 60*HZ) {
-			psecuritypriv->btkip_countermeasure = true;
-			psecuritypriv->last_mic_err_time = 0;
-			psecuritypriv->btkip_countermeasure_time = cur_time;
-		} else {
-			psecuritypriv->last_mic_err_time = jiffies;
-		}
-	}
-
-	if (bgroup)
-		key_type |= NL80211_KEYTYPE_GROUP;
-	else
-		key_type |= NL80211_KEYTYPE_PAIRWISE;
-
-	cfg80211_michael_mic_failure(padapter->pnetdev, (u8 *)&pmlmepriv->assoc_bssid[0], key_type, -1,
-		NULL, GFP_ATOMIC);
-
-	memset(&ev, 0x00, sizeof(ev));
-	if (bgroup)
-		ev.flags |= IW_MICFAILURE_GROUP;
-	else
-		ev.flags |= IW_MICFAILURE_PAIRWISE;
-
-	ev.src_addr.sa_family = ARPHRD_ETHER;
-	memcpy(ev.src_addr.sa_data, &pmlmepriv->assoc_bssid[0], ETH_ALEN);
-
-	memset(&wrqu, 0x00, sizeof(wrqu));
-	wrqu.data.length = sizeof(ev);
-}
-- 
2.51.0

