Received: from cvsmtppost03.nm.naver.com (cvsmtppost03.nm.naver.com [114.111.35.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55CE43E9CE
	for <linux-staging@lists.linux.dev>; Thu, 22 Jan 2026 04:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769055915; cv=none; b=LxBzsMnij9yHkHzRtmildVy4C1EM7e0gBl5a4ASyQbsYGsKx+eWbX5uMvZoVdJFlqMqeBZKwQomjlx6z6ioozSnVpnBWNtmxzuA3qsTIh3Wg25WblXMl+VLuuGnk40/F9/wavZK6XXzEohRU/FYvfODyEDOSlgHzPWJsKiIdToY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769055915; c=relaxed/simple;
	bh=UuM8SjqHe4qcr6/BH6mKu1g3ju8KDMz/OIa3etV8F5A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ACgWuxR4gvyTxUL62ZeCBHhFaKx0AtywwTcnwBrcYWEey3N+Av8i25H1mnul2pihKDYJjgeFlznY8UurfopgwrklauUZw0+8/zfccvClYxp+qUY7PHUW7XfXSaCj7Ahxnt8KfxaWDC5TmK3C8Iir3AxO0ImtZly5k90ma9rBiaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=U7JKF1yF; arc=none smtp.client-ip=114.111.35.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="U7JKF1yF"
Received: from cvsendbo017.nm ([10.112.18.57])
  by cvsmtppost03.nm.naver.com with ESMTP id rAuiucIEQ3SjuvOwVNP76Q
  for <linux-staging@lists.linux.dev>;
  Thu, 22 Jan 2026 04:14:59 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1769055299; bh=UuM8SjqHe4qcr6/BH6mKu1g3ju8KDMz/OIa3etV8F5A=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=U7JKF1yFza+3cSbLl+JCdv8w+H2N71geQDGDd8QtatGwhn588b+SL+JET+4mq0jZw
	 CScCmy+99IjYYRU7aV/JQOlWwoJkBB473Wm55Ho2nzPTgXchjVtDslGOEfWYF8T+FX
	 ntcSS5JNlN/mGl71cuT5CW0uR9iEL6Rfu+52TXXHv4sAZzMq5Ng3OEQ6OQbSG7Q5Z3
	 VYTSl+lY1zvO/IgM3sAb89P6XU8lMz+C3HF24Ktk4MNe+N8CyJ1RIZ7CYyvSBpsVdT
	 g3xojcuDla2JTUQ7L9Wkq/wmEoJFC6aLb3SD0pGyk66WWZMuFVxejkXy7qPMvKQuas
	 apwJRQEE0xDQg==
X-Session-ID: OD7x8GB2T9a7lfSH3r9OHg
X-Works-Send-Opt: LdYwjAJYjHmZaAKqKBmmKxbwKqpYkEljxBmwjAg=
X-Works-Smtp-Source: l9YZKAvrFqJZ+Hm/ax2Z+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by mvnsmtp02.nm.naver.com with ESMTP id OD7x8GB2T9a7lfSH3r9OHg
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Thu, 22 Jan 2026 04:14:58 -0000
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
Date: Thu, 22 Jan 2026 13:14:47 +0900
Message-ID: <20260122041450.2325560-1-s9430939@naver.com>
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
