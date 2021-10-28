Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5122C81
	for <linux-staging@lists.linux.dev>; Thu, 28 Oct 2021 10:35:58 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id m22so9399737wrb.0
        for <linux-staging@lists.linux.dev>; Thu, 28 Oct 2021 03:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IGvktVhPA6KMBN53Q9S7sFoN48GUfEwFvixIWYHV+nI=;
        b=Sxm6VcJphDjRh8Me8C4V+iuxN95Imhe2VFw9dMiGYEPDnIANrGILveOFbbl5lffyBq
         dB8d5n3t5HSZK+6nhvKr3YQ+YahQaX4k7yVF08/INr4GquIYITDKfXb/vlybNYyEZc3W
         Y5u4HcDng50sSWYpb0P8h3c7RFxzRXLhCyF9AzGJTg4Ck1mFvb2DeNkwPlh+p9ogf4+h
         Ugn+13kuXh4IoUBkTxeSOIPoZvDEn5kyDtZ3iORy9UhPX7+eMdKUxnBubHpL572ILA1u
         AaTokTyYHdSAbGJ3N4IdI1wIQ9mQCHPVT0L9J6OoU/9YPlBJKRYQcCqby/BjgQFBzSPO
         nm7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IGvktVhPA6KMBN53Q9S7sFoN48GUfEwFvixIWYHV+nI=;
        b=1Vpd9ACxtsMDdj6Ta+HbzPVDsyrweZYnAOeGLpBZPWgZF1YXoyVf2BVs0TNnwJo/2S
         Y2BnO9ZiShF1VcTNyzWgjrpbbcMpx8dNHpjXIXb2y5Wb6OaayO8UlMzGO+OIxGfHCqqO
         gIomPaAtgXt8iNyvDlY2MVpc9auKKDIPGygDPS+g5Y22bbw0cnCqEEWjR1JM9vCOYTJw
         XkYxBQb3CTcRs5BpdnPpeOJ3xwZ27WjJFZU6pSFFcu8S4nR8prNzyAqEwzRP9N9brawG
         Ynb3DLrV6YjTj/UBUAIl53WAk4pUp/U+0xFCXzPOHeBGbLL+k9LQHN5CeGydbj4g3Ilv
         qhjQ==
X-Gm-Message-State: AOAM530lqf+8ELhTs3W3Dz6F9zWaNtiB4vpdmoTpO6BNI/QwCj3isZTW
	5VG4BrGpDL2qHnYFAs4Itjo=
X-Google-Smtp-Source: ABdhPJy0OHC/Z0pjoruA7fVybjLgRInXO+fCbCQ6mm2m62n6br5IuulLDNIS8la03WanY6gQB39Osg==
X-Received: by 2002:adf:e0c1:: with SMTP id m1mr4558338wri.241.1635417356520;
        Thu, 28 Oct 2021 03:35:56 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id 13sm3768083wrz.38.2021.10.28.03.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 03:35:56 -0700 (PDT)
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karolina Drobnik <karolinadrobnik@gmail.com>
Subject: [PATCH 2/7] staging: vt6655: Use incrementation in `idx`
Date: Thu, 28 Oct 2021 11:35:32 +0100
Message-Id: <c569952d92ba51f32679c2fd87fd48ad8e49e3fc.1635415820.git.karolinadrobnik@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1635415820.git.karolinadrobnik@gmail.com>
References: <cover.1635415820.git.karolinadrobnik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Increment `idx` in a loop instead of adding the loop counter
`i` to do so. Thanks to this change, the cast to unsigned short
can be removed.

Signed-off-by: Karolina Drobnik <karolinadrobnik@gmail.com>
---
 drivers/staging/vt6655/rf.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
index f195dafb6e63..c07653566d17 100644
--- a/drivers/staging/vt6655/rf.c
+++ b/drivers/staging/vt6655/rf.c
@@ -700,11 +700,11 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char rf_type,
 			return false;
 
 		for (i = 0; i < CB_AL2230_INIT_SEQ; i++)
-			MACvSetMISCFifo(priv, (unsigned short)(idx + i), al2230_init_table[i]);
+			MACvSetMISCFifo(priv, idx++, al2230_init_table[i]);
 
-		MACvSetMISCFifo(priv, (unsigned short)(idx + i), al2230_channel_table0[channel - 1]);
+		MACvSetMISCFifo(priv, idx++, al2230_channel_table0[channel - 1]);
 		i++;
-		MACvSetMISCFifo(priv, (unsigned short)(idx + i), al2230_channel_table1[channel - 1]);
+		MACvSetMISCFifo(priv, idx++, al2230_channel_table1[channel - 1]);
 		break;
 
 		/* Need to check, PLLON need to be low for channel setting */
@@ -717,17 +717,17 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char rf_type,
 
 		if (channel <= CB_MAX_CHANNEL_24G) {
 			for (i = 0; i < CB_AL7230_INIT_SEQ; i++)
-				MACvSetMISCFifo(priv, (unsigned short)(idx + i), al7230_init_table[i]);
+				MACvSetMISCFifo(priv, idx++, al7230_init_table[i]);
 		} else {
 			for (i = 0; i < CB_AL7230_INIT_SEQ; i++)
-				MACvSetMISCFifo(priv, (unsigned short)(idx + i), al7230_init_table_a_mode[i]);
+				MACvSetMISCFifo(priv, idx++, al7230_init_table_a_mode[i]);
 		}
 
-		MACvSetMISCFifo(priv, (unsigned short)(idx + i), al7230_channel_table0[channel - 1]);
+		MACvSetMISCFifo(priv, idx++, al7230_channel_table0[channel - 1]);
 		i++;
-		MACvSetMISCFifo(priv, (unsigned short)(idx + i), al7230_channel_table1[channel - 1]);
+		MACvSetMISCFifo(priv, idx++, al7230_channel_table1[channel - 1]);
 		i++;
-		MACvSetMISCFifo(priv, (unsigned short)(idx + i), al7230_channel_table2[channel - 1]);
+		MACvSetMISCFifo(priv, idx++, al7230_channel_table2[channel - 1]);
 		break;
 
 	case RF_NOTHING:
-- 
2.30.2

