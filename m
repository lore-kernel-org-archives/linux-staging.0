Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B5072
	for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 09:37:58 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id g141so2243235wmg.4
        for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 02:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d7RhWPpiRn/6eZuKuWb4Qykp0WF6NU3VTuWhWe9FJ/U=;
        b=aEiwYxvHkMqgB/wRsY+LIGPnCe88NCRnXH9E+51HXkCDsYrk6Tzg9YiFqae1LplibJ
         YEYKKydIb3hqz0IFnemc/4jAd8mzTfXJ+tNtLA3uS60oF3SVxx2jvWPY5aEgWRgWo4Pu
         n1XJZVeeQfUs5WMoloq8gvNir2osPFl1hj9oBwVPfSN9/LMSy9RF/gv8wjxesYrw+Jix
         nvz/KJFvIXtYuOBLBRHECnu4PpU9uwf9iY0K73LjhXfe3E0JDEqd33aNzBB21KwFv8+F
         va6QqlVcmsfLrE8VXPUc0XGzPp5TD8k914RcMn2Zw60ZF9cLUWgv7HIIozUDiITt3+SB
         Bcbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d7RhWPpiRn/6eZuKuWb4Qykp0WF6NU3VTuWhWe9FJ/U=;
        b=uzasyom7ase50mshC8/6E2MTbBTBzB1l5WNy965E0XmzSOK9a5hKPUK8ub18oI5G1h
         SVffN6Q8TUQOWnoysHYyO4BcMOvjk/d+NSK2/anOyy5p70E8wr81OZB/qfQnZVDSkRXW
         CKGvqJAhYTz3CM8kbVALzs5LO9kl0GE/F5dj+JUGff3Q7CMcdbK76HRgiCPsc4HOB8fD
         JuEYVCOe0WFxXcHfyGwL/S9f1LyGAA4ZpszO1ARrxmJUG6s7GDpNdemaT/KPLgOnRuyl
         +mLrsTaU2Qoc1cSrcSC/ryljah9xW9oPbJ/1626zi/NfHqGj8FQ2ku4cXda9C0lydl8l
         lJeQ==
X-Gm-Message-State: AOAM531QNM+nCwnbFKu40Wg7HUrq0MelNFUx564M4tDEjIe52WIC+dam
	tpUtwGJsS4c9PmT71vbBP7c=
X-Google-Smtp-Source: ABdhPJz9G2VqTbk75Af5yZurK7wFd4k3dntxX793Ol0qZVDbUCxikNYu9AL0NIWBey6vAZ8CCAJZBQ==
X-Received: by 2002:a05:600c:1990:: with SMTP id t16mr13231229wmq.124.1634895476586;
        Fri, 22 Oct 2021 02:37:56 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id r15sm1643602wru.9.2021.10.22.02.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 02:37:56 -0700 (PDT)
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karolina Drobnik <karolinadrobnik@gmail.com>
Subject: [PATCH 5/5] staging: vt6655: Rename `byRFType` variable
Date: Fri, 22 Oct 2021 10:37:18 +0100
Message-Id: <f0b6818d2b15982081bebaf14f830f4646f61fe2.1634826774.git.karolinadrobnik@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1634826774.git.karolinadrobnik@gmail.com>
References: <cover.1634826774.git.karolinadrobnik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop Hungarian notation in `byRFType` variable in
`RFvWriteWakeProgSyn` function. Change it to use snake case.

Fix issue detected by checkpatch.pl:
  CHECK: Avoid CamelCase: <byRFType>

Signed-off-by: Karolina Drobnik <karolinadrobnik@gmail.com>
---
 drivers/staging/vt6655/rf.c | 4 ++--
 drivers/staging/vt6655/rf.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
index 0dd91b0433f6..3f57834901a6 100644
--- a/drivers/staging/vt6655/rf.c
+++ b/drivers/staging/vt6655/rf.c
@@ -676,7 +676,7 @@ bool RFbSelectChannel(struct vnt_private *priv, unsigned char byRFType,
  * Return Value: None.
  *
  */
-bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char byRFType,
+bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char rf_type,
 			 u16 channel)
 {
 	void __iomem *iobase = priv->port_offset;
@@ -685,7 +685,7 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char byRFType,
 	unsigned char sleep_count = 0;
 
 	VNSvOutPortW(iobase + MAC_REG_MISCFFNDEX, 0);
-	switch (byRFType) {
+	switch (rf_type) {
 	case RF_AIROHA:
 	case RF_AL2230S:
 
diff --git a/drivers/staging/vt6655/rf.h b/drivers/staging/vt6655/rf.h
index d3f2b8dd6afc..0939937d47a8 100644
--- a/drivers/staging/vt6655/rf.h
+++ b/drivers/staging/vt6655/rf.h
@@ -60,7 +60,7 @@
 bool IFRFbWriteEmbedded(struct vnt_private *priv, unsigned long dwData);
 bool RFbSelectChannel(struct vnt_private *priv, unsigned char byRFType, u16 byChannel);
 bool RFbInit(struct vnt_private *priv);
-bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char byRFType, u16 channel);
+bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char rf_type, u16 channel);
 bool RFbSetPower(struct vnt_private *priv, unsigned int rate, u16 uCH);
 bool RFbRawSetPower(struct vnt_private *priv, unsigned char byPwr,
 		    unsigned int rate);
-- 
2.30.2

