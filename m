Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DB3258A
	for <linux-staging@lists.linux.dev>; Sun, 17 Apr 2022 17:54:52 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id g18so23490448ejc.10
        for <linux-staging@lists.linux.dev>; Sun, 17 Apr 2022 10:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KEwI6Q2gOou7SmTI/FqsvAk6CZ0LfOMwOSJ78RsRzQU=;
        b=f1hqZGQ45cLUIX4T7+k+y5bWOaM56L8Ky5XIxmSLUcfM6j44rehlQN4I2SnvpjLWLn
         2C8Em2U1LMqmE4jiJohYaTusIMNYtwaQ7QCKZWAmQL82bH8ivAQuc9Bdh5jQAUNkrCxX
         ICQtx8aUKxBU29PvM9tzLb+VK4AViNQsNNnGl1vl+i4mxiYPn3uZUpSW3giLxZcrUnje
         4PbzUYmdnS3jBGc+Az7+gBPtZOpvWeDA55kxUyCIQLXFZlRfKyyxgzG6Co/ifuPRVrOn
         3Cu8PUTOuyDCsiydm15MK74Azo38PYXun3l996GX/YYXle7jFmHDbPW4kVbuEFBePY3D
         vJYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KEwI6Q2gOou7SmTI/FqsvAk6CZ0LfOMwOSJ78RsRzQU=;
        b=EoVo8yBi0Lax1DGbV3TaFYLxv0JPhp54UD5pEf4dmlX1UCYIXN3TLScWrCAZ8rFaOM
         dUCLqS4doCGrftnVfVscxT5fjlFCG0lTutvNcmeNHRGqPCIDhJ/KE2wsbLukzqAUICRE
         eiptZ/OII/dTd7BCmHlCF5Pnw8l9/64tSgr9aLHI1xDpNYdKrr13mkjfnd4mS1mDMFxp
         iPiozATQZ4/foPokxpdxnXTlHjYE6qvR1+EXhL6cNn0OHznXAH8Ff4mJ0l+CeVGo4lZv
         M9ImNTcPP1rj/EyUSGcFItxiy2hJ5y/0M0hYVGoINWk2xKeucUOQE6l/ZmlQUP9mScLr
         HpNA==
X-Gm-Message-State: AOAM533NmUWRu4oax2MV0DTokZTWgUO0/DQ2w4RvwcW8lKzv1gkUT+TU
	V3qVPTyt11dZRH3SQ+hScKVwFx2Ddy4=
X-Google-Smtp-Source: ABdhPJwE+VrcsnQ6WcjEACvgNW7r1oitmbIaM/2BJUEx5VgdhGMNEDE/7GOxvqEOyRIv5koX3YI3dw==
X-Received: by 2002:a17:906:16cc:b0:6ce:e607:ff02 with SMTP id t12-20020a17090616cc00b006cee607ff02mr6117957ejd.418.1650218091437;
        Sun, 17 Apr 2022 10:54:51 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abba5.dynamic.kabel-deutschland.de. [95.90.187.165])
        by smtp.gmail.com with ESMTPSA id jw12-20020a17090776ac00b006e87137194esm3719409ejc.150.2022.04.17.10.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Apr 2022 10:54:51 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v4 5/8] staging: r8188eu: use sizeof instead of hardcoded firmware header size
Date: Sun, 17 Apr 2022 19:54:38 +0200
Message-Id: <20220417175441.13830-6-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220417175441.13830-1-straube.linux@gmail.com>
References: <20220417175441.13830-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use sizeof() instead of hardcoding the firmware header size and add
a compile time check to ensure struct rt_firmware_hdr has the correct
size.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v4:
- no changes

v3:
- added the compile time size check from patch 8/8 of v2

v2:
- no changes

 drivers/staging/r8188eu/core/rtw_fw.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_fw.c b/drivers/staging/r8188eu/core/rtw_fw.c
index a80cc7fa3a53..42b36505cf8b 100644
--- a/drivers/staging/r8188eu/core/rtw_fw.c
+++ b/drivers/staging/r8188eu/core/rtw_fw.c
@@ -39,6 +39,8 @@ struct rt_firmware_hdr {
 	__le32	rsvd5;
 };
 
+static_assert(sizeof(struct rt_firmware_hdr) == 32);
+
 static void fw_download_enable(struct adapter *padapter, bool enable)
 {
 	u8 tmp;
@@ -268,9 +270,8 @@ int rtl8188e_firmware_download(struct adapter *padapter)
 			DRIVER_PREFIX, fw_version, fw_subversion, fw_signature);
 
 	if (IS_FW_HEADER_EXIST(fwhdr)) {
-		/*  Shift 32 bytes for FW header */
-		fw_data = fw_data + 32;
-		fw_size = fw_size - 32;
+		fw_data = fw_data + sizeof(struct rt_firmware_hdr);
+		fw_size = fw_size - sizeof(struct rt_firmware_hdr);
 	}
 
 	/*  Suggested by Filen. If 8051 is running in RAM code, driver should inform Fw to reset by itself, */
-- 
2.35.1

