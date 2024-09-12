Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1621891D6
	for <linux-staging@lists.linux.dev>; Thu, 12 Sep 2024 04:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726113875; cv=none; b=ntfjYTrZ10Mn/KkcizwCgLkHNZQyE5S7yGZSWMOfusy8ohLD5cnxXfI1USdhDds8twDcxsKFinqeX8vMdz5XUMk26nBlfNJjsInNdVJaFymtKmIJKvmaGTzJI3A6dBNprKsB+riH8VPUSU8dNhT68qC8zIEMxVf/qysDW47iyzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726113875; c=relaxed/simple;
	bh=8nxyDJcKvfaE2YoayCrAHbXJF+z+7/4qP2LTJZwR+cs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bpkF4gsbjkbqA2UJ60eTLakos2m//WIO3LW9wfJttSDycxaMkKhy5kMZds0hvPI1UA5I9gkjo9xY6692eVs3d3NyrZI5vtzOUbL+rQckhyN1vr31VMfBLOAqo+rLohAfw2odJh6Z+4nXBb7scVG1nwX7AkO+UpvBhrIXv4X0T7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGbTqdgT; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGbTqdgT"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71798661a52so369650b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 11 Sep 2024 21:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726113873; x=1726718673; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4I5sXZJVd6DoJL2ghSKrRMRQLAAStuHg4Or/EqIZN4Q=;
        b=dGbTqdgT0XCxcil3PGyfC5lnQhGVv3Dibpxka/ISmw7wdotT0S8QJCbDmfyB9QzOIv
         X6z0tBn9SujTUFqwJW/WTKmyHQ0CvrxYTCrZe5+Tl6ap36+ckiKMhYavrCYjPBcv9RQT
         EQvL0BOakJSVeEcuvW858Cw1Xtft+iRhTV1W9tR7MQeu7aNpqRTBHezB1MvZpnPRj7kw
         WJLedIDBaRT2PTWtKiXwQGo/Lc1fBSHxcjgsKjVTmwjVRvn2J43Xn0G5+AIgpkAmFpEM
         SDw2XUa/zXRwZTDYK5tr0YQoaLY63vsizwZ/P/ejNCbq71BtrB1vRFHNFaTVYk1FUmE7
         S8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726113873; x=1726718673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4I5sXZJVd6DoJL2ghSKrRMRQLAAStuHg4Or/EqIZN4Q=;
        b=I0Ic0ezCgRfuA6EE85dChxCsnPWREk8cR1R0Pg3DF9/Ny7/T1R6CquBJcFjurrKjvb
         Y96MX1jSGTcjyNZbTLGN6S5pHKiFdVMbuwieFSHZXW5/CUY4+bac8TK44HfRTnEbb/qE
         mcAgaqUOUTc/c0cNIWS6lQgLFeCyCciPG2E+VfVJS9G5hBoxVSN2qUyCV8hAHoIsowfV
         VAVEiztTFRLEAK5z5ewnv7MAsO9R7b0/BZgSYdIqz+0qVvk1CJGeNXbmznY8qC6lvLX2
         M7gzAyIQY7StFAcLYEhl5QtEkgN6Sz1T9qiomxUX8uIn2vRzJ9CacAtcadyUeyQhd/R2
         lx7w==
X-Gm-Message-State: AOJu0YxVWSMf4grXtwHnsx0Jg6L13b1afCY8CntA/TQBTdYpdTqPotQA
	e6L7uBjQSjz/e35oWBAag4uF28nO83NdZdqsCNxWogRtp/qioDVN2T+NTXqzrT8=
X-Google-Smtp-Source: AGHT+IElAKHNYdE2RMto0PLX8schrZEEVREC0BdUYqLm6TcPKXu5UKuxpfWQ8uzE0Cha2/hrwvNIkw==
X-Received: by 2002:aa7:8f8c:0:b0:714:21cd:a4e3 with SMTP id d2e1a72fcca58-71907f721cbmr11972046b3a.13.1726113873069;
        Wed, 11 Sep 2024 21:04:33 -0700 (PDT)
Received: from debian.tail629bbc.ts.net ([2409:40c2:12a7:616d:eca9:534f:4e49:7c41])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fba469fsm768359a12.11.2024.09.11.21.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 21:04:32 -0700 (PDT)
From: Sayyad Abid <sayyad.abid16@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	guilherme@puida.xyz,
	philipp.g.hortmann@gmail.com,
	linux-kernel@vger.kernel.org,
	Sayyad Abid <sayyad.abid16@gmail.com>
Subject: [PATCH v2 4/8] staging: rtl8723bs: include: Fix use of tabs for indent in rtw_security.h
Date: Thu, 12 Sep 2024 09:34:05 +0530
Message-Id: <20240912040409.3315067-5-sayyad.abid16@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912040409.3315067-1-sayyad.abid16@gmail.com>
References: <20240912040409.3315067-1-sayyad.abid16@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This change ensures that the code is properly indented and easy to follow.

Reported by `checkpatch.pl`:
WARNING: please, use tabs instead of spaces for indentation.

Signed-off-by: Sayyad Abid <sayyad.abid16@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_security.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index ee4b5c5804fb..0c3271fb7e9d 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -75,8 +75,8 @@ struct {
 };

 union Keytype {
-        u8   skey[16];
-        u32    lkey[4];
+	u8   skey[16];
+	u32    lkey[4];
 };


--
2.39.2

