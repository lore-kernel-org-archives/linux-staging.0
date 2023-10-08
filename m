Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CA8FBF5
	for <linux-staging@lists.linux.dev>; Sun,  8 Oct 2023 19:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g9z9/IYY"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6934202b8bdso3166641b3a.1
        for <linux-staging@lists.linux.dev>; Sun, 08 Oct 2023 12:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696791726; x=1697396526; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w1+Qsyy+bFdp5dmNBCr+fP+a+JH1BEYENvEHb1RnYwk=;
        b=g9z9/IYYmgVZOfIssk0b1zTLQyPnB2K16w/OTKXZi7gW0xfMn/eHvmNbLnjr0zFHbM
         Iuk4vld4GsIkBO0x3eYpEUC+V8p5fTmi08ATFvS2EVPRTqYVpiIUTrOn+qn0dqbHRSvA
         huuUZBkzsr9N/kyE/x6kAdbespBnZaO98T0msOqUoOf8lQDX/LjNVKalpYJuXmcMN1Wt
         S/QQliDMjEaPOnCAaFtTjVskEp+G3RPIUFi858mMhcN08lTWoBv0CPahRhoA3ZHv/6Me
         EFEWQ14P9/jN1stheVntxJXAxMcVn0axsHT9nCE0vH9CSsrKyak8UtZ4DuqQ5vYPbs9q
         DIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696791726; x=1697396526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w1+Qsyy+bFdp5dmNBCr+fP+a+JH1BEYENvEHb1RnYwk=;
        b=B6Ys8TZ5Yxvz9rTm5FZM4pSiyg6CpWQ24ncU8QhWhduidiNAqk3W1RX+ZBAmrk+TfW
         rO/4j6k42YG/h033K4OqAP4AQ4hBdoEgSqGZ2DuH/TI6jhAL/qKSFasx60PcJCxbGjvc
         mjwa/6P4Dbo36Nkzp+zZAwzAFCTQSslZ9Q97yGskEQSJh+0eb87Con4TFMMWqfDlK56e
         g1QpVflahGuUryjmZwtFxIqpkAZNIBhqjEd0hteaE02uDwTCkAfPfuO0mLHVzWtQf9j9
         QlY09rDwbaII21/JJCpXnpki9c88W9KrooCQy8YLKcPZVuIncsivsdOjSAkfiQq+0h07
         zErg==
X-Gm-Message-State: AOJu0YzrAQuyvXOJBWnHBPkIIbVjZ3vGjwwdSI8jDDG2eKzTZNUT0RX9
	qEvSYvrTl2TLYo7zGQ3jTUo=
X-Google-Smtp-Source: AGHT+IEPuPtqQ5zNPmhUWxQ27zPqwWH7rYWq0GjGIWqAwGdboE2LIkOqDipI4eMn/0YhBFMdQJRmDQ==
X-Received: by 2002:a05:6a00:391d:b0:68e:4303:edb8 with SMTP id fh29-20020a056a00391d00b0068e4303edb8mr15323342pfb.30.1696791726338;
        Sun, 08 Oct 2023 12:02:06 -0700 (PDT)
Received: from ubuntu.. ([223.178.246.252])
        by smtp.gmail.com with ESMTPSA id g12-20020a63be4c000000b00577e62e13c5sm6018165pgo.32.2023.10.08.12.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Oct 2023 12:02:05 -0700 (PDT)
From: Pavan Bobba <opensource206@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH v5 0/3] Type encoding info dropped from arrary name "abyBBVGA" and variable names "byBBVGACurrent", "byBBVGANew"
Date: Mon,  9 Oct 2023 00:31:47 +0530
Message-Id: <cover.1696791459.git.opensource206@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset series consist of fixes to issues found by checkpatch

Pavan Bobba (3):
  staging: vt6655: Type encoding info dropped from array name "abyBBVGA"
  staging: vt6655: Type encoding info dropped from variable name
    "byBBVGACurrent"
  staging: vt6655: Type encoding info dropped from variable name
    "byBBVGANew"

 drivers/staging/vt6655/baseband.c    | 40 ++++++++++++++--------------
 drivers/staging/vt6655/channel.c     |  6 ++---
 drivers/staging/vt6655/device.h      |  6 ++---
 drivers/staging/vt6655/device_main.c | 24 ++++++++---------
 4 files changed, 38 insertions(+), 38 deletions(-)

-- 
2.34.1

