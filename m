Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11E135293F
	for <linux-staging@lists.linux.dev>; Wed, 17 Dec 2025 15:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765986149; cv=none; b=FXUeb9dagOEpkxybHuJdoPD6XYE8GKQLebuytm9vt5UwUVwU9erE+wOjc6mVMLrDGLeesxR5kuJiPkcUyUhTHp/OpdH18nqGo//cTdCZcXiNziHQuK1ypPn7AQni82XSGJMZqSyjTC0dG/e7RHp37B5oOg41J4Su45jy4/ef0cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765986149; c=relaxed/simple;
	bh=qo6Su76KF6RBKyoix2E2RDK/JywRXHqupIsVexf9oxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EwgI6rX0ud62GX+okFhNXR680K7L0IrqUUydqeLznrgH/7acYmPV2w2I6A+TNW5cRnqoDyL91/iIdX00ACiywDIAkVFpazacRawk38hWGLiP8OUuWwl4eLu48/wqLRgX/0Gnow2hBUyB4NjHLhwl5OsLmzZ5RBAQgc3XGoSVjTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gCydkZ+M; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gCydkZ+M"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7ade456b6abso4722871b3a.3
        for <linux-staging@lists.linux.dev>; Wed, 17 Dec 2025 07:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765986147; x=1766590947; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4990UMYfP5m0Pd8lQSzep58XLVK/86AzrKVZXcIZzc=;
        b=gCydkZ+MrXrAnHY3/9aAC830Txakx8np2n4Gl85Fh859f9yEu4INaDBIoysczs6CbB
         RbytDHejeqiGRX57LOyExkhP9ZU+20VUY1fyno355MzAjN2ipNHx7EwwR3fT2jG0MREC
         1S20dBEj0FqcTDNkOvH/zSh6WBHabhhE58dohKFZrCnMJv8q2cbSBg2uux1Sp5KoJwiI
         H9bqIDsCw5aNiXAR8FpIyZzbR7sCbFta/0OMj5ldOV+T9TtqG2RVMVCbWNiYX9qIbySd
         m0uJ3GxyFpXMw1iADQdyjdSgZ6YxS7EFzHqKly53nDe8Zh9vPz8uRLPk6pYB4GvK7hM0
         arYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765986147; x=1766590947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u4990UMYfP5m0Pd8lQSzep58XLVK/86AzrKVZXcIZzc=;
        b=PqosburzZNPTmoTQ2A4qN0/U21AjpaBLD2eAIA4RHdt8O8tMp3/8UekMWFy/eZxgJU
         g/CHmK8U24Uv2WHPRss4a9G/6pfogqhBhtkNuuR6pNeBkCvucwqUpiT1xNEHl3LvTRzs
         kYgUa2zINtCRI9xZI89f7iRR8EUxrRBmBtMruXcCXreVlv790mQ8UgjTSTl2aVECehPQ
         gVxpjhCyEPXx05csoFSbaT7kZjHz6FDZ8Nt3IXchccxFo47bB/UuQkQ4VzS7fjuaoDP8
         FA8qeM2WNAx1O22qGrR70erwPK2uDvata+AnTe/Hb6EZ1eKpL4sw4ngbEUF3GFsOwMEt
         XvXg==
X-Gm-Message-State: AOJu0YzQFAei0ZNIZCFO/Dx3ZHXsJYj8M6P7Cx3ZNQjFtN0rxjfxDqgV
	vKP6ntM7ATv/jhY+q7l+2gQf4+A0IOrqGa4vAx2F9eXHTIhI5vEYupYa
