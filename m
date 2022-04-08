Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C37368;
	Fri,  8 Apr 2022 01:13:03 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id 88-20020a9d0ee1000000b005d0ae4e126fso5121683otj.5;
        Thu, 07 Apr 2022 18:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g1Kle3EQr1/CPSHsj2wGFWYkLo1imKPjNuOAYNOExHs=;
        b=UFGH/oIFlHTTJQozUrkXJKx7CPyl9/4A2J2k+KuS6wljCHDWMr4GNoPjm9TMSc2d+5
         Wz/iTpOA2hnbvguleQgxhxycamUICCHpdxLfu6T7YsGjFTkLMubpnQTU5bCO7T8pQzF6
         BbVdLtSzpsq/8++edOSOco+p4nbZB38+mAuO1XOpQ+Ckcc9gk21WhK5nJhwibKNmL5df
         KSBUFHBSq7ux69Lo/oJUm+4P38ZYDi2vIEOGA8Ccd1ay+j85CQC44LpXKDCGoUp8y/0Y
         t1tN2qeZHIODOJUix+Eudc8Gbf9xd+vkhu2/98xEvqaOUAu0MK217JEXVXNVgF9sxnu/
         lvHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g1Kle3EQr1/CPSHsj2wGFWYkLo1imKPjNuOAYNOExHs=;
        b=GpnucDPWbS7RT0paomflgqncRU5ZYLXBJ4iFB3y4VdLvMpzSA0ryJnO1WVD0/Q/R7H
         3qs3GehdcxZBRlhfDdnIcHKCfxa//7aLKGqURiKany9pfTpuNvBjOZ653ybk89ErQkbE
         AkADif3/sRQPrbQCLSDAxzTqzAP1mgnuZh0ddJw9CbwmOY+HDxf4iicM3orLB5XOsdn2
         VZ/AVlgGFJ2qR+WH4Txn2uvL6y3PMDhKPavI6kKLylQ092MJrDv49SNQN4ypJrrjkfX1
         +yUpTg7LvA6DN7Kq9u7+5YPVn6h3rDWxYTISmqk2C22PdMkXIQ6eDo51kUg3U20EFWr+
         fGyA==
X-Gm-Message-State: AOAM530wWWo1U26W2sRSEZ3mpjVEKcXjnOm1LQ+jIqPEuZL42+k0GLL/
	I/fJ6uyjC8Obemmc95TJNJc=
X-Google-Smtp-Source: ABdhPJxA8Gat5vXXgIRovYAAo79QdQpB+QXY0jkhdAEwFcyrXxNjPRcfY0o6rJkCIwNpV0iPlknIVA==
X-Received: by 2002:a05:6830:11d6:b0:5b2:5a37:3cc7 with SMTP id v22-20020a05683011d600b005b25a373cc7mr5731636otq.381.1649380382380;
        Thu, 07 Apr 2022 18:13:02 -0700 (PDT)
Received: from bertie (072-190-140-117.res.spectrum.com. [72.190.140.117])
        by smtp.gmail.com with ESMTPSA id p22-20020a056870831600b000ccfbea4f23sm9085214oae.33.2022.04.07.18.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 18:13:02 -0700 (PDT)
From: Rebecca Mckeever <remckee0@gmail.com>
To: outreachy@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rebecca Mckeever <remckee0@gmail.com>
Subject: [PATCH v2 2/2] staging: rtl8192u: use min_t/max_t macros instead of if else
Date: Thu,  7 Apr 2022 20:12:51 -0500
Message-Id: <65518c0b366bf199903c6c530774c61ba6087165.1649378587.git.remckee0@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1649378587.git.remckee0@gmail.com>
References: <cover.1649378587.git.remckee0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace if else statement with min_t or max_t macros to increase
readability and conform to Linux kernel coding style. The _t versions
of the macros must be used to avoid applying typeof to the bit fields
pPeerHTCap->MaxRxAMPDUFactor, and pPeerHTCap->MPDUDensity.

Using u32 assures the reader that the value with not be truncated
without having to look up the types of the variables involved.
Found with minmax coccinelle script.

Signed-off-by: Rebecca Mckeever <remckee0@gmail.com>
---
 drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c b/drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c
index dba3f2db9f48..358c35d9589c 100644
--- a/drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c
@@ -940,10 +940,8 @@ void HTOnAssocRsp(struct ieee80211_device *ieee)
 			else
 				pHTInfo->CurrentAMPDUFactor = HT_AGG_SIZE_64K;
 		} else {
-			if (pPeerHTCap->MaxRxAMPDUFactor < HT_AGG_SIZE_32K)
-				pHTInfo->CurrentAMPDUFactor = pPeerHTCap->MaxRxAMPDUFactor;
-			else
-				pHTInfo->CurrentAMPDUFactor = HT_AGG_SIZE_32K;
+			pHTInfo->CurrentAMPDUFactor = min_t(u32, pPeerHTCap->MaxRxAMPDUFactor,
+							    HT_AGG_SIZE_32K);
 		}
 	}
 
@@ -951,10 +949,9 @@ void HTOnAssocRsp(struct ieee80211_device *ieee)
 	 * <2> Set AMPDU Minimum MPDU Start Spacing
 	 * 802.11n 3.0 section 9.7d.3
 	 */
-	if (pHTInfo->MPDU_Density > pPeerHTCap->MPDUDensity)
-		pHTInfo->CurrentMPDUDensity = pHTInfo->MPDU_Density;
-	else
-		pHTInfo->CurrentMPDUDensity = pPeerHTCap->MPDUDensity;
+	pHTInfo->CurrentMPDUDensity = max_t(u32, pHTInfo->MPDU_Density,
+					    pPeerHTCap->MPDUDensity);
+
 	if (ieee->pairwise_key_type != KEY_TYPE_NA)
 		pHTInfo->CurrentMPDUDensity	= 7; // 8us
 	// Force TX AMSDU
-- 
2.32.0

