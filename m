Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8B23B3898
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 09:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776157995; cv=none; b=fzYhKeivZaG9bqXeXHELCckCD0mODW/fkagWZtGjJa0E0tPBKZIypSoukAlplPNVoxe6AtFG3W2eE+97W8eEIjPyu/ecc2TsbO1lwM7zqA9DnQOc7bLqbKZ68PtRnrSZCmWDfa0DTQiCyddZjL4D57X8xodm0EznuhQmw7aPozU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776157995; c=relaxed/simple;
	bh=eP4D4GNwsawcxEXw684svxH/w2GIYqCO5lilHeOr4zg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BxNmaiGFOXFpdOH+9yaFRREk/4EryWqTXaLMC6qiP1O1YSXlyn7W/2yVM88WcnVgtEM5+aZsGBlSDGkV8JdhSMmG+Mfb8pgbDxipxsS9cxcyoGjLUP7BttsgSfI7KgfdPpynufygy9nKY7JefTLE5Mujz8OJOUeBJfg1BgdJNJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHl5esMX; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHl5esMX"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b9c9d03524cso659455066b.3
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 02:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776157992; x=1776762792; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cALGFqNRXLm6IfVizKgr8efbiRqkV2I059rgEgWBcao=;
        b=VHl5esMXZOGyWLCd9fEM0kfDp0j/kI9CdmhKVMomjHlgoMQdpusIptgWbrEFdBx5mh
         pgdKrPmdcohCHZucSBgEvcdYN4sDcK3TqG1bXK5sP+SV6UhpUAc3A+fBj0e502OPG5+f
         Dkjl0Wsbz3qfZ9xYouy9HycS7B39YT2JGwEQHG3ivXQszu9PHSQmi9cEa1nDpqqHLZEB
         ignwMbbbvGx6QrItS33+g+3/0NLOM36UOraeVHFCTaip8XtUCT0ktXLjBSEf1sXxwB7J
         k9llmddcox3Vlg96GHcrMrrEmJuEYFV9OZvwGkuCm8jJgxq79j6bo1Agj8RCPQmmNvD+
         Ws4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776157992; x=1776762792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cALGFqNRXLm6IfVizKgr8efbiRqkV2I059rgEgWBcao=;
        b=Y1lqdWMgpk6U3emDjr4CwC7gnn6EW2Cl8b5PUftTlh4JVZ/tV/r83G5ZyamzdFX1xP
         LJRL/LOZxdDhjmwo2oPAZGilKK0g04dgpNo2a8jyrgkzh/A5sPJG03r/SE9pfIg3Hyet
         hTo+I97seZtIqy9Z5o20GtctpEeGYNZAOIfcpfD2mr/xFimuU2H9Z6cZgxUtyEEVWRPC
         8HehoS53Kqe7XslpbUl15Vt4aE4cwokZqKlsNza8in5dppKysjsnOvif/jSV50FNo3dx
         NTiNPU3+by44c1CyPpeHkTjnESM5mHuWnnAu5EZ5843xPaQnESwHr1SMyHXhX/fNC3Db
         3Jxg==
X-Forwarded-Encrypted: i=1; AFNElJ9hwfljB7nWc4f7w6NR+3N4JAGZCjNOxzW//s3KkhfTdJd/Pc9jFwql6B7KXYKKtrNVRXoTO/MzpeucCknO@lists.linux.dev
X-Gm-Message-State: AOJu0YxnkGQhaixT0uXfk7/ZfdJ+jdShw0T176ewy+f42TnWlJMmqwkv
	L7ucMylyFqw/Ao862+5pjO60+ZKrZ7Y0AAzwDI5QapiKdxf2FGYikeiD
X-Gm-Gg: AeBDieucmo37rwDAnmXLS5u/fYtROcA+FqRbO8H6iGq6CAuZXL3hm98IkkslVMph9nX
	sw7/219l+U9izk3vO4iNg1hzChr8euEuJrNdMPz5YiEYoCCt7LjMemVOTlBGANnV0pAacSW+CfC
	IZsPOC6OqQvyuTxAq/cj0Fe9T9eN3WXbl3JHIDweRGRBJv8XaSVBr9ZQzkckGYa8mOi+SI8goR3
	DAD7dEal35j9XjQJFHrXLdEHTRbEmrdJXdISFgHLJgLdjQ2k2Z2f6qNH1/xC9leRJMpRXwmvGWn
	DqHwkFv4nox7qERKmMT2tXkZ1FXf7mo8Aua/JL91ju/FxOyPywqDTOhr8i8YNKSErBc3WskozQV
	RaFXjlISEoqWn/oado1MiG+Eh+c2b2oCiefbPGfIF1tpCAofJPEUBXCwHbbx4x0YKZzUoWCN6VP
	8/kxPpgzURpA5Ob2p/dhWW97SkminSaPWIKYN6dYRngZ/3L3ABTk7/8PvN5m9dJll8sjDx/IBd2
	UOabrzS3/+bA9RK2Hc2VjQyHvQx2MKMsyDAc1w68FNlxZx5IGbmmQKy8o4WC5BwGUTmVQh47c9z
	BM9eWmmTVtnxc4ZdifvDIZcvnyz0hrhgiIdWvSJW5ZBrIIMvEzS5kR9mBNAgiDgJ0hcbfNlldK1
	5L5kmRnejcFqYKYPOupQv6sI7R3apMIJiRRy0edIiflY7xQW0TXddlDt7l41o7LZHOAAkaEjnGf
	Ov3FrQEPI=
X-Received: by 2002:a17:906:518a:10b0:b9c:7c84:c443 with SMTP id a640c23a62f3a-b9d72793370mr711253166b.17.1776157991936;
        Tue, 14 Apr 2026 02:13:11 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-b.c.od237066db22328bb-tp.internal (63.152.141.34.bc.googleusercontent.com. [34.141.152.63])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c8a44sm384466866b.52.2026.04.14.02.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 02:13:11 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH 0/3] iio: frequency: ad9834: driver cleanup
Date: Tue, 14 Apr 2026 09:12:47 +0000
Message-ID: <20260414091250.1295-1-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series deals with cleaning up includes, changing sprintf()
to sysfs_emit() for better writing to userspace and adding mutexes
when reading st->control to prevent data races.

Joshua Crofts (3):
  iio: frequency: ad9834: clean up includes
  iio: frequency: ad9834: change sprintf() to sysfs_emit()
  iio: frequency: ad9834: add mutex_lock() when reading st->control

 drivers/staging/iio/frequency/ad9834.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

-- 
2.47.3