X-Gm-Gg: AY/fxX7A2ls1FwUIb+aO8l9SCl7AdukGQvcZyWKMV/xvziSTODxfRtl8MY8zsAFlnVn
	vrz2Wv18gzSBlsxSEpLOQdGJwNlIyBUWHb4CaPrWbv6DWuPzo/s3CsIqCfTU/jPjuDhZQoFhUDM
	ZkMRY7sfRj3VR1V2CQjOBIElV4EueWznTQYUYo1AcCrQcJFbO4ZRsq7R0ijQx/Uh58cE/wzJAex
	tPu1y1FjRzVPALfsEtOSgsxawZ5VlrcX+w3IHyYw84s8UENA378rSBffcEcOtP2F9Tz+PrGVMtQ
	FgH7Bh1jdlpS70df7nUkPrBA3nMZnxkJR2FZUsWkMCWoduB9Bm7G7hjfkwl1/LfQmJDoDFXvofF
	THYkcHL95vjHZsbjwmzGFZfk/KNndvT0c5rWdQe3vmetbwvZJrWOSzI3D6v3Ef9xIsrr6MP8jrb
	0arOXlrxk+S1qesM58GsU=
X-Google-Smtp-Source: AGHT+IHadyQi6xNMdvMrPjltdmk7J941DIMQ0mMDl1p4lln2IAKs4sYxfJndp5hCYd8vKeXrbqdI5A==
X-Received: by 2002:a05:6a00:330d:b0:7aa:93d5:820f with SMTP id d2e1a72fcca58-7f66810bd78mr17253928b3a.30.1765986147054;
        Wed, 17 Dec 2025 07:42:27 -0800 (PST)
Received: from ubuntu.. ([211.234.192.122])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fcbc0bebe7sm3097978b3a.59.2025.12.17.07.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 07:42:26 -0800 (PST)
From: Sanghyeon Lee <sanghae778@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	karanja99erick@gmail.com,
	Sanghyeon Lee <sanghae778@gmail.com>
Subject: [PATCH v3 1/2] staging: rtl8723bs: remove unnecessary braces
Date: Wed, 17 Dec 2025 15:42:15 +0000
Message-ID: <20251217154216.8921-2-sanghae778@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217154216.8921-1-sanghae778@gmail.com>
References: <20251217154216.8921-1-sanghae778@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary braces from single-line conditional statements in
odm_CfoTracking.c to fix a checkpatch warning.

Signed-off-by: Sanghyeon Lee <sanghae778@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_CfoTracking.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
index 666a9f44012d..0b70509f553b 100644
--- a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
+++ b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
@@ -100,9 +100,8 @@ void ODM_CfoTracking(void *pDM_VOID)
 	u8 Adjust_Xtal = 1;
 
 	/* 4 Support ability */
-	if (!(pDM_Odm->SupportAbility & ODM_BB_CFO_TRACKING)) {
+	if (!(pDM_Odm->SupportAbility & ODM_BB_CFO_TRACKING))
 		return;
-	}
 
 	if (!pDM_Odm->bLinked || !pDM_Odm->bOneEntryOnly) {
 		/* 4 No link or more than one entry */
@@ -110,9 +109,9 @@ void ODM_CfoTracking(void *pDM_VOID)
 	} else {
 		/* 3 1. CFO Tracking */
 		/* 4 1.1 No new packet */
-		if (pCfoTrack->packetCount == pCfoTrack->packetCount_pre) {
+		if (pCfoTrack->packetCount == pCfoTrack->packetCount_pre)
 			return;
-		}
+
 		pCfoTrack->packetCount_pre = pCfoTrack->packetCount;
 
 		/* 4 1.2 Calculate CFO */
@@ -176,11 +175,10 @@ void ODM_CfoTracking(void *pDM_VOID)
 		}
 
 		/* 3 2. Dynamic ATC switch */
-		if (CFO_ave < CFO_TH_ATC && CFO_ave > -CFO_TH_ATC) {
+		if (CFO_ave < CFO_TH_ATC && CFO_ave > -CFO_TH_ATC)
 			odm_SetATCStatus(pDM_Odm, false);
-		} else {
+		else
 			odm_SetATCStatus(pDM_Odm, true);
-		}
 	}
 }
 
-- 
2.43.0

