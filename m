Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A84D405F7
	for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 03:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716261444; cv=none; b=TMVdoBC402gXHMGKU+Pj/Lw4roL3Py20IJcdP/f2rgvNq+RlapORfqAf9BTX/N6tXfMHXxOz6pND/UVCgZ39hoNT+C/7gnqjSxu2Bgp3Pe4D35HcM8boV7rqxUo0Mh55/23qmf6JynNqshkyIjkmJq5FhTtOS79DPjWXvuweDTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716261444; c=relaxed/simple;
	bh=rmQ4T+nGAvY9sCmAPKBpE2xvlymeLhT8/MbFVAM0HMI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cDdA2gTIGXJMqiCJLgFgV1eyT7/E/VTBy7oq3MpTBBxa+zCAua8eZZaQqyQY84Saq1gopL0YZeE2H+doYMRXe1drq9EssG8VqZGbkKlWG7Y1IY5C6ab31QDbzlovF5J6MuXCNrROvqWq3n4toOzQW8F5SK+z59UB4eCalEzDmVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=QIKpRpkh; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="QIKpRpkh"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1f0537e39b3so92133905ad.3
        for <linux-staging@lists.linux.dev>; Mon, 20 May 2024 20:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1716261441; x=1716866241; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FTRE2aAD7nMAx0mWWNU5WX8ozRRvU4vGs8kuCzV19R0=;
        b=QIKpRpkho5T02ukwv/HNj5W4AlgX8xumJLSR+lFYjIyl4bMy+5sNVVOA5EWkYfM/V2
         rFeZxZj1/iFNwSPeC1Ho7tATMe9hbrh3NfI0wm0wJmkCOfe+ZM70rUSA0C1lM9BTrgXW
         m1tbRjLUaiVb3ftjQlujMF9NlydZD6y+/tX4odW1+UvyytTv/cSEkmnJigFX0GflviLr
         bLjYv0VlZMlRhh9Q83+VHgEaLOvBdKj3/sgUZajNbJGU6zgAUCWLRPBmtTs0lWaIOCx2
         Ctq96xF1gIY1yJf0s1czkGeLoV+NJThLntmN1zFtwQT3BqF1qJxesaX3huSUKhmppRC8
         TILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716261441; x=1716866241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FTRE2aAD7nMAx0mWWNU5WX8ozRRvU4vGs8kuCzV19R0=;
        b=BMKDJHjkXph8+Dqi2Yva3eqeostdmqmKvwGLVrZU33tI1/tGsLh9IzEQ75pfp8GgYG
         d21VYSKjVsmPlLuq/IXXh0XbjqjpkH/0Va+zQlooBlhJ4ZgyCFazOeenmiSZsG31E4xt
         i4+zm5iVDBmkE59XlHqYxMMHlj1/0VVcepM3EPh7kD7u1LeZf0/9tI6ENN2vQrsovu9/
         YWJRtU0vJOCO1TDycysCFOtBiGJOSJn3Phf6GWCCCY0ruJ4fG2/HCDMgyQoQ2OCFbosN
         D8Vl+no+utSTYn7hPeOTOQOmA1p/QgA6xRxarWkBg/HjzMerxh1rbJgfoVaAR5BQh+g4
         jfgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbMe27Ayg3iGfdk4mSiYVP5IbAXiEHc7RMtKADwTGCscaZSKFZ8W/JWscd0SRnqvQiPwx7cgfAjhYa4il/Eg3dNsts25LVVMUaw0EKuw==
X-Gm-Message-State: AOJu0YySh4fJVCEguHZ1rXLuZ0GxT3XA1jHf/R5hDxjAyyrStwOpzX3f
	bQNvSoJjnXmnhPPyNmW72YA4Hk2HZNPi2G13pVmFmkd5glyM9fmAl4c3q1cpM+I=
X-Google-Smtp-Source: AGHT+IFviQB0DFnx5N0Y7fin5e/l+PBKg41SVlyUvy91vBLvTO11XDubSEkoRXnQvu5lNy7nUz6N5A==
X-Received: by 2002:a17:903:2986:b0:1f2:f0a5:5cf9 with SMTP id d9443c01a7336-1f2f0a561b7mr82883635ad.50.1716261441515;
        Mon, 20 May 2024 20:17:21 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf31a93sm214885415ad.134.2024.05.20.20.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 20:17:21 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 00/31] Staging: rtl8192e: rtllib_rx.c Rename camelcase variables
Date: Mon, 20 May 2024 20:16:47 -0700
Message-Id: <20240521031718.17852-1-tdavies@darkphysics.net>
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

