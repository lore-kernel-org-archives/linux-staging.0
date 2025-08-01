Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF15221772A
	for <linux-staging@lists.linux.dev>; Fri,  1 Aug 2025 08:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754037161; cv=none; b=qsWOmH6RrE7FN/A7+bIrpVEamlRHAGGidlsz7OzTtFS7KBYHgbRPz/+X/lUTe2N6uytlU54zOqBfz7EMBMNWvvAe9urlJsPcXKNYEwcA/u4K/BcEwbaKPznJPV0HEctMuuiy/Gyv0u4RGHbWa66aBeWS6p/cs0Oww7DL4isMxm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754037161; c=relaxed/simple;
	bh=429Dsz1UXCl+tc4Qfhqn6rxGh5DaOcSImn2Rmb4v8WI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iTagSf+ftWWcm2CD5fyiQsHjzaBK+22jK6ibR93YNoxYtRwxfU0rRa8SROiKEbLYx5Vl+E2f4mtLW60z1idBHfG8d1S/AZgVwPE6kSmiHzqrTojXvkb0EVYGAambECNVnKgKcXsIyOOo6ZJ4JDQUD88QNikxuwqzUgT1jRoRUj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kKLwNLo1; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kKLwNLo1"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-615378b42ecso1013558a12.0
        for <linux-staging@lists.linux.dev>; Fri, 01 Aug 2025 01:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754037158; x=1754641958; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SvAoNTM7MhnTBXwN9OXdWpK9Cl2xaDI6Blg0pAmiyvk=;
        b=kKLwNLo1wV1hrVAN701nAoiop0v1jzyajqhq3eBeaaMR7CgBT2FUR4uSS6x4I0E1fk
         Y5qxyTZasRC3qEPVQb6967pp//Mpd8Dwk1dtYOnlwgWsC8LETHWyKX1cHf/LWhOeptq4
         u8Pw9fS1BxLygZWhNZrogf0H2c6oFsxADVvy4+Jgjmjy2UXuzY5Ww17mMEQypEKFkFae
         e6xQibAkik74h5BFX0/APBpRJtiZaYUaUKsHarEjfSp9wIFEVS1z5lLv7vImAI9QwpNp
         srm0QFaktPRUrWlVifUym5ubST8QQhc4qC9PaafIL5l9BJW1pkkgAb++NUu4TrqR9yWN
         Nitg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754037158; x=1754641958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SvAoNTM7MhnTBXwN9OXdWpK9Cl2xaDI6Blg0pAmiyvk=;
        b=UU4K1gKjU+AHw2wqgsXkWJMi7yKKb37YyUv01U1+DkfihIMRX5Wa40ZczmV6cDXw0N
         GGiRsmXcJ1MXBGggV0cxaSiwxATyHBazShZ30EQt2o6amF/AeoICDfptdO2S9ficJgpk
         SXTnOlEhrcexlWZlPhdKAXPKEqrtv226aXOTscpNEIWr39ZlpWihd/dDY1FfhwOveZNt
         hDvm/Bpwx3omYBBtMlUOxvqKSI8pT1uS8yEv2z5jHOVMuE4Iht+TIH5IU8CVhLSfdtET
         QJ5TjM5yFsTKPaNiaAiVeLvkIgW4038DJAlA4ETs+O0ymUfn/y/p7zNRoWSiRUako0WG
         2fvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYFm/g5ZPetDUvGXWjq5k10VZS8j2J6Bg0i84VkmSItSmpauvQ1EKDUsm90QolBmlMl8taNc4IjWwcdxZv@lists.linux.dev
X-Gm-Message-State: AOJu0Ywz7TKKtiVt5SDFyizumdDiRrMd04OglIIslFQY2mfm3isczjs7
	UPACn9ifTcUoACpNunDHKv0b1HglIdtNfk5g5djaPxtG32ewA6E1LS4h
X-Gm-Gg: ASbGncuzZRa73T3D/qJD1iCKpE7avVphKgHsOUdqnj6j3reDm40lrqJHN0aj8wc3GAo
	tSmvFDWlYUxltyrOHVIWAva1G5R9j4szFIfw6RKg71WKtlI/Sf3lzDKBFhX8CAk5DuuAtvoHPgz
	VWsP8+3Li/j6FvDdadeDwVR+9zqxR07SIS3QckUbwB01vvUbECZVx/lVAggqLaor4TE+OpRVGUF
	PJo46W6GCDtmGaKzyjGz+NmOQD6z7k0kgjmKuwTqV7RlPJGaZ+zIV3/csGIaFSRQRX49wg/3YoR
	iGkaLZETXd04wh1ScOGzNFiI7pZ+k2TEHN53eBljTeJ3T3jOc/S+sDWuCold/730keSA3WqZ29d
	J9TZdlcJ1dy8j4IXbCAtJoDwUw4PPmYzwXbtlKm2h+wS1O1ub6+Vk7QZWwxT0rA==
