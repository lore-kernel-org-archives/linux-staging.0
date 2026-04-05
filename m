Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37E6296BCB
	for <linux-staging@lists.linux.dev>; Sun,  5 Apr 2026 10:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775384247; cv=none; b=OzbsiELXXkYa1tPmunEY37m8HXsiSPouGsI2r6qiBqufljH+Z5x4zzVmaAS+AnFksLHwjzCGZFZRtjHRT8fjZ2eZ8GnmbSM7OatC9aC3CYhnSsbq+W1xyCmfIBDiDREbZk6O7+YS2b+t5W62qwumNvpSdiigqJyse+2vVPumaqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775384247; c=relaxed/simple;
	bh=AQ+pJFMYbzgXk9iZEWD3QQpsUE1t1TUjc5+4cHZ9DBw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CzDK10Cy1VIdj6RER4lV5a4M57WhBZy8pOOUGC7J8dvnbg/o/YpyLYpVbvrVu0rrffHXgnaxIlbX886+/RdQSBM35IiN5zKrpviRRXHHHoxab4pGh9wYZ7p+cPtBSCcHgnZ5R3+Abzb/FR+LcWvG0RAFZVYVRfiKcXoJ/Ipj03g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vh621U0O; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vh621U0O"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-605a27fa8d5so1515737137.1
        for <linux-staging@lists.linux.dev>; Sun, 05 Apr 2026 03:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775384245; x=1775989045; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aJj4mxR0xJo9+KgEcTyLfLO7BVuCEavMpxT0H8imf/E=;
        b=Vh621U0OWlUq9aTep9gc1GFkJ32Ivl0626yxj6axL9t68eWJ6N26u/xuvXMYhRbx4R
         EBKLTvk0+W6fiYuIUtKBoEC7YuzezYps9iZ8Iy10HL7xb85N0jQqSzf2aDLih879U4Ka
         Kdm/rRT0waaQWeIzrur0uwZhUjDsr4nWJrQlQjgdictD3tKpG4SbfzNyOvHWPuzfbHS0
         l+3E/xMf0wWqDj+Nha2CZQnen4kdBCHns92lBeiw67ecJpUdOHBSUZmPeMh7e7LO0Aia
         FGH8TMOlkgSVF3Lv0NI7gGZhtrYsqYkYous72Kxe84m8VGet4aiP34HhTwN4GLJ/lb+T
         CKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775384245; x=1775989045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aJj4mxR0xJo9+KgEcTyLfLO7BVuCEavMpxT0H8imf/E=;
        b=iQ+TBr5ZzoDy1LLCXT2W32jJOa8d6hYkXHeaPv4A62OsaeB3l4//aTcI6/2MQhDiWB
         WH9WqLZ0c2JYUW64jg9Tigjx/b1Qh3oGyAeo9ucOzH00vskzbRoVR6QRJhpdXaPoN7Sp
         RV9Y7zqHk1Dtu0imUcVU4K75a+4ja7b3ikRQcMeTA01D+GX0GrUxZZ2PtxMdOpwnwAVF
         1gTfZysSCY3/LMy/Sr1AWSytoHjZCUhnt4bB1lg7lrKWqfBXgH0PzaY6EspZwhj0ORrV
         jhdyl83eyTMOjnzUSXnblWsbevYOaiwl3m9hytY7qzh/+aYlkn/ue25ZTPHdKL/ixo/D
         g8zw==
X-Forwarded-Encrypted: i=1; AJvYcCVUNVT5881PKP5YdtU3orNwpdxWkD1zoLeUTQ6MzDWA8IvH9+mjokkmz+IcHFmJaYiDdkNGGf1PKeVUCCzR@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9dah2Xe951QRhCwVKYqGer8i3mjNGxHz/hUzOjUQ3uX42jf0I
	Z7VLrS0ymA42GUuhDX2zTL5nzC0/8Ihm1NfzK4ue3CJN/F2FzATLIULO
X-Gm-Gg: AeBDievd9qYv8sVGQiplUO8Fn5V3YLk1iLhP9L1x8W5KQPvZqDOs01O/5rHD73nnXux
	RVYxZQ4iYfADAL9IvT/LlKDbDpriDeqzo0ZcMr1VOhFKX/f0nfAhzDFdgL6KWBWQtGvG3YkozLu
	aSpeErJRcvsYMjbwhXH4zP2UEoWGV41q9tI3Uin5KBvXdBrx+yZhwoRmN1G4MrVrMi06I3dIl9P
	2hEdIkOCQVGKzpdjOdjZ4WCiTJ05R3AtUxVTBFZiRy3KVVNCxyLG63645vtTGz0FsAFjzigyo0a
	fe9LDoWuUzdFCMEVt6ucDazqyEP40Xt3bAmTGKIf1mgftcCI1kWuRDWUMkRYRwMYR6bwMEsypiT
	qt1a/IwsLoqwa1ZzhMbEyCBYdneR1ErgUI2cXLuxXGa4asxnNS8y50VDE5uSALPnsiPyAztnaTx
	+a2fLTZD6fqsI5lCnaHT2KDOOhM1SkidXr5lqF0GTx
X-Received: by 2002:a05:6102:4b87:b0:605:17b8:16dc with SMTP id ada2fe7eead31-605a5038e40mr3323448137.20.1775384245524;
        Sun, 05 Apr 2026 03:17:25 -0700 (PDT)
Received: from localhost.localdomain ([102.244.98.15])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fb897b8dsm10473385241.7.2026.04.05.03.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 03:17:24 -0700 (PDT)
From: Delene Tchio Romuald <delenetchior1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Ethan Tidmore <ethantidmore06@gmail.com>,
	Sam Daly <sam@samdaly.ie>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Delene Tchio Romuald <delenetchior1@gmail.com>
Subject: [PATCH v3 0/5] staging: rtl8723bs: fix multiple missing bounds checks
Date: Sun,  5 Apr 2026 11:15:43 +0100
Message-ID: <20260405101548.124829-1-delenetchior1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes five missing bounds checks in the rtl8723bs driver
that can be triggered by malformed WiFi frames. Each patch addresses
one function and is independent of the others, but they are sent as
a series since they all modify the same driver.

All patches are based on staging-next, pass checkpatch with no errors
or warnings, and compile cleanly. Found by reviewing the 40 memcpy
calls in rtw_recv.c and tracing buffer pointer manipulation through
the inline helpers in rtw_recv.h. Not tested on hardware.

Changes since v2:
 - Rebased on staging-next
 - Sent as a numbered series instead of individual patches
 - Added proper Cc list from get_maintainer.pl

Delene Tchio Romuald (5):
  staging: rtl8723bs: fix heap buffer overflow in recvframe_defrag()
  staging: rtl8723bs: fix integer underflow in TKIP MIC verification
  staging: rtl8723bs: fix out-of-bounds read in portctrl()
  staging: rtl8723bs: fix out-of-bounds reads in IE parsing functions
  staging: rtl8723bs: fix negative length in WEP decryption

 .../staging/rtl8723bs/core/rtw_ieee80211.c    | 15 +++++--
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 43 ++++++++++++++-----
 drivers/staging/rtl8723bs/core/rtw_security.c |  6 +++
 3 files changed, 50 insertions(+), 14 deletions(-)

-- 
2.43.0

