Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E90D23F40D
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 17:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778435495; cv=none; b=NuCNm/pxXVN+S3ew2yh1gFAu+m2N71CUXVLfm3T3gaJr/6gPMUG5CHFalNlo1ff5SI1/EQ1pzzDFxgTUuhhbhsszFk+FgMwpgGHIJirSmsHbc0FlZFKD4fWQGd/UVCB/LgIo0lW8ql5kHjNBArn20wzAScdSBy0cQMehoFcwYvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778435495; c=relaxed/simple;
	bh=eHqnZlHYccZF1Fmkv1RKdaGOGWA8DNXL2hSj39+IK4E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VKXbd17P4vgab+vuOS1Zb2Gp2k3+qi5PeLjiaYQRxVx67kgyrY1A9M3e15sCd+Y24zp9KR94BSIIvDA6XbdT0M5n4YDybT+Z+fMk9UjQ147Vhs6j+CVxZrnupeNTyd8TnJQAtPJY/CX5rEIOJo7ls1vx74OjI3fDE919E0XxMlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NgU83iow; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NgU83iow"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-83945063f70so1958270b3a.0
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 10:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778435494; x=1779040294; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xuJsxf8osCbDOIAhEyU+SFph+MI8lAGuJRaKgv+5BNg=;
        b=NgU83iowurzVXLe/Z8oa35ppLFxkVxj4ZBkabIe99dvyB0bJku6PgVRAVSC46IfIs/
         Qn+rZEuNmfjqFC3tRId7HYX3LcGhohzcSUsI4ow70qfyOF92hG09N67x70kqgGlWJvYi
         LkrH6duRTM4vVCW4PXdotWvfIeMzJARet8/JnsZI1gGgPq4kHMRoXnThvfD86XdeUxXB
         kH+rx8YJGKtnGVBL42w5a47v0WSePEJHx4IiDK5IRkZBtnXPZW03ZV7k0K5SSoGZKX8n
         BtYcTDzG5jqZlItzX9OhzA6k7qQaI0K57I5FXwt4hvttIYrdOSlhZdtCPoe1MNpJvpqM
         tfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778435494; x=1779040294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xuJsxf8osCbDOIAhEyU+SFph+MI8lAGuJRaKgv+5BNg=;
        b=BVafp/li2u+Hqs+n+vSv8Lq8TwTqJtbPcWXw+7gdfhVH3Gh59WIjLQ6ExswVFo3jvx
         7b2o237gpPSm+xTaAnSLAzVZFIdeLmuDovVmJ9Ako8NPBjc7F0eHIS0oe4hEK30bVANg
         B/k6rNN4ABpvETuCFcE9u9f2gQ2BunqfICTzW8SwG6A5eZjhNMtYrwVWfFs4gCoLB3qW
         CAJ+IVmc72Hxaf4U38evmVl3G2cW8MQUUjFXSQgXexH5OnJPm/d60OyJAqIZso5EnsRq
         lxR7BqEBnQjHWLB4JOs9AkqSaKI2dCv+YmodsnbrarE70Nbi8OJ/mK4XMJd/a89fivkb
         3jow==
X-Gm-Message-State: AOJu0Ywg/tR9rojyNtRBok9FBYNYPksrdCbpPRKBMtfQjLoi4dN96/eB
	76JSiArXQIqZgJLOCRIhkAXFn9LCife58LLIFTu2tzqX7PEo2z00R8jr
X-Gm-Gg: Acq92OFv/fIpmr90cMl3zSZUbac8S2igVr2Zx8dhf3blaz7iLHkhKnw7+GdMBAV+3ir
	JO0oUH7rAMOun1byCkLNoD3CVhk5H4DzalCmHojdDd1/fpRYS5I64NlwKJ2A9mgv5nhO/3YGysy
	vNz/p3Jzew32dHCuQNTvxttloPMp3dP3ltGZz0cAmErsDqyjcmkys4qUW1aSj+aDyDAYifhMjFi
	MIbkrZ2pmDQsyl0LFlonAHnmr4MOf1vg5JKb3SJ7qjr7XEhdSBRGFKuEHiw3n3lmnSsPq0bkB+C
	ii9KXPMcFE15Zv580JpkQ64/p8iP4ssUiNBdXQ9RIFQd9lLxO0iiNH5OCyrdf0JWoWzz3zr+XYw
	njpnf5IATtK7rkSLWdGeeYXJlb3WVEUL4PKhNa7zcF2qMcTycKPfBA4uXN6HXJMtbSw91iDwVXL
	znqNBKNnYeUV05FWiysyW84/wYxrcgGXgp6Wsmna20
X-Received: by 2002:a05:6a20:7346:b0:3a2:ed4a:5d81 with SMTP id adf61e73a8af0-3aa8beb402fmr14748891637.11.1778435493768;
        Sun, 10 May 2026 10:51:33 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d008:80b:a00:27ff:feb6:42dd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839683a6252sm17964762b3a.59.2026.05.10.10.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 10:51:33 -0700 (PDT)
From: Pramod Maurya <pramod.nexgen@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	nikolayof23@gmail.com,
	Pramod Maurya <pramod.nexgen@gmail.com>
Subject: [PATCH v2 0/2] staging: rtl8723bs: Clean up coding style in include headers
Date: Sun, 10 May 2026 13:51:01 -0400
Message-ID: <20260510175103.562518-1-pramod.nexgen@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes two separate checkpatch.pl warnings in the rtl8723bs
include headers, split into one patch per logical change:

1. Remove superfluous consecutive blank lines from six header files.
2. Remove the redundant extern keyword from function prototype
   declarations in cmd_osdep.h and fix extra whitespace in struct
   parameter types.

v2: Split into one patch per logical change as requested by Nikolay
    Kulikov. Added cover letter. Previous combined patch was sent as
    "[PATCH 2/2] staging: rtl8723bs: Fix coding style in include headers".

Pramod Maurya (2):
  staging: rtl8723bs: Remove multiple blank lines in include headers
  staging: rtl8723bs: Remove extern from function prototypes in
    cmd_osdep.h

 drivers/staging/rtl8723bs/include/cmd_osdep.h      | 9 ++++-----
 drivers/staging/rtl8723bs/include/rtl8192c_recv.h  | 1 -
 drivers/staging/rtl8723bs/include/rtl8723b_dm.h    | 1 -
 drivers/staging/rtl8723bs/include/rtw_ioctl_set.h  | 1 -
 drivers/staging/rtl8723bs/include/rtw_wifi_regd.h  | 1 -
 drivers/staging/rtl8723bs/include/sdio_ops_linux.h | 1 -
 6 files changed, 4 insertions(+), 10 deletions(-)

-- 
2.52.0

