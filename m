Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A149E2FB3
	for <linux-staging@lists.linux.dev>; Wed, 23 Jun 2021 23:49:11 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id t9so3500016qtw.7
        for <linux-staging@lists.linux.dev>; Wed, 23 Jun 2021 16:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i500zeynpOj9f3DeDL5kN9xvrj7e0uG6xsJdS1T9Uuk=;
        b=S4saWzjSSFr5O2/0eXJXG5sM89IjLY6X3vVjrAi4sihkjOEOnfTAuY4Ly/St3lRAgs
         NJMLJ3qRiPza0B7KY5dFAI9DoVngj8DegDFjhYtI/u+88+cOuuK8H2c5PpjBIsyPJ7tB
         Urln4G5NslePgIxKK5rmeT0qm2HGHu/ZykYfasfWOQ7BITfOOUd22LCpXqEWSBfBsW/x
         juWiCMUKyaJaEy/euQ09IqONPrTdDMYnkM7iXjjO27ScxjQZIEfTGN4XVRNMbq2tacqy
         JVFzS/lED2x7PsKRuL5HdNnbn6sSzlj3yTJxUAHswEetjClrB5EChfEfARiTVaaxmCJ5
         nsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i500zeynpOj9f3DeDL5kN9xvrj7e0uG6xsJdS1T9Uuk=;
        b=ivqHsQ9Q3ruLw/rrvXwoyXplKnTL1shtCYOjqQVxvOD9kcBWGo1ab83Bx/7SZ4lBrr
         LREsgL8/FC99b47zEP1BJh3C2P4OfoBKBYNXnuoEhHY1nK60DOxciU2WjLDLzBqzJgNc
         Bqt12Gze8qrwPAVvUYC7tJGnYC6zfWZ2WDNLBz1Q9OWj8h00MVQv/cMX9HbCTCC2D0Zs
         aV0MGHnHYlT9Ns7flfPP22zN4K+gu0Kd1/631f9o25YkNQ3orl0Z2oU8YRGqqbj7Yz/K
         JxFtPP+LEcNDyAsT473OZQBLTE/3cMukg7ITy9Mc/vqimaqZ4zphqXfjlsISbfnnMNAz
         X8CA==
X-Gm-Message-State: AOAM530rPTVtZLGC3GnaOkZzDZVgpEBj1PT2N9nWN8/MwOt8VhQrYSn4
	0rZKAJgB6XzYZdfpGYxklP5JJDIWL0iyMA==
X-Google-Smtp-Source: ABdhPJxxFJuYWMg55b6m5Mo9jGyCmLOyqUAmKbvEpw3HpnJY0gaw5kIex4nUCgNEvubiobmdvHDzVg==
X-Received: by 2002:ac8:44cb:: with SMTP id b11mr2329838qto.170.1624492150853;
        Wed, 23 Jun 2021 16:49:10 -0700 (PDT)
Received: from kerneldevvm.. (5.6.a.8.a.a.b.f.c.9.4.c.a.9.a.a.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:aa9a:c49c:fbaa:8a65])
        by smtp.gmail.com with ESMTPSA id w2sm992387qto.50.2021.06.23.16.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 16:49:10 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 3/9] staging: rtl8188eu: remove all DBG_88E_LEVEL calls from core/rtw_ioctl_set.c
Date: Thu, 24 Jun 2021 00:48:56 +0100
Message-Id: <20210623234902.7411-4-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210623234902.7411-1-phil@philpotter.co.uk>
References: <20210623234902.7411-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all DBG_88E_LEVEL calls from core/rtw_ioctl_set.c as this macro is
unnecessary, and these calls are dubious in terms of necessity.
Removing all calls will ultimately allow the removal of the macro
itself.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/core/rtw_ioctl_set.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_ioctl_set.c b/drivers/staging/rtl8188eu/core/rtw_ioctl_set.c
index c8b8346adbee..adf772e7bac0 100644
--- a/drivers/staging/rtl8188eu/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8188eu/core/rtw_ioctl_set.c
@@ -131,8 +131,6 @@ u8 rtw_set_802_11_bssid(struct adapter *padapter, u8 *bssid)
 	u32 cur_time = 0;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
-	DBG_88E_LEVEL(_drv_info_, "set bssid:%pM\n", bssid);
-
 	if ((bssid[0] == 0x00 && bssid[1] == 0x00 && bssid[2] == 0x00 &&
 	     bssid[3] == 0x00 && bssid[4] == 0x00 && bssid[5] == 0x00) ||
 	    (bssid[0] == 0xFF && bssid[1] == 0xFF && bssid[2] == 0xFF &&
@@ -214,9 +212,6 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, struct ndis_802_11_ssid *ssid)
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct wlan_network *pnetwork = &pmlmepriv->cur_network;
 
-	DBG_88E_LEVEL(_drv_info_, "set ssid [%s] fw_state=0x%08x\n",
-		      ssid->ssid, get_fwstate(pmlmepriv));
-
 	if (!padapter->hw_init_completed) {
 		RT_TRACE(_module_rtl871x_ioctl_set_c_, _drv_err_,
 			 ("set_ssid: hw_init_completed == false =>exit!!!\n"));
-- 
2.31.1

