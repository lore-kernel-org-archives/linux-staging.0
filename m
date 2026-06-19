Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5500440D582
	for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 02:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781835770; cv=none; b=JJROOOGj5hBhOxXh5cW91sWpRBPa5L9vnka5Q37Tr8+j6hfSNF3Mwi+cbe+Drs59uQeNCWPkpREpr7pQ/fgFDRQWqwgAOlUBArkstN5gAxMDjcXCmlDHrMYtc7mcnk2hA65j7M4Id5Ok9kUTEtYOk3xnixfaELoonD5wNd7UljE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781835770; c=relaxed/simple;
	bh=Rv5s4D6zOilcsbHIKoJIXKbjJ1RTA/5ynGaaAIj8Cfg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=u98nRoK8pQ+s5WqLQTk1vSqgMxp9Y64rRvxYu/vyzq8Y/RdgPVUF0vOgL2qPq6zLXZj66b93NreL5vAYnSvpq694+hOoinkn29s8w96eCK4MR1ggGg9evxXklY+y/imPHTQQt7PzA9cAFc+CtInu5ZUwemw/fsiluHUIMxvW/Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dKWaTpW6; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dKWaTpW6"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-37cae9b7536so978760a91.3
        for <linux-staging@lists.linux.dev>; Thu, 18 Jun 2026 19:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781835769; x=1782440569; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jkJiL+YreOAtURVCViA16oD0/ALDelTABH8A2Rwh8Zs=;
        b=dKWaTpW6e4oBXWPBtp2BwE5G10hLhy6vq9uK+31Nxm0gPTsBpo73tbtjYRfZ4/ymHb
         23mXljLDxEf8JUsMCC0dK/enIovk3oHuq8hMBP3pDKvuSNUPYY/oBYMC43Fzph2d6DL9
         90wI7vWW0MF35b6pmYyh/ByfUqUvGyxNRfFSR22kQPMiGSAxzboB6+OvLz603BS1+1lC
         vV0spe/LKow+HtssfpHM0fQh67Yr7Cy6enq0lvWkFDS9+LQCYbqr6fQwsnmFTLipNOYR
         kw16ng9lUOF2z8Yc6WmxjEoi7Mqd8a0oQ2WpFsuzZ5RHwLgLRfCrPN3m6AuJgB+yd9dS
         3s7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781835769; x=1782440569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jkJiL+YreOAtURVCViA16oD0/ALDelTABH8A2Rwh8Zs=;
        b=MXyOkDgMzOyxI28qDJt6zY0LXOJCoL386EdCu/kp5nCpDlFeg5QdMlF0ptMgFFzW0Z
         aF0oBfW5xIhokrVDmMgtcU6x+iH+qtEpheZwlHd+/WeVpoT7NSi5m1jmufqJQiLgvS8G
         HdNfbaD5kxK/cPKsJX7s3Y6mWO1WZg8fer/9ou3UDzodKrLLhx4+dXJcCTyDNlzw+L4d
         fdDrwBNuEsKdhTTmJ2PyOXTNBDbNQPdrOre7uvQ+26ekuit3Bg527pWSBCxWN5VbgUSK
         Kjt+VlDUb0LXlokEHNbYTTO0n7gdsyrXxrgip/gBNzK7tgkPVjCYboOxQ6aXPOdjQMcN
         2vVQ==
X-Gm-Message-State: AOJu0YxrOJ4xl9pyePmTkMd3iamsY+xNcH1os0+aZe9F6G6oG05tuLSZ
	BYEXhI56ChKM3JmQRlpaHdcP8/xK/oAP0NTAC5h/fdk0VeS0fa2wWRPE
X-Gm-Gg: AfdE7cnvmOeXELAcvsvaHZW2NXg5jNvqbdmv8SPAnAsAgvsoL4Zkb2iwwZIEA3xE+Tk
	mIsWKTHPHqIW3rwWuXI5Iz208U18agkifTXzLkY02SKif+iCZJOA9qGCe3gFJz7axondVlopTMQ
	75AY/natasmh1pMnvP7FSKTQyX3qtf+PBgUp61u9K4wvzKPlhH+XvFplBOGD9yAERT1BowUzH1G
	Z8QiMJFUrBUIehZ7/G9BJNB5xKbLOciQW35DxXyr94vTjo+OvW7QWctJmssaAnN5i/4gmABbhms
	Ah21z3bHhE58HA6DjiqzTKrjWdbEELaKoIgiWRtADpbt/rlYCd8tzP/rqaE7jO9fSiTCpT9Q/zj
	wcKXThuqHpxt/XnTzZ7Fro7Te9jn2jH8F8y+zBgJ+FXFPI24z50hIQU9mcA6n9OYvG3eUoqc2bG
	X0eW4ZUwNJlRu1ESzw4KrbBWEWjyBasyEoAefXgrHz20fwgHqLFUkADAQgahY5CmwzRH05
X-Received: by 2002:a17:90b:4a8e:b0:367:bf0c:54e9 with SMTP id 98e67ed59e1d1-37d15e027a3mr2310056a91.21.1781835768576;
        Thu, 18 Jun 2026 19:22:48 -0700 (PDT)
Received: from moksh-Nitro-ANV15-51.. ([2401:4900:c0b0:86df:f75a:8ee6:3dae:31fa])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8a888e219fsm768539a12.21.2026.06.18.19.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 19:22:48 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>
Subject: [PATCH 0/3] staging: rtl8723bs: Replace bare 'uint' with 'unsigned int'
Date: Fri, 19 Jun 2026 02:22:07 +0000
Message-Id: <20260619022210.143940-1-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series replaces bare uses of 'uint' with 'unsigned int' in the
rtl8723bs staging driver, as part of cleaning up unusual variable types
listed in the driver's TODO file.

Each patch addresses one file independently.

Moksh Panicker (3):
  staging: rtl8723bs: Replace bare 'uint' with 'unsigned int' in rtw_cmd.c
  staging: rtl8723bs: Replace bare 'uint' with 'unsigned int' in xmit_linux.c
  staging: rtl8723bs: Replace bare 'uint' with 'unsigned int' in rtw_ap.c
