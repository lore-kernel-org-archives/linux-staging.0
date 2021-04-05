Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA355F
	for <linux-staging@lists.linux.dev>; Mon,  5 Apr 2021 16:50:29 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id a6so5435066wrw.8
        for <linux-staging@lists.linux.dev>; Mon, 05 Apr 2021 09:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lY2cZl4jmtqee28Wid3oWUq3bqH3JHfeDzZ9nthtBOY=;
        b=Y1+T+GzxranPSfFpVG88DfAIeUZ7+KfkL0ArlGPMbbvuK/JYjJgF2+FkQJQgmmtdaT
         ODCuqrDb21sZBjw/2Gxjg4iRFCNzM59rD2FaWNhwgJUYf33TycTOB6dP2lDMV97XGzzC
         u3vsYukqQxQWOSPn1RJr9m2TNvTTCRXkC7NJP2YEA3Xklde4GlXaquLbecJviTlvE1cY
         Zylp3c0SRlo+UQ55FNZE00ioCZCNl8aObrx9N2Eu3kcls0VuTTeOFUh+bGrtOkR6X6zQ
         +UnGD1tBrXirEdtS0+IifmfJQgLqV1S9ax4i8TTR2YrhftviyVcKK1UPGLoyL7PGnfEY
         khvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lY2cZl4jmtqee28Wid3oWUq3bqH3JHfeDzZ9nthtBOY=;
        b=QQ5aqdMiQPpuC6BMDo3U4oh9XBzoUfiwhBQcCXHRpyqk0Z8CE95/hiFiTJb/Y+Lf8r
         GqBP+NsfQNTLvImP80ajuwg0VNrmgOWly5wIVj7z8ze5m0qC8w006VgLgTO9adMUNKAH
         myFDfqsi+Gl9IWfpD2rJsPWc8K4sV9Ptgg9+q2q5vsjrPSamUeP5dukHF1JDz7FEk6bC
         ZB4Zc/+dWcsdZ/zvCniiWYDcPeVes7Q5kYrTrZhVjL8SxqwUzEfL1bQ3P+M2lmPeW8Sw
         5bs0kYeMsL6E+lIt9Yo07lWywamTjNO/UW/4kGT474hw2LEXWph7PBQQZcav19bYXFlI
         jySA==
X-Gm-Message-State: AOAM530Oc0IJlAIk/VDKV/DrT2cyKYglJnKwtWND6v4SJg6vlWlfesu+
	IB6TjLq1QtghV9KyUYdsLa8=
X-Google-Smtp-Source: ABdhPJwrABX4IxFOcIS3MXPr0hk2kBOFhli6e4mmcChdEhXzunvTkXDMalAbeNfypfQ7kW/XSxfChQ==
X-Received: by 2002:adf:df8b:: with SMTP id z11mr8154449wrl.133.1617641428026;
        Mon, 05 Apr 2021 09:50:28 -0700 (PDT)
Received: from agape ([5.171.72.58])
        by smtp.gmail.com with ESMTPSA id r1sm35488857wrj.63.2021.04.05.09.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 09:50:27 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 08/10] staging: rtl8723bs: rewrite comparisons to null
Date: Mon,  5 Apr 2021 18:49:55 +0200
Message-Id: <92edc9da10838dd99f96a99121343f4ec11b5d90.1617640221.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617640221.git.fabioaiuto83@gmail.com>
References: <cover.1617640221.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix the following post-commit hook checkpatch issues:

CHECK: Comparison to NULL could be written "!pwep"
147: FILE: drivers/staging/rtl8723bs/os_dep/ioctl_linux.c:442:
+			if (pwep == NULL)

CHECK: Comparison to NULL could be written "!skb"
226: FILE: drivers/staging/rtl8723bs/os_dep/recv_linux.c:204:
+	if (skb == NULL)

CHECK: Comparison to NULL could be written "!dvobj"
275: FILE: drivers/staging/rtl8723bs/os_dep/sdio_intf.c:398:
+	if (dvobj == NULL)

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 2 +-
 drivers/staging/rtl8723bs/os_dep/recv_linux.c  | 2 +-
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index 03360af0645d..297287cff5be 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -439,7 +439,7 @@ static int wpa_set_encryption(struct net_device *dev, struct ieee_param *param,
 			wep_key_len = wep_key_len <= 5 ? 5 : 13;
 			wep_total_len = wep_key_len + FIELD_OFFSET(struct ndis_802_11_wep, KeyMaterial);
 			pwep = kzalloc(wep_total_len, GFP_KERNEL);
-			if (pwep == NULL)
+			if (!pwep)
 				goto exit;
 
 			pwep->KeyLength = wep_key_len;
diff --git a/drivers/staging/rtl8723bs/os_dep/recv_linux.c b/drivers/staging/rtl8723bs/os_dep/recv_linux.c
index 63a7e7fe2bb5..975aceb7b45b 100644
--- a/drivers/staging/rtl8723bs/os_dep/recv_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/recv_linux.c
@@ -201,7 +201,7 @@ int rtw_recv_indicatepkt(struct adapter *padapter, union recv_frame *precv_frame
 	pfree_recv_queue = &(precvpriv->free_recv_queue);
 
 	skb = precv_frame->u.hdr.pkt;
-	if (skb == NULL)
+	if (!skb)
 		goto _recv_indicatepkt_drop;
 
 	skb->data = precv_frame->u.hdr.rx_data;
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index f8e1d15f54ef..deba03ad6c6e 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -395,7 +395,7 @@ static int rtw_drv_init(
 	struct dvobj_priv *dvobj;
 
 	dvobj = sdio_dvobj_init(func);
-	if (dvobj == NULL)
+	if (!dvobj)
 		goto exit;
 
 	if1 = rtw_sdio_if1_init(dvobj, id);
-- 
2.20.1