X-Google-Smtp-Source: AGHT+IG9UtA818tUQyzTBxmyycijLf90jRyxH1yIxm+p2IBSQn5NV1nmQ8MpIGTh4noUUEDvN6MmGQ==
X-Received: by 2002:a05:6402:210a:b0:615:b6b9:d859 with SMTP id 4fb4d7f45d1cf-615b6b9db0dmr5281972a12.3.1754037158132;
        Fri, 01 Aug 2025 01:32:38 -0700 (PDT)
Received: from tumbleweed (ip-77-25-33-2.web.vodafone.de. [77.25.33.2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a911a59dsm2362735a12.62.2025.08.01.01.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 01:32:37 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 3/8] staging: rtl8723bs: move rtw_init_mlme_timer to core/rtw_mlme.c
Date: Fri,  1 Aug 2025 10:31:26 +0200
Message-ID: <20250801083131.82915-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250801083131.82915-1-straube.linux@gmail.com>
References: <20250801083131.82915-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the function rtw_init_mlme_timer from os_dep/mlme_linux.c to
core/rtw_mlme.c to reduce code in the os_dep directory.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v1 -> v2: add back accidently removed tabs

 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 30 +++++++++++++++++++
 .../staging/rtl8723bs/include/mlme_osdep.h    |  1 -
 drivers/staging/rtl8723bs/os_dep/mlme_linux.c | 30 -------------------
 3 files changed, 30 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index ebc4bd6ecce9..2e957f00bd75 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -9,6 +9,36 @@
 #include <hal_btcoex.h>
 #include <linux/jiffies.h>
 
+static void _dynamic_check_timer_handler(struct timer_list *t)
+{
+	struct adapter *adapter =
+		timer_container_of(adapter, t, mlmepriv.dynamic_chk_timer);
+
+	rtw_dynamic_check_timer_handler(adapter);
+
+	_set_timer(&adapter->mlmepriv.dynamic_chk_timer, 2000);
+}
+
+static void _rtw_set_scan_deny_timer_hdl(struct timer_list *t)
+{
+	struct adapter *adapter =
+		timer_container_of(adapter, t, mlmepriv.set_scan_deny_timer);
+
+	rtw_clear_scan_deny(adapter);
+}
+
+static void rtw_init_mlme_timer(struct adapter *padapter)
+{
+	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
+
+	timer_setup(&pmlmepriv->assoc_timer, _rtw_join_timeout_handler, 0);
+	timer_setup(&pmlmepriv->scan_to_timer, rtw_scan_timeout_handler, 0);
+	timer_setup(&pmlmepriv->dynamic_chk_timer,
+		    _dynamic_check_timer_handler, 0);
+	timer_setup(&pmlmepriv->set_scan_deny_timer,
+		    _rtw_set_scan_deny_timer_hdl, 0);
+}
+
 int	rtw_init_mlme_priv(struct adapter *padapter)
 {
 	int	i;
diff --git a/drivers/staging/rtl8723bs/include/mlme_osdep.h b/drivers/staging/rtl8723bs/include/mlme_osdep.h
index c84c84c68286..4bb7a01caf4a 100644
--- a/drivers/staging/rtl8723bs/include/mlme_osdep.h
+++ b/drivers/staging/rtl8723bs/include/mlme_osdep.h
@@ -8,7 +8,6 @@
 #define __MLME_OSDEP_H_
 
 
-extern void rtw_init_mlme_timer(struct adapter *padapter);
 extern void rtw_os_indicate_disconnect(struct adapter *adapter);
 extern void rtw_os_indicate_connect(struct adapter *adapter);
 extern void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie);
diff --git a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
index d22d6cf3cb11..5cb27ddab769 100644
--- a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
@@ -6,36 +6,6 @@
  ******************************************************************************/
 #include <drv_types.h>
 
-static void _dynamic_check_timer_handler(struct timer_list *t)
-{
-	struct adapter *adapter =
-		timer_container_of(adapter, t, mlmepriv.dynamic_chk_timer);
-
-	rtw_dynamic_check_timer_handler(adapter);
-
-	_set_timer(&adapter->mlmepriv.dynamic_chk_timer, 2000);
-}
-
-static void _rtw_set_scan_deny_timer_hdl(struct timer_list *t)
-{
-	struct adapter *adapter =
-		timer_container_of(adapter, t, mlmepriv.set_scan_deny_timer);
-
-	rtw_clear_scan_deny(adapter);
-}
-
-void rtw_init_mlme_timer(struct adapter *padapter)
-{
-	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
-
-	timer_setup(&pmlmepriv->assoc_timer, _rtw_join_timeout_handler, 0);
-	timer_setup(&pmlmepriv->scan_to_timer, rtw_scan_timeout_handler, 0);
-	timer_setup(&pmlmepriv->dynamic_chk_timer,
-		    _dynamic_check_timer_handler, 0);
-	timer_setup(&pmlmepriv->set_scan_deny_timer,
-		    _rtw_set_scan_deny_timer_hdl, 0);
-}
-
 void rtw_os_indicate_connect(struct adapter *adapter)
 {
 	struct mlme_priv *pmlmepriv = &(adapter->mlmepriv);
-- 
2.50.1

