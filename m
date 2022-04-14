Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32A017D3
	for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 10:43:53 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id p15so9216924ejc.7
        for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 03:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vkswkCkzkfuTkcC/MPeEn0SGFUoxOD74D06SLg3Ufn0=;
        b=iWlnSum74zWq9k1VdmcjywmgcKKEeTiTo4Edj/3kWQ3mphEoEhp54slxtjXphSS4Ux
         Tpk8EmwCVTNLptsx6NjCrpCHDZNQ6jSd3E0+BxBZKWJAwwAyueP/wF6bVeJ4QWImzNJh
         mXraTy9ukq5tEigcDXYUDA4mmw6GMy68jysVh/0OJL6KTe0dJ4TtmnPgAUDzqLclV2ed
         giaDgrGU8qvaCkc+qfCzSWTPLexpbph+DQdzOg2D0ZPkMl8lYFBT0J6y08Bp42oBp0jz
         S/ArhcDel9UqRBcFQMtELR3H72iCq16zeHJhOqrC+G4idVxp8wD/7MtPIlh64Q+YLcOS
         cN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vkswkCkzkfuTkcC/MPeEn0SGFUoxOD74D06SLg3Ufn0=;
        b=nlig1vUWX/c2/zQvbcd42FZcxIfcvqz7yiFPBZtb7vQR4ZhuxdUpIMcw69cuevRx0b
         5iOCv4uwXcS5H0tLGjv5JxVLf7wMgBKQX9cWIbigXH27yC6+xZEOwkYMldRpg1F0gZjH
         Me2mO7ksgMislEfOeGl5BGSp38yUxtcgegOb3Zq650ygNF75+ZjIleBmds4T6klWi75X
         PlKEhrcY97n8esD4U8hlLsatT09nDn9v+fCakSVCzaSqQRGczMsGNwa0Zu3++v2J2lcU
         HyJbysENrVhVuw2WhQHus4w78swaEVBldOvb+Mf3yM83VVPaPFpMwkR5s/xIf0HDEuGv
         +Q0g==
X-Gm-Message-State: AOAM530I7Nj7Zpb4bZexITrDEQgGTb/PktnPGW7RkDU5zk1lg8xtnk3e
	hBZyBA3wtamq8AU9/ZObCZU=
X-Google-Smtp-Source: ABdhPJwSuPzquu8kUAxNyiwAm9/xkpxEyLKBIK+2FStPtDiTfsFEn7Q5tANPnti58aaRIauri31amA==
X-Received: by 2002:a17:906:52c7:b0:6ce:a880:50a3 with SMTP id w7-20020a17090652c700b006cea88050a3mr1728945ejn.437.1649933032340;
        Thu, 14 Apr 2022 03:43:52 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb6b.dynamic.kabel-deutschland.de. [95.90.187.107])
        by smtp.gmail.com with ESMTPSA id h9-20020aa7c949000000b0041b4d8ae50csm821318edt.34.2022.04.14.03.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 03:43:51 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 7/8] staging: r8188eu: check firmware header existence before access
Date: Thu, 14 Apr 2022 12:43:22 +0200
Message-Id: <20220414104323.6152-8-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414104323.6152-1-straube.linux@gmail.com>
References: <20220414104323.6152-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We should access the fields of fwhdr only if the check for firmware
header existence is true. Move the affected code into the if block
that checks firmware header existence.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_fw.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_fw.c b/drivers/staging/r8188eu/core/rtw_fw.c
index 64963507a346..c58bce1a1856 100644
--- a/drivers/staging/r8188eu/core/rtw_fw.c
+++ b/drivers/staging/r8188eu/core/rtw_fw.c
@@ -249,14 +249,13 @@ int rtl8188e_firmware_download(struct adapter *padapter)
 	fw_data = dvobj->firmware.data;
 	fw_size = dvobj->firmware.size;
 
-	/*  To Check Fw header. Added by tynli. 2009.12.04. */
 	fwhdr = (struct rt_firmware_hdr *)dvobj->firmware.data;
 
-	pr_info("%sFirmware Version %d, SubVersion %d, Signature 0x%x\n",
-		DRIVER_PREFIX, le16_to_cpu(fwhdr->version), fwhdr->subversion,
-		le16_to_cpu(fwhdr->signature));
-
 	if (IS_FW_HEADER_EXIST(fwhdr)) {
+		pr_info("%sFirmware Version %d, SubVersion %d, Signature 0x%x\n",
+			DRIVER_PREFIX, le16_to_cpu(fwhdr->version), fwhdr->subversion,
+			le16_to_cpu(fwhdr->signature));
+
 		fw_data = fw_data + sizeof(struct rt_firmware_hdr);
 		fw_size = fw_size - sizeof(struct rt_firmware_hdr);
 	}
-- 
2.35.1

