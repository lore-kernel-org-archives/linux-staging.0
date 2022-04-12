Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B9223A3
	for <linux-staging@lists.linux.dev>; Tue, 12 Apr 2022 18:58:05 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id c64so11337038edf.11
        for <linux-staging@lists.linux.dev>; Tue, 12 Apr 2022 11:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P83BpPosTwKlH7SaIyI97o8/90EHDJt3E+4hDWW/yXg=;
        b=iAVLcdBHQNnx/Tw+la/1EVMwd3ENyyk43q3x/W0681+7OR6tYYnTMYb1qOCo71cJbx
         3q0xtFXBujVeuJeUdyCvbe/lKsGwGglZF/E+zKcCEVujwnCKyw/iGRfxYp9ep19X1L8U
         7APv12fBuoX5jX80594NPXmX5YAvEZTxJ6KeoQ33cHv09E3bRy6llG8JpD9FyKZeTt4n
         2gmfhMRH5J01qD22uSR8Gfsp/dQE5xQtcwJ3EKAXs8tvKv3STdeY8Y4pow+c6qe7BvxP
         6hzC/xgZwe8jOJtXcnTsF6cjG6Elmzoe3pZ4RI8mA5Ct0sCRWearU/7K7tnXB7NIQTA/
         03gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P83BpPosTwKlH7SaIyI97o8/90EHDJt3E+4hDWW/yXg=;
        b=UG1s5mOBR3CUWTqH/MZ/3JjRq/TQvz3knS7QlMU01wpkzVDN3/RPudCTTksGBgC1Av
         dYa8qcpejl6acZyGS6evUqmGDZ5a0McpmxrmIjjDjBkZf3v9rhd7ThPro36/vDRcRAz9
         AxcXPglBUyVqKKTLB5eUbFn522FyZ5+nTQcDObBNdLKkkgCcPIfMzuG1Bj5FHA/+vHqh
         vfaODwg055uLhU0+9/+H6zdUQM4tbRHkrEb9H8tBX7IdLbpyWEOrdKXqyUY6DVGrNXZ0
         2YQLxQ/dl46aH/w+ZwfrI7VCZWz+/MpZrv8ALNo7MwZ1+BUZJatGDcNEOz5HR++2OntU
         Vbbw==
X-Gm-Message-State: AOAM530CJsViH/iYIhuJzPlzhd+0JS/JtJENm12o1avDVHHuUqrW+jND
	Yv+kivWdaRbf18nz8wAhYiU=
X-Google-Smtp-Source: ABdhPJxoZUoGuosYL2+S8ZIvCyaA5aUdc3/mzJZUGnzbijUSjmCMQhEGx46Pjea0oH8CxXu2A1UhQQ==
X-Received: by 2002:aa7:cb93:0:b0:415:d57a:4603 with SMTP id r19-20020aa7cb93000000b00415d57a4603mr39865733edt.62.1649789883857;
        Tue, 12 Apr 2022 11:58:03 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb6b.dynamic.kabel-deutschland.de. [95.90.187.107])
        by smtp.gmail.com with ESMTPSA id q22-20020a170906771600b006cf8a37ebf5sm13443482ejm.103.2022.04.12.11.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 11:58:03 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/6] staging: r8188eu: change void parameters to u8
Date: Tue, 12 Apr 2022 20:57:51 +0200
Message-Id: <20220412185754.8695-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412185754.8695-1-straube.linux@gmail.com>
References: <20220412185754.8695-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The second parameter of write_fw(), page_write() and block_write()
is a void pointer, but we always pass an u8 pointer. We can convert
this parameter to an u8 pointer. The pointer is not changed in the
functions, so we can safely remove the local variable bufferPtr.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_fw.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_fw.c b/drivers/staging/r8188eu/core/rtw_fw.c
index 5f59acfd8b5d..3cea4e41ab13 100644
--- a/drivers/staging/r8188eu/core/rtw_fw.c
+++ b/drivers/staging/r8188eu/core/rtw_fw.c
@@ -71,7 +71,7 @@ static void fw_download_enable(struct adapter *padapter, bool enable)
 	}
 }
 
