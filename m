Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B061C21E3A6
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 10:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729072962; cv=none; b=Y2iDQWDV04xdrBnFH53QLjKs7YpZt791DlUcYQFaNn7/833STVVtoKVs6x4+QX+7BplYdWi+x8xNLqAtWEDj/poQPmykiQKCW4CYwhpwMHvbS80wK5WuB+iJOs5mNQVPeFUxtREjTJm+3wD8vNxNPe5gXTGfKxfxS6gF9AqqWBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729072962; c=relaxed/simple;
	bh=C++QMyEQ2pxhdyaVUO+MoRTh8k8ZqZt6zFA+ffUkh4I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JUiLsbV1Tvx932tjUmLJzec91Hxg1CoJgpHEs889Io/q5vdZ0S6RXQ+eGnFfg0m99Z+cgfaMXvPiHf30/NBy5DelG67uYcH3vUNPtty32etTj3mVBK7+Lo9ufuOLPObNY4VUaawIhGrD2sL6tabOkXYl47TsRUiN8YBLZ2mKZ04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wxhn4PjH; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wxhn4PjH"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37d4821e6b4so3930467f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 03:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729072959; x=1729677759; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NEWGIv/W0Vu43Mfbpxxo37gcCLVTifJvZOU7qVvZ2Zg=;
        b=Wxhn4PjHYbDyyXu3fRoWnmpoHqM/NWxrsTtFzEH7GgoJvmefCbyx+WrQf38ERoWr3U
         VaOyizpf8EvOTNS9Ocd64J91Tj23nZYXT+kzw9JiaN6Mc2tRR5zRATJeJyQDB5pYtyHb
         erF/n1mgosfyZZVVuYhmGYAgEG4uGrkNq7BfJigbnQt5POyRLx9p91kHg1ZSBvPus3Nf
         VRgD+BVjku6uHOVVTo/nYsHvgznUfPfzsW6bR3VnHiE0pu9CC1WJlNgz6nv58Iaw4Tpb
         TRLnCW7icXkzzEvm6JLNNqvXDRJhsVdGIzvqt/UD0XzPeA+BXvcHDNab1ZNdXuV+Q6n3
         4ELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729072959; x=1729677759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEWGIv/W0Vu43Mfbpxxo37gcCLVTifJvZOU7qVvZ2Zg=;
        b=prlD3y0/36qV9iLFhh1zbWY1+LqzvCKPh2rTXcioHG2hX71p5+RYKldmM85yELKROC
         tYSSLlAiwtqrW/ekN71S93X9Z7uaF6N9xFaeL+TBV5iG+59qX3Yyaucr5DzR4Aup3rBI
         0YUU5E6Lw05Q/1steolnTweTTQR0EwNQDJNQcz7R/Ia/0Ms6IHGSZvc0ZwlDf5tCDY1K
         r8yFQDYbN/KyEWpALPWM4WlkdhjY0P/BaqKo0qaELyHKhHUInp1myJp+AYWnfhYoJs5v
         IBz6f2vnYAqpARxbgUUMRpIt8W0U4Yg+9a0YS4Xh/lLVO95ITvY2+UnexErWFBjcGYeq
         /fCg==
X-Gm-Message-State: AOJu0Yzgl59RCaW9HzN2eFO1ljECRpAU4JsCOQekuBV/VoYmupl8fGwK
	oYPqfPoO7rLuf4Z3tOdCe0bb//z+eNpaXvoLxX2TFECSpffT/yVaiC70NhBP0gc=
X-Google-Smtp-Source: AGHT+IEWOs1B0El3l8mAkw0eAJKA+glRNJZztM0qBoYA6nv6I3V7T3lcZovN/Nokpu5QXqrZPgXOKQ==
X-Received: by 2002:a5d:5541:0:b0:374:c3e4:d6de with SMTP id ffacd0b85a97d-37d86d5044dmr2538715f8f.41.1729072958904;
        Wed, 16 Oct 2024 03:02:38 -0700 (PDT)
