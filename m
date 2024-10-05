Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090673A1B6
	for <linux-staging@lists.linux.dev>; Sat,  5 Oct 2024 20:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728160490; cv=none; b=LxFizUKHGEE/IlghHQwwPA3klo7QOAGHKD9E/yXBo7RYUYjtu4q1QvYLYCqo3QVdEBfkBOASiKjmQ9yYfOZkI/6pUTDo57FjIu6mt7cD7WPoVj8Mf/jRMeApbhfTYRFZYuMgT7e+ihEH34a08FSQI9swYKFfwOxE8tqBcJwn+0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728160490; c=relaxed/simple;
	bh=WPSFRzpQmXyTM3z6ZSuzbrHr4kiT7ZJ23YAnn18iKN8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NRW9oEo9kIYvW151jF5wDLooBvxBUCOJ532MdwDr8TuyrUV9g0ZigDpnVZ9NCvo/n+3POI6aYicEh59mhwOVV45WUxIVmGeQa+VBCYjob/U2EL7GtTND7R+zrJadgfzS2MfjtP52Ef3/w3237gQ5RdC1xJqSQ34iLabZ3nrBLbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZeriRqLg; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZeriRqLg"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42cbface8d6so41378015e9.3
        for <linux-staging@lists.linux.dev>; Sat, 05 Oct 2024 13:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728160487; x=1728765287; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wFt5tBfdZec46McMVPfu4D/j5Q/aM8HZT4ZihSPJdl4=;
        b=ZeriRqLg/DrLT95SZf/1sY9STjUyT1keR7MVt6d9CBqOmLqeiR0I3oQkqRd8JiG+2o
         xaRN6FaKPIdU+4sVQnuRQW63MyNqRDMNZyc/BBkIjYTcAJWZuaaTTUeAC5uOL2b4YC7A
         h+DLUW1pdcnzkFnHu0f/l8QVz9nPQmL1k01G7YYxncQCq4tCYAanLCb9sMmo+Z1KAYiV
         tbCK08dtTSF3HhFy+o3AobSfR0rkKwIUks0scX0yYyy2ULE4F5mGeOnPFWDIEnyI4do9
         nLn7N5F2rbCidkG4H5+7lWVW1w2bXY8kk2m0btRDB/Sy+AfUKM0RbWirQkLuEtDTEuos
         0yUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728160487; x=1728765287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wFt5tBfdZec46McMVPfu4D/j5Q/aM8HZT4ZihSPJdl4=;
        b=BsZkCf+M0Jj1HeO6aIABNHQEQn0SDZ4BhcpuRoSKV3LvtWxGUZXpZUJUePpmaySAOx
         KoEJcvWhRrH/PMtEiUJCx2Q43yWDrjczdbwUMxcztiT5BM8YPtzL4szC4cN/rzf982FH
         nV7jNaZsezqL1/ATdzLphJpHeG9oFprw1etOCv+D7PrIZUrzhz9X/OK6CBz7xAhPgoku
         eTdk/x95EHhCJEW4LjfAHaZAKezrQ27jw2zi7GZdQ60FsVzjEhcPWtJZc0EE6txETgLf
         po67t+wP4g1UnqimlI5Wr+482Z/cpWT8QKRLBilfgxYX9YbFkiIxsiRCUT5+v2FJJ0f4
         GxQA==
X-Forwarded-Encrypted: i=1; AJvYcCV6+txMUjudc/wlHQ+vv37/IFUtWwOkcOz4TWc30JJr2mEHWtib62JsoLaUUFwA3ku1Tqxpt1VNZimbYR5y@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8DGTxYwce1UbIdGauaydfh8c/uIkk+psx8GzJE7O8AUqQ1Qpt
	HObkNbuUbfd/CFh7CDtAKE+v4rmMNIcp3I5kbaL5aFkEVIxElSHa
X-Google-Smtp-Source: AGHT+IHJocbNMS5V788ycKbIuwDiIww8RvJ5MqZhv9rYA70SB31uX71x8JPNo9xRwpDYAwArbr21Ug==
X-Received: by 2002:a05:600c:3c9c:b0:42c:bae0:f05f with SMTP id 5b1f17b1804b1-42f85aa98ddmr68081755e9.13.1728160487165;
        Sat, 05 Oct 2024 13:34:47 -0700 (PDT)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f85995932sm41824805e9.0.2024.10.05.13.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:34:46 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 00/15] staging: rtl8723bs: Remove function pointers starting with hal_init
Date: Sat,  5 Oct 2024 22:33:43 +0200
Message-ID: <cover.1727966761.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove function pointers and replace them with function names to increase
readability.

Tested with rtl8723bs in ODYS Trendbook Next 14

Philipp Hortmann (15):
  staging: rtl8723bs: Remove function pointer hal_init
  staging: rtl8723bs: Remove function pointer hal_deinit
  staging: rtl8723bs: Remove function pointer free_hal_data
  staging: rtl8723bs: Remove function pointer init_xmit_priv
  staging: rtl8723bs: Remove function pointer free_xmit_priv
  staging: rtl8723bs: Remove function pointer init_recv_priv
  staging: rtl8723bs: Remove function pointer free_recv_priv
  staging: rtl8723bs: Remove function pointer dm_init
  staging: rtl8723bs: Remove function pointer dm_deinit
  staging: rtl8723bs: Remove function pointer read_chip_version
  staging: rtl8723bs: Remove function pointer init_default_value
  staging: rtl8723bs: Remove function pointer intf_chip_configure
  staging: rtl8723bs: Remove function pointer read_adapter_info
  staging: rtl8723bs: Remove function pointer enable_interrupt
  staging: rtl8723bs: Remove function pointer disable_interrupt

 drivers/staging/rtl8723bs/hal/hal_intf.c      | 46 ++++++-------------
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 12 +----
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  | 25 ++--------
 drivers/staging/rtl8723bs/include/hal_intf.h  | 23 ----------
 .../staging/rtl8723bs/include/rtl8723b_recv.h |  5 ++
 .../staging/rtl8723bs/include/rtl8723b_xmit.h |  2 +
 6 files changed, 26 insertions(+), 87 deletions(-)

-- 
2.43.0

