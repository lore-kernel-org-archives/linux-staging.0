Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCD12376D
	for <linux-staging@lists.linux.dev>; Mon, 13 Nov 2023 19:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="kcGNZLQB"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1cc3216b2a1so36333645ad.2
        for <linux-staging@lists.linux.dev>; Mon, 13 Nov 2023 11:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1699905168; x=1700509968; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zbxZc5kYpfeHxdLaFG3HUwJ3WjytSiN17Zx0BgO6L0s=;
        b=kcGNZLQBF3Op5kQEV+0GcbVEhea4GzLoDjV/Z0RQaUQKhBW6jOsH6bJ9SnY4aIuUVV
         meupucEXgR2h4LzKUkkgr3viLRMgz9bG7KJjNkhrkdbhWWNsNARxUmjSa+mxBIjW7Koe
         i24IyqBBzOMLd5P2/8rgFPQbMjLGlvTUSNAv9Ar2r7ky3w/VZ7gAwaB240K/AFHR8Hxj
         ve+UVwCftu4kGCu+uoIEzehh/T6O7hQh+M03+vUBL5TJ1kzWY6n67pGEcmYpxyTU5pl+
         jCyHLyjkYmlnDN8E+VJD4inFCoxcR/qj8VEuuaWvWqFUx8L7BkHVCj6PXqLEkmMaUtth
         MasQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699905168; x=1700509968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zbxZc5kYpfeHxdLaFG3HUwJ3WjytSiN17Zx0BgO6L0s=;
        b=oTZk20xu/QvGW3vEBPftvsjrCSkT2D3IX2tqAHBqFpqDtS6hCEneeH+Jw1iGfZlxxJ
         +wbDZdYZY/XsAHf4hY2M9l1z0l+Mj/dz1F2EL/95PuNASFberqA6IpPPT3DmZm2/PV2n
         aEsCZZgau2LRVkS4kRoB6oYyrjxcsMvSGUXm9tzFTQ86yxFo+i8UcQqnfp5NP32wBCIY
         jTn88n8wm6n67GLoRE7tGKJGNlA9RdD27Da46VCeIyu04VDrU3g/Gcqoax6sOE8JCXDv
         c3m5rXnR7xQZFohCYakovKu93M3g8m9l0Qw7INqe0QefTeUaS24mNjHImV4WKQuhhoW4
         RUyw==
X-Gm-Message-State: AOJu0YxL+Bi3tSdN/uZVSdqUpUGPkxCEf94uyYo3y1catYkD9AOsZqKS
	388klmvBHN9qkUS1Bl9wINKGxg==
X-Google-Smtp-Source: AGHT+IGCV8s8p/yUxlbuLeV9km4Uj92Et8ZxUvFow97ZuMSoyQWE/b199TP6+j2Br1MX/rceG9X/5w==
X-Received: by 2002:a17:902:7241:b0:1cc:33f1:3f03 with SMTP id c1-20020a170902724100b001cc33f13f03mr246535pll.2.1699905168244;
        Mon, 13 Nov 2023 11:52:48 -0800 (PST)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id t7-20020a170902bc4700b001c9d968563csm4395815plz.79.2023.11.13.11.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 11:52:47 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 0/7] Staging: rtl8192e: Rename bool variables
Date: Mon, 13 Nov 2023 11:59:03 -0800
Message-ID: <20231113195910.8423-1-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series renames bool variables to fix checkpatch warnings
Thank you in advance to reviewers
regards,
~Tree

Tree Davies (7):
  Staging: rtl8192e: Rename variable bSendDELBA
  Staging: rtl8192e: Rename variable bCurrentAMPDUEnable
  Staging: rtl8192e: Rename variable bAddBaReqInProgress
  Staging: rtl8192e: Rename variable bAddBaReqDelayed
  Staging: rtl8192e: Rename variable bUsingBa
  Staging: rtl8192e: Rename variable bOverwritePending
  Staging: rtl8192e: Rename variable bDisable_AddBa

 drivers/staging/rtl8192e/rtl819x_BAProc.c | 40 +++++++++++------------
 drivers/staging/rtl8192e/rtl819x_HT.h     |  2 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c |  6 ++--
 drivers/staging/rtl8192e/rtl819x_TS.h     |  8 ++---
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 14 ++++----
 drivers/staging/rtl8192e/rtllib.h         |  2 +-
 drivers/staging/rtl8192e/rtllib_tx.c      |  8 ++---
 7 files changed, 40 insertions(+), 40 deletions(-)

-- 
2.39.2