Received: from ARL1114-LINUX.. ([196.233.5.237])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa926e3sm3876657f8f.61.2024.10.16.03.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 03:02:38 -0700 (PDT)
From: Aymen Khalfa <a.khalfa.1012@gmail.com>
To: gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net
Cc: linux-staging@lists.linux.dev,
	Aymen Khalfa <a.khalfa.1012@gmail.com>
Subject: [PATCH] drivers: staging: rtl8723bs: Fixed coding style issues and msleep() issue.
Date: Wed, 16 Oct 2024 12:02:24 +0200
Message-Id: <20241016100224.2449224-1-a.khalfa.1012@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

-Fixed brace coding style issues.
-Fixed unaligned comments coding style issue.
-Replaced msleep(1) with usleep_range() as recommended in documentation.

Signed-off-by: Aymen Khalfa <a.khalfa.1012@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 31 ++++++++++----------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index dbfcbac3d855..d88e9f5bc1e8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -56,9 +56,9 @@ int _ips_leave(struct adapter *padapter)
 		pwrpriv->ips_leave_cnts++;
 
 		result = rtw_ips_pwr_up(padapter);
-		if (result == _SUCCESS) {
+		if (result == _SUCCESS)
 			pwrpriv->rf_pwrstate = rf_on;
-		}
+
 		pwrpriv->bips_processing = false;
 
 		pwrpriv->bkeepfwalive = false;
@@ -429,15 +429,15 @@ s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
 			err = -1;
 			break;
 		}
-		msleep(1);
+		usleep_range(1000, 2000);
 	}
 
 	return err;
 }
 
 /*  */
-/* 	Description: */
-/* 		Enter the leisure power save mode. */
+/*	Description: */
+/*		Enter the leisure power save mode. */
 /*  */
 void LPS_Enter(struct adapter *padapter, const char *msg)
 {
@@ -476,8 +476,8 @@ void LPS_Enter(struct adapter *padapter, const char *msg)
 }
 
 /*  */
-/* 	Description: */
-/* 		Leave the leisure power save mode. */
+/*	Description: */
+/*		Leave the leisure power save mode. */
 /*  */
 void LPS_Leave(struct adapter *padapter, const char *msg)
 {
@@ -556,9 +556,9 @@ void LeaveAllPowerSaveMode(struct adapter *Adapter)
 
 		LPS_Leave_check(Adapter);
 	} else {
-		if (adapter_to_pwrctl(Adapter)->rf_pwrstate == rf_off) {
+		if (adapter_to_pwrctl(Adapter)->rf_pwrstate == rf_off)
 			ips_leave(Adapter);
-		}
+
 	}
 }
 
@@ -591,7 +591,7 @@ void LPS_Leave_check(struct adapter *padapter)
 		if (jiffies_to_msecs(jiffies - start_time) > 100)
 			break;
 
-		msleep(1);
+		usleep_range(1000, 2000);
 	}
 }
 
@@ -1011,15 +1011,16 @@ void rtw_free_pwrctrl_priv(struct adapter *adapter)
 inline void rtw_set_ips_deny(struct adapter *padapter, u32 ms)
 {
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
+
 	pwrpriv->ips_deny_time = jiffies + msecs_to_jiffies(ms);
 }
 
 /*
-* rtw_pwr_wakeup - Wake the NIC up from: 1)IPS. 2)USB autosuspend
-* @adapter: pointer to struct adapter structure
-* @ips_deffer_ms: the ms will prevent from falling into IPS after wakeup
-* Return _SUCCESS or _FAIL
-*/
+ * rtw_pwr_wakeup - Wake the NIC up from: 1)IPS. 2)USB autosuspend
+ * @adapter: pointer to struct adapter structure
+ * @ips_deffer_ms: the ms will prevent from falling into IPS after wakeup
+ * Return _SUCCESS or _FAIL
+ */
 
 int _rtw_pwr_wakeup(struct adapter *padapter, u32 ips_deffer_ms, const char *caller)
 {
-- 
2.34.1

