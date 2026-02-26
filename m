Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD9738A701
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 10:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772100277; cv=none; b=rHRmqmeIQpFuH5C2daMT2vKpIy8CJkipVFj75ehsYdbAbgmMaKwlI1LGIYwpfTR1gY2vjBAqfD3OpS1WdUHK7x0n61nVhxsw01ozpLXsj/99GtfrJZGaT+mEIPYbBiWfF/B+ZJbM+pvG8nV6mki2NiWrHp51DDSOs0LTi+YJyes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772100277; c=relaxed/simple;
	bh=c+DhzsrLPya1eFFLkX9yadL6o6aO8IOouGsz+C30QjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pTRbcyyZgobzr+Gza76Ms0LWCSiT/F3bS6Q3TDd//f2WwOxMi64PSAwjU3qi/qxtR0Yc1n0ED26vOg/RxKP/gOJ+CGf6V2EvX2dngE8nmo+qytuWUQw2Zl9QS6UHa234Ml/+YgRUWGYZmeq0ec4JhXpxDPGu9ImXQAyyJY4Ozao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pg7T6to5; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pg7T6to5"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4399567ea8cso25262f8f.3
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 02:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772100271; x=1772705071; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WJt2pAu3Dfz5tHvYEQ5NlezLanKoshazTGdOefmbmZ8=;
        b=Pg7T6to5jq1nNrwMEjeCAw1S92HTyZhIRV8AU2aiuz4qfSjbKpnEMGPuDVNOeQhE8Z
         3k9GZl7JV0/PvBVpFRyk1buiQe7rFx8d8jck6gQ4ltZtWDyITd+p4FXXmAjikBM3x4kC
         6ZUIcMrJtnefK2fBTYxQEVhxFejo4w6RC5L8bI7EbSf1KAY2XW3OGIvbxA0O9OFf6Zrv
         b5vsB85ZjVA0SZ9re+OkbRX2nBSWMD5UPz0CaNQTbr0iSo96pzmIvn42f54u/8qBhASh
         bKJN2nvxzA82ugEY51O3MHqSreuZKPu2FBtdpyLemgR+QOsASxXDKC/IJUcRzWZx/izD
         q+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772100271; x=1772705071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJt2pAu3Dfz5tHvYEQ5NlezLanKoshazTGdOefmbmZ8=;
        b=Ag+fj1NqrYm2d3/bW+bpHTiw7WW9w/AHSjDwdd9bca6hUp1G8YXUOt9nBK1DB8tZtd
         b5UI4LArjFP8f1RvbHBJqdc+xy/3rCZBP+DLnN0WakRppLatI1gVf9RQpMtwdlMPLYO/
         pFfobMwBrBLZSbMRmhFBdFVDF8nNTSBlQbszLPoFlV2X07huPQwLqX4iQSPHqpcBolt9
         eghzP6CHspYTzZPQC1Hpy6n8WfgJOXWb5C8HsOMKgYyPGyfCPZGF2ZPGIRtI8vR3+5Se
         avO5rxz4FBy04yI5qbzxdg0BN+gyKhZ1vohc9kHFTi9jxAkiWzY9aweW+aRNXOMQWD6v
         aC3g==
X-Gm-Message-State: AOJu0Yz8m49BeiYm+3IZHk2yuLVCfbkR0BEU+J58zieV0YTacCOJMcIh
	kVOguOg8JF6zUt+5Hk4tIxfh7bCN/agTxwCXCj+UEkVCyy75iYtqSf8X
X-Gm-Gg: ATEYQzwi3Agef9bWOwA6DtZXVRZ9URKLjM/5JzI5FwUXimb9ln/cjJQ4bdxzSyT8L3F
	+AeII5TUgBEt7XYt7NA0eVOHcgxyAksw4XVM07Ws4RpeZfRJ9fCuqnbgB8l3Gb4p1PXv52JI0xJ
	tIn8dfFqc5Nn2GQpth3OqiFjzPsACfrwV9vAkNWMDZORdi+PjICBgXFUxUOy/YYKu2M77lWAz1u
	eYnVBj9P8hLSXHfC2BH0fiok5nk8cFYzMhiriZLGdjiYSQqL35NQo1d/t4JvessYfaKbSbK9gBi
	SrJEJArEYmD3hTEeq+XK3yPUrLd/pdkT+z6IPTpqVSO2SwCXZFevk8EhLMeidTSeBpI+Q6iYNtB
	A3SyPnNJRBi60xUTd562nOgMJhX2T2JUu1B9UUmEmGsHHN5AAw8WhlZcrfnfg5QtepkHAHDEN1D
	6QlI19EhrDoDTEGMjwGdtifRawH5aUEXFibqW8qHQMqxuoDTADDyEPND81DNFUpWG+SPGh7cdFy
	1NL6pqO1CEdmyEkQc1dlJWeTXjT4idqzuKuMxFns1D8gwoMaF93
X-Received: by 2002:a5d:508d:0:b0:439:8bee:b97d with SMTP id ffacd0b85a97d-4398beebf43mr5794688f8f.4.1772100271448;
        Thu, 26 Feb 2026 02:04:31 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43994da2584sm7127026f8f.12.2026.02.26.02.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 02:04:31 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH 06/12] staging: rtl8723bs: remove unnecessary casts in rtw_security.c
Date: Thu, 26 Feb 2026 14:02:50 +0400
Message-ID: <20260226100255.167059-8-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary pointer casts in memset(), memcpy(), and memcmp()
calls. These functions accept void * arguments, so explicit casts
are not needed.

No functional change. Object code verified identical before and after.

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index b489babe7432..a387b5502edb 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -1091,7 +1091,7 @@ static signed int aes_decipher(u8 *key, uint	hdrlen,
 
 	/* start to calculate the mic */
 	if ((hdrlen + plen + 8) <= MAX_MSG_SIZE)
-		memcpy((void *)message, pframe, (hdrlen + plen + 8)); /* 8 is for ext iv len */
+		memcpy(message, pframe, (hdrlen + plen + 8)); /* 8 is for ext iv len */
 
 	pn_vector[0] = pframe[hdrlen];
 	pn_vector[1] = pframe[hdrlen + 1];
-- 
2.52.0

