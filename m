Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B0C71
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 09:23:00 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id e7so9226749edu.10
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 02:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6C1kuLI/6U1TSBMUqk9JLF9SDGzIgrVMBUMNpn8I56w=;
        b=kHFajjcjeY0LaYCjifNIp+F+rpF48yL0JPVutu8rI57pss6iPMuHp1GmPfMX2wnDM2
         4FSYE0Zi6UDF4+YpSmKeVYy6ut0NUT49icEe0+AA/cpLSq5T7CRZmeH4TE+8MLmJ8eRL
         1NR0GFo1f9DnAdKS6/H9ziMLKJV8HnP9seAgKpKWWDfUoH0k1PQm4AVLL+wJ4VqfA0OD
         QvhSaWV+yjjCzeyeszgU2iQtujAR6Kj5bRcqSVZCcbp2zZKfQZBnVb19Ikx3s/9Ws0j/
         kU/2cu0hW4L9nFDHj31wJFi+JcCuYNWIoqd3rw91KhozGXySfnF+awjvg1dK5R0oNKU4
         0UWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6C1kuLI/6U1TSBMUqk9JLF9SDGzIgrVMBUMNpn8I56w=;
        b=Mmh5nvQbEqVRzxn06vYgsjoeGKK3imyh0JsNgKqWwyCV/h4M3sdlt8J+SQnx7lkeyP
         eobEtl6AOsWv4dJCPMvPtBtFxwuM9FFxTWn5XIEtHRhbDLru3nVbSBPVIZ3NTORArXKL
         ADC/lF1729C2f3GdvRKtgFwOBWtSnalsROJkp30fdyzhRUJKl9ABFZE0d94r5CdvbueF
         T9pdkz6rwKIYQbZ6KZJ/mYdixQTYEiKQsKhv328LCxzrr1BcVBQ9AxHSCAdtjE5XXvSJ
         3U6G2un1PQ/CxCC4q6+FndXHS/m4vwKvFA1RjWSq6vRw1wIp/VAkPeo7WDBcO69WoI6J
         Zppw==
X-Gm-Message-State: AOAM530bxJQdL2tWYlLgLdOM+Ljgf1LcDzTaW3WiSgclkLDnuRFRpEKF
	gU2KyfdZd8sIialYZDhpGw7Ipf/EPPzl6QjQ
X-Google-Smtp-Source: ABdhPJyFFwmjVHqbl6Ldl5E961acmImtDpzrBNYIi9NV8+qYIO0bB3G66dsmwsAIjvgRehs6lsQ00Q==
X-Received: by 2002:a05:6402:2209:: with SMTP id cq9mr5651190edb.216.1618046579364;
        Sat, 10 Apr 2021 02:22:59 -0700 (PDT)
Received: from localhost.localdomain (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id a22sm2801624edu.14.2021.04.10.02.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 02:22:58 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	outreachy-kernel@googlegroups.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [Outreachy kernel] [PATCH 4/4] staging: rtl8723bs: Change the type and use of a variable
Date: Sat, 10 Apr 2021 11:22:32 +0200
Message-Id: <20210410092232.15155-5-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210410092232.15155-1-fmdefrancesco@gmail.com>
References: <20210410092232.15155-1-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the type of fw_current_in_ps_mode from u8 to bool, because
it is used everywhere as a bool and, accordingly, it should be
declared as a bool. Shorten the controlling
expression of an 'if' statement.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c        | 2 +-
 drivers/staging/rtl8723bs/include/rtw_pwrctrl.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 96fe172ced8d..8dc4dd8c6d4c 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -348,7 +348,7 @@ void rtw_hal_dm_watchdog(struct adapter *padapter)
 
 void rtw_hal_dm_watchdog_in_lps(struct adapter *padapter)
 {
-	if (adapter_to_pwrctl(padapter)->fw_current_in_ps_mode == true) {
+	if (adapter_to_pwrctl(padapter)->fw_current_in_ps_mode) {
 		if (padapter->HalFunc.hal_dm_watchdog_in_lps)
 			padapter->HalFunc.hal_dm_watchdog_in_lps(padapter); /* this function caller is in interrupt context */
 	}
diff --git a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
index 0a48f1653be5..0767dbb84199 100644
--- a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
+++ b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
@@ -203,7 +203,7 @@ struct pwrctrl_priv {
 	u8 LpsIdleCount;
 	u8 power_mgnt;
 	u8 org_power_mgnt;
-	u8 fw_current_in_ps_mode;
+	bool fw_current_in_ps_mode;
 	unsigned long	DelayLPSLastTimeStamp;
 	s32		pnp_current_pwr_state;
 	u8 pnp_bstop_trx;
-- 
2.31.1

