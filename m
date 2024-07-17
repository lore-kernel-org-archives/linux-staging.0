Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DAB1802B2
	for <linux-staging@lists.linux.dev>; Wed, 17 Jul 2024 13:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721221608; cv=none; b=YbbC0VivN2kDa9OtarBjvxKs4cmT94pyhC5B9CzUWODtIVh7OcwqNK633FtW0/Gl0ni7QzUyrRn6vn8U8AknpIa0zgag6uMwMvqc6ALzP8w6g3w/3SjszIgcXpavtT/ZBPCK5M+B/YR9ODTaKVZcKhR6yy+PxWAG27A2VK/RrTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721221608; c=relaxed/simple;
	bh=X6qUC7gVV4QIZGcID8RsIBmaMKamLJi8yiQ3oC0t8no=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eOrXBXjr0Nkg+7h73tUOC8JVwH4izoPHyIe/HPjRZOgaViuw9ZAvECQz9b3j+9GKzE+7QEwD17FLWdsoFvvT0edU/8Ydh4+G/D3eJWFDbi/CxxNbbBBM2O6NW+fGJrIEz1FtdABwW0q0i5chLfZbrv35M9RImLdWt4aBvEdixQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S6OD7jng; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S6OD7jng"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2cb5789297eso280013a91.3
        for <linux-staging@lists.linux.dev>; Wed, 17 Jul 2024 06:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721221607; x=1721826407; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6tariFUSXQkWtNNWfv2Tqu8LFewkJuGm7SNgNU+1Rok=;
        b=S6OD7jngZ650EYo0ZIPF9RlAl0Xn4rfVQN1HW52vaNnrBUbxQSo93kCZR1v4+lgxBO
         iPG4uMUEwlq9R+bMbhLqSmv8rp3ZgWV7eSysQpIxUuno7tpCVwT5CZjHtCUubLpTT+Nt
         Pcl7IB27WS1+KyGJoKFPeNP6tBg7031UjB3r0p4h2vb3083vjQj4IeKxvgvTZ/98rzD4
         2rFWVNWQiMpbbB7JUbS4gIxu65yr843Kc5mo2fQWWz7+Rt8cRjmAanSa1K6YzMSQbxAI
         bp4KSebuPjaz0psZXgyRs5H3JpI/2GCCN4EIdv3LiaBwF536WkHy37LVg14Ye2lJxI+9
         I02w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721221607; x=1721826407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6tariFUSXQkWtNNWfv2Tqu8LFewkJuGm7SNgNU+1Rok=;
        b=qsZ94fOxAIGFh5fNop/6GqHOfXvZkskwGYtsMfmV114bWpNoWi4OkhSGcroG/qJ+jN
         wdHPcnIJoRdpTx91L/zv4cYj56+5S6rNM7BmIFqTtmcu310f+fd3Fs7+6ntjfgKQX3JN
         xnYdezdG1TUW6Lz+cSSijKENwQtdTXoLKGDhM3IDh+2XaJ37VJJqf404S2yM5aHwTMRI
         e5Ax+7RtlVnkF75iG2rq2BpLmOGw/PBkVOv9z7aaqtGNWUP8rV5ZGVxeFZgm8GpmJq2g
         p9HHus/1ah4x5A7stDpIykLDjDXgIXh/fpQo36+C+GbWsMJXf+SHS6aRjvrI5fIu+Gmz
         rttQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFN7WH7yUJGgUiu1NyruJSnkhk3EPZrdL/eFlR/o3u01c7Nm7kMhkX+tO6fG9bUTOdtGolRuvFCztYB/YPK2vwatanjxRtGiKgz2H2xQ==
X-Gm-Message-State: AOJu0YwYaOXnaWi+wlRuOndS0ECz520wmDVltvyPAa3v+IqFjQLOOGoP
	D/mecWfAUn3RbgYzoVJvHbCWRepjAgR3BQ2qni6ttmAx2OvIUsC4
X-Google-Smtp-Source: AGHT+IHk5G2dBMU9fUqgXya/ZBe6XkkFoOGRj0xvzES5zyJqox6/DrYiT/Co/JRus5UKuGCqQJv+qA==
X-Received: by 2002:a17:90a:f315:b0:2ca:8684:401a with SMTP id 98e67ed59e1d1-2cb52930c14mr1134471a91.32.1721221606597;
        Wed, 17 Jul 2024 06:06:46 -0700 (PDT)
Received: from localhost.localdomain (7f.84.a880.ip4.static.sl-reverse.com. [128.168.132.127])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cacd41a0casm10053941a91.33.2024.07.17.06.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 06:06:46 -0700 (PDT)
From: Moon Yeounsu <yyyynoom@gmail.com>
X-Google-Original-From: Moon Yeounsu <yyyynom@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: Moon Yeounsu <yyyynom@gmail.com>
Subject: [PATCH] staging: rtl8712: style fix multiple line dereference
Date: Wed, 17 Jul 2024 09:06:36 -0400
Message-ID: <20240717130636.2139-1-yyyynom@gmail.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It fix the following checkpatch.pl warning:
Avoid multiple line dereference - prefer %s

Signed-off-by: Moon Yeounsu <yyyynom@gmail.com>
---
 drivers/staging/rtl8712/rtl871x_cmd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl871x_cmd.c b/drivers/staging/rtl8712/rtl871x_cmd.c
index bbd4a13c7bb9..c8a220e04776 100644
--- a/drivers/staging/rtl8712/rtl871x_cmd.c
+++ b/drivers/staging/rtl8712/rtl871x_cmd.c
@@ -528,8 +528,7 @@ void r8712_setstakey_cmd(struct _adapter *padapter, u8 *psta, u8 unicast_key)
 	if (unicast_key)
 		memcpy(&psetstakey_para->key, &sta->x_UncstKey, 16);
 	else
-		memcpy(&psetstakey_para->key, &psecuritypriv->XGrpKey[psecuritypriv->XGrpKeyid - 1].
-		       skey, 16);
+		memcpy(&psetstakey_para->key, &psecuritypriv->XGrpKey[psecuritypriv->XGrpKeyid - 1].skey, 16);
 	r8712_enqueue_cmd(pcmdpriv, ph2c);
 }
 
-- 
2.43.5

