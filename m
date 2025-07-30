Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE772291C23
	for <linux-staging@lists.linux.dev>; Wed, 30 Jul 2025 10:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753872312; cv=none; b=dkrTUUzD8ChKsDXsNC7NzF79HsT6CJQHYvNQMV2ujYZbUubI55B32DqUCuT8F/AkAkNECwzNd27GLB66I0MDnCOM98vlkQreRE9ZfCbVKWUkL66wcR9PEx7z2jDkEr0/RsoL90dRsvMHsVdg/K9Pwbty42PoZPuwcFrXLDwl4CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753872312; c=relaxed/simple;
	bh=L77oU8lZo3lzX41cIKGEPd9c8cdZbSewguoNoT1+x70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bJvHNNx+JOisZWOh/yV15MKZ+wmvHt9/xCn2FLCFdtGIto0Sh7AXFpyCHoIWeWWWFf6XLilSBVnqZ925QpVD9YprwwvqylMcasJ2GapMgNUDXBY8NS+Id2j7dgArPDEHA7z5mIgb+rit9RkOA/bvJzrSvLStdpNr9029qmkvHf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xy2QwW80; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xy2QwW80"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-615378b42ecso6106872a12.0
        for <linux-staging@lists.linux.dev>; Wed, 30 Jul 2025 03:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753872309; x=1754477109; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHtF4hBBASGxHUgQMYqKRKFf8D8GGRC79rjCKEZrjZg=;
        b=Xy2QwW80rRcw2Nd6WQqeuCg23YPTqt5zNlmFpi6gkYOhz3iuN+cS5O5gNKmxa5kxF5
         R5zLh0njVaBpH13bLRUlkKy+HgOoRdENGCh+ZSkJEhLD+ATl0zAxY9tVS0nnTXwDyKA8
         IfJu2HufPXPKPyubZOc4069b5PtwLgDDlHNG413DWmclEnXa/Lb9tFKDYWJz9t0qkCjJ
         t+DvTfL6wIoxsu8Ke0S0XmWWx9mO1THBKVZSJZGaO++wPcR7Yq23AZ3U8L6UD/h6OLOP
         NA/Rn1Ms5Ffscy5hS6916R5zNRBgp9czx+B+z8Hx1VmPEJYsCpD7VvbLD2lAZU3ujz9g
         NgKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753872309; x=1754477109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AHtF4hBBASGxHUgQMYqKRKFf8D8GGRC79rjCKEZrjZg=;
        b=jleKdU9cRrtXrS20gsb/h4/03Y0ojffHCwfIqDMWhbFNDo/bcsJMX2H69MOS2kIpOW
         lemtBlgtlTH10PZpxiSOZmdoqI3+xILDJHoVhgfAutHjDEo4fMSTFHixrV3qAq9SIFPm
         LEZ6GSEusMC9HI2N2ocjmXOLFsEcmSzx2pjqAf5DMR/SGlNuU6jsbvkm2R4zak6WpQNX
         PEhiNP6Nx5EacrD4hbVCXaXVuJnDHwcvv0eDGmgjNpFUOFzK6ROBca1O8shfmWiDp8g7
         UKt+GjQZydI60ASOcMaRL7s2ywAxF4IlzPllYDwYkUevQ33ZsojVk2AvrWwp9kyDfN2Y
         1myA==
X-Forwarded-Encrypted: i=1; AJvYcCXm10ZwlaMkOti4zHzf8vYU0a1TYXjp5ur67s/xWqlNyFietjUELaf6MgKKnjZYoHxsOQsSWJkGPcJ0Yfws@lists.linux.dev
X-Gm-Message-State: AOJu0YzvxERNLPFkVXn8xSUNgTtY+oG7h412dcY6D+EHG3PT6flhFIuW
	Rx+i4KQ3o57IAEpDfEzOq16WmNByjVJyp3vZz3MNneZdWYNIVT++f8Rd
