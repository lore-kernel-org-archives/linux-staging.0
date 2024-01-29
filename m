Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C1265BA9
	for <linux-staging@lists.linux.dev>; Mon, 29 Jan 2024 14:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706537946; cv=none; b=PW6nnSl8ob1BSkcG58hc+SdK75X7zgnKuDk+Nq1tlWlSwdxt5/mOt/QiN1g5KL9M5KtXxhe7HYmBgZ4vOeWD3QUf4SSKIw3iI3SdZy0ZstiBSOP2QBLe5xRFV55vw/z8F/Vy9DDowZjTSduArI/+tuwcrCv3z9twmIlr0PzC8BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706537946; c=relaxed/simple;
	bh=Gnwfp/Egjb88DXFVc79CpP+Kphf6d6Ub9Z0ZLmJp43Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oA0kO2Hkbfieb8W8Nziiz3kW89DqRTH202U7k4+3x5PXRCXdCEnPAT+zH0U5MiPVlf8B+MztqRFCIXq6n5xO3jVmAYFhHAQyYY+nJ+5Tno3VgxeWxttnLkwBGP25+HRGP0iQBomsLxrlBoI1aqHkZpRf7p2VWyAlxw/MEHGB29Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qc4sJwLM; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qc4sJwLM"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3394bec856fso2165572f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 29 Jan 2024 06:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706537943; x=1707142743; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aLS571dVw4X8+n8FbYXlJLtZy4tBEfQY4YRQLn5hanA=;
        b=Qc4sJwLMUAON42L2/g3wH++ohD/EpgFvmTo0TlX3jBt28+X69BJ85B0JCJylV/1v9M
         spn+RPP20UsQZs8PW0pu+Hh51DZIqiWSQGmhDkCsPl55CjzxokAuKw4TA+hl7y7B2JbS
         hCRhq7P2wtW/EdM0/AphcwFzynydPiS8tBjkm5qb/biOphpUpRLRIrCI0ito3bzhYJbU
         xAdtjD4GmWfY+QEpIcsdkUVmPAtUQ9aEJIWpzq4X/0aWrJ8sEAOKSv+wbajBzG1oeAVE
         e2LWukMwAgg0yixecnqUsWWsCYoiBruh+PvAiIxl68QivDX9ZiRnlnjXKtOuMIq65cuc
         ttRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706537943; x=1707142743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aLS571dVw4X8+n8FbYXlJLtZy4tBEfQY4YRQLn5hanA=;
        b=sXU/8cXngurdsRGJiCmRwdFs9RFS+XD+enP/GaB+V/v+0wuNiNxk3MBeP61DyrWmmb
         tsJW00ktIjoHR2H2cQDPCkPJ1MYGYGmE8duuF9kv+0FdzWADG9X6mqvwQOg1DbD0SuD2
         6AGO4qmUs1aF/FXfsPv34ixPX8TVVFbYFlhyr/2sNbP2fILK4D1yMdjpY92am2jKb4qE
         j88MKVfFjzcSxNOCwlGPbsECphln5UsSmoqCu+cj/4k7l97bn/OLrVRVhGMlJNdESOCO
         cHGA2ubYUl7Y9bP6SkTV4YG7cGDBlcTyv/Sv2YztImUddLZovJdHVV9MJzJT/dyYXk/d
         bpDg==
X-Gm-Message-State: AOJu0YwlvQkaFaGF2E8zcBxq7QvLfkFgKDDFes/QvBVPyx6pPnnbNKqP
	OsKTUSNdRX0H0ESMR+edDYFkAu3NgdZbzbKngkx9yfCLq6KEpWrU
X-Google-Smtp-Source: AGHT+IHuI7h+GeXoy0qKXnNpp7HNkXdurZuvJjrOTcuh1RRQbe/+/JPGj2LgCVKlFFzQvwAifygcGQ==
X-Received: by 2002:a05:6000:1561:b0:33a:edc9:8e32 with SMTP id 1-20020a056000156100b0033aedc98e32mr2457546wrz.26.1706537943022;
        Mon, 29 Jan 2024 06:19:03 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUVyyKnhuYqmON6CZr8R4wWpLf1kN9+FY1GG/3yN9vciHGBbQQa3kUr41pV69X5cSLALGRGAuh+PXJzzGDE8RpH1ZRNljfbAMvMnX1p9lQCwhBD/7SHSgNfvhvyB5vuanS5WPss4HIK5f49zumVO4GAM05cLs+FPHJreIHDHnrxy5s1pNoLCd+VYA2H9SCn9yUJt+fySif2r+4cU+xW+60cT8OsxQ93
Received: from Ubuntu22.myguest.virtualbox.org ([46.121.140.152])
        by smtp.gmail.com with ESMTPSA id v8-20020a5d59c8000000b0033af2a91b47sm1768430wry.70.2024.01.29.06.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 06:19:02 -0800 (PST)
From: Meir Elisha <meir6264@gmail.com>
X-Google-Original-From: Meir Elisha <meir6264@Gmail.com>
Received: by Ubuntu22.myguest.virtualbox.org (sSMTP sendmail emulation); Mon, 29 Jan 2024 16:19:00 +0200
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ruan Jinjie <ruanjinjie@huawei.com>,
	Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Meir Elisha <meir6264@Gmail.com>
Subject: [PATCH 0/4] Staging: rtl8723bs: checkpatch fixes for rtw_mlme.c
Date: Mon, 29 Jan 2024 16:18:52 +0200
Message-Id: <20240129141856.416532-1-meir6264@Gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Checkpatch fix series for rtw_mlme.c

Meir Elisha (4):
  Staging: rtl8723bs: Remove unnecessary braces
  Staging: rtl8723bs: Remove extra spaces
  Staging: rtl8723bs: Fix block comments warning
  Staging: rtl8723bs: fix else after break warning

 drivers/staging/rtl8723bs/core/rtw_mlme.c | 241 ++++++++++------------
 1 file changed, 114 insertions(+), 127 deletions(-)

-- 
2.34.1

