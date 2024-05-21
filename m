Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC93182DB
	for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 03:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716260543; cv=none; b=hk7oaedbt5lrQHgZYLFeXW+kX8I1pud2BEnR9zapf4vHwiYrEM3BiWynR/Jaf4e7feMRQT79iYRFFMf++yneafVPFWWTNwNa+YCXuswJ0vIjnFvLmGIloVNWwovVvYykNv/tD8bpjVFWGe/dfYZFFGHcLrAv3sZB96ByDYncwE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716260543; c=relaxed/simple;
	bh=rmQ4T+nGAvY9sCmAPKBpE2xvlymeLhT8/MbFVAM0HMI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=f3o5u8SlFpdpjsHuFS04O2d1BS5JBmB/NCea5RU9wuzeneopxlMHK/8pP65h83XY2OJ/hR2SFfvjhOj7ZWofHzBJcLK3ztWeS8OlcTqK1M3/uUkMiBN0l84a61VeoScJHrzqqA9CRLVorb6NsjeeFqU0O3xFy3DC9kfmjxRYgrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=h3jog42Z; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="h3jog42Z"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1f05b669b6cso92695775ad.3
        for <linux-staging@lists.linux.dev>; Mon, 20 May 2024 20:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1716260540; x=1716865340; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FTRE2aAD7nMAx0mWWNU5WX8ozRRvU4vGs8kuCzV19R0=;
        b=h3jog42ZyFHIrr67MP56G2cwD6GJqNcy9aXU1jplAVaAm0LgwtWOVLM9O+wF3FGYlv
         bYN9SoBQnmvhRdNgsYX3xvxP8F7LE79lCbK/isDZtz2disk470hpVIqJ4VmS8UeC8hmN
         LFrOnj96tZ8JDzV4m/UAjkrcOTWDHDdWu6AqeHBNZijb1D8Czc1S8ubmFVS7Clm/oBms
         gYz2RpVbgdUU7GgEf7KIjyKW4B4MRWUH5vnBROItmavwrpW4DHsDJsYJkfAN+WEzSEJq
         CHqoC3zKNtKtAOG15bVuhVS66y1vRliw7K0rojHSa4Y7Q8YmEMIMhGbZu06en2OCzP+K
         FpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716260540; x=1716865340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FTRE2aAD7nMAx0mWWNU5WX8ozRRvU4vGs8kuCzV19R0=;
        b=bQU6MUy7vusMTS+epFwrE934hPML9z+mb1wffw67fd9g7oitJVIM7QCxf5MN2jVkMk
         5bnHvPeaWLEbUsKx5RkkOxY38ZUM7raqVuezFEU1Wp53jSXYCWfShSUMuTmZE/SXMr5n
         vG2aU5ZhQbYs3QPPVn3U3g09pCeg3JzmakkJSIYOiPgwdXUB6wzMojDzSPr6Yr841DCE
         fGakPZw8+c8/TlHfm/AcOBN9kxxjtPW3oQPS1VINJA8HB/ggRF+09bUIIg0410fkE21m
         C2WLQmqbnhal6GX3VIFw7EHAhA/0gx0/YXx+KlCQpg7ety9Bh3tOVaGYvzIsn4wi65Yt
         aDFA==
X-Forwarded-Encrypted: i=1; AJvYcCXCTiEF7QL60nTcmsr/RX/mscLhxOl7n3CA5+rUU4ZXTR5KIHzuf4vLgy1CAZVd0HNOvIdZtG4DpAe42kR7mkKuxDbXwRwnSKFetT6N/A==
X-Gm-Message-State: AOJu0YxKrX/vlxvE1HE4hab4jIBzV+Wozm0sHMEFS03eAWSUXih9z9iM
	SLljJARP21sEzLfmw2EbfIZwEtXlmK1oQVup6AWwzv0L8tBMJ9ZkbLTylEkQ/nE=
X-Google-Smtp-Source: AGHT+IHxVX9iKGp3mUZ7MrQHFcpj9+avbawMj0Nyc9UVoPpd9OzQp70+XukMmO0BFRk2ZOf0MntDCQ==
X-Received: by 2002:a05:6a00:18a0:b0:6f4:3c65:d05a with SMTP id d2e1a72fcca58-6f4e0384f7fmr34486334b3a.30.1716260540065;
        Mon, 20 May 2024 20:02:20 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6341134694dsm20213029a12.77.2024.05.20.20.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 20:02:19 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 00/31] [PATCH 00/31] Staging: rtl8192e: rtllib_rx.c Rename camelcase variables
Date: Mon, 20 May 2024 20:01:45 -0700
Message-Id: <20240521030216.16842-1-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v2 of series renaming camelcase variables to meet style
guide requirements. Thank you in advance to reviewers.
~ Tree

Changes:
#16 Renamed plist to list
#17 Renamed npadding_length to pad_len
#19 Deleted ChkLength variable

Tree Davies (31):
  Staging: rtl8192e: Rename variable IsPassiveChannel
  Staging: rtl8192e: Rename variable CountryIeBuf
  Staging: rtl8192e: Rename variable CountryIeLen
  Staging: rtl8192e: Rename variable bWithAironetIE
  Staging: rtl8192e: Rename variable bContainHTC
  Staging: rtl8192e: Rename variable MBssid
  Staging: rtl8192e: Rename variable MBssidMask
  Staging: rtl8192e: Rename variable elementID
  Staging: rtl8192e: Rename variable rtllib_rx_Monitor
  Staging: rtl8192e: Rename variable rtllib_rx_InfraAdhoc
  Staging: rtl8192e: Rename variable IsLegacyDataFrame
  Staging: rtl8192e: Rename variable RxReorderIndicatePacket
  Staging: rtl8192e: Rename variable RfdArray
  Staging: rtl8192e: Rename variable Decrypted
  Staging: rtl8192e: Rename variable AddReorderEntry
  Staging: rtl8192e: Rename variable pList
  Staging: rtl8192e: Rename variable nPadding_Length
  Staging: rtl8192e: Rename variable LLCOffset
  Staging: rtl8192e: Remove variable ChkLength
  Staging: rtl8192e: Rename variable WinEnd
  Staging: rtl8192e: Rename variable WinSize
  Staging: rtl8192e: Rename variable IsDataFrame
  Staging: rtl8192e: Rename variable bMatchWinStart
  Staging: rtl8192e: Rename variable bMBssidValid
  Staging: rtl8192e: Rename variable bWithCcxVerNum
  Staging: rtl8192e: Rename variable Frame_QoSTID
  Staging: rtl8192e: Rename variable CcxRmState
  Staging: rtl8192e: Rename variable IsQoSDataFrame
  Staging: rtl8192e: Rename variable RfdCnt
  Staging: rtl8192e: Rename variable prxbIndicateArray
  Staging: rtl8192e: Rename variable bPktInBuf

 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |   2 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c     |   2 +-
 drivers/staging/rtl8192e/rtl819x_TSProc.c     |   8 +-
 drivers/staging/rtl8192e/rtllib.h             |  36 ++--
 drivers/staging/rtl8192e/rtllib_rx.c          | 183 +++++++++---------
 drivers/staging/rtl8192e/rtllib_tx.c          |   4 +-
 6 files changed, 116 insertions(+), 119 deletions(-)

-- 
2.30.2

