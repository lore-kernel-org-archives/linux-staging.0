Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCDC20F08D
	for <linux-staging@lists.linux.dev>; Thu, 11 Dec 2025 05:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765430842; cv=none; b=Ij+Jr543jBp2uHS8qAOHTWpyfRm2qpSZDMyZKrQ5fvmgolsnPpOMKjysrq8lP8yr4pdOImTdwYAereo/dPE3JQJpZTMK2eoCoFdiolSfOXLxGmCwxm6ecMYnWfmEwUxsnltmnf5is/3JI5sTbjGBepVqUbZ/Rh3Jsv78Lu5v6hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765430842; c=relaxed/simple;
	bh=Pms9rGKQrV/wWRMG+vyjpUCSrq1fJ3AkYkgjY3zlwIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IQ3W0GyEqgytc9djsJHDo+vuBEW/exdGFuRgPr7wPHwGi3+mGb4NTs+wVEONnJSC5iTzekCFTKtA3jF5Rpiys5JCH/+lcmbwF+vnMR8ee18BLPN9aqD9oun8jPWAdJIFwwds2auc09sp6P2cVQa3T4plDqEGUaMGPtM0wmt7WZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k8OsBznN; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k8OsBznN"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-343f52d15efso629494a91.3
        for <linux-staging@lists.linux.dev>; Wed, 10 Dec 2025 21:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765430839; x=1766035639; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95BH0/uinAOxOXcQXE12PRP1dAEancDYlQp6ik6Xv4U=;
        b=k8OsBznNJ8Kn7LQmNOtKwOXEKtZGM6RldMxliKmzXD8nIxLFaolniAk3D2kNqskdKJ
         /RI9FyKtgafAnpxI1wN/+Qw+TQDKNIOtPR1ByosKvXl8bQG+HMlc4O0dyC/1kljt3Lad
         vW8ms2h6d25Vtc+y4GLUpVec9HhUvyJJEu67QYqnHak+cF2Bw9sG4npaIpC7jf/bEdeB
         W/bdfywjv58OxbJtL5QFzAUz7aUOcwjsi8I67Y1V2un3J7XyPAYooqWIIVJdbto7ZMQm
         2KZ9JQ8xcLCAPDYly+gy9LU/AMLA+HJvKt0pfmbMKkjXyJbc2fBNwyWU3LYSJsgimntd
         Z8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765430839; x=1766035639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=95BH0/uinAOxOXcQXE12PRP1dAEancDYlQp6ik6Xv4U=;
        b=nRmEm/VXxmgFvQBd/1MrpvKBMYZajwkP+7ZhX5L3/YhS3Q9SR0p1woBfmRjMizLZ0o
         Y4v6GysKSjZJySLllO3B7umnEQ3E/8MI8blrw0hgzzSjIXKxpPdkOlOnxOamaIDB0UHi
         poM17IyfPCJkkJAAWBlBgSYvVYrCeO/mki68lyQry7oLQy5NBjUge6ZgP30vN2dhwXCz
         yE0DQS/oWaFMhOl2ATIOutSgTXBOeYr1yQcsLRwweJoKTvNltKiU/QAVRJZTSJ0eMQf0
         QQk+/t97DmamiU+4uKyrmuVaUga6Uv7G3LHcmBPAjfpaQr52UOhOZHiYnePO566kq+k1
         7M+A==
X-Forwarded-Encrypted: i=1; AJvYcCUAn6K/M+WRVju+oJ1pv7fSPS4a6mvg/9CQaFH4GenDlg6BQJfFtVzu4NdZWz99Kg1jhJXDYc9PwzBnTnwO@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1HSSHaZqU+5kvjcl5b07kKDapn7C/sKfq8DnP2f2PZ+Y0rnAs
	9HWCcH/Pz97U5vdgJL/nFAL9+ukeONpxnOecm50jd+/e7/5dSOXI9SVN
X-Gm-Gg: AY/fxX7L/y048KAUKmg9CnXwMUb1RBsAK2dFuZcqd95g4EQ/3T1Gao/NCXO5Io3tf0w
	fI3n2kGxS5lc4oHN0mN9xPp7FN3sppLIkGCStcjjgXeEqAx4IQ9jjBldgGx62GOpefO5evqSrlg
	0DdnRZ4tAI8omKm+/guW6NWSbHjU5BipuRnbIkLIN8g5ndTErS1GmfICrj4YLCQByPnyyzJB+F5
	q0ML3Vq0JDe6kq7viRTmpKK3y01LZY5DrpbUq/rPzyVIUyhbEWZjHTRA/S0+mQplhIYuPoOWL9C
	jFISWSvpNXh0Up0WYmTcyH2MxfCKKSve9qklsTqUyfuyDSj0t1pMyqU62nr8YB9PRDslosQQxYi
	TU6IJIJlVvNFgsGEaKQH0FtAHhaTajTMZw0abVKbyI/O6eoT/s6QPZ9aibxRB51eYHQcdiHirJ0
	M26xj4dJFAp06kZUfIk1c7g4g3Z301
X-Google-Smtp-Source: AGHT+IHpc88r8xX16Lc+KR4vyNGcDKZ1KjuZYVhX4XpZepWfhgWzWN1KEew9mla9BNXmowCCm58hyA==
X-Received: by 2002:a17:90b:2590:b0:343:7714:4ca6 with SMTP id 98e67ed59e1d1-34a72875249mr4523986a91.22.1765430839260;
        Wed, 10 Dec 2025 21:27:19 -0800 (PST)
Received: from SIQOL-WIN-8.localdomain ([49.36.67.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a92733507sm640351a91.10.2025.12.10.21.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 21:27:18 -0800 (PST)
From: Arjun Changla <arjunchangla7@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Arjun Changla <arjunchangla7@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove trailing whitespace
Date: Thu, 11 Dec 2025 05:26:52 +0000
Message-ID: <20251211052652.3589-2-arjunchangla7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211052652.3589-1-arjunchangla7@gmail.com>
References: <20251211052652.3589-1-arjunchangla7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch error by removing trailing whitespace at line 2021.

Signed-off-by: Arjun Changla <arjunchangla7@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 98704179ad35..ff4e668f199c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2018,7 +2018,7 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 	return ielength;
 }
 
-/* Ported from 8185: IsInPreAuthKeyList(). 
+/* Ported from 8185: IsInPreAuthKeyList().
  * (Renamed from SecIsInPreAuthKeyList(), 2006-10-13.)
  * Added by Annie, 2006-05-07.
  *
-- 
2.43.0

