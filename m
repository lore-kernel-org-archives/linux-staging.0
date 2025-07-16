Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B13420C00C
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 05:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752644186; cv=none; b=WHK1zlqsFgc9ASNganuLxap+Kfw10iNX8L7xkxbpMKA8Km6LYGAU0UfFYTWXoBR3tBKGDvpkUsVV+yknL5wz/YZPoZ59IB02anuKtzQ3q1oEDVOWEA5FW2lDA/p19J+4H1eeeCxyB0pMdS1OlLThUrEkmcRTpPh5HwU1P2Goelk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752644186; c=relaxed/simple;
	bh=fP8jsuv424pTE3LGPC9NYIj6wjBMrsrbGmjkh2cvXAA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R0SNvj2MTeANF911RbeXqocuo1C/YG1H3NzVnFkA+OaqL8j2wINhv/AAYRHyUZUJhgyL5XFr4lahmja94lZ7NRt+OQIW+ArUGhxGyAhYzzSeTMcrqgc6B+FT/kH5ZtELLS03lmYpq6PopYJAXSuSAN0iNQ5vyIjxvU9pusj/mSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PZBXr9iq; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZBXr9iq"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2ffaa884a44so347431fac.1
        for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 22:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752644184; x=1753248984; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v1bLtDdmAxULj2jlPW+Fr0McxL53HC093oCmFFyn4gM=;
        b=PZBXr9iqA+XXtXMktPdeb+kMWpUD1aeL1tD3zx+phYxfkfGg9NKtl4ZcjuBawSE7Wc
         KMkfg4YNZiHuOhVTClo8Bk0OdW5G+gmXUJEwb6yy3F14jVJ6Xbrtxtdqd87IQLm0c78/
         aLXgqOVzSWV26c4yObvnSIQW9jYuKPcWdIa7MjWuz2V+1xkKIQaRam/wD6IfqX1mwYlQ
         qeyaESExJudxRV7f3DVfN7j0YJtt5FICgHm+iIY+vUrMi4uKFEolEJDUdf3YPAPL2PP+
         VxI75cW/4W9tqz0hl0thdpaWTiCRy4eRyrEzkG2MxkxZO87nqV72T1Ig1REjBDcmQWmY
         baPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752644184; x=1753248984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v1bLtDdmAxULj2jlPW+Fr0McxL53HC093oCmFFyn4gM=;
        b=tmL+58TR2h6NL1xsRqXkNMyBpfFgSo/rEdj7D4NjZkV6P2w6NxMs9ZwTpW86KR5MQZ
         /4OfSg1ZhuQq+HE7cccw9NkdkkrmxQy5VOlBGSskebH6SzufETApGwJynby5L4+iqGxU
         FAb4UeJDKMoqy1Xr6yBf3dNE75RAwe80Nl/4n22jnL3PB62xbgPqHUmxqksFuwGp7cmk
         8g8lRKsLJ4A2UycwATfdr4c4LKq83Bd4yO9Qpkff9WHT9+OceIEsLuQSGPDr5xxtA/om
         iitovth2VTa/Ms+TF/8t8QnX86Bya1gbqmT84QUwgMtLu5ujBHNQSWLfW7DBQdQ1bcK8
         pozA==
X-Forwarded-Encrypted: i=1; AJvYcCUKZeltGN/ZHL+MFx9AQcursj5/RrjsdShCdHVnSeHcWT6acMmieOzCyvzvvVpFjna7FRbO4mmfaDFoRDTI@lists.linux.dev
X-Gm-Message-State: AOJu0YxC+/ENDaerYTAaOsJ0qF4R19EyyP7Wdzz1f223EArrqH1ZT0RM
	fIC4cUrYqiVzjMEc/Bh5gDCk3SG97GV1liiekpxeG+mi6nY3ep+gvOB7
X-Gm-Gg: ASbGncvI/5p0xfhejxnCnxeNluKS/fy0ZCzg+qiSmkRZE2QeIoakIp/LNle38asDHsk
	rXkhdPMjHvIsWbVgh6GLabUL/4PANn2M9z7TLypGiTHEFjUINfxOkUzlmyAsFO1+E6pG385k9/T
	jvsF70rZ82AdlK4OCWXIEkekYesv3HrMDP5CmUvzBThyTjCmYO4YfvSd7zOlwr5U8reUDjMpK1L
	Iw6tw3zOHaeh3rg+5NLCRHi3A17E9Ds/I0NzGhEdtKd0/rWuXCxIf4fsDNvcAbVuqZCwFbXKrFR
	CVv58FIhpWwT1h7EedU9ZlZRkKemEUXzFq8lDw5DAyG8PlzKXD5gqt2agw0MrXm6N0OndWj8CGt
	xSdFw+wIjF+MsicS1yP3DJyU+A23pI6wQVbyeqb6LmtcZsJCqyneF
X-Google-Smtp-Source: AGHT+IHnmzpWza6y51XsiHI3R0Q0MQzhWY0PfW1/lNAQLQyfRghVEkhRnWOf4Igi35ebzr34XlKcqA==
X-Received: by 2002:a05:6870:218a:b0:2d9:7a9e:99ef with SMTP id 586e51a60fabf-2ff8f974e36mr4442296fac.1.1752644184161;
        Tue, 15 Jul 2025 22:36:24 -0700 (PDT)
Received: from localhost.localdomain ([181.161.11.224])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ff111c379bsm3177613fac.5.2025.07.15.22.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 22:36:21 -0700 (PDT)
From: =?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: Ignacio Pena <ignacio.pena87@gmail.com>
Subject: [PATCH 2/3] staging: rtl8723bs: add missing blank line after declaration
Date: Wed, 16 Jul 2025 01:36:03 -0400
Message-Id: <20250716053604.64798-2-ignacio.pena87@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250716053604.64798-1-ignacio.pena87@gmail.com>
References: <20250716053604.64798-1-ignacio.pena87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ignacio Pena <ignacio.pena87@gmail.com>

Fix checkpatch warning by adding required blank line after variable
declaration in Efuse_CalculateWordCnts function.

Signed-off-by: Ignacio Pena <ignacio.pena87@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 1e2b3c456..fc6dee711 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -85,6 +85,7 @@ u8
 Efuse_CalculateWordCnts(u8 word_en)
 {
        u8 word_cnts = 0;
+
        if (!(word_en & BIT(0)))
                word_cnts++; /*  0 : write enable */
        if (!(word_en & BIT(1)))
-- 
2.39.5
