Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81917320E
	for <linux-staging@lists.linux.dev>; Fri, 15 Apr 2022 12:10:39 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id l7so15108026ejn.2
        for <linux-staging@lists.linux.dev>; Fri, 15 Apr 2022 05:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CJi+tLxXamIuDAtEfjvcqCgFDEYBl2Om677cUuE/bbA=;
        b=qhgCzLkd+bA8r6SGZR0qHhG5JQ7asfZzybk24U9sGCt3ey4X5LXDDQ4i/mlbDP4rfC
         HQyjoXVEHNgVlog7GS3/ZkEoWAT9MA2/dKy01Qu0TZK3xs+AeeDm7D5b4ulNomEFab1L
         ufKiKzSbgF75EGlXqf8oL+gIQq9tZJW//fGWY7ODb/W+5DXMjUTAMU5CnnlKW2aGrK+y
         wOzEY7hkcGV0XqH8zG6Y4bnxJgudVvv3IA9QnlSMxkMrKVOx46qV081CN3aKrIHbzdY3
         wTI5shBrGrPiyYr47zLdXtEcaozQTXAN8e7yoAuepiyN8gtoVl/RchVaGyFEhr8VtH4S
         VLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CJi+tLxXamIuDAtEfjvcqCgFDEYBl2Om677cUuE/bbA=;
        b=d1hACdVuDupnBn6MlmYmhQz5rfmJxjhaJVZG313jqJf0U6cvXkC3xMpdCouG/QXCSk
         BlADpgXmT+nxpvfHxImukES0VJDPAFtqpxoXdX+yMlj1BSCj4NJwSmPnCDJ7YYx1C0g+
         kVe1Ac1VSI/PBsB48Ue4x66yONKEmL1XuS5N9Yz8+IevjjFPhygaNk52/SJVMbLtpUVD
         8f3t4gp7/2cDQ2MUa6qNGoJRBi4LrrCnJoJam0mkQI0abthklgZIwORJQ9T/wfBLKcLI
         5WsIUjDSHZVf7z1VtqCIr8JJQ0jqd5aH4ywmRE5WMmfwTPSN0K/pi38NjVnSwn9gHlAI
         538w==
X-Gm-Message-State: AOAM533QC2nS4NqcwL/iGhTRuzo66P/wTWIiwjVj2Nq3mNoPT79PQs8R
	cR64bmVUh4OyH1gMfGFiOxs=
X-Google-Smtp-Source: ABdhPJx5rDcal83LHDyWtmxL13N9eb58SYGqi/MCghxYdcwXxrcc4lbxqNt0s5f9P18SdzlnJLh7DQ==
X-Received: by 2002:a17:906:4fcb:b0:6e8:74db:6b04 with SMTP id i11-20020a1709064fcb00b006e874db6b04mr6064220ejw.676.1650024637867;
        Fri, 15 Apr 2022 05:10:37 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abba5.dynamic.kabel-deutschland.de. [95.90.187.165])
        by smtp.gmail.com with ESMTPSA id z22-20020a1709063ad600b006e8867caa5dsm1626114ejd.72.2022.04.15.05.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 05:10:37 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 4/8] staging: r8188eu: rename fields of struct rt_firmware_hdr
Date: Fri, 15 Apr 2022 14:10:19 +0200
Message-Id: <20220415121023.11564-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415121023.11564-1-straube.linux@gmail.com>
References: <20220415121023.11564-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the fields of struct rt_firmware_hdr to avoid camel case.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v3:
- no changes

v2:
- no changes

 drivers/staging/r8188eu/core/rtw_fw.c | 48 +++++++++++++--------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_fw.c b/drivers/staging/r8188eu/core/rtw_fw.c
index 323e0c634c4e..3da52a1ba23c 100644
--- a/drivers/staging/r8188eu/core/rtw_fw.c
+++ b/drivers/staging/r8188eu/core/rtw_fw.c
@@ -9,29 +9,29 @@
 #define MAX_PAGE_SIZE		4096
 
 #define IS_FW_HEADER_EXIST(_fwhdr)				\
-	((le16_to_cpu(_fwhdr->Signature) & 0xFFF0) == 0x92C0 ||	\
-	(le16_to_cpu(_fwhdr->Signature) & 0xFFF0) == 0x88C0 ||	\
-	(le16_to_cpu(_fwhdr->Signature) & 0xFFF0) == 0x2300 ||	\
-	(le16_to_cpu(_fwhdr->Signature) & 0xFFF0) == 0x88E0)
+	((le16_to_cpu(_fwhdr->signature) & 0xFFF0) == 0x92C0 ||	\
+	(le16_to_cpu(_fwhdr->signature) & 0xFFF0) == 0x88C0 ||	\
+	(le16_to_cpu(_fwhdr->signature) & 0xFFF0) == 0x2300 ||	\
+	(le16_to_cpu(_fwhdr->signature) & 0xFFF0) == 0x88E0)
 
 struct rt_firmware_hdr {
-	__le16		Signature;
-	u8		Category;
-	u8		Function;
-	__le16		Version;
-	u8		Subversion;
-	u8		Rsvd1;
-	u8		Month;
-	u8		Date;
-	u8		Hour;
-	u8		Minute;
-	__le16		RamCodeSize;
-	u8		Foundry;
-	u8		Rsvd2;
-	__le32		SvnIdx;
-	__le32		Rsvd3;
-	__le32		Rsvd4;
-	__le32		Rsvd5;
+	__le16	signature;
+	u8	category;
+	u8	function;
+	__le16	version;
+	u8	subversion;
+	u8	rsvd1;
+	u8	month;
+	u8	date;
+	u8	hour;
+	u8	minute;
+	__le16	ramcodesize;
+	u8	foundry;
+	u8	rsvd2;
+	__le32	svnidx;
+	__le32	rsvd3;
+	__le32	rsvd4;
+	__le32	rsvd5;
 };
 
 static void fw_download_enable(struct adapter *padapter, bool enable)
@@ -254,9 +254,9 @@ int rtl8188e_firmware_download(struct adapter *padapter)
 	/*  To Check Fw header. Added by tynli. 2009.12.04. */
 	fwhdr = (struct rt_firmware_hdr *)dvobj->firmware.data;
 
-	fw_version = le16_to_cpu(fwhdr->Version);
-	fw_subversion = fwhdr->Subversion;
-	fw_signature = le16_to_cpu(fwhdr->Signature);
+	fw_version = le16_to_cpu(fwhdr->version);
+	fw_subversion = fwhdr->subversion;
+	fw_signature = le16_to_cpu(fwhdr->signature);
 
 	if (!log_version++)
 		pr_info("%sFirmware Version %d, SubVersion %d, Signature 0x%x\n",
-- 
2.35.1