X-Gm-Gg: ASbGncvw8oH5rZ8T+II6BIO14WUDMG8IDoUUlvboJEAvZ0Sj4nh3rsweptB0xTcCYKs
	7o4LeITPSbeLhHBw8y1XDPrEIPJdx/1ndOPZJloxdFw+o1KGtbw+z373yfc4szlgllcqTx/I1CK
	l4WkLL7lEvg3kXyUtNW+0nYiViRhLK32L38iO9bLVwSuac5RnY96g0LMe4fu85zIgbOkKzvFl2v
	9W4Pa6AFUU3N5NjMwIcSb8bqkUOZZQsmyvSGCN55nGWRAXJYqmElOoFrT76pdwFiyCYevAvLj++
	diz72TudSb1gbkbHnrlubNHM7uAnTnfpeiWXBDpTinpFoa/++GhXa7FfllU36HPAPLUMGz6fyd2
	H+wh2V0Mim94ZIVhwwGMqpzN6+StyrXc8lYxkHgp2H1OqAPzz36laXQSpsEOJaP053EI=
X-Google-Smtp-Source: AGHT+IEtUMni+dyL/zZ5x2IMONY/kuNiW77XyB8eQcmhC0XIqdWrLXMCvMYcprCXdHoQpdcQCthApQ==
X-Received: by 2002:a05:6402:520d:b0:612:cdb2:d4d7 with SMTP id 4fb4d7f45d1cf-61586f6213fmr2816821a12.15.1753872308995;
        Wed, 30 Jul 2025 03:45:08 -0700 (PDT)
Received: from tumbleweed (ip-77-25-32-208.web.vodafone.de. [77.25.32.208])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6157974fde0sm1582734a12.7.2025.07.30.03.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 03:45:08 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/8] staging: rtl8723bs: remove wrapper rtw_os_indicate_scan_done
Date: Wed, 30 Jul 2025 12:44:54 +0200
Message-ID: <20250730104501.150270-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250730104501.150270-1-straube.linux@gmail.com>
References: <20250730104501.150270-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function rtw_os_indicate_scan_done is just a wrapper around
rtw_cfg80211_indicate_scan_done. Use rtw_cfg80211_indicate_scan_done
directly and remove the wrapper.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c      | 2 +-
 drivers/staging/rtl8723bs/include/mlme_osdep.h | 1 -
 drivers/staging/rtl8723bs/os_dep/mlme_linux.c  | 5 -----
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 692d0c2b766d..ebc4bd6ecce9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -909,7 +909,7 @@ void rtw_indicate_disconnect(struct adapter *padapter)
 
 inline void rtw_indicate_scan_done(struct adapter *padapter, bool aborted)
 {
-	rtw_os_indicate_scan_done(padapter, aborted);
+	rtw_cfg80211_indicate_scan_done(padapter, aborted);
 
 	if ((!adapter_to_pwrctl(padapter)->bInSuspend) &&
 	    (!check_fwstate(&padapter->mlmepriv,
diff --git a/drivers/staging/rtl8723bs/include/mlme_osdep.h b/drivers/staging/rtl8723bs/include/mlme_osdep.h
index f0d19637fb0f..c84c84c68286 100644
--- a/drivers/staging/rtl8723bs/include/mlme_osdep.h
+++ b/drivers/staging/rtl8723bs/include/mlme_osdep.h
@@ -11,7 +11,6 @@
 extern void rtw_init_mlme_timer(struct adapter *padapter);
 extern void rtw_os_indicate_disconnect(struct adapter *adapter);
 extern void rtw_os_indicate_connect(struct adapter *adapter);
-void rtw_os_indicate_scan_done(struct adapter *padapter, bool aborted);
 extern void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie);
 
 void rtw_reset_securitypriv(struct adapter *adapter);
diff --git a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
index fd4ae870a617..09bf363efa8b 100644
--- a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
@@ -53,11 +53,6 @@ void rtw_os_indicate_connect(struct adapter *adapter)
 		rtw_signal_process(adapter->pid[2], SIGALRM);
 }
 
-void rtw_os_indicate_scan_done(struct adapter *padapter, bool aborted)
-{
-	rtw_cfg80211_indicate_scan_done(padapter, aborted);
-}
-
 static struct rt_pmkid_list   backupPMKIDList[NUM_PMKID_CACHE];
 void rtw_reset_securitypriv(struct adapter *adapter)
 {
-- 
2.50.1

