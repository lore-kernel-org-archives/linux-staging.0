Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27E6149E0E
	for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 15:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718291867; cv=none; b=lhfVEuixxxqrtnc3nJdcIm7bkMyKzkcKodBaJEdNBWRUOSaD7fuKSst4hns35bHBJyAydvYaU2nxhFPZNzTtrQrUgbU7elMDKq3ALi3RfxUIvjWend+1B9uYhefSvXZyK87V8XSkIgbp0+q0O+U1U2US1eIfxC5WzzSLMOlrg4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718291867; c=relaxed/simple;
	bh=zN1UETXXdqrh3WBTxRV+3WqwL49VqCIOmitMRKZXlLU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SRTAzodE06vdTDBI0srEqfD2xwLNF8b+BPqvq0850XOc281nT+fdH86qQn/24IAg1WPwKMLnEhFQoHWbXnAa+8CxNJKsNk3IacbZAUa3NvWbsdzBAjAxi27w9LZBAJauqv1VZQuE/UkxRMEByrKhzNPmFdI5A3WXJUKCCCR8NvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZDwCxel; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZDwCxel"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-421cd1e5f93so8935035e9.0
        for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 08:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718291864; x=1718896664; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6BG0M0s1xfKWqVwW2SMl3OjEYd7P2vlsk2ol4M6/ryk=;
        b=bZDwCxeliP6DMzbVHTKhbRSbWKK+6FvW9shVUD3DbhZLKyguKpcgS3/SnUEEgTbZz4
         8VdKiMIC8LF+9+n542hh+hjS/rri+U+4/Wx6lFrVWFiTwBJxlXTwly4WPwKuhWSU1ZTG
         whTfPDr1bH2lGMmdF8Tgi5aCLNFsS0F8SO6KNgPnMuPWPVmfE62N1kM4U7mtFDptH4Cq
         EkcBdxnfTKtCs+LBkRG4XtKk3UAxMt6I+7eZ+P1GSxEFlAXJxzoiX9rmQJPDrs3WVv2M
         V3mUSfUe1m56aKEswq5R3puwZE5+3oXKzZkJnXcKL/y9GNZ47abv9xH50tXSKF39Cza2
         18dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718291864; x=1718896664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6BG0M0s1xfKWqVwW2SMl3OjEYd7P2vlsk2ol4M6/ryk=;
        b=uOSSEqj16D0QuF/8n2VyslrkTo59KsfIHSGm8pnVTgmlWVlT2mLdMfM60gXYATsns+
         C2BoFBMdCAgdybQGGHU0LKBzuaf6HNTDSPsuYbRSBl38XxXnRmvPO4pH9EHn4kRhSBB1
         tZhSVkzR/cBOUFjfgFNJ0sUQy5YSJMimdYggSiO9koAOfF2GD4ShxZaomxishhJIqyrc
         VmDZuexaurefdHYlvQRn1OGrLzJpMHc+aeKptN0tIiy1bK59Gi4hk6eLscrR+qOX0N8l
         JF2Gpv12ePnOYtiRuZk47E0Crbp0ulzJ3LF1hjtyEzKEGtjdapy+P/okxEij7PgYjErD
         ryxw==
X-Forwarded-Encrypted: i=1; AJvYcCXEiP2dFq9fbbxm8q+E/vezrG3qUeCyiY2qq7x9BSvEvJaS9O4Tt/Ytl2C5MDP57aTRwV8aCx0HpH1HvmVMucMeE3fdxiYnNcjROy9rkw==
X-Gm-Message-State: AOJu0YzR8AZFrs+4nD9F5E7En+QMwyvSN542o7BpNb5oSFPLcR0d5GFV
	MxTLhxnnB5M0RxYrPdSe6dkFlWQTpyjukWu+Mq8IWUYBFnl3758ZW2+gtsNzg2k=
X-Google-Smtp-Source: AGHT+IHivfMxCPLBIseyR/PkOdi/noH37L986yS0duDhQKgZmcCVn63dfugPrWMeffsl/KWndzwFpA==
X-Received: by 2002:a05:6000:2aa:b0:360:6435:b40 with SMTP id ffacd0b85a97d-36064350bfcmr6572880f8f.7.1718291864170;
        Thu, 13 Jun 2024 08:17:44 -0700 (PDT)
Received: from localhost.localdomain ([31.120.167.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36076515a80sm1856978f8f.76.2024.06.13.08.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 08:17:43 -0700 (PDT)
From: Teddy Engel <engel.teddy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Teddy Engel <engel.teddy@gmail.com>
Subject: [PATCH 5/6] staging: rtl8192e: Remove unused macro dm_tx_bb_gain_idx_to_amplify
Date: Thu, 13 Jun 2024 16:16:36 +0100
Message-Id: <91961c0f7acba56576cfaf2a19d2d4121c90e721.1718291024.git.engel.teddy@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1718291024.git.engel.teddy@gmail.com>
References: <cover.1718291024.git.engel.teddy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused macro.

Signed-off-by: Teddy Engel <engel.teddy@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
index 3add5aa933b8..55641f17412b 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
@@ -133,8 +133,6 @@ extern	struct dig_t dm_digtable;
 extern const u32 dm_tx_bb_gain[TX_BB_GAIN_TABLE_LEN];
 extern const u8 dm_cck_tx_bb_gain[CCK_TX_BB_GAIN_TABLE_LEN][8];
 extern const u8 dm_cck_tx_bb_gain_ch14[CCK_TX_BB_GAIN_TABLE_LEN][8];
-/* Maps table index to iq amplify gain (dB, 12 to -24dB) */
-#define dm_tx_bb_gain_idx_to_amplify(idx) (-idx + 12)
 
 /*------------------------Export global variable----------------------------*/
 
-- 
2.39.2

