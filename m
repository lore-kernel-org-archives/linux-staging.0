Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B426229B21
	for <linux-staging@lists.linux.dev>; Fri,  1 Aug 2025 08:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754037168; cv=none; b=i/PsKIX7mw+dx4bonpOXiKlzT8Q0NaDXOJPKSqxm0ElYeweYWp76jsnworjf/TVsuBCjdDaObDT4eLeFjcnNhaaCB4Ae92BZeqZtAFA1J7d/buZZK+0han29t8L7HBetVsFKB/Jpj7Tq+koP7izGkRWKa6y8Qv4R2bunhQc9lcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754037168; c=relaxed/simple;
	bh=Fem8ko9lSvGHfgnIOnh/NvK/frr+MZh+mvHCOWVbchY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K8t0GehII/7OQ0YpM1w3+JKAcF3+IMfk0schuQ4sYsirvL7G/5hz6v8n7fwE9dkLNAc/7lFbphIP5w24y7id0433lv5S8mCZh9sYdiaaXnqBP+bD+9vDFhYsgPmf4PuFPCt8LmgU7FOn2gxLZOdXiIrDFWim+kgO1n3d5qRtUQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e3LhaMgn; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e3LhaMgn"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so2550382a12.2
        for <linux-staging@lists.linux.dev>; Fri, 01 Aug 2025 01:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754037164; x=1754641964; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2bBtvdWNzSZQGm09QORxMyO31qGjWa8u8PjxWCuc9as=;
        b=e3LhaMgn9WZyii049+fF8s2Zpsj+THarrgZqQHjwhSiVfrBaDp4fIZaZM5/+Uf0bGT
         e0oThj2kXRLuV2xWYD36aH8zWquIrN9Us9yuFwptmGdGQUpKRGTyCDbZQaQdT880RxXl
         yV3HCnPe8RuNlL2aj4fc2LY2QBx4Z9Da9+wG7uE6tOBurPLYppyDTXsh+bU0P7iGM5hy
         64bOxrkuWx/Dr2w9hPxyBQ7f6puKe6rCkacblGynpvaUs3okTzsKG+GoDcuRmMcQcPmB
         gpi4oOZ93ieVmJfIj5S6SifFH6I26Wlm+4HzwgI9EBf8HaeEHEDYJTkaIm2Xd6PIcZx1
         /yTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754037164; x=1754641964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2bBtvdWNzSZQGm09QORxMyO31qGjWa8u8PjxWCuc9as=;
        b=H67l8yl1g3T5IUzXc/ZBpMbTyoLeskLo2fevPKNNBqLtN2wWRS1cdXGiL9Z+5g6K0H
         Ix2R09R55CFo0Kg0m0QpwU+WBMKg4rJ7SpcEwQSI7g4G3JwoIzt23kKUbc8zlWQtcvd6
         JPnie2N/Bg4fCG+aEO53eavHyrgelzeTD5+3gakOXvTAcoAKcRFIAdg3IWliBKULcw9b
         2H+PcnjQyDzNcsCaIyFOllTSxfVjcnaQXgnibJls0J/F+ixVZcXo+SLyDOcMZG3UBq+X
         0OUEvnQ/QHPZ6FI8Lzoqb/VyEUxZzABdIxJM+7oDzvda6fLDlOXoapVX/ww1aSm9BS0X
         dwYg==
X-Forwarded-Encrypted: i=1; AJvYcCWRzHKlHfoPc/zz5h1NZFNoQE0mqOUxCSsvtsTyusVNJD88K4dG2TGiVugKlzELLosKLXbrawPCeA8fCPeh@lists.linux.dev
X-Gm-Message-State: AOJu0YxdET9hTbis49bKUfKCcwb7wL+k//dATlwX535B0oXLSioQsu/h
	68f9cqm3976cAknE/oZXfdaAH+jA86GAHT6L/UYaEFPgsFWSVcDZLro0
X-Gm-Gg: ASbGnctwviHwCcehRC3MvWjRP/wFjlrwfkmbR9wCKgIed+OQQ33ww3f8uXHC4g9FvHF
	pd0Rr8Yp252dt6ISLLUjmp21c760iree/qS44WG0OcdGX08RcfWM9BpzQwmbSGVRwFYh86PeQ6T
	iT6bGuiwBn708CnSEvbE9kbf0mR973BtQpADNqEy5B0lyoySA07auRHZ+UyYN8HlR4CF+nSiePH
	d4jFXSiQ+natQH8UCP2XT46RX5D37Q9K/Z4Ah6gRlH07BX+3TbN/8eHpsUuAZ1U6KRswm5hS3gt
	IpLU7UCjpfkKy2r17fAN6agxocdRQrFPNMs4dgfFS5XEgZzXL5CC1NZmYrp7lyZqLwSwy5ZdrlU
	jFnHJzpPZMNrGF9zvWE2A18xrajhxCNOtPUIqv1wwANNW84VqAh/CSgCgjfWhbA==
