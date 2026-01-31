Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B171DF73A
	for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 07:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769843714; cv=none; b=iXXTH09wPenZ18Tw9PXZRgcC6BxIFpaO8T8vI2oFWi+paRDw0B1hGrztFEBMQvxoBFrQfLe4N7JQJ+75mijICnWftifgeEiphB8SDUHX6ZMB14+AD3bSVn8UCrurPab1Xjt7Z7329ma266ZgEr8zBHbClpKi+HoFVFCwPgRrATc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769843714; c=relaxed/simple;
	bh=g77VcdCV1MNLoDOUdCxkH6xxn4zzUS4smjNVQWiFhbE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fgSTkxtbofNuedjwPBys1BQI4gIwOZBgm7+gTiEFlrX27Ky3KZltlhUUKgmhIZwYliWRxtIljhsKkhllQh5SORyqM21O9HwWLGWUFlWy3k0fSF6181DyGYE3H55l0932oJ4zjDVanC0m0ylSOSqJKLR0zMQmX/hDiDzJ1Lv0IKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/HSH4ZG; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/HSH4ZG"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-34f634dbfd6so2137510a91.2
        for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 23:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769843713; x=1770448513; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YSlVMquhsKjbqBQTjfSCQUV/WSNHePBs+tvJrWDb2WU=;
        b=m/HSH4ZGRJ1cGfVHxV0sRBOgR2zXyLhWf667+WzHsEtqdmujMLsaB65gp9aZ3Ho+Lc
         QCr6rDqE0m2fzs1TNKkghh7kyrOEUYT8vZQto4nxFes+dsPqrYJZdne1EFeLnlAQ2Kfw
         /S3dXvBAS91AM/EGMstORudGGeiC+edpqQbaboCZMt/D6h6iFXTQGtHNUTAJePoxyI0H
         91Q7P1mtFN4o2cAAa/dv0X9jIHTj0ooVFQWGHbmjEu2e5FfMlKx43k8C8L8MnWEuO9ym
         SZ/RN9dzAGq7umAaDqTFGemvi/urLRuWT0YlfNg4WpddMq/6bokD2xWALLeWzjkekemR
         fbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769843713; x=1770448513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSlVMquhsKjbqBQTjfSCQUV/WSNHePBs+tvJrWDb2WU=;
        b=GN3fMLd4gjB4133tNHHoDnjaNC4wSl/OGBsx1B02uXfNJ4pJp3xF0rkDTfARztiqSc
         ZW2sJlagUDDCn6OqSDRmuKBACv24Oiz254oiYHMGP6f1TwocJ+o2I6rW9R+h5UJqv9g1
         PpHSVnPxFAhu6BkSjoJr+VeppFQwkVVAN39ZSJ2dNv94SQG9zdWNOD8xUmwVi4EVdC/L
         VWT/uldpsOvoClTZWAaZ4KXqQRi2gzBZx+Jvoe5kaEdEiuxrpniriu0a0gsUTwgmkbX8
         ZNEyqBw7neI1b2bC43ZZwpd3C4lT2Doj1SrrpszJBYSzf6gNJsrH36Gyhw/YWh1cZuQw
         aL6g==
X-Gm-Message-State: AOJu0Yys1Nl/9rvcP79X4ZKEqfilgczOICRfBLiQOR69slBMLLjHwagl
	8HGFx04+qnWQ7oLPO+SRBkJETp3BuderRPAOncpOvLuuzbpXT72GY+Mh
X-Gm-Gg: AZuq6aJz/EQqG8NjDU7r0TAhXZ9pm0SnN3ZasfZkklSg44d0GSkQOXOzgcW29/a0WMN
	Ji9w+ZLzWp+6STi3MOVVzELn4dmiNpvOKq6BP73bI+1mwippfzehOc1Bd0b592nS0EiUemmUgN1
	1OaAwRfbQhprKCpw/OQfj97IlelbUDT8S5SeM/4+BLFARFgDf9ZJCbwNE3vE84I1Ipe9u7OFd8G
	h9Z89xIo9FbNmgnAlfCzmi2BuRszfZ6O+wLf28dIAdAIrlLDtOiWnCmAfz4GriKRRVQ0Z0mE+dU
	c5O30YCkWvcCKEVDlzst+lR9Sm59pSgQ5PxQuSyjyrBGIXrXOucU0gMUXhg+8Jl3RY9ic/Lkod8
	VxZWDrDyrqblGOyuM/XmIxZOOeXdg84V7GYqBP20rZdKLRCKh2eY44UCZGDAgNP0hcW86Ajid+g
	S24h2evvRw
X-Received: by 2002:a17:90b:2e47:b0:34a:b8fc:f1d8 with SMTP id 98e67ed59e1d1-3543b3e3a6amr5876161a91.37.1769843712650;
        Fri, 30 Jan 2026 23:15:12 -0800 (PST)
Received: from localhost ([60.12.244.174])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3540f3cc71bsm9460008a91.11.2026.01.30.23.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 23:15:12 -0800 (PST)
From: Fu Zang <t1468150755@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fu Zang <t1468150755@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove dead code in rtw_mlme_ext.c
Date: Sat, 31 Jan 2026 15:15:07 +0800
Message-ID: <20260131071507.32677-1-t1468150755@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch removes a block of code guarded by if (0).
It appears to be leftover debug code that manually prints
packet hex dumps.

The kernel has standard facilities for hex dumps (print_hex_dump),
and keeping dead code with manual loops serves no purpose.

Signed-off-by: Fu Zang <t1468150755@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index ac49bfbaa5bb..0700d4318cd8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1865,14 +1865,6 @@ unsigned int OnAction_sa_query(struct adapter *padapter, union recv_frame *precv
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
 
 	return _SUCCESS;
 }
-- 
2.43.0

