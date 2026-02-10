Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7157320A04
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 16:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770742526; cv=none; b=iCkDn/fCUpJRRbwEJhMP8qrtJgUQhzK5hCRT2CUhruTKOrgfgYoI0CFE6MZQJDm2ZMn0nmzaCC2nIHl28VJYxbc2L6rGgM+6ufzTafyga01KJ5fH6Jenwv/mnjp+He+kugfDLQgQA3bZXtXgVCMBnQ3Y5k0N/eroKs58IK3JE1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770742526; c=relaxed/simple;
	bh=7MosGhy/t1Mkok33yGqKsa8MA6KoL/BFPPyAa1YCxls=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uTuLocmECaOvxI+o82Q7rKoxckygK/P7tNn9eS3ueOMHdNtn06hqrDYwaNtgOwNvnWk8R9YEUiPG7cKYlC4GogfHIrBAHP3skE3T72er3l7ErJmfvSSJ5j3aEW60j5Ybophsvca2jDQ1XXtiMAKFCltQnGS+P9YyGe49ujZ6bt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GBp9hJ5f; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GBp9hJ5f"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-436356740e6so3575105f8f.2
        for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 08:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770742523; x=1771347323; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=El7fyJXctfLNl9Ri9kiDoimyV9o1cKPXDiPyPOcJdeg=;
        b=GBp9hJ5fm0G/dEsYKkIJ2d28HUQMo3LkHbDK+wnr+HQxYDdXBDNYQ462bh8qOnom6t
         KcJEZLZjX/Ge5d5A9BPrJAka7fwxkDFqegW9pK08wqx0n8yRenJaslhmUYJ9LB1G4TVk
         3HJddRvdTgpXNStL3OaUNBRRplgFYfnhg2zfA6+DZdc19y8oQopawTSckQIsqGjfJVvK
         /oK/lBJhMogB0XgL/H9dlYoM1A7a6LW6KZ/R1t+LDdP6yuhHvtHlgVN3muBSqDQYt57w
         59P3bQKFXcuEUR1g3LjWpBg0G3g8VUv8E9MHpNb1PpylErDKSdCStxoiFQCyUwmdtBGJ
         a1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770742523; x=1771347323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=El7fyJXctfLNl9Ri9kiDoimyV9o1cKPXDiPyPOcJdeg=;
        b=IYrs0z9tcM+HqIyvLBkKoWxJcdhfna7A1OUTQVY0X8zKHOl+pdYdBvu4RckcRMcl0X
         afSGRA/olNPIxfa7dx1dx7HDFIoxFH0y9AhQxhdFuxReTb7kggibSCodB72tK8+Nzw4/
         0RXR92eKUL7YAR5E4UBzll5NZgkoOTUQ+uykVh9BRDWk5ncbCm+x9c/Qf3MXp/wO5RQ4
         r29gYaPMeJmWv5FsSUHuERcqpgJpDoX/cRTFjIkIgqotw2izNfOhVmO/pvtaJ4q4urLB
         AkwcAGgdthGT2OYlirKLbeu+VVJWGXdZg85/sRqlG9b9xh1+jnI2VHjVS+uH5UE3OIr3
         rMiQ==
X-Gm-Message-State: AOJu0Yy4/YU0vK/A4plrg6KGjYEkMIBsSLPgHVlZNJKKYSLhQGQlmlvq
	dbHVvtOUBWuFWWwMoouBOuuaa/7dLdClboMOyAvW+8XMe1efxRz1zyCty2smgwY+