X-Google-Smtp-Source: AGHT+IGUM2Trs7GoVAhrsokBw8hYDQtQNMKPEPAcNZUU+WeRHA1SHQYaNhbpGznOVlfXrE/+PtCNbw==
X-Received: by 2002:a05:6402:5cb:b0:615:4d3a:9330 with SMTP id 4fb4d7f45d1cf-615cdd06d80mr1766661a12.14.1754037160476;
        Fri, 01 Aug 2025 01:32:40 -0700 (PDT)
Received: from tumbleweed (ip-77-25-33-2.web.vodafone.de. [77.25.33.2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a911a59dsm2362735a12.62.2025.08.01.01.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 01:32:40 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 6/8] staging: rtl8723bs: merge rtw_os_indicate_disconnect into rtw_indicate_disconnect
Date: Fri,  1 Aug 2025 10:31:29 +0200
Message-ID: <20250801083131.82915-7-straube.linux@gmail.com>
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

Merge the functionality of the function rtw_os_indicate_disconnect into the
function rtw_indicate_disconnect to reduce code in the os_dep directory.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v1 -> v2: no changes

 drivers/staging/rtl8723bs/core/rtw_mlme.c      | 12 ++++++++----
 drivers/staging/rtl8723bs/include/mlme_osdep.h |  1 -
 drivers/staging/rtl8723bs/os_dep/mlme_linux.c  | 12 ------------
 3 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index b0384244a950..839496aef933 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -930,10 +930,14 @@ void rtw_indicate_disconnect(struct adapter *padapter)
 	if (rtw_to_roam(padapter) > 0)
 		_clr_fwstate_(pmlmepriv, _FW_LINKED);
 
-	if (check_fwstate(&padapter->mlmepriv, _FW_LINKED)
-		|| (rtw_to_roam(padapter) <= 0)
-	) {
-		rtw_os_indicate_disconnect(padapter);
+	if (check_fwstate(&padapter->mlmepriv, _FW_LINKED) || rtw_to_roam(padapter) <= 0) {
+		/*  Do it first for tx broadcast pkt after disconnection issue! */
+		netif_carrier_off(padapter->pnetdev);
+
+		rtw_cfg80211_indicate_disconnect(padapter);
+
+		/* modify for CONFIG_IEEE80211W, none 11w also can use the same command */
+		rtw_reset_securitypriv_cmd(padapter);
 
 		/* set ips_deny_time to avoid enter IPS before LPS leave */
 		rtw_set_ips_deny(padapter, 3000);
diff --git a/drivers/staging/rtl8723bs/include/mlme_osdep.h b/drivers/staging/rtl8723bs/include/mlme_osdep.h
index 00c0a44c125a..8e8b5de285dc 100644
--- a/drivers/staging/rtl8723bs/include/mlme_osdep.h
+++ b/drivers/staging/rtl8723bs/include/mlme_osdep.h
@@ -8,7 +8,6 @@
 #define __MLME_OSDEP_H_
 
 
-extern void rtw_os_indicate_disconnect(struct adapter *adapter);
 extern void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie);
 
 void rtw_reset_securitypriv(struct adapter *adapter);
diff --git a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
index 326acbd8dc84..d2f4855e9d9d 100644
--- a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
@@ -66,18 +66,6 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 	spin_unlock_bh(&adapter->security_key_mutex);
 }
 
-void rtw_os_indicate_disconnect(struct adapter *adapter)
-{
-	/* struct rt_pmkid_list   backupPMKIDList[ NUM_PMKID_CACHE ]; */
-
-	netif_carrier_off(adapter->pnetdev); /*  Do it first for tx broadcast pkt after disconnection issue! */
-
-	rtw_cfg80211_indicate_disconnect(adapter);
-
-	/* modify for CONFIG_IEEE80211W, none 11w also can use the same command */
-	rtw_reset_securitypriv_cmd(adapter);
-}
-
 void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
 {
 	uint	len;
-- 
2.50.1

