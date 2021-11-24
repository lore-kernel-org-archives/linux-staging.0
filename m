Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A5A68
	for <linux-staging@lists.linux.dev>; Wed, 24 Nov 2021 19:04:57 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id b11so2619689pld.12
        for <linux-staging@lists.linux.dev>; Wed, 24 Nov 2021 11:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mg1AAfzE3TnVEZLKrk2eTyodphC+4RofwhV3Xd4iHcU=;
        b=hwW3JqNmyuW8dQKixMsahppodxbVChpsvSeIBfAPV6+/7hFnhj9I0cazUXopKBwAwY
         td551cpaV4VFz1it3KhMmmjA5kgs5D+XqDm+khWO6dX9owAZRubbvuQZr+bkcSSt3ONH
         24SQaIiujHyPSibqIDJ1ZCdJE1STuHjDB3FzV6VXAiKui5CtZJd+DU1mHhjM2C6qx9TS
         AN2vuSMZmFSUuhOf9b8Yc3k5HCOexjDmoPadaQTHmm2xPJGK7k3qu2oRS/MHCixdR+Co
         KoPoGeQbwcmM6XtPuIRnN5PoZi8HJJLoITT8qCBU/8XxoSf6uoUx1sDUnpGjFzUsSV33
         X59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mg1AAfzE3TnVEZLKrk2eTyodphC+4RofwhV3Xd4iHcU=;
        b=X6VBZ+K6EyG8zgBO0VaGPO+ny13hMasLzZj+XT5hT6KPrQFBatv71MzyhwZngYSRIE
         HXCQTHOL8K/SZglDAD7NReeHHWC9sd4QLwYkKq0+44P+TVCMvYXcXBrMN8RnWDF+rwSE
         M7mAecPQhhiI802Unxa+0y9tCT6zGPM3c7m2JDbewoU3B+i7L4fQhOitLfm/T83wCs2G
         M1Jqir8mZo0j7wAo61UIvhQ5lu7LIAqwZrEjp3Q4C1yYXE1O6pxUzzCVjBwMfZ1ZQxod
         i3lXcG0yA7juygL2yGg1EKt0V1nmh8hdgAJcixBQnSNIq83DGs2taNRP8BZhpngyfv38
         BCQw==
X-Gm-Message-State: AOAM530542UmeG77se/OXieCXb7VGPSbh+5ueYlIWeBxbcaFFbD/54NU
	OSWORtALrpalyqGcnrxRNDA=
X-Google-Smtp-Source: ABdhPJwJnBCPTGdFcb0VKvvPaagJ2J8GriQPgNiD/VTVIVDpRqjyEEq6C5ck1fbXN2+cax2am5Bvvw==
X-Received: by 2002:a17:90b:4a0f:: with SMTP id kk15mr11708467pjb.223.1637780697539;
        Wed, 24 Nov 2021 11:04:57 -0800 (PST)
Received: from localhost.localdomain ([103.85.8.147])
        by smtp.gmail.com with ESMTPSA id c18sm452624pfl.201.2021.11.24.11.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 11:04:57 -0800 (PST)
From: Vihas Mak <makvihas@gmail.com>
To: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk
Cc: gregkh@linuxfoundation.org,
	straube.linux@gmail.com,
	nathan@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vihas Mak <makvihas@gmail.com>
Subject: [PATCH v2] staging: r8188eu: use max() and min() macros
Date: Thu, 25 Nov 2021 00:34:36 +0530
Message-Id: <20211124190436.251312-1-makvihas@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

use max() and min() macros to fix following cocci warnings:

	drivers/staging/r8188eu/core/rtw_wlan_util.c:719: WARNING opportunity for min()
	drivers/staging/r8188eu/core/rtw_wlan_util.c:724: WARNING opportunity for max()

Signed-off-by: Vihas Mak <makvihas@gmail.com>
---
v1 -> v2:
- fixed checkpatch issues (parenthesis alignment).

 drivers/staging/r8188eu/core/rtw_wlan_util.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index 6d4e21a16783..524e8d22075c 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -716,15 +716,11 @@ void HT_caps_handler(struct adapter *padapter, struct ndis_802_11_var_ie *pIE)
 			pmlmeinfo->HT_caps.u.HT_cap[i] &= (pIE->data[i]);
 		} else {
 			/* modify from  fw by Thomas 2010/11/17 */
-			if ((pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para & 0x3) > (pIE->data[i] & 0x3))
-				max_AMPDU_len = (pIE->data[i] & 0x3);
-			else
-				max_AMPDU_len = (pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para & 0x3);
-
-			if ((pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para & 0x1c) > (pIE->data[i] & 0x1c))
-				min_MPDU_spacing = (pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para & 0x1c);
-			else
-				min_MPDU_spacing = (pIE->data[i] & 0x1c);
+			max_AMPDU_len = min(pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para & 0x3,
+					    pIE->data[i] & 0x3);
+
+			min_MPDU_spacing = max(pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para & 0x1c,
+					       pIE->data[i] & 0x1c);
 
 			pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para = max_AMPDU_len | min_MPDU_spacing;
 		}
-- 
2.25.1

