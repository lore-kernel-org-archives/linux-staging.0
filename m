Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76916F511
	for <linux-staging@lists.linux.dev>; Sun,  7 Jul 2024 06:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720335272; cv=none; b=GQv0U5OpK+vCjzF6dArEITeR6LADbUHQODN0Poh+SqaWhhclg/LjUzsxw/rc33WTrjJC1iR9poIWQalNyLixGt1VAcoESgfrWr7pmFRFig41oPxtS6we0oS8T/oMy7BmKqf+8VKg25TFhCJX8N3Rt0HmVK4bsoLtdcB5mD3rLpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720335272; c=relaxed/simple;
	bh=+IuYxCm1vlnF378i4O4W0jciEGj38cmeBQhvj6kIefI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=peE5xYWDzEYbs3DAmBS1JleKhUM7qXvfXbyVdZVJkRjrTgeMXR66lv58p26rbMdvFpaPm/R9M/BynZmVIho8urwecS+W2oNCMOWjVNyWGq6hJi/Dfyts15QEFfIJoCjGlbWU7db+IKMdu4UrCUfjrfiPTjLzhciuKGiWQ9vRC0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LwzU5YQk; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LwzU5YQk"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-367a0645984so230938f8f.1
        for <linux-staging@lists.linux.dev>; Sat, 06 Jul 2024 23:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720335269; x=1720940069; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GrA22IGjkXIPIsfTt9aOZ8ajLSC1LUgeoha8qPdMqb8=;
        b=LwzU5YQkIgYql/ftkEiM5fHaDUXwP2dXKK9ja/xuDsT3zrDd4sv821MPnce166Q+eP
         X56HLlu/De2ekVEYNv7Euj1yIdYf9zltrkZ7Jd644DZ0chG9nmBui8Jc4Zke6yohPxMI
         J3YhRV4rXQNM2tv9XXVDz+KpENm4mpwfZU1unwKBElJer//fzAzoNPKBNU6TNwzqRrDO
         RyTXhwAMxz0DGq2muuUHKEtaikBV/EyfNJwRVrvbgy/iGFOy6mo6HxOvhEsIUO4ExLpG
         QLPtmkf5IqkooFWCQHDK2RNxKYlHQ4TfLB0hCTRBwss41p1Zk/JzQiPHjwsY4S0wYh/n
         P5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720335269; x=1720940069;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GrA22IGjkXIPIsfTt9aOZ8ajLSC1LUgeoha8qPdMqb8=;
        b=C11nkwvyj4FzTG9P76/hyiA3giohGHkuLw450VztHGa7KDrjOwDxLu05mDa4k+uz+J
         tpIDOzgjzq6ChJLG+HyY6YP4mMQOTZrB9aQ4Qn3sMWgsHU1dbeHYx4veO6WWS8jmQCJ4
         Cv/6/GlTxFH43FqcJi6eVrs0OV6TijtQY1coi+bXeki98RTZEj1c+cTlRN2wwWV5QEUa
         p1PiJM3qDELmZvvT7hamsV0l9lrDwTzgluk+3s/JvMY7G0jjRoeWPvlI43iFldx+dele
         60OZqdkudsJ3g3+YdI6dALXFQE/dFaPlPkL4rfmD93T7ZANoMuM5SGqy2aOsi+B5OrUY
         BT8g==
X-Forwarded-Encrypted: i=1; AJvYcCV4O7kZ5tpVv616b2gReuCeOB7Jo576c7u+6Dx5IVVxmIMzmGdEd3PgJ4jCz5ZstK8ei4vTPa/fUKbYYuBT9EJu0NuYW1BZPx3/rYO/Ag==
X-Gm-Message-State: AOJu0Yy0fI+wU/IgD3baRoNGiDLTA+b0jBZoLCGOVJYpOqZP2y2JbqRA
	X4m4+hORWWozSE4GJ1ucvdcpYz4Wy4wBkSMoBTbmpoMZa20593aFf+nlJA==
X-Google-Smtp-Source: AGHT+IGufE3eoOICGbDX7bEjamrSracJzS3rK65OoospbvJ4bZw+aIa8Ytp4bOT2V1liAOcVi6lhmQ==
X-Received: by 2002:a5d:6c6a:0:b0:366:e496:1caa with SMTP id ffacd0b85a97d-3679dd73a48mr5689649f8f.5.1720335268857;
        Sat, 06 Jul 2024 23:54:28 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3678877f19dsm13204328f8f.43.2024.07.06.23.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 23:54:28 -0700 (PDT)
Date: Sun, 7 Jul 2024 08:54:26 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 10/13] staging: rtl8723bs: Remove unused macros in rtw_mlme.h
Message-ID: <e04836b646ccd0a97ee0658dc61db7ac748bcb40.1720245061.git.philipp.g.hortmann@gmail.com>
References: <cover.1720245061.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1720245061.git.philipp.g.hortmann@gmail.com>

Remove unused macros.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_mlme.h | 26 --------------------
 1 file changed, 26 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index f939d267b0c7..e103c4a15d1a 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -39,11 +39,6 @@
 
 /* ifdef UNDER_MPTEST */
 #define	WIFI_MP_STATE							0x00010000
-#define	WIFI_MP_CTX_BACKGROUND				0x00020000	/*  in continuous tx background */
-#define	WIFI_MP_CTX_ST						0x00040000	/*  in continuous tx with single-tone */
-#define	WIFI_MP_CTX_BACKGROUND_PENDING	0x00080000	/*  pending in continuous tx background due to out of skb */
-#define	WIFI_MP_CTX_CCK_HW					0x00100000	/*  in continuous tx */
-#define	WIFI_MP_CTX_CCK_CS					0x00200000	/*  in continuous tx with carrier suppression */
 /* endif */
 
 /* define _FW_UNDER_CMD		WIFI_UNDER_CMD */
@@ -75,8 +70,6 @@ enum {
 	GHZ_MAX,
 };
 
-#define rtw_band_valid(band) ((band) >= GHZ24_50 && (band) < GHZ_MAX)
-
 /*
 
 there are several "locks" in mlme_priv,
@@ -252,11 +245,6 @@ struct mlme_priv {
 	unsigned long	timeBcnInfoChkStart;
 };
 
-#define rtw_mlme_set_auto_scan_int(adapter, ms) \
-	do { \
-		adapter->mlmepriv.auto_scan_int_ms = ms; \
-	while (0)
-
 void rtw_mlme_reset_auto_scan_int(struct adapter *adapter);
 
 struct hostapd_priv {
@@ -400,20 +388,6 @@ int is_same_network(struct wlan_bssid_ex *src, struct wlan_bssid_ex *dst, u8 fea
 
 #define rtw_roam_flags(adapter) ((adapter)->mlmepriv.roam_flags)
 #define rtw_chk_roam_flags(adapter, flags) ((adapter)->mlmepriv.roam_flags & flags)
-#define rtw_clr_roam_flags(adapter, flags) \
-	do { \
-		((adapter)->mlmepriv.roam_flags &= ~flags); \
-	} while (0)
-
-#define rtw_set_roam_flags(adapter, flags) \
-	do { \
-		((adapter)->mlmepriv.roam_flags |= flags); \
-	} while (0)
-
-#define rtw_assign_roam_flags(adapter, flags) \
-	do { \
-		((adapter)->mlmepriv.roam_flags = flags); \
-	} while (0)
 
 void _rtw_roaming(struct adapter *adapter, struct wlan_network *tgt_network);
 void rtw_roaming(struct adapter *adapter, struct wlan_network *tgt_network);
-- 
2.45.2

