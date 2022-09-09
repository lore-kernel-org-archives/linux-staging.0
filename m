Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A1D612E
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 19:21:16 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id b35so4038985edf.0
        for <linux-staging@lists.linux.dev>; Fri, 09 Sep 2022 12:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date;
        bh=MkAY/Jcu/hkscnGDVcOYDI45azzXGp9MrTrjBXlU/cA=;
        b=au1S7C3TORZbne2ymkdz4Gjz1ynnIJR9sm2Hkb2weOmzXTcshEODiY4BRU5Q4WCKDV
         Ai+n1LpoIEh7CeGyW7ykmhVbgMo3ekrF8jh7c+SOdPreNgV72nsalQzhr7BVfgdrdFG6
         Iz9qVGXWbuO3tYUAVFoJzMUA6rNzCaNH1OPTbYYU02lWdkEnynPp6ZmzAfkyKqKy9h6y
         ZokA6B+OWvFWDlx+0vxrrtczP4K9GU8iQpPeewvmHxTu61ZRaFyCkBOs9LidWALvC0ni
         Nr/cMKBfvF/BiaIOYmcAL79c9ZPL+xm7bDgOCOf9FRmlk3PlT71OfxdoXyngXMlI1rXZ
         OhEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=MkAY/Jcu/hkscnGDVcOYDI45azzXGp9MrTrjBXlU/cA=;
        b=LAQ4V0+wUFVQKVzRiieRANnr+jaGMWi2+PQXujQLQvpJUtS9bij6Hj/XpjqDP9WPel
         kuR8LmvxbSm8P6K2c7G+ng/igQLLxr1o5TVU3OZ3W4+k2DQzdKHsbtner8HoY6xdl//k
         ZaxhqyOI+TSaCmIE9fo9u65WrDRO57lWYnLljd27mPidxM4jLx6xBtEYsSiVwWEcVKMa
         o0saX1E2iyXoK2vfgpD2QZmdycqw2oqWBQTCVSa2/ANk3qvLWGtBqadBMtkBY8MFJP3b
         Deyc8wdz6hLtCmGWlJ1697KV+wYohix5UxU/GT2/bQXmimg7cCUCKPfgvApTnXdbIORL
         ZXzQ==
X-Gm-Message-State: ACgBeo29X+dF3KCBEGaMEiRU2QSM5nZyvE2Zlu8AJUiRX+oQaOOP5oR6
	ieim2SkqKpqzjVTMYEwypns=
X-Google-Smtp-Source: AA6agR4iO7uEvZ6T8gHyCCuuNYv6WhbBg9DMz2grQwKWvsXDsZ+HOE1A8lPM03V8IT4f+YWZGoHoeg==
X-Received: by 2002:a05:6402:34c2:b0:44f:322f:f0de with SMTP id w2-20020a05640234c200b0044f322ff0demr9775354edc.297.1662751274410;
        Fri, 09 Sep 2022 12:21:14 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id u2-20020a1709061da200b00764a76d5888sm672812ejh.27.2022.09.09.12.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 12:21:13 -0700 (PDT)
Date: Fri, 9 Sep 2022 21:21:11 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/8] staging: rtl8192e: Rename bActionAllowed
Message-ID: <e8b617ab58c360bb485cb51d080a8ef81cd47869.1662402870.git.philipp.g.hortmann@gmail.com>
References: <cover.1662402870.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1662402870.git.philipp.g.hortmann@gmail.com>

Rename variable bActionAllowed to action_allowed to avoid CamelCase which
is not accepted by checkpatch.pl.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 005c4fd966eb..e904a8704e5d 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -137,7 +137,7 @@ bool rtl92e_set_rf_state(struct net_device *dev,
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 	struct rtllib_device *ieee = priv->rtllib;
-	bool			bActionAllowed = false;
+	bool action_allowed = false;
 	bool			bConnectBySSID = false;
 	enum rt_rf_power_state rtState;
 	u16			RFWaitCounter = 0;
@@ -177,7 +177,7 @@ bool rtl92e_set_rf_state(struct net_device *dev,
 
 		if (!priv->rtllib->RfOffReason) {
 			priv->rtllib->RfOffReason = 0;
-			bActionAllowed = true;
+			action_allowed = true;
 
 			if (rtState == eRfOff &&
 			    change_source >= RF_CHANGE_BY_HW)
@@ -202,19 +202,19 @@ bool rtl92e_set_rf_state(struct net_device *dev,
 		if ((change_source == RF_CHANGE_BY_HW) && !priv->bHwRadioOff)
 			priv->bHwRadioOff = true;
 		priv->rtllib->RfOffReason |= change_source;
-		bActionAllowed = true;
+		action_allowed = true;
 		break;
 
 	case eRfSleep:
 		priv->rtllib->RfOffReason |= change_source;
-		bActionAllowed = true;
+		action_allowed = true;
 		break;
 
 	default:
 		break;
 	}
 
-	if (bActionAllowed) {
+	if (action_allowed) {
 		rtl92e_set_rf_power_state(dev, state_to_set);
 		if (state_to_set == eRfOn) {
 			if (bConnectBySSID && priv->blinked_ingpio) {
@@ -228,7 +228,7 @@ bool rtl92e_set_rf_state(struct net_device *dev,
 	spin_lock_irqsave(&priv->rf_ps_lock, flag);
 	priv->RFChangeInProgress = false;
 	spin_unlock_irqrestore(&priv->rf_ps_lock, flag);
-	return bActionAllowed;
+	return action_allowed;
 }
 
 static short _rtl92e_check_nic_enough_desc(struct net_device *dev, int prio)
-- 
2.37.2

