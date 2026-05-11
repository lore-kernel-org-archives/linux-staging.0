Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3B925FA05
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 06:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778482016; cv=none; b=MmYbToXrv5fL7C4FuCPZKrItbwEnH2FynWiz7banNgyD7A11hFeLUZmJC1b9ttEZ01YWtDXxQyvdNK9vh6ydLCrebsyq5sMqo9epi7n1DGnRdDv0J9vqn0s5F4fTQSQgm0kZIgK47PF6FjveChZqKv3wFRsW+gtPlI2yHwNycho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778482016; c=relaxed/simple;
	bh=HNd4KcweqOerQ3yNSjA7mvwp9lyg8yR2Hb/yl9GmhR8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IG2ZZu+42z5aHkx6SvBEG6MmiO3UTpH1XNEcuQI0HPNBFdCyLkSrwXL6cQL3UtQFOm5p+rKU9hRKaeL7QBQjrG7gHG6q8V0I9M4K190/x5gKDDMOY31W2uEbPggX/XrCzmCZ6vCCsuDxq8YxAntRzhYncBSzgRXSQyUxO/GTM+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aasHWMQH; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aasHWMQH"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c8025aecc40so1753300a12.0
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 23:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778482015; x=1779086815; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oCn2UQF341QKAGr5qaUtJj0Uc0HOfufLBQXtrbecHtQ=;
        b=aasHWMQHFNP3/i7c3TJ27dClOLYJczt6OtbxmRxHPMp4z8n9312FBq16Vs+M4MsJ5Q
         wrRwS08WALZgEpBHMrUF6twiD5ZNH5368Ngn8CgoBSulS5pO1sS/xW7/Bcj5SvZQFV9w
         HZkALdd+sLy2/WtM4boi5ai9eAf7wSle79r2SRXVUNpk5sFfjiiHSpyG9EZLhgdvn7uc
         m2Mg+gBIlCCnErnNzTlLY/bRed49mWIxnQMMcsgCzopByj0NEISfm+QpFztV4edt+fDj
         1k9wKE3QB8wyw7GjVpsp9K9yma/A8w7shdvTDhC18JhKkKXvMTNIREm8vKTvnwbn0/NU
         rSzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778482015; x=1779086815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCn2UQF341QKAGr5qaUtJj0Uc0HOfufLBQXtrbecHtQ=;
        b=hBBjQw080NgDQJut+6fXLGaW1d/Zp7XrOXeTwo6iA5lGMehtKm4rAFqIbjeYu86na+
         bPj9txHjci/lLFOW1QcmAV1N26CZ5BtPi8uHH/5bkbLsKm0mmkgK6CAcqQwu29c8EC02
         aJemxRGSTc7A6u8vVsaAyayO5MoBQTH6ujZyz1mcT6yCZyNwMrmQ2hmT4xeCXgaBWkmZ
         CBzZZkhv3FcDbcACc/CVS6PHiyjCIpG2oNvO/XL5QjJNs4V9/K5V7M8SQD98M4Psi0ET
         bnp+0Zq2HRe4+HNwNp1owDRyZYYI8cULcqMzK/sdBpu/AI3rMe2jCMlP5nW40M2Hrf16
         bQOg==
X-Forwarded-Encrypted: i=1; AFNElJ8v5iXVK10hzgC10zD969tpL/I/ZQnnNauMdkhk5KOpByDdp4bU7uP720MiYZgspgHqKnA73n4PK2OsNedj@lists.linux.dev
X-Gm-Message-State: AOJu0YyvSEFxV75Jo2NHrrP8GFVMOuQXlEk9sLlU78MzyXvXOLHGRNYM
	BFz25dQASOaHpjCDx7HY7HdmvZ4q7tToHXzg1SHT5o4G6T2iNL9glEg+
X-Gm-Gg: Acq92OH/CHeV5TH0WJmLbHcxsbRx3USYMSmK9+cBbCX4MsNErAMhRoaPzHn1YiDphrP
	YqV+i+2SKVxWH96EdnH/gXyVEVYL1eQyAk0w3BuJS0r29cZQsCkLd4YbTDLz9kDRQJT9SePUvXH
	37rL559bh4Aultc82ZjDnk38GJ5gCatOfEUMTm+tqH5nFJd/7X72zLv7cmxXoh3AMoEuMMcMA2m
	N+YFlZTMkaISNXsT78lZW3KZLnsPIbX9m6Pt4PPrc9mbc+9OiFQfHn5+cQj7tBTAuSyH1C0bqH4
	r9JJt+AMUV8rihnaaDDg9AqMOOpcoqF2p1bNPp/bByfjy+im6oIyR1lDK3ieWAIH9WPIAI5Jo7W
	jT+m4SeRnxbypwgtlqPhkg/RC7JJtt9NYFPcHHi4hsfZadCMGQlkzl50C3ND6IH/Qc0KVgarqsV
	jYpG+HXjaBwWubqm5VGrE9FOlwICMZW5VZiK3rKmz0
X-Received: by 2002:a17:903:2282:b0:2b0:4fb3:c771 with SMTP id d9443c01a7336-2babc858ca6mr155258745ad.6.1778482014989;
        Sun, 10 May 2026 23:46:54 -0700 (PDT)
Received: from MAHADEV.localdomain ([103.211.132.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bc83101ee1sm56485835ad.79.2026.05.10.23.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 23:46:54 -0700 (PDT)
From: Hanu-man12 <shawharshit116@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Hanu-man12 <shawharshit116@gmail.com>
Subject: [PATCH] staging: vme_user: fix line exceeding 80 characters in vme_user.c
Date: Mon, 11 May 2026 06:45:48 +0000
Message-ID: <20260511064548.1247-2-shawharshit116@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Hanu-man12 <shawharshit116@gmail.com>
---
 drivers/staging/vme_user/vme_user.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vme_user/vme_user.c b/drivers/staging/vme_user/vme_user.c
index 11e25c2f6b0a..f5e29933ba68 100644
--- a/drivers/staging/vme_user/vme_user.c
+++ b/drivers/staging/vme_user/vme_user.c
@@ -446,8 +446,9 @@ static void vme_user_vm_close(struct vm_area_struct *vma)
 	kfree(vma_priv);
 }
 
-static int vme_user_vm_mapped(unsigned long start, unsigned long end, pgoff_t pgoff,
-			      const struct file *file, void **vm_private_data)
+static int vme_user_vm_mapped(unsigned long start, unsigned long end,
+			      pgoff_t pgoff, const struct file *file,
+			      void **vm_private_data)
 {
 	const unsigned int minor = iminor(file_inode(file));
 	struct vme_user_vma_priv *vma_priv;
-- 
2.53.0

