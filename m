Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA5D3A5995
	for <linux-staging@lists.linux.dev>; Sat,  4 Jul 2026 11:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783166050; cv=none; b=b/mnatkCaMKlCMffyiP7xl6Hh7lZHKHSnUNf560uhKHnnUmej0RWKlSqoHBrnL+nVaKheJ0+xd4V3ywXVuX+d9Canzl2OUL4MAiFiSdeo2ZJR45iO7hcGWC8S3CF/tu/BG2oAr/zQ3K/aGthrZSDL8Q01xEH4TwX72BcxNZ6h4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783166050; c=relaxed/simple;
	bh=SCFwqaPyAOd7AtOZQfQy4tSUqGdfqIp1+191PLyGxsg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PSAQgigPmzKr1WFb9wkMvWNJe74biJtJ9/zRP4AzF4IaOim9BOf/TZtMhsA6fJZIkLG0dAY86Cpz+3hkX+t7z15k9lHKUY3wFLRRiBeXB0z9Su3m/4qdw+LniXreFS/tZGHGEWT5LlYmLisycRofDd1y2tHuMiqKfrEDAw8V0gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kAkYFl4Q; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kAkYFl4Q"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-847968ca62fso1417673b3a.2
        for <linux-staging@lists.linux.dev>; Sat, 04 Jul 2026 04:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783166048; x=1783770848; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MRDokiXswTCZjdnL5U+GA5MEZ4vFkd9wPUEaXRriHlg=;
        b=kAkYFl4QYO+aiIuAfWrCaBbe5P2KOWKN1OHqewEXeBHAsHoCT3bXxav3WSil9HO+AN
         B3w4Asx9ofssu7iJinisEq3G4DV3jNvGWpaxb6W5Z6pyceUNGUfnZEJDWjWOxy/4G+zN
         V2OSRioXl7ig/mV5xGKyq2BcK4bJ70mDeofZ872rDew6TWQNHQFAUYATIjRJ4BnRASi3
         aXtEJaoZ25WEc2DqxJw4SqlcIRVeDi/twpCbjPo93xF1PxZkbMnVac6xAR0RmzgzusKG
         36gJtJ5uUYTdHcbZCmnqLt6M/626EbEXl+80/AKB9i1yfLoxUOtIP7IATfkNRZfGkiko
         qtwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783166048; x=1783770848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRDokiXswTCZjdnL5U+GA5MEZ4vFkd9wPUEaXRriHlg=;
        b=n8F6RSgY1tmvq/5vf6toF8aWGcbh3VdT7Ia7TVqW0M3EMoDeavlS/9Z6rt5cz7v1Iw
         wzm5/C11mYAEEc1lDHgLr5mIGmPupxDfN2mfCsFMtcKC9lKJ5+k+DqUhajgOHtjRw+xn
         RrVsMG7eMCkEVKnG5hmcqzk840Pozn7AGIX1Qk9p/1jPipmI9fGMbBxqI/b7p3Zzc2w0
         uSaiRLt3FsaTRg6vHEDvjTcaPeNSr8R8ofViGKd/qncmDJw2Pw9ZLZc6jauJz+6Yq227
         qklJdMuvDQ/8pCuM2HxHRrV6rCj1fl5FWER35WjjDvLsjbsol/qqO5OR5zGxrohji6t1
         Uluw==
X-Forwarded-Encrypted: i=1; AFNElJ+T7L2vpUbwCXzC0eG0zM4X1RuWhcuS3gZj/6iAYRIscgY/VtccaJRbbZz2oBaveVSl1DDfytMJBObKxUsC@lists.linux.dev
X-Gm-Message-State: AOJu0YwPic2T+ITU8qI+TtlYq4EDQ7UGiDMMwmYVslTDqI7ccitNKoJc
	raosw+H3LNc0U113K2SYAsDSvPzuxl7twvbaBj0tEi771E7hnPRL8MF2
X-Gm-Gg: AfdE7cnIFE5ke6/swD4OOK4S1JXUJRSSugz+AAFdhsdLIxgb5xSdQmHQMh48S3wAZTr
	Cuaeb78cCNYgXUnGSOk9sCF00T7HhBTInYYFmf+euERIVvW4dZC0A+yaOc5nJI4/mjTxNoWH41e
	t4PtvcP3331H8Zp/qunykUq+EKB/6eEwverhQanr1CX6ptMGsE2F6yrbwk2ZtwPzJCplu3z68TE
	e5ByoPU30l7Zh4rL3dL5F+BuGKwaHLfxnxHwgbwxKudyoO0KBE0mBvAGv55R+f0cPrBjaucr+DQ
	czoD6qQwH4Lt6/J/oArkCrtj+s6wqkiLjprbDU9vQr34TXBy7ypd7RCVDwxdeaALzfbpiElbKqw
	srYl56R90mFYrCNo7eXcHp8wUZvLlsobKH7PYoA7s62kIDyGqR7wyc5rxuodWTkBx8J+E4QLezE
	HABnu06Xj1Brx0Nm1Qb3FWT5CBmWH4UTMZ67mhzdXoLYbEne4D5FFj4Ls2XaSg6xbsdFi26cVLR
	fH+bG43MMjfirlDxE61JCWagBnm2A==
X-Received: by 2002:a05:6a20:d52c:b0:3b4:b2d7:c146 with SMTP id adf61e73a8af0-3c03e299402mr3518959637.21.1783166047950;
        Sat, 04 Jul 2026 04:54:07 -0700 (PDT)
Received: from dileep-HP-Pavilion-Laptop-15-eg2xxx.. ([2405:201:5c1b:700e:13c2:fa08:9a8e:9e32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f4453996csm6864322eec.17.2026.07.04.04.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 04:54:07 -0700 (PDT)
From: Dileep Sankhla <dileepsankhla.ds@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	abdelrahmanfekry375@gmail.com,
	error27@gmail.com,
	dileepsankhla.ds@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: media: atomisp: Remove unnecessary else after return
Date: Sat,  4 Jul 2026 17:31:13 +0530
Message-ID: <20260704120113.201099-1-dileepsankhla.ds@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary else clause after return statement as the else branch
is not needed when the if branch always returns.

Signed-off-by: Dileep Sankhla <dileepsankhla.ds@gmail.com>
---
 drivers/staging/media/atomisp/pci/hmm/hmm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index f998b57f90c4..6ff77e053d5d 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -235,9 +235,8 @@ static int load_and_flush(ia_css_ptr virt, void *data, unsigned int bytes)
 		vptr = hmm_bo_vmap(bo, true);
 		if (!vptr)
 			return load_and_flush_by_kmap(virt, data, bytes);
-		else
-			vptr = vptr + (virt - bo->start);
 
+		vptr = vptr + (virt - bo->start);
 		memcpy(data, vptr, bytes);
 		clflush_cache_range(vptr, bytes);
 		hmm_bo_vunmap(bo);
-- 
2.43.0

