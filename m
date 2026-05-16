Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9B1405C4B
	for <linux-staging@lists.linux.dev>; Sat, 16 May 2026 15:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778946662; cv=none; b=PviIelwzMJMIcikQPLnZKoUzb3OVqk8oEQoH8V7PyjPfkHO3c+TcxnCK2bLEmuy7hMDHWzngLGF7I/nTmNSqBInxu/Lu832r/qNDB2ep0ZFS/tMtkOIXAE+/T1WAWXs//Ij27zihC2hxKlZSBaVIRNskiHYsn60Nuy54kpRTDEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778946662; c=relaxed/simple;
	bh=QMWv5kTR3Z8orXG1d69hSRQEQKzRadhtj3GlQuXI5zA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ggznft/KxUFEAIIU4uM02UZcv5EjqNWnklLL/ioeFUFTuxqmD6k6oe8jIBA/G1CBg/Y8alE5+o492DVVh+Ze2ZywOFV8H2cSVnohKriFyXZc3pfxUoBZvBIIL3uYxyjXhd33XHLQy/Sx8nWzxnHxgta3A6N/vKFJU0UMBMKaZoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iPsuXO6D; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iPsuXO6D"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c80167f56cdso295004a12.3
        for <linux-staging@lists.linux.dev>; Sat, 16 May 2026 08:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778946660; x=1779551460; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B88evz4AfPX++SW1Roueh1KZYYJZf38uXj4ng+JFhXM=;
        b=iPsuXO6DrCXOHR4aFSLyGx+9XVAZ1V+CnhKBZTvjbR025s61BA2MhED2oVNJ69cjFY
         RghAXDvPR5vrEsmUfFN5JU8PH9JdIae6sGjWMlWZLvJBf6CVS/flFTHWhmdtXQx4JUjK
         DzOpgimdAJgBhKS2qNan+t5ZRLWg5jKwjx4JK01x+sCd9RhKIJ3w12oOVDALfPD2pNKF
         FHd7T6R9JnqZbykT5aigCpISQruCdNTwxO7jgCCuXP6yXuIn7SLS+W8k8V5bfpGIVtBE
         NuUmWA2yEFRyJQcbD3JMMYYls3cCNxPpy//qEXyDBitpoSkFRtwrAwa8yH5qkZkSVuUq
         cNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778946660; x=1779551460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B88evz4AfPX++SW1Roueh1KZYYJZf38uXj4ng+JFhXM=;
        b=IvWHovU0B1ypo1hSzKmMItWYjocbjiZFCwAy4QhARi/kXLJlMqmKjbuTLfKmz5rAZd
         Enr0n5NVFR0hzcYWqNJjcwPp8ZT85yHauFNIoWr+3QJ1a82vDs0XOfSg12utb2xq+wxs
         pZNKWSmqkw2Hc6tSgb22rK5USVFefWGmpQKRvC5701jHLP/uBYdf+fBnkilMwOmkc75D
         yQYobdv9hi/PEN9eCq+Z4iil7gsmW73X/v9JZTtmtBBYS4xXuLSvHM+Vx30bKiCm0hcT
         cbqFYeiayipXsdRmAA9hbbwxv/GeOFIxD/WOX4rRRyefS3YLecI9hPyu57nYzss8LKex
         lneg==
X-Gm-Message-State: AOJu0YwvyEsVFfEvRvMwFm2Jc9n+DfKUBtwLxzD2SP9ec2VS0TsVxZuD
	BXqqQncRh6jH5VKiryRXs3+3eKO+M1614vtoJU0XzqFHpj9NYNF9M00jpMhiNcx8
X-Gm-Gg: Acq92OEuMs5Di/dCd6XhDR5uG8+5jpjMrvx82UUzuyltSry0fsD/G5nZH+WXwjDDmoI
	TCiKmcM02/Hlvx9QbR2qddlk3ITEH3HRTrZn2UaHCLjji4AQ6KIssOPsA1MEl/7HlcQfW3sxJAt
	IEFpK7mNm/tPGtzE7F+/CzLOKcU4XkaN0aOp23zmAes0bpFIEAgsQYmvo8uWYEjIfhaQb4xmLBG
	1B+GESEn1Oeg5w6c98ZxG2lBsSYDG1mnYJgfgn03C7ENhf/IxNhHUz3paLMdiE9TuHOYqx4TDwZ
	OSJO+mypnSqaSEpCf0QI3vGSWHbW+S3nmJ6bJ4E5mWbgq5Vcja0236bmTV6Xvba2hol2Y5gQ33q
	Mzgg2ng0DNUsFmdmPgMItUXxa0kNjx1yiFwl8s6lYKI99lNp6T4KHVnRv3Rb+mMxszPufppzrho
	CRxGlRfs2UHhlEHct9EgRJolzLhELWX8RPwCpQat2urn0PCnSQ5Jfrh20SVYJ83iwPr3Nn+/ee1
	0kolg==
X-Received: by 2002:a17:903:1a4e:b0:2ba:4f37:d3a7 with SMTP id d9443c01a7336-2bd7e9771e3mr94741855ad.27.1778946660444;
        Sat, 16 May 2026 08:51:00 -0700 (PDT)
Received: from localhost.localdomain ([2407:4840:a002:5ef4:c9d8:7ea6:1f8f:17da])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c0600a4sm89346425ad.30.2026.05.16.08.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 08:51:00 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 3/4] staging: rtl8723bs: reformat rtw_efuse_one_byte_read() signature
Date: Sat, 16 May 2026 15:50:24 +0000
Message-Id: <20260516155025.230865-4-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260516155025.230865-1-mokshpanicker.7@gmail.com>
References: <20260516155025.230865-1-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reformat multi-line function signature to a single line to fix
line length and coding style warnings from checkpatch.pl.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202605150301.7FuEahpv-lkp@intel.com/
Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 2be74f2d4ac8..ef0cec40d388 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -79,11 +79,7 @@ u8 rtw_efuse_read_1_byte(struct adapter *Adapter, u16 Address)
 } /* rtw_efuse_read_1_byte */
 
 /*  11/16/2008 MH Read one byte from real Efuse. */
-u8
-rtw_efuse_one_byte_read(
-struct adapter *padapter,
-u16	addr,
-u8	*data)
+u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16 addr, u8 *data)
 {
 	u32 tmpidx = 0;
 	u8 bResult;
-- 
2.34.1

