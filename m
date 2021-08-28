Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6613FC4
	for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 17:08:47 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id u16so15562770wrn.5
        for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 10:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/M9cHDkNGnyftZAmMuET/ghbO+Y/OsvzwGvOvRO+R8I=;
        b=L/FuFsIhSiI0pLHBLFAWAtNIxLstdFgoBCndCkPruuR1FrH6CKs/W8h74TvI9PW2Z8
         2BCq71+HpEKdo114l/iufj/1I2zWXTmq6iQlv8B69s/nKMpPlvIT7A5N0UPVrl/uzzRz
         1Hi3S+oaItK98BY3KDlBWDntmmOHGRfwXcf2gOwUawBoCVtt3iz6X3d//VydUVqTpf4d
         JdEbk3fIjLBuFnYloNsryrQgDkOjApRllO0zo3Dav7iF3om2LJn5cq/DbOtih0CtaDeS
         9Oz2SwQ13NAL7I5LkmfnhKGIXIs0RrTtdwLbNURMJkv43tJ+ZLU/PfvxWks9bEdlsZYy
         A0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/M9cHDkNGnyftZAmMuET/ghbO+Y/OsvzwGvOvRO+R8I=;
        b=lTxlYNVGBpQ9C3pGMmALdGlHKrzydAK7HjnYL81LjOTrvAlE6QrqrNTpR7cOXPMnOH
         E7ZumcLSbBBdanCS0HJ4uahMg5oKuhbELhyuW0XsaGEeHAa+2eYgezbngmxYzxVVj9Sl
         P1+52FTaPX0LO7D6JTwyypbz14ha1GW9o5wPptnZlHBaRpqA7MhckugMykzGRHrRu7xC
         XsNd1N8/9/AW1F8+Z3MAWmQAIE+5sSx1sdRufGmutoCw2OziDoSALm4LovKkBNFUtXTO
         DGRmwb6rYW//azB5EKMUfNTRIiyutgoPY+iwbt5T/VYvfi7mqcbqJDTf/3ccmPOHi0zD
         H+PA==
X-Gm-Message-State: AOAM530LXBVflVWJfO2bxM/jvnLSJxzSTgbOLNpwQPEdEBYLCeKZOyl2
	XLLbyhjGnqUFmtZkfZ12mM5mzfn5b6TepA==
X-Google-Smtp-Source: ABdhPJyuVWF+RCSSeQbAjAlQLBuJVEgVxNqVXXW1Fcq5NtLdB3rBckep650iXwncHh2rjf/AVRRhdw==
X-Received: by 2002:adf:b785:: with SMTP id s5mr16246909wre.30.1630170526269;
        Sat, 28 Aug 2021 10:08:46 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::884b])
        by smtp.gmail.com with ESMTPSA id u10sm10046515wrt.14.2021.08.28.10.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 10:08:46 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/2] staging: r8188eu: remove rtl8188e_PHY_ConfigRFWithParaFile()
Date: Sat, 28 Aug 2021 19:08:34 +0200
Message-Id: <20210828170834.31388-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210828170834.31388-1-straube.linux@gmail.com>
References: <20210828170834.31388-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtl8188e_PHY_ConfigRFWithParaFile() is unused, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c | 20 -------------------
 .../staging/r8188eu/include/Hal8188EPhyCfg.h  |  4 ----
 2 files changed, 24 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
index 30a9dca8f453..1c1906161da2 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
@@ -609,26 +609,6 @@ int PHY_RFConfig8188E(struct adapter *Adapter)
 	return rtStatus;
 }
 
-/*-----------------------------------------------------------------------------
- * Function:    PHY_ConfigRFWithParaFile()
- *
- * Overview:    This function read RF parameters from general file format, and do RF 3-wire
- *
- * Input:	struct adapter *Adapter
- *			ps8					pFileName
- *			enum rf_radio_path eRFPath
- *
- * Output:      NONE
- *
- * Return:      RT_STATUS_SUCCESS: configuration file exist
- *
- * Note:		Delay may be required for RF configuration
- *---------------------------------------------------------------------------*/
-int rtl8188e_PHY_ConfigRFWithParaFile(struct adapter *Adapter, u8 *pFileName, enum rf_radio_path eRFPath)
-{
-	return _SUCCESS;
-}
-
 void
 rtl8192c_PHY_GetHWRegOriginalValue(
 		struct adapter *Adapter
diff --git a/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h b/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
index d15ff69b8485..ea83c2e17913 100644
--- a/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
+++ b/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
@@ -185,10 +185,6 @@ int PHY_MACConfig8188E(struct adapter *adapter);
 int PHY_BBConfig8188E(struct adapter *adapter);
 int PHY_RFConfig8188E(struct adapter *adapter);
 
-/* RF config */
-int rtl8188e_PHY_ConfigRFWithParaFile(struct adapter *adapter, u8 *filename,
-				      enum rf_radio_path rfpath);
-
 /* Read initi reg value for tx power setting. */
 void rtl8192c_PHY_GetHWRegOriginalValue(struct adapter *adapter);
 
-- 
2.32.0