X-Gm-Gg: AZuq6aKUHw/0LDept/wFQqgJ/NVjD7N+hjIb8sCREabafUCFimL0moT3ZbEnGy0M+mk
	U9bKm5ZcVDMNEgUoXSj99xmLO4jB0qZlzFSx9P+36fqXE7g6jLQjYrg5lBO+1Y/Smi7PxJ0UVF0
	NQFxYLNtjmIP65FQQ5RZy/4+XyBMym6VvZbEhdd1NPtb0R9EK4t5/uq8qnwvXOVQySxh4bbKy/B
	8YKvWP5ejGLj5Eo0ItpXl9PHVgwoMIKycvREt148wYvuDT6E6UTxrf3eBzpSm1uo4fLOH4DZs0K
	2tUEG68EDlRltJLAwJY0EZIeRE/RCEnvfMcUawxYrmzAgXPiDyLBD2TQp5AHJgBP+ht15X8ovNN
	2AzTKmSbHpuZKK0x7gZ36vDcBW6ej+ywhGvIXB1UJXnWNccQ3sDmeLHeXHeG5J92UfhkJJwsGOh
	TmjrUHNWiW3djd/TkYodecZLoG6FyFDN47g5KmhE/Y1z3SckFNY6qbfJSIoZ2LMLvH9546d3Nfl
	g==
X-Received: by 2002:a5d:6885:0:b0:436:3563:49a2 with SMTP id ffacd0b85a97d-43635634b58mr11211989f8f.37.1770742523245;
        Tue, 10 Feb 2026 08:55:23 -0800 (PST)
Received: from localhost.localdomain (95.59.121.114.dynamic.telecom.kz. [95.59.121.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436297462a8sm33057784f8f.30.2026.02.10.08.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 08:55:22 -0800 (PST)
From: Azamat Rakhim <azamatrakhim8@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Azamat Rakhim <azamatrakhim8@gmail.com>
Subject: [PATCH] staging: rtl8723bs: use u8 instead of int for bssrate_len in get_rate_set()
Date: Tue, 10 Feb 2026 21:54:37 +0500
Message-ID: <20260210165437.24550-1-azamatrakhim8@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace int with u8 for bssrate_len in get_rate_set() and update
all callers to match. This addresses the driver's TODO.

Signed-off-by: Azamat Rakhim <azamatrakhim8@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 4 ++--
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c   | 2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index ac49bfbaa5bb..47c13a0294b1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -2458,7 +2458,7 @@ static int _issue_probereq(struct adapter *padapter,
 	struct xmit_priv *pxmitpriv = &(padapter->xmitpriv);
 	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
-	int	bssrate_len = 0;
+	u8	bssrate_len = 0;
 
 	pmgntframe = alloc_mgtxmitframe(pxmitpriv);
 	if (!pmgntframe)
@@ -2846,7 +2846,7 @@ void issue_assocreq(struct adapter *padapter)
 	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
-	int	bssrate_len = 0, sta_bssrate_len = 0;
+	u8	bssrate_len = 0, sta_bssrate_len = 0;
 	u8 vs_ie_length = 0;
 
 	pmgntframe = alloc_mgtxmitframe(pxmitpriv);
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 5ffefa50699e..f17741f81147 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -159,7 +159,7 @@ unsigned int ratetbl2rateset(struct adapter *padapter, unsigned char *rateset)
 	return len;
 }
 
-void get_rate_set(struct adapter *padapter, unsigned char *pbssrate, int *bssrate_len)
+void get_rate_set(struct adapter *padapter, unsigned char *pbssrate, u8 *bssrate_len)
 {
 	unsigned char supportedrates[NumRates];
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index dd5080056e58..99c09c71c005 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -432,7 +432,7 @@ extern struct xmit_frame *alloc_mgtxmitframe(struct xmit_priv *pxmitpriv);
 
 u8 networktype_to_raid_ex(struct adapter *adapter, struct sta_info *psta);
 
-void get_rate_set(struct adapter *padapter, unsigned char *pbssrate, int *bssrate_len);
+void get_rate_set(struct adapter *padapter, unsigned char *pbssrate, u8 *bssrate_len);
 void set_mcs_rate_by_mask(u8 *mcs_set, u32 mask);
 void update_basic_rate_table(struct adapter *padapter, u8 *mBratesOS);
 void update_basic_rate_table_soft_ap(u8 *bssrateset, u32 bssratelen);
-- 
2.43.0

