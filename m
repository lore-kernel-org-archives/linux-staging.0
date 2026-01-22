Received: from cvsmtppost31.nm.naver.com (cvsmtppost31.nm.naver.com [114.111.35.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9833336B07E
	for <linux-staging@lists.linux.dev>; Thu, 22 Jan 2026 04:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769055273; cv=none; b=eLX+Ge2ZQ1iVOtzcU0NPfgX0QK65xsy6hMjdeoYEDAaAaynAAVsi44QdAg709pyR3kZ87A7fc4CdTFn+FJ+YHuYFqPdMWmKA9NIX+wBUp5wnKQq/SlMSZ4HsXJVa3S/iS0+wuYcDkgeRRBSIp4yV8iL3dgRmjacm/Yxf5sNylOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769055273; c=relaxed/simple;
	bh=UuM8SjqHe4qcr6/BH6mKu1g3ju8KDMz/OIa3etV8F5A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=peDAT8csN6a3+nhvxaRTfHaLWpkKJsNaFuvmluzfnacG9gO95VElyP6NnyN/dLpyepF/FCPEzo/TdetBKTV56MmBDnI1NFwGhV+W0x5lsU+PibiFzfoV2qmtjF5x/gbNLOTzT/A8uPlkm17f1r3AFp2lKchA4asd98UeqaPYPpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=Gnb4sDBm; arc=none smtp.client-ip=114.111.35.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="Gnb4sDBm"
Received: from cvsendbo034.nm ([10.112.20.50])
  by cvsmtppost31.nm.naver.com with ESMTP id 6qVo1GyVT1qKnMckX2jb8w
  for <linux-staging@lists.linux.dev>;
  Thu, 22 Jan 2026 04:14:21 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1769055261; bh=UuM8SjqHe4qcr6/BH6mKu1g3ju8KDMz/OIa3etV8F5A=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=Gnb4sDBmXNsDisNy8b/v5P3yNzvOL1AHI9LpPMZmaXHqsDAp/BBFsAKoMg75REjyw
	 P5w/MfEsKR+dsXr7xmzywqekYjbbtXT8xvlpY+djRpJTXY5yFt9zNL6h7pTfyXzCMR
	 t4iT9DcLRMpTXBPVSZ/BqcRuNcUMZ4rO44sP9rbzxx6cj0YhmvQwhz1lFdbbssieN1
	 KFN8i/0DqLQnM8TpAw//DF6awoojQEokgi1z6XI/w5GodHYPpFBqtMAqdmf33+jJ/+
	 PMTxs18MIvOjmv0W7FjCYuxV8gOgzCa8mNnXHeze3m72Nyj0R4llLQ5kR5T8DUTRnG
	 nUEntJpweqaPA==
X-Session-ID: 1RB7MWHDR8C6hXMIK5X3uQ
X-Works-Send-Opt: LdYwjAJYjHmZaAKqKBmmKxbwKqpYkEljxBmwjAg=
X-Works-Smtp-Source: lqbZKAvrFqJZ+HmwFo2Z+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by mvnsmtp01.nm.naver.com with ESMTP id 1RB7MWHDR8C6hXMIK5X3uQ
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Thu, 22 Jan 2026 04:14:21 -0000
From: Minu Jin <s9430939@naver.com>
To: gregkh@linuxfoundation.org
Cc: andriy.shevchenko@linux.intel.com,
	abrahamadekunle50@gmail.com,
	zxcv2569763104@gmail.com,
	milospuric856@gmail.com,
	karanja99erick@gmail.com,
	weibu@redadmin.org,
	dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Minu Jin <s9430939@naver.com>
Subject: [PATCH v5 0/3] staging: rtl8723bs: improve error handling in _rtw_pktfile_read
Date: Thu, 22 Jan 2026 13:14:15 +0900
Message-ID: <20260122041418.2322587-1-s9430939@naver.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series improves the error handling and data integrity of 
_rtw_pktfile_read() by preventing unsafe partial reads and ensuring 
proper error propagation.

Previously, _rtw_pktfile_read() allowed partial reads when requested 
data was insufficient, which could lead to incomplete packet parsing 
and potential errors in callers. This series updates the function to 
only update internal pointers when a full read is successful, and 
updates all callers to handle the new error codes correctly.

I do not have the physical hardware to test this, so I have carefully 
reviewed every place where _rtw_pktfile_read() is used in this driver. 
I have also confirmed that the driver builds without any errors or 
warnings with these patches applied.

Changes since v4:
    - Split the single large patch into a 3-patch series as suggested by 
      Greg Kroah-Hartman to ensure each patch performs one logical task.

    - Patch 1: Refactor return type to 'int' and replace non-standard 'uint' 
      parameter with 'unsigned int' for better type consistency and to 
      prepare for error propagation.

    - Patch 2: Add missing error checks and update existing handlers to 
      correctly recognize negative error codes. This includes inserting 
      new checks after _rtw_pktfile_read() and updating existing 
      '== _FAIL' logic to '!= _SUCCESS' to ensure all failures are caught.

    - Patch 3: Implement the core logic to prevent partial reads and 
      return -EINVAL when data is insufficient.

-- 
2.43.0
