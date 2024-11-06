Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CCF208989
	for <linux-staging@lists.linux.dev>; Wed,  6 Nov 2024 18:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730918040; cv=none; b=mKmBSb/k1J3EGYDLSr9xwSv8CnWgHBjD1t2lEMxp90RTOiyMgABYp71iILvw9TRYIsBQ3S+B1q7TF2JDB2k9cx6JUuCEDqAa5DBueiAteSpMYzMlHs388M9riMb8TAuvToyRjD5oYHqPp7CpGgFsz5Iem68K10hy/6bNLbgq9EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730918040; c=relaxed/simple;
	bh=JlxoI49Tas3/+Zubaa46kNb6rA7I8AbxfBvVMi493V0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f9dBMvq87gSYEoIEVxW4tNIyk6jsyAu9ur+HchSeEOL6gprZVbOMN33rzjDAUmtjGEmXHrnWFtppQNhFVCFrp4lZ5vHZDqb6IlI1Mx5k9QzD/4QtySVrfGTrMgnkBdDU2mr4ghUqd18r4abuIl3+tUazVVV8Y5wc75n/av6l644=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OJ9Rglbr; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJ9Rglbr"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5cacb76e924so85281a12.0
        for <linux-staging@lists.linux.dev>; Wed, 06 Nov 2024 10:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730918037; x=1731522837; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iVKE9ffo3aYqFVj1Tqb4OUMVtzlo+x3zucLHdg40mrg=;
        b=OJ9RglbrFmu/UHUjS9h27OUGS3yUbrQ2vJl8u55FtjNs+mLgz2RFuD0XJLwkAvmLwC
         MEcyKZ+wfzMb5kajSMKOMevtCTgvT9QPVtJq3/r5ebwJSf48N4yPcrcbENuDunfyW7/T
         MaSMV76eXKBWnKDvc3Vr7M+L4Bp0SckaUlDSIGTV733uQdvRDhHZDKzj8DIClLUF2VpS
         LDxYPlAMBxytoVGdgl9Xl3J35dbP+znh7TP+VvFagyyUD1eGh9SnRAuF8PAKvWABGq2X
         KF/h0DLsHzB0lQaeXZg33SHJW7cOF9mw503pVKX/EMIPprMuK7zJBEvxSukSzrXFOYWS
         8GtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730918037; x=1731522837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iVKE9ffo3aYqFVj1Tqb4OUMVtzlo+x3zucLHdg40mrg=;
        b=IxSu6nr2UrsljDhYfAikNE3VifS23vK8vNEIu3J4q+veSgkx345LhsNjwzMmXJ7/D3
         wAeS6Yi3IrVZSIrkHQ0/7avG5gz9/2jhenD73ho45K3cjVPtGxmLDmWwnAGlEJRUaMkq
         8wAStcdI/CVFmzkkZWUYSGADmROTJg/yN2PRGqONnYV07C/xAkMBSb+CU++JR6oPZayJ
         jdUn+GKil8G0jbEHzUqR0uJ42/Wt9S72PZXZ0STl6ZApdW5ienv8D9ZvjKnEwX0jKHYP
         P90+PkiAqSxUqs4PbzyroNK/VgToazcpE4v7MnylkDXqg+MvC2QPtKXyHNJW2Z/5ZTNr
         gPwg==
X-Forwarded-Encrypted: i=1; AJvYcCXoChLPfG+jklWzVXa/8PKS/R9g46ufQL5d0ICgVL8aTY5fm3WT7i/STyrG1euOk0xu8jFjB01rD9UKwea6@lists.linux.dev
X-Gm-Message-State: AOJu0YyTvUdtSlTUUCKWwqWBDIxxyxTr/JeUYFZjN7WRIju7QjAmVu66
	GxEydQvBYLGfLEW/dQBcuMJVWt5RZXxDacbgAKi3MT9JdvCFbiCgEUaqQg==
X-Google-Smtp-Source: AGHT+IFoZXcQ3XgiKtwcgCf8KuC/fiFBmdTQJb6P/7cb3mAvIJDNRtneFJwAU865d74mvu0LzO5bWQ==
X-Received: by 2002:a17:906:c145:b0:a80:f840:9004 with SMTP id a640c23a62f3a-a9e6553bf86mr2141917866b.12.1730918037171;
        Wed, 06 Nov 2024 10:33:57 -0800 (PST)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb1813a07sm315298966b.190.2024.11.06.10.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 10:33:56 -0800 (PST)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 05/16] staging: rtl8723bs: Remove unused function Efuse_PgPacketWrite
Date: Wed,  6 Nov 2024 19:33:34 +0100
Message-ID: <0ef7eee047401f62256970eb3186887202ffe851.1730916582.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1730916582.git.philipp.g.hortmann@gmail.com>
References: <cover.1730916582.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused function Efuse_PgPacketWrite.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c    | 11 -----------
 drivers/staging/rtl8723bs/include/rtw_efuse.h |  1 -
 2 files changed, 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index e83daeb9303d..557f87306141 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -311,17 +311,6 @@ u8 efuse_OneByteWrite(struct adapter *padapter, u16 addr, u8 data, bool bPseudoT
 	return bResult;
 }
 
-int
-Efuse_PgPacketWrite(struct adapter *padapter,
-				u8	offset,
-				u8	word_en,
-				u8	*data,
-				bool		bPseudoTest)
-{
-	return padapter->HalFunc.Efuse_PgPacketWrite(padapter, offset, word_en,
-						     data, bPseudoTest);
-}
-
 /*-----------------------------------------------------------------------------
  * Function:	efuse_WordEnableDataRead
  *
diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/staging/rtl8723bs/include/rtw_efuse.h
index de4e5906ceb5..546f32dbd33a 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -97,7 +97,6 @@ u8 efuse_OneByteRead(struct adapter *padapter, u16 addr, u8 *data, bool	 bPseudo
 u8 efuse_OneByteWrite(struct adapter *padapter, u16 addr, u8 data, bool	 bPseudoTest);
 
 void Efuse_PowerSwitch(struct adapter *padapter, u8 bWrite, u8  PwrState);
-int	Efuse_PgPacketWrite(struct adapter *padapter, u8 offset, u8 word_en, u8 *data, bool bPseudoTest);
 void efuse_WordEnableDataRead(u8 word_en, u8 *sourdata, u8 *targetdata);
 u8 Efuse_WordEnableDataWrite(struct adapter *padapter, u16 efuse_addr, u8 word_en, u8 *data, bool bPseudoTest);
 
-- 
2.43.0

