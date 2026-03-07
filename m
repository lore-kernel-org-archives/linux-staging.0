Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60BC218AB9
	for <linux-staging@lists.linux.dev>; Sat,  7 Mar 2026 16:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772899263; cv=none; b=SU990AYVJpRj+FZnHZG4zvWISPGmf9Dpxa6GDZH8EeFTheeIvxxwcMsVaKigd9A2XUXq1ozk3UsxiKragIgO594fJNPfWOvaQiwUnt+82qp+Puj4F2MyxP0rIy51N9aw4WLGmUns5Xc7vUvTSyNlk1rqX+wFwTnRUoC8lq1SJ1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772899263; c=relaxed/simple;
	bh=FdXMs+3r6RbvQFHeA5EbqotDqNI7zuNeZT0EtbBYX/M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OOxGr7OXgIXs/BaCozxwB1N9HCXl1Zabu7ntZU1O2n6WDUYa1jA6MEy1j8PcBVNejRGndUMPzfr2PE0S9os/+uZwpCQIufsAfjxrWVSQunCIHp0QodaJSU13Kehh+Y3uWkHbmFbx7WfHbRD6IUmWLPJwKOvzNF+gcevHia1DN2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hwnDT8m2; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hwnDT8m2"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-64ae222d978so9872213d50.1
        for <linux-staging@lists.linux.dev>; Sat, 07 Mar 2026 08:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772899261; x=1773504061; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P1kcVBxom6zjMb9sdcC5dGO/1L7wVD+4hEVSpg1/UqE=;
        b=hwnDT8m2P+Jw5qCNMMo7ArTRe0hv5ipYR+/nV2+5FOLGJa5v5FRMZwAOClvm6GCqdZ
         1SF/QF+KBLhIb0jffzvA7+TqO/m32R4UUQzH9x5OyzTuuFIIZELnqOPbiKv6Wthy65Oq
         UyHMIhGUETfzCQq47Ds+11eB+n2alu1s+OujVPg5G2u2fjV2CMad0HQ2cIeKLtFUiVQe
         jjHy97pj4cSKPAgY/1grTaQW+5MSbCQUa8HoGUtaCR2bIRseMqCUo5DNxLimYILCywDc
         1PgOiPEmu3rt43nCcdj3Mx0wuGP8Et8CaqpEakBh7o9ZMaD4KKCYojLwGPAy+ymFTfCf
         TH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772899261; x=1773504061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1kcVBxom6zjMb9sdcC5dGO/1L7wVD+4hEVSpg1/UqE=;
        b=Afvvk5aF9zojR5jsPBIUtZNG5hSHKeYfyt++/UPe7RIhSkU/8LdMYAqpIMf4ZxOVP3
         ThZkdKj4k8cdeHslYOX6VCJDJts0Stk2xWdWTmEoe2ZWo6tXHOrbQDorCdsG1e/4dUQT
         8CKrni6wOqUh6UwyBW7z+9RM7K40e2/GOVwVnR5+Wjy0O7B5ohSqoQG7jCjapoU7W/0K
         V+rar8ozyry2iHG8RlDgwwULnZfiheP2zfh6Kts5ICpMr7BNurt+59BFtH/bCfEbLenp
         iWHpipb1gAgFagyGy8+ic1WpngAxC28rX3US9pJRz1OkcZWkDXv2nfB+pRBublQRCw0F
         0wZQ==
X-Gm-Message-State: AOJu0YziA0pC3j6YoQLC/AWWSzfNm6mySh//dBjfrsf51zBNk/paq8Ok
	RS1fbUEHofTx9IAvZ6/J4JevfI4UlguJlZINhKl7B3Li/ecvIxy+uBrP
X-Gm-Gg: ATEYQzwGm9YsGHlVj4YTb1loJGlyxrSM+0BVV1LdAe15H/ye1r88hqfh5DyU/3/hHW6
	beMl6lwCYaH21pU6RzrX6+4qzM5FKhdnE+M2W3x+qrMLRhWcrQiVyKLO6nVjfN4oRCehZLVx45m
	ofAXchwXFsakviCIg1e/MnO0rHZ8xEbyZw4AkhV2CjnHSCo2ygMMnGyA6u+xtR+YaLX0in1giWf
	GEidrFkxUCf6g/9aWm0AOp5QXftpwuDSoSWQluTuq5CS1hK45GtqXg1zMXFhOHA4ybVhaZeHAGP
	agqEjkowzN67J0DR7e6QzdpbJvL5laWtVxWNevMbNsClOoInbe1x0FoeAkZ23GNF48hDeHwdWCh
	Jm4/lV5ESwUpj/5Y6xaWGy1IQJIHH8FxhwZmYC84RD5xdZPAPPaMUjD3k41cNz+L3dPaQqmlxIz
	YuYJckml7RMLafd9GA2Fq14g49
X-Received: by 2002:a53:b199:0:b0:63f:bc75:6ead with SMTP id 956f58d0204a3-64d1407f32bmr4354044d50.9.1772899260773;
        Sat, 07 Mar 2026 08:01:00 -0800 (PST)
Received: from archlinux ([185.140.162.146])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64d175d2f31sm2232160d50.5.2026.03.07.08.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 08:01:00 -0800 (PST)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	ethantidmore06@gmail.com,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 0/4] Replace functions return types to 'bool'
Date: Sat,  7 Mar 2026 18:58:29 +0300
Message-ID: <20260307160024.18039-1-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset modernize the return types of some functions in
core/rtw_mlme.c file for greater code clarity.

Nikolay Kulikov (4):
  staging: rtl8723bs: replace rtw_if_up() return type to bool
  staging: rtl8723bs: replace rtw_is_same_ibss() return type to bool
  staging: rtl8723bs: replace rtw_is_desired_network() return type to
    bool
  staging: rtl8723bs: replace rtw_linked_check() return type to bool

 drivers/staging/rtl8723bs/core/rtw_mlme.c    | 19 +++++++------------
 drivers/staging/rtl8723bs/include/rtw_mlme.h |  6 +++---
 2 files changed, 10 insertions(+), 15 deletions(-)


P.S: Or should I have sent it all as one commit?


Thanks,

Nikolay

-- 
2.53.0

