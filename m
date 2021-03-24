Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D551270
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 12:45:06 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id b9so24320190wrt.8
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 05:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oMnWeNt+8HKY/XcCc061eINq7mLFVa2tXy6YaO07BpY=;
        b=THj1hCu2fzmUY6zmcQMi+WdNV+Q/hkZC+Jp+8zjzLRVTeyR0OTBkpbBLASaU1AEKy9
         bli2LhrTMIiQOipeltJ1N0RH8x2+UnvPe9QmdedS9rZYXjny0gHgnXtopT+yQTSAzqDI
         24jmjKyNTgrMkt44CI/flybUJtKuxUKjl+XymEVHc332RtSTFtyDeohzQJhofcNqRWFc
         MwHVdvap0JUl7UeSUzntFqOxSsrar5h3lbz72/XmVHnRJcBOyo++c4o2MNCqOh44B4IS
         nyj6y530BI/GuZp5IIjDlwwYVNxl/CK3CsN+OrpDwYjE4cLGYZHwKCSapSUljxc1dvRc
         rw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oMnWeNt+8HKY/XcCc061eINq7mLFVa2tXy6YaO07BpY=;
        b=jQ6ORHiz4e82FNlsBaQft2qkxcpvjubyCizNeWkghddEz2MdPWVECJqc5Gvq6Uid4J
         Vf5DUFVv89IFXSTiOBCePUXM7Ox6c7qj8kPSX5tRAlwYe2Ln/4Kyc4jYnomFB33xMBi6
         EPegQfyGht+1YHOZfDSVchuCEs0kqQwd6TF+lfYHGH5hs90OYYS+DWmysiZ/LR5iuIuT
         yarGRN4naxzyxIrMCFy/veSVMrBOs7oWjcfkFHFO8RlvERVU7ZGRBXXORwoGTQnoo1z4
         n2zCTQgnYvQu7N6Za+2h8jkFva2B7UAamphMS7HK7XamfJoezMqqlH4rOMCzb5V34we9
         X+hQ==
X-Gm-Message-State: AOAM530a58OJADYORAsbwg6UuOW7clVA3xgJM40rjYF1fAn1PGqxnUNc
	JbGAnJ1Ax9UbW+VGSO9162A=
X-Google-Smtp-Source: ABdhPJz8/01Tyu8sTfQCuDgclRxSirkTrR1q96hMVQMD+NKcpLUfGPJvHv2d6AHEvAX1l3jeWhvfxg==
X-Received: by 2002:adf:dd4f:: with SMTP id u15mr3413375wrm.260.1616589905451;
        Wed, 24 Mar 2021 05:45:05 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id s20sm2324005wmj.36.2021.03.24.05.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:45:05 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 20/33] Staging: rtl8723bs: remove named enums in rtw_xmit.h
Date: Wed, 24 Mar 2021 13:44:43 +0100
Message-Id: <20210324124456.25221-21-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324124456.25221-1-marcocesati@gmail.com>
References: <20210324124456.25221-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum definition in
include/rtw_xmit.h:

	enum txdesc_sc

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_xmit.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging/rtl8723bs/include/rtw_xmit.h
index 4d4fa157daa9..73d020cfd0d1 100644
--- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
@@ -83,13 +83,6 @@ do {\
 
 #define TXDESC_OFFSET TXDESC_SIZE
 
-enum txdesc_sc {
-	SC_DONT_CARE = 0x00,
-	SC_UPPER = 0x01,
-	SC_LOWER = 0x02,
-	SC_DUPLICATE = 0x03
-};
-
 #define TXDESC_40_BYTES
 
 struct tx_desc {
-- 
2.30.2

