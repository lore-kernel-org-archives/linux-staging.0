Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFCE3FC4
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 14:12:10 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id d11so37256956eja.8
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 07:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QQf0tXwdGDJ9ytbZatMzcHhknhsJ90N1NisHqNGGGOk=;
        b=jG8dBbc9aVT+q+Secokwq/et2WnxfcUfIwIAGzxxO03Oorl1BflqVdmpI5jhPh2wdz
         b+cxMtD1gEIG27Rci4CsrQs27fN9RRMtZHH2UOuLAuycI35vH1/n9RzHc4ae10GBFmEC
         KoVOVHosEGrRsT6ZEL/0jEUrsR5FCi0lRvugga+6OwEaC+sCNScA5R0mqDACuoyeCmVF
         AD9CePiuu0FPzePakassg2Xdc38Kj5tNz/H4AcPWWa/pgRDT0bvUBu1e7VIEv/Uj+4HH
         xOpYWlNNhbXFwJrYEiStnQfkasA5RBul36f/I5ESV95j+dquUmg18ufniRP80upaa9TN
         Tc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QQf0tXwdGDJ9ytbZatMzcHhknhsJ90N1NisHqNGGGOk=;
        b=jlHYZQAj86I2AkuRmd529NH5yHaw7devHD06MOjNEBbzB53P4rQtyRQRzUJrjcAhwq
         oYpXSSmfGVsPrM2rfDOsfkhFVSbsX5lRK7XvYLXSR99WZlofcyJLfAQwqUau1uIjhmrm
         I/HnKnN2y65jP5bc38QzRZ0FOr3XSjzws21I4ubnRwEtq4/+Iv4bxtnW0vSxxGLUbg5Z
         PflOmq3gZjjjMa+yElHRAsg6inneIeu/vvaR5oiJ/YBgILO1oCBn2TBXMTlr92sOMUU2
         CzBkWMtNo5k5B7IRwlUKGHxJ4WW0ZKdIGpDGA4lyzgJet7v/4yGFtxIifdX8WH0miY4y
         PUUg==
X-Gm-Message-State: AOAM531/E96+M4OruHmbJ3VIPteB5HdQgHWbQh4vZM5s17vWf7Qho4oI
	djTOQn65T7H8Uj7lP6WX0wo=
X-Google-Smtp-Source: ABdhPJygAyUKChQyBPQotOeMgOB0p7p6MqSUXCITAqUU25CrY60veUNgzg4WpdEactbSEAWGCZ4dKw==
X-Received: by 2002:a17:906:4fd6:: with SMTP id i22mr36353720ejw.92.1629727929271;
        Mon, 23 Aug 2021 07:12:09 -0700 (PDT)
Received: from agape ([5.171.81.132])
        by smtp.gmail.com with ESMTPSA id g16sm7465876ejw.74.2021.08.23.07.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 07:12:09 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] staging: rtl8723bs: fix code indent issues
Date: Mon, 23 Aug 2021 16:12:00 +0200
Message-Id: <aa394052c8d81b4a00356adf5f98fc3c81f8b1d9.1629727333.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1629727333.git.fabioaiuto83@gmail.com>
References: <cover.1629727333.git.fabioaiuto83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix the following post commit hook checkpatch issues:

ERROR: code indent should use tabs where possible
2463: FILE: drivers/staging/rtl8723bs/os_dep/ioctl_linux.c:388:
+        if (padapter->securitypriv.dot11PrivacyAlgrthm == _TKIP_$

ERROR: code indent should use tabs where possible
2464: FILE: drivers/staging/rtl8723bs/os_dep/ioctl_linux.c:389:
+                || padapter->securitypriv.dot11PrivacyAlgrthm
			== _TKIP_WTMIC_$

ERROR: code indent should use tabs where possible
2465: FILE: drivers/staging/rtl8723bs/os_dep/ioctl_linux.c:390:
+                || padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)$

ERROR: code indent should use tabs where possible
2466: FILE: drivers/staging/rtl8723bs/os_dep/ioctl_linux.c:391:
+                /* WPS open need to enable multicast */$

ERROR: code indent should use tabs where possible
2467: FILE: drivers/staging/rtl8723bs/os_dep/ioctl_linux.c:392:
+                /*  check_fwstate(&padapter->mlmepriv,
			WIFI_UNDER_WPS) == true) */$

ERROR: code indent should use tabs where possible
2468: FILE: drivers/staging/rtl8723bs/os_dep/ioctl_linux.c:393:
+                rtw_hal_set_hwreg(padapter, HW_VAR_OFF_RCR_AM,
					null_addr);$

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index 790e3b2454e8..5067c2417351 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -385,12 +385,12 @@ static int rtw_set_wpa_ie(struct adapter *padapter, char *pie, unsigned short ie
 	}
 
 	/* TKIP and AES disallow multicast packets until installing group key */
-        if (padapter->securitypriv.dot11PrivacyAlgrthm == _TKIP_
-                || padapter->securitypriv.dot11PrivacyAlgrthm == _TKIP_WTMIC_
-                || padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)
-                /* WPS open need to enable multicast */
-                /*  check_fwstate(&padapter->mlmepriv, WIFI_UNDER_WPS) == true) */
-                rtw_hal_set_hwreg(padapter, HW_VAR_OFF_RCR_AM, null_addr);
+	if (padapter->securitypriv.dot11PrivacyAlgrthm == _TKIP_
+		|| padapter->securitypriv.dot11PrivacyAlgrthm == _TKIP_WTMIC_
+		|| padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)
+		/* WPS open need to enable multicast */
+		/*  check_fwstate(&padapter->mlmepriv, WIFI_UNDER_WPS) == true) */
+		rtw_hal_set_hwreg(padapter, HW_VAR_OFF_RCR_AM, null_addr);
 
 exit:
 
-- 
2.20.1

