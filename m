Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D8833C3
	for <linux-staging@lists.linux.dev>; Fri, 20 May 2022 22:09:57 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id r23so13199216wrr.2
        for <linux-staging@lists.linux.dev>; Fri, 20 May 2022 15:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EXIataNBxQzsiHab2Zt90bviLe04cA23imKlve17OxQ=;
        b=kuJgYj5jPU9tZUpCMxOtSXfcrr7x4eWnvsbtT6Hd4x+edQlyh/Xj0CYwmwjo0R653Z
         ToFH++1DUvVUy1z9rdtLZ/ZkJpOO/FsY3pds8cjiagSlPyLgfbssMAlfHiIZ9JOc+i6M
         eKUPowmfoKNUydOQNeG1D4eo0RAM9qOVMeT/W3GdzTSWRi26GC/WFvWyBJEcsnRYlg4d
         LMXq+D8+xivu0cge/UlNO+dK4GsNtqJLovaDtu1Mp3PGxsIrfirJtDRPQeMUo+0+FdmY
         MatczTr+x4hbeuGecMVS1CyxRX+YiEmbb0VKBgGr6000akc8xUJAgKkN8iW88vDaefZ5
         LOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EXIataNBxQzsiHab2Zt90bviLe04cA23imKlve17OxQ=;
        b=qtwCYkB5HK5OReuGTLp4imGIpFkk2/bc2tGbXxA/8/6y2Eor108PLL/PkF/KM5iyi/
         JsVJI5aAdUjA3oTtZURiqOT9Zc7UKRcEtKeswQ3a1k9tu/Oh2Allj0OTNmYFgOALSHtv
         ST7ITzWWpB0zJevLnh1eZvKe3T4cZ+u1ZJG6drutET45fBpOmlD61SE3UE2XNpIWF+rm
         imXC3WFOmh3wukJuNM3aEmfFsp+mhq09EeIgxlUloTdDHDvQs/c9EBG3GzAisR4LS2DW
         4ddnHuRVsD6XgyyzXTGU7Mielzdx7eHLRwFd3PJkR8uSuRm1q/tYM0/BxIIvRMfJpaLY
         oD7g==
X-Gm-Message-State: AOAM531i+7HdhXm8QKuwsAJeF08MKn5tUyD4A5JpHbKTFh9xqGOUjalL
	HBvDGOAjrwK/ts57v5bmjqkfcydL5qj0uA==
X-Google-Smtp-Source: ABdhPJxr/aIMYpp6YAQxg9nkLfWM7p6UafKUTFg7cnGAsHEUpSbFOyCr2rFdAEtDXeelrbyfwKkVfg==
X-Received: by 2002:a05:6000:1a8e:b0:20c:be8c:10a4 with SMTP id f14-20020a0560001a8e00b0020cbe8c10a4mr9633223wry.437.1653084595472;
        Fri, 20 May 2022 15:09:55 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id b3-20020a05600c4e0300b003973d425a7fsm1677206wmq.41.2022.05.20.15.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 15:09:54 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	paskripkin@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: r8188eu: convert pr_info_once call in core/rtw_fw.c
Date: Fri, 20 May 2022 23:09:53 +0100
Message-Id: <20220520220953.11840-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert pr_info_once call in core/rtw_fw.c to a dev_info_once call, as
ultimately, this results in the printing of the driver name anyway
(r8188eu) which is equally clear and removes the need for the "R8188EU: "
part of the format string.

Suggested-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/core/rtw_fw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_fw.c b/drivers/staging/r8188eu/core/rtw_fw.c
index 0451e5177644..87dc0e97652a 100644
--- a/drivers/staging/r8188eu/core/rtw_fw.c
+++ b/drivers/staging/r8188eu/core/rtw_fw.c
@@ -259,9 +259,9 @@ int rtl8188e_firmware_download(struct adapter *padapter)
 	fwhdr = (struct rt_firmware_hdr *)dvobj->firmware.data;
 
 	if (IS_FW_HEADER_EXIST(fwhdr)) {
-		pr_info_once("R8188EU: Firmware Version %d, SubVersion %d, Signature 0x%x\n",
-			     le16_to_cpu(fwhdr->version), fwhdr->subversion,
-			     le16_to_cpu(fwhdr->signature));
+		dev_info_once(device, "Firmware Version %d, SubVersion %d, Signature 0x%x\n",
+			      le16_to_cpu(fwhdr->version), fwhdr->subversion,
+			      le16_to_cpu(fwhdr->signature));
 
 		fw_data = fw_data + sizeof(struct rt_firmware_hdr);
 		fw_size = fw_size - sizeof(struct rt_firmware_hdr);
-- 
2.35.3

