Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5782D359710
	for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 17:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769794000; cv=none; b=WJtR09GoHynvpMgOQJUPn6Bf5/JM5sw8UHTmP7DgHtkKLvCmZnXRzXhtHuj8seOuiJepF5AtNDEMrfbtiDeMU2RpbT8mnfgo4hP/0xDQatRk/ugI9GjkGVbHuLNenX4NaGoDtvBfEJokRTxB/FzjYoQ0DmdVwyJ4kUkXJbkhSow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769794000; c=relaxed/simple;
	bh=AquEAXT+C+5JpRHmCkvrPolWBh5PP+PFQtO7aSkaXnI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BBqRlldy3GNus2GAIshZRXV+SOAnPOXeVjTD4Czhd9dKa6sb6WBv0lc2Vv0IwVU9APjU5snvUjzrA2/16Y9eldyK+otuJP69KMrGJmIuqC4o94xzU4qe/hkT43B/dXnVx7SkV6UcD8kqNGJ1PicYQnlxMvLTIVbSuIIpuQ4Ek3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HNEp42kA; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HNEp42kA"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82311f4070cso1600406b3a.0
        for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 09:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769793999; x=1770398799; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qd6QkPLzD+VnXxMDV1WB+xh9ioLPxpSE8CTC7dEP/9w=;
        b=HNEp42kAzePhkZu6jQnp6UW+Yd6UflcJF7MicwllUaa9ZXwEYbgu4qHF8yy3ZDk2bb
         h7SSjv9Baol9wzl3St0BC9gw/8vFLS7GpC6vWxmPePLHVFahb+mgpaTo+ysGjSgFNvqY
         5ivxkpOS/ZJUFfoRpUsiaFj9C58L/93sNlKzmq9yiYMg9/CTEZDZmMqrQXSD8DVoycsI
         uGuH5P73hIRiwpPSspd8ckXoaev8bYBLOojQ1zoc4Y1ObwAPYxlmBxCS4cUGbFoRsGFb
         ODgUVN1GB8Fp5V1DoBhxHA9zFpjSZZHxZSaN3Kcir498Tk/JINeYdtL5rgKodoEf6vib
         aCng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769793999; x=1770398799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qd6QkPLzD+VnXxMDV1WB+xh9ioLPxpSE8CTC7dEP/9w=;
        b=laubjCDPsdBOIQeAAuUPBjSXoOAZjyta9Gk/FrQAgWLrzmbpOhphJJFkRYUqwVR3w4
         +jDsUw8zAwwiTi4b9K028aBSaGY0rLqVDBAfI0zI0dm1ygy3w4HjWrK0ReMhA7eFvJje
         tEKXzV2BB9uohw+Uzq5u+VhP3RJDvh5Ti/NQfgbOfjfhujvH74AKYSI+4cSPovo2r7aF
         BZ5oZwYYsPM7AQetADTzGhYYcqqJdeC+D7sV/DQSP2a6wwVX0tkE/wAr3rGGCQd99tuw
         5IyOX/1KjGwIecc8y+Oi5T0e1PAIyNOwJT00gvFnf9kXhiCUYTh2qRSUK0d/X9KKhiMC
         c9mw==
X-Gm-Message-State: AOJu0Yx+TRByaDdWrTOiJio4bM59mKCGc+mSbC5/6VieZmUKXuXIL3QV
	LqYhf11g7/9xivtw6Zyfdzn4oALk0ZuUzHtd0nTqNDy2qwJoBlEAUzg8
X-Gm-Gg: AZuq6aKmx6AttV1hqCy+4LIfRWNHrjB8f4Dfak1L0vpgfoVwS/PkyzsKmdVVy2TDoYV
	jKrf8Wu83Wmm24PX8TdPJ9ollw/r3QFBLR9CUv2HSwFzsW0i2nRhX75p2AYGndefub06ygax+Ez
	V6GpiaGdDIEWHTkTAYaXsIs1Q+cqwsjx1ZgJbHLnVCB4fk5Y9N2ejPjO2Rp2Itxa8wcTgV5odg4
	rPuWV9E1rHTuQXojLVTu+jl+yPKgtYnrv+TGgf2DRVeXilXc5i4gHcAYAeHxgONty4MdnBoNRCp
	xi4hioVsk8AoRGth6D2N/KARX5fGOhomChDXm1/DOwquxjxZcUjqYUCw2/rWMMuZn7F3NeMX8pr
	paOv/fMVhi/pGF5Wu9SrQAaq4YKEh7xOTJFFgprUZ7UH9QS+w7ty1NLQNeDQ2tWmIsw6GQvOcKD
	G/O5nGG9NgLGK4yj+kRQ==
X-Received: by 2002:a05:6a21:e083:b0:38e:9e19:6c6f with SMTP id adf61e73a8af0-392dfc12dddmr3454783637.35.1769793998648;
        Fri, 30 Jan 2026 09:26:38 -0800 (PST)
Received: from HPVictus15 ([2401:4900:1cb2:d02b:4761:c62a:859e:e20e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b413c1asm72715405ad.28.2026.01.30.09.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 09:26:38 -0800 (PST)
From: SAJJA EASWAR SAI <eshwarsajja20@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	iryuken@duck.com,
	kernel-janitors@vger.kernel.org,
	SAJJA EASWAR SAI <eshwarsajja20@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2] staging: rtl8723bs: remove hardcoded dead debug code
Date: Fri, 30 Jan 2026 22:56:32 +0530
Message-ID: <20260130172632.130898-1-eshwarsajja20@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The debug code is guarded by a constant false condition and is never
executed. Remove it to simplify the code. This also removes the now
unused variable 'pattrib'.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601302336.Jt5bRreu-lkp@intel.com/
Signed-off-by: SAJJA EASWAR SAI <eshwarsajja20@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index ac49bfbaa..ae16f045b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1849,7 +1849,6 @@ unsigned int OnAction_ht(struct adapter *padapter, union recv_frame *precv_frame
 unsigned int OnAction_sa_query(struct adapter *padapter, union recv_frame *precv_frame)
 {
 	u8 *pframe = precv_frame->u.hdr.rx_data;
-	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	unsigned short tid;
 
@@ -1865,15 +1864,6 @@ unsigned int OnAction_sa_query(struct adapter *padapter, union recv_frame *precv
 	default:
 		break;
 	}
-	if (0) {
-		int pp;
-
-		netdev_dbg(padapter->pnetdev, "pattrib->pktlen = %d =>", pattrib->pkt_len);
-		for (pp = 0; pp < pattrib->pkt_len; pp++)
-			pr_cont(" %02x ", pframe[pp]);
-		pr_cont("\n");
-	}
-
 	return _SUCCESS;
 }
 
-- 
2.52.0

