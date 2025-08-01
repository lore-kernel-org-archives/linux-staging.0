Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB888220F2B
	for <linux-staging@lists.linux.dev>; Fri,  1 Aug 2025 08:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754037163; cv=none; b=F93aI9yz+OlP0YZsQQNOpCokYM5jre3uWPdH+P+OOHdgEp/b556jzE0N/Z1MvuQPR1/FKx9M7uh29n+BwXNPHkfwM1g4ZMsdSzXI0RXOEOCsFbvmrnUsyqrqdk6J0oI5PARcm4RnrQOr3IyX9BeyFO4Mm6owHYpWlhfbTk7xXOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754037163; c=relaxed/simple;
	bh=u4ILaCmJ1NI7frw+wzMCZE2/gYH+BzJEYUtfuQsAqfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N7cx153C2/Ky9EEyKwRJAKK6LIL5FYGpG2O/Gsn+CRwTXJ6X0q/Sse+wCDkrY3m4Fah14/deAXh9FSmjmHYE7rqGIvBObMfQWChdlqpCbTxHaKyQldUKCSBZ4TTs8JEJX/8SjGP64QkTpkQNEJyw3Tc+qhkpI89PDF+0iULmCBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTZjx0UD; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTZjx0UD"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-61589705b08so3740418a12.0
        for <linux-staging@lists.linux.dev>; Fri, 01 Aug 2025 01:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754037160; x=1754641960; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTHDESjkBUS6IAMRUedeGkKS6hmPI5IEjbKpB43coI8=;
        b=MTZjx0UDX2qdAZ4WivZbmiZ7T9e2bOPBYSlUV/8yFp6gGW40AGKTT5TeGCUSE0GRYx
         ueihjBmsmtCbX4rEvZYiWOTbx3SffruSKmSUs5cwOw/mG4mTgIRWjJ5Ycn74ypxex791
         vHeX/ToHa106Y/j1+n3KOGsDOrpnH42fE5aSIs1zm9BKYbQL/C9e1abcBcalSX4LMsxF
         hBIR1rT4xTaEG4CnXrAXWcuUNWDjI/R/i2v64EFUU+8l7+XzXzXBmPHmUMK4lXOKpJdD
         v0Q9GjWFTvi2Zen/g12Or1aKe7M9QJwI0OGR695cbIQ/2qXreX1lRO8wp2e2AB7ii4BF
         lgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754037160; x=1754641960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rTHDESjkBUS6IAMRUedeGkKS6hmPI5IEjbKpB43coI8=;
        b=scl8IKKCLwpaijbdBjx4ZEWLFs0VvfMvzYkLeRuHm4P5mFlCirqvWBH/bbP0gsKU4A
         eTMoUZBODDsOg+ekBhgjB5+cTh/FuIdYZlOmdhAJEq9zNCD+38DYOWQl0Ju5atu9Q/U6
         UzCjW0u+H0LjPgmPC7Rf9Cb04kOjFGCuyuXN17RTysXQtR6FeYREjQejW//kT+I4W5hY
         OvldXGwdS1Reg1yTmD3uOLUACppzG/Z1zdM7Ei6WIHQeNxc4H4teb6ZxGU1hhuJoXsPs
         0yGEQHkQGWULuJnUmVmzc6hnlgXoPC06/MwzVN3UY1HO4LtJZoXZKY7eMi5Gx2is9HeY
         LCcw==
X-Forwarded-Encrypted: i=1; AJvYcCU7hE05JCpHC+KuH7EpUIQbFPWF3/H873nKUK5HhRLXRIMhYqt75Rd+MM3jRGZjmQqT1rsA/3fK41ZRvb4u@lists.linux.dev
X-Gm-Message-State: AOJu0YwjVroG+G3WUBLOAWqnCq+5VMibR4SWss8y+p3dnpqkE3j0FAEi
	7gYNnPPzcClYUwBfgRyybwNCLIu4bN8aOGUeE+rQPelZUlUX6yNBMJWP
