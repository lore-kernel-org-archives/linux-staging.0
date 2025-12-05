Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FCF219A8D
	for <linux-staging@lists.linux.dev>; Fri,  5 Dec 2025 02:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764900863; cv=none; b=H2WLw9x9KYU1eK0INkgsxykSiygq0mq3PL2JGMqrZpwgHXtbyXsCoFft4APKzxDEbTKPSbIlkUv9vfdpONqPLiYSRmqBw2/5BHmmRiNWHIe/fSm6kE5JnXu06WlxtfeBbDQUsUmNeGxvhBmfw/+nuWDLmoaxukADChkk0W/ABnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764900863; c=relaxed/simple;
	bh=EZnStdDDHzEYd8QEiON1kMATbv/vWB8VoAmeIlAx66c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YW1eqV1cn8SJVMkpFf1zPJyk7DxNIi6HTCS0C3fl94BbJaSyy60NBObwZGtjelkOchHSNw95RPCaL6Ils+3av/u+tvrqnKr1hst9n2ZFkOsu8SHBKrYyGmgJSR76SdyrdMsM0WqaiV/4bKy97m85W9khdKUoMWpSjXE727Cb9Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A0NQlNmH; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0NQlNmH"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-88678d7ed65so16759676d6.1
        for <linux-staging@lists.linux.dev>; Thu, 04 Dec 2025 18:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764900861; x=1765505661; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jetWAZkuhxE1xmVEf4kdDUzFhZVeqe5Fy6VrrXWrDs=;
        b=A0NQlNmHyTCi8wh1AY6mxMOwxRC+uQgVg+uCk8RMHg0TJU08tmS3RTSnZQIMqwPAnS
         l9Xsjq/ul53vIdMNFUjM576PZ8DKhzySZbgbrqQeP+ATxBBDc/DnxbBt8m9Ms4EvcsFc
         eCPg6f0aeOruIw+3OJGaIvoaeMdShEndN45oJoXgkKPuJHGL0NeCJvowoyOht5XTPVYd
         5A8mLZmRZ2OJC9yG0ou7dIeEPwH+mxkN99B15gUNqpHzGysFn14bsO5NQhnV0AJSBPXH
         zVBsWHidXeew6rnDUJC7v4voTYjUdJQXlNMR5T00JRDT3ZdpySDW7PAJGTeqh3acfaCv
         nq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764900861; x=1765505661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7jetWAZkuhxE1xmVEf4kdDUzFhZVeqe5Fy6VrrXWrDs=;
        b=PjXRqPHv8tF4nIt/CJBGqWfFo+9/oJrc+YeLCW8N2gVkP1W9yz/BYoX2QZzEU5DT5J
         syt4jHQZGPzFsf5m5IgzaXdKnRQHJs3TH+Rpl0Ljw0ci/L0qzUhOZ/5nBHx/edk/LQj9
         pNfzfedccjtyIyBMchLz+3Xlr5WyjlQbWhCWxIV2CQM0ex53hn0/cgL3vtzIgZ6C3rjk
         gbuZPBDpLZ+VcTW/WM9ZZJuZDKDcguGfsC+DW/2EZY+UP42VA9ucywww/zmk1VGBZcR1
         5uh2XZaES1owU3LzBtpMKdrla1+R1Oli1My8u2auiAVFbjAB6SEMuf8X/l/RD6EW1Hxu
         M1og==
X-Forwarded-Encrypted: i=1; AJvYcCUF0V9v+lfufWmB9YDtyw0eqLEA5y/vFQti4IJm0JxPgPog5ffpMbEaOrpIdqkcN1icq02mqjE8zK9vkq1h@lists.linux.dev
X-Gm-Message-State: AOJu0YyaPDFDBFhl1WCbhUxF/pKafMynkxomiIpkt/grpQVh8nc249zj
	rMgSRpBps4V8DBsDM/kSTHb4oZDRFo9dTv+d+HoVSrjWGZk6nc3cJwevpz9ALQ==
X-Gm-Gg: ASbGncv3DkTOttMaVcDKM7PhsPZtUNBn8hwxXS9mhrDa7NFRybYqqNMt2ob+n9+Sc71
	mZqEYdOzKVW+eBO0SjmVJFszlEI5zXnvu9FA1yPDeP9ru7atNVWseEWHhcIVKCMB7zEWyp71dCi
	c05t4mRzIsPHSYVAfIsAeh6U5w5G4FEdfxyAB5LIu54sSeDjep9ofW2J5XOgkwzCJziGtvOpCLj
	KoWmZv/CNmeHxBXt+HvzLERqUug32c+D8DfHJxz0CcGJAyR8lrOoHc5K91zTB1DNiLrLhiKw7ot
	nLq9KLzcvJd04LMxDZVVaFVa/jJvNe5DKs484MJTGGqu76ykJ18padKo+CSad4JlrZ5xwrg+yfh
	JqD8+sbIWmjzHVJ5FncWYC0fCYvV0PTCLunVZcpKdxAdIGJmCRu2j71RPdV7bGIWkHeOd3hyjMl
	vQRADeloR1DusU57hqp1l/7TRlB0D748o14ac677Y7r44=
X-Google-Smtp-Source: AGHT+IHq1Raw5u4pVXCl3bUVMEl2r9ZK7iVf0oI/5DQHi1txU+N81ZKnsAbBLU7e53bnE9v1c7Wq1g==
X-Received: by 2002:ad4:5b87:0:b0:797:1a0d:cdd3 with SMTP id 6a1803df08f44-8882482aa55mr81606406d6.19.1764900860845;
        Thu, 04 Dec 2025 18:14:20 -0800 (PST)
Received: from kernel-internship-machine.. ([143.110.209.46])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88827f51ab8sm23661356d6.21.2025.12.04.18.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 18:14:20 -0800 (PST)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	hansg@kernel.org,
	tglx@linutronix.de,
	abrahamadeakunle50@gmail.com,
	mingo@kernel.org,
	dizhouweng@kylinos.cn,
	ninoxzhang001@gmail.com,
	dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH 1/2] staging: rtl8723bs: remove trailing whitespace in comment
Date: Fri,  5 Dec 2025 02:14:16 +0000
Message-Id: <20251205021417.2705864-2-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251205021417.2705864-1-vivek.balachandhar@gmail.com>
References: <20251205021417.2705864-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A comment line in rtw_mlme.c contained trailing whitespace. This cleanup
removes the unnecessary whitespace and aligns the file with kernel
coding-style expectations. No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index c06d990350e6..778b8715cdb2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2024,7 +2024,7 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 	return ielength;
 }
 
-/* Ported from 8185: IsInPreAuthKeyList(). 
+/* Ported from 8185: IsInPreAuthKeyList().
  * (Renamed from SecIsInPreAuthKeyList(), 2006-10-13.)
  * Added by Annie, 2006-05-07.
  *
-- 
2.34.1