-static int block_write(struct adapter *padapter, void *buffer, u32 size)
+static int block_write(struct adapter *padapter, u8 *buffer, u32 size)
 {
 	int ret = _SUCCESS;
 	u32	blockSize_p1 = 4;	/*  (Default) Phase #1 : PCI muse use 4-byte write to download FW */
@@ -79,7 +79,6 @@ static int block_write(struct adapter *padapter, void *buffer, u32 size)
 	u32	blockSize_p3 = 1;	/*  Phase #3 : Use 1-byte, the remnant of FW image. */
 	u32	blockCount_p1 = 0, blockCount_p2 = 0, blockCount_p3 = 0;
 	u32	remainSize_p1 = 0, remainSize_p2 = 0;
-	u8 *bufferPtr	= (u8 *)buffer;
 	u32	i = 0, offset = 0;
 
 	blockSize_p1 = MAX_REG_BLOCK_SIZE;
@@ -89,7 +88,7 @@ static int block_write(struct adapter *padapter, void *buffer, u32 size)
 	remainSize_p1 = size % blockSize_p1;
 
 	for (i = 0; i < blockCount_p1; i++) {
-		ret = rtw_writeN(padapter, (FW_8188E_START_ADDRESS + i * blockSize_p1), blockSize_p1, (bufferPtr + i * blockSize_p1));
+		ret = rtw_writeN(padapter, (FW_8188E_START_ADDRESS + i * blockSize_p1), blockSize_p1, (buffer + i * blockSize_p1));
 		if (ret == _FAIL)
 			goto exit;
 	}
@@ -102,7 +101,7 @@ static int block_write(struct adapter *padapter, void *buffer, u32 size)
 		remainSize_p2 = remainSize_p1 % blockSize_p2;
 
 		for (i = 0; i < blockCount_p2; i++) {
-			ret = rtw_writeN(padapter, (FW_8188E_START_ADDRESS + offset + i * blockSize_p2), blockSize_p2, (bufferPtr + offset + i * blockSize_p2));
+			ret = rtw_writeN(padapter, (FW_8188E_START_ADDRESS + offset + i * blockSize_p2), blockSize_p2, (buffer + offset + i * blockSize_p2));
 
 			if (ret == _FAIL)
 				goto exit;
@@ -116,7 +115,7 @@ static int block_write(struct adapter *padapter, void *buffer, u32 size)
 		blockCount_p3 = remainSize_p2 / blockSize_p3;
 
 		for (i = 0; i < blockCount_p3; i++) {
-			ret = rtw_write8(padapter, (FW_8188E_START_ADDRESS + offset + i), *(bufferPtr + offset + i));
+			ret = rtw_write8(padapter, (FW_8188E_START_ADDRESS + offset + i), *(buffer + offset + i));
 
 			if (ret == _FAIL)
 				goto exit;
@@ -127,7 +126,7 @@ static int block_write(struct adapter *padapter, void *buffer, u32 size)
 	return ret;
 }
 
-static int page_write(struct adapter *padapter, u32 page, void *buffer, u32 size)
+static int page_write(struct adapter *padapter, u32 page, u8 *buffer, u32 size)
 {
 	u8 value8;
 	u8 u8Page = (u8)(page & 0x07);
@@ -138,21 +137,20 @@ static int page_write(struct adapter *padapter, u32 page, void *buffer, u32 size
 	return block_write(padapter, buffer, size);
 }
 
-static int write_fw(struct adapter *padapter, void *buffer, u32 size)
+static int write_fw(struct adapter *padapter, u8 *buffer, u32 size)
 {
 	/*  Since we need dynamic decide method of dwonload fw, so we call this function to get chip version. */
 	/*  We can remove _ReadChipVersion from ReadpadapterInfo8192C later. */
 	int ret = _SUCCESS;
 	u32	pageNums, remainSize;
 	u32	page, offset;
-	u8 *bufferPtr = (u8 *)buffer;
 
 	pageNums = size / MAX_PAGE_SIZE;
 	remainSize = size % MAX_PAGE_SIZE;
 
 	for (page = 0; page < pageNums; page++) {
 		offset = page * MAX_PAGE_SIZE;
-		ret = page_write(padapter, page, bufferPtr + offset, MAX_PAGE_SIZE);
+		ret = page_write(padapter, page, buffer + offset, MAX_PAGE_SIZE);
 
 		if (ret == _FAIL)
 			goto exit;
@@ -160,7 +158,7 @@ static int write_fw(struct adapter *padapter, void *buffer, u32 size)
 	if (remainSize) {
 		offset = pageNums * MAX_PAGE_SIZE;
 		page = pageNums;
-		ret = page_write(padapter, page, bufferPtr + offset, remainSize);
+		ret = page_write(padapter, page, buffer + offset, remainSize);
 
 		if (ret == _FAIL)
 			goto exit;
-- 
2.35.1