X-Gm-Gg: ASbGncu/9loKcE7R8HhJoNv2aubnxevlvsZiWnOFsjq6iUM4xCXcbW27tC680U/T0Bp
	SHmVwNARuwPLf6NIamAhAEQTe/TBW+wNZdvhLOegYRlRUSINgZVxjdeSqLJk8SkhmF0eeAuP1bu
	QuY4+Q1iB52WDsZaG5ETpla16OhnI9UIVkYjGg3kpqnnxnjekG6i50GJRAtok43XXJgMpWWR/Qb
	SruB+fBVZ49/Eesj6H7cGX5wxqaVg7gRh6d9mhhmhIwmtTtS0Cn8oNpRbizgrfvQ+KelA1vwbAj
	CV9vsA0Gx/367NRP9Lt3cl6j/GGSVrAUspbJCpJE7lofpj/MDfs9ii7dJ9fVkHEUalxHwOJChxS
	7Jt/cl8npZ1t+F5f0qZ40JyMEtkX8qC1igHthxaDifzn2WFFlvKIbfC176E6mOw==
X-Google-Smtp-Source: AGHT+IHO1dD7rOATDlB/3W92rSORtlW5/aV6FE72dj4ndusMskVWj81AZO9BAxh5Wt6Hjv0zjjXEcA==
X-Received: by 2002:a05:6402:4302:b0:615:a5d5:972c with SMTP id 4fb4d7f45d1cf-615a5d599e9mr6125936a12.6.1754037159717;
        Fri, 01 Aug 2025 01:32:39 -0700 (PDT)
Received: from tumbleweed (ip-77-25-33-2.web.vodafone.de. [77.25.33.2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a911a59dsm2362735a12.62.2025.08.01.01.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 01:32:39 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 5/8] staging: rtl8723bs: merge rtw_os_indicate_connect into rtw_indicate_connect
Date: Fri,  1 Aug 2025 10:31:28 +0200
Message-ID: <20250801083131.82915-6-straube.linux@gmail.com>
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

Merge the functionality of the function rtw_os_indicate_connect into the
function rtw_indicate_connect to reduce code in the os_dep directory.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v1 -> v2: no changes

 drivers/staging/rtl8723bs/core/rtw_mlme.c      | 13 +++++++++++--
 drivers/staging/rtl8723bs/include/mlme_osdep.h |  1 -
 drivers/staging/rtl8723bs/os_dep/mlme_linux.c  | 17 -----------------
 3 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 2e957f00bd75..b0384244a950 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -901,12 +901,21 @@ void rtw_indicate_connect(struct adapter *padapter)
 
 		set_fwstate(pmlmepriv, _FW_LINKED);
 
-		rtw_os_indicate_connect(padapter);
+		if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) ||
+		    check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
+			rtw_cfg80211_ibss_indicate_connect(padapter);
+		} else {
+			rtw_cfg80211_indicate_connect(padapter);
+		}
+
+		netif_carrier_on(padapter->pnetdev);
+
+		if (padapter->pid[2] != 0)
+			rtw_signal_process(padapter->pid[2], SIGALRM);
 	}
 
 	rtw_set_to_roam(padapter, 0);
 	rtw_set_scan_deny(padapter, 3000);
-
 }
 
 /*
diff --git a/drivers/staging/rtl8723bs/include/mlme_osdep.h b/drivers/staging/rtl8723bs/include/mlme_osdep.h
index 4bb7a01caf4a..00c0a44c125a 100644
--- a/drivers/staging/rtl8723bs/include/mlme_osdep.h
+++ b/drivers/staging/rtl8723bs/include/mlme_osdep.h
@@ -9,7 +9,6 @@
 
 
 extern void rtw_os_indicate_disconnect(struct adapter *adapter);
-extern void rtw_os_indicate_connect(struct adapter *adapter);
 extern void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie);
 
 void rtw_reset_securitypriv(struct adapter *adapter);
diff --git a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
index f85e17ae0e7f..326acbd8dc84 100644
--- a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
@@ -6,23 +6,6 @@
  ******************************************************************************/
 #include <drv_types.h>
 
-void rtw_os_indicate_connect(struct adapter *adapter)
-{
-	struct mlme_priv *pmlmepriv = &(adapter->mlmepriv);
-
-	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true) ||
-		(check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true)) {
-		rtw_cfg80211_ibss_indicate_connect(adapter);
-	} else {
-		rtw_cfg80211_indicate_connect(adapter);
-	}
-
-	netif_carrier_on(adapter->pnetdev);
-
-	if (adapter->pid[2] != 0)
-		rtw_signal_process(adapter->pid[2], SIGALRM);
-}
-
 static struct rt_pmkid_list   backupPMKIDList[NUM_PMKID_CACHE];
 void rtw_reset_securitypriv(struct adapter *adapter)
 {
-- 
2.50.1

