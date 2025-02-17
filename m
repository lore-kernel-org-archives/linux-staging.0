Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6358422E3E2
	for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 19:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739821861; cv=none; b=nntx/GX2ZS3aYsFivxGu/12vEJSukykVYdpH4vLgRHz/OEkofzZKweSVkoHSOEnkxujUrd1VNGj1gblJpRgy7tRmJaVUS96BqaiO2bq3988b9exvbX8T3DoDWyFjOZ85diQG8qF7/wTJZJM6sxCzXZpkgnA4DqDFzJExh1d5mno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739821861; c=relaxed/simple;
	bh=8djotlyOow3U6WpdapdKdiyo3bMweGbclUeA8Uvft7E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TcvxARcT4vrgPazNQxwhn3vffJ6eNyeMwJudqEOGejgmW883Kv+ZfIQXpeOlUe8X2rIfXs2IwN5D+7k6QLqrZk7uBcVi5skZoPIVyGcNYhS4La8/xXrI4YtAUYm6duIfBCbJaEWZuNg6TTMLCpwmHsxhlwTSrE0jhaqYOqu8ShQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QysNjOKu; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QysNjOKu"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2211cd4463cso30040615ad.2
        for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 11:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739821860; x=1740426660; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1MqTA0vRxn2Uf7ysEV4axwxSXNlJYZ63FyMvrvWVGdU=;
        b=QysNjOKutPFvIkAfqOrjQ/bRKnD5OpaN9RvlodVoqLnnrWuBywUfLpP1uIEfghEVjT
         YtmkoTwCkY3YB8Xp315uasWOVMptrQOvc3PJr/I5F/bJOMUxSl2QeMpgiSNRu62OvIgh
         rkoh77/GqWgE3MboXfisHTFY6Mt4pqDgi7v9WnzGujAQ1ElghSZ7PKzHz56zM3BvtSZo
         gZ+ZNNXOTxX8KVyUmI9UKO5WQGXXQUVLQR6NYs6/bEl23DVcJnhZ4Tjv3VpdaEe5ptOI
         x1fwmjPQVxsINRUNEAvCVrph6veItLzBvjBrSUgYmIAZWLN+GUQJd0HxQAXk7nzrFuwc
         hndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739821860; x=1740426660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1MqTA0vRxn2Uf7ysEV4axwxSXNlJYZ63FyMvrvWVGdU=;
        b=K3bkA925VchTOH0mDUaUKk6pv4mLl6VLYVCjb2gorhVpE+VQ/1hT2tJRwx1b3L0OhG
         YbJLvCHHwz7NPD5Bj5Y7N9acOVHeIhmBEbzaPFzzgR5SVdjSOyR9SdP1ue3yfb8XUMd/
         zh1k2ZciJLvyLIiAr6Jo+8KKN6IKxc/hxijOsRzVpWrqYQgOhCgoroyh0I0It7mE6Dpn
         MkPKb+UjO0VQbzi72t4zy1uWpHZVOrxbytHR4Cx7sdiwcVQR2vmkGj063CRgEay+sT/r
         G/ADFEfIb6L3zx6qyUohTR+06rMIlJcGOyte7+74RnW2pKNOiTjED8dqbfblEnIAze5M
         mLIQ==
X-Forwarded-Encrypted: i=1; AJvYcCU32cZbLJA07AvESexrxAG+BNOz4RBCEf9Fa/pV/9/FE3UPr+1jVupS6XAFuQrOWAxcAtt+Zs/6+0DfODg/@lists.linux.dev
X-Gm-Message-State: AOJu0YyeqMEc/Vf5461HSRaA7a2ptjHLjQTNBcC16pqwVBxGLTn+R0l6
	DR9s7Ui0xsjsGOac6VnL7n6wVxfWuPr/acR8CT32Y9LgG29J1+jQ
X-Gm-Gg: ASbGnctkAt+LfWpw33qsPnT4Iaqd9u1XMnvYX0v8JDbWTOsrbs7clwO8qCNexpgTNMm
	sF2gQu+cmVdVzCju8ScfsA3vwmgTA+hKiIJrl9UPxnr+8MaQJsUsnBZHyhloIVMXalbZNo+i+eX
	I4quSSCAAPEiATUfXJ8wZLfRkhKxPvznaPiWh1Pyvckr/RX2UMMoBMEUbjP9Gr64MSHhWypWDam
	PmmWiuyML2FA6QFgM8rpaSrxcMLszCTcP4+hpURomUS0Lb2ZzgM4cwtYf3ByUP9u+rXBWZDWkgz
	OQGDdOyEZPCCXdTHIwRI
X-Google-Smtp-Source: AGHT+IFQqlyGGnwP1AKUpdQjn6VhX+4WnkPIk9II4OV70FotBJjNMX3/QzGFqNNsrzKLYgtOZkRjGg==
X-Received: by 2002:a17:902:e890:b0:21f:6885:2b0b with SMTP id d9443c01a7336-221040697ecmr172506445ad.26.1739821859667;
        Mon, 17 Feb 2025 11:50:59 -0800 (PST)
Received: from localhost ([2409:4066:d04:319e:1d76:db25:b6bf:4f52])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-adb5aa216f2sm7856362a12.69.2025.02.17.11.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 11:50:59 -0800 (PST)
From: Ravi Kumar kairi <kumarkairiravi@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	kuba@kernel.org,
	dan.carpenter@linaro.org,
	rmk+kernel@armlinux.org.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ravi Kumar Kairi <kumarkairiravi@gmail.com>
Subject: [PATCH v5 0/3] staging:gpib: typo fix and cleam up
Date: Tue, 18 Feb 2025 01:20:47 +0530
Message-ID: <20250217195050.117167-1-kumarkairiravi@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ravi Kumar Kairi <kumarkairiravi@gmail.com>

minor typo fix and cleanup

Ravi Kumar Kairi (3):
  staging:gpib:agilent_82350b.c: fixed a typo
  staging:gpib:agilent_82350b.c: cleaned commented out code
  staging:gpib:agilent_82350b.c: removed braces from a single if
    statement

 .../gpib/agilent_82350b/agilent_82350b.c      | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

-- 
2.48.1

