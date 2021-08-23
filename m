Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443D43FC4
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 14:12:12 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id q3so26433049edt.5
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 07:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hVGnF32J36jAb+yNsrrim+zcEmES2WYDnRtfWUi5SnM=;
        b=su/MH1x29CKzVEZ69e8y3lFvbyyB/PPeYZKiWV+JY7cAfY/if85aJRX34s2g91hgKI
         KZIgjWCZNzVqofBwp+ZEwHG4ZiKaUHi7raPu+HtZ/psUtvJRQMSi/NUqEQd6EqEwLeZE
         pzKpp5n6p26gbcfY8+ShyNWbr2z8gSrmrZmjzxwO2ube7AwLrBxMX0Lu6ZDpd2IRus30
         4cvaUWt1ym66svLSNEjW1ozXAw2zIGRyf/5uYsIO7RYyotnrlQpgnqjjQz6Pg4NGvIde
         VlTMygswu15jaACsRS/cFgQYObsslLuguK8D11uzOsuUfKo8aij6ciUz5Ppmc+PXICdC
         Cl4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hVGnF32J36jAb+yNsrrim+zcEmES2WYDnRtfWUi5SnM=;
        b=bKR0AUbnyC//uo8KKeIFsRXu98cd0TeY78/TtkE6mlkfCaZGSomsgbkWmVXSKmlaml
         rAxrNXX8W0OfOvCmuNFsLlqZ7T3xQattMQ6rnupoG/H0lMCopH0k2Fum1y4+kVf7KYxl
         okvgKi1Bq0DK94Wz+RKMGJWBP5Z4fhHKnBkksri73C2JzfsfWT7Roc6DsBlEYR7sp7ME
         DRC4/PNk5QUeQmvTKfZSntKqFriI6obzJGdd4JLW6KjkO/ycsdGFMyHJJPjob+3LUh4H
         UHZ0QDKJEssq2m087umy7By4CoMPeCRN2rDYwb1hz5kvKa48VsGQtPQjEmuyDDrsZ3Wy
         XpPQ==
X-Gm-Message-State: AOAM531NY7X4VEffh/EiBCVCIJ05gjx9mEzSwBAzwFA7GlmRvpqMSByX
	xQpNB+X1wnAmDNFbURWgYZE=
X-Google-Smtp-Source: ABdhPJyaQ00KOzTiQH852ZSx3EJRB5NNQuB9CYjA2JIVGZX2mzqN9v5hoyCdhUj7kYt96fCd1rsIWg==
X-Received: by 2002:aa7:d40f:: with SMTP id z15mr37338999edq.113.1629727930764;
        Mon, 23 Aug 2021 07:12:10 -0700 (PDT)
Received: from agape ([5.171.81.132])
        by smtp.gmail.com with ESMTPSA id k12sm6833018edq.59.2021.08.23.07.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 07:12:10 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] staging: rtl8723bs: fix logical continuation issue
Date: Mon, 23 Aug 2021 16:12:01 +0200
Message-Id: <5d4e7ab18005e69e8cc162619149d6fa93568875.1629727333.git.fabioaiuto83@gmail.com>
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

fix the following post-commit hook checkpatch issue:

CHECK: Logical continuations should be on the previous line
52: FILE: drivers/staging/rtl8723bs/os_dep/ioctl_linux.c:389:
+	if (padapter->securitypriv.dot11PrivacyAlgrthm == _TKIP_
+		|| padapter->securitypriv.dot11PrivacyAlgrthm
					== _TKIP_WTMIC_

CHECK: Logical continuations should be on the previous line
53: FILE: drivers/staging/rtl8723bs/os_dep/ioctl_linux.c:390:
+		|| padapter->securitypriv.dot11PrivacyAlgrthm
					== _TKIP_WTMIC_
+		|| padapter->securitypriv.dot11PrivacyAlgrthm
					== _AES_)

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index 5067c2417351..733c6b93eb8f 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -385,9 +385,9 @@ static int rtw_set_wpa_ie(struct adapter *padapter, char *pie, unsigned short ie
 	}
 
 	/* TKIP and AES disallow multicast packets until installing group key */
-	if (padapter->securitypriv.dot11PrivacyAlgrthm == _TKIP_
-		|| padapter->securitypriv.dot11PrivacyAlgrthm == _TKIP_WTMIC_
-		|| padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)
+	if (padapter->securitypriv.dot11PrivacyAlgrthm == _TKIP_ ||
+		padapter->securitypriv.dot11PrivacyAlgrthm == _TKIP_WTMIC_ ||
+		padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)
 		/* WPS open need to enable multicast */
 		/*  check_fwstate(&padapter->mlmepriv, WIFI_UNDER_WPS) == true) */
 		rtw_hal_set_hwreg(padapter, HW_VAR_OFF_RCR_AM, null_addr);
-- 
2.20.1

