Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BD62580CF
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 16:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777394729; cv=none; b=CHvuVol81LxIPRPcW+eup/ytMEXHPnKN6FvPI6xwlHFJUfpAhIDRliEKwFfsRY37j+eDBhfLvIB4rZXnYfTg7i3oc1FNKyPxiD7pVHIEKhUuv6HnYnYlXGj0YVJzhSX3N9vp3T55qphC1VM9arYqTgT8SZbxZvUJJIWHzVGdKRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777394729; c=relaxed/simple;
	bh=AAaQ3rKC5eJH9zfms/Bc+U96m4mYeaFs6BtTUGzJXL8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WpqfIfPVgoSI78a8BSBKI5MZ4XDUokazyeF9kIgMdpp4RcRfKquThfwGl//BfxkbY4Qfv04ZLQY8fMBbwHrB0q69VM99Ul9oL47ErdqZALg8OGm7E+f1aCcIqrly/EKe/EE3tgaiSyKTc/BdpH2o6y7Qa+uy2L6grQ5TZZA1p9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=so+Y6WbB; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="so+Y6WbB"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C8EE284E55;
	Tue, 28 Apr 2026 19:45:19 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1777394720; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=olRf346P1cRrU46mf6rVhkSgsbgQxRGhJZ7OaMGhY38=;
	b=so+Y6WbBDyEWbY1SCQwTwkCtMr/dujjV1HJJzixNhW/x47xQMLQjx34atNfXITOL0CxEwO
	2uOpF0IQsCFGYujKCk6QsuM9I/ocKffqyFcL0DfCStBsFDW/bHmRNZ7q8SxO1bsGsokQRY
	O50C4Jw9Sag0+xOzSVfZYmzF71JSY1bQ28l/jdiexvBe8dOafdB4j0qtGDdsARwN80Ip4V
	ncPb2blJMAQGzY3y3tFkoTAFUD0w5jrOY3VEFCJFNR5fIdfwT9Yc3LVlzrYb2FqPY+MLYX
	OCQxl/ns0j6NHghVVQsmaUtcJNX/pHEehvT13jy5v+nJOjT5TAd1rYDNxjrOW8i0N664XS
	OonEOJn6D/+Th0WDjjh3Rls0NEOEasWL9Awp3+2Jcr3fNjApNkA4DCqJ87nhz/6sOrRUos
	EovD5/QhNYo0nStcO7WxvdpLSLk+Al9CBPAZeRIPaJMQMI+k0ffOFNZCcGKyWT1gDxA4OO
	eVlIzO6CJQuudGZhTAH+Zgqnyk7y6GlXxtcia1nJOXVdy7AqiiMIEDasVhoUgyNo4mDjWg
	RWxpKZvxK1RnPejK7l2BDc7kYOtOkU9Up6pA3b6cAzw5YoaabTzuHXc7poCf6J8woDJXu9
	k53O91zwxh+Xf0Ul4MsnH+NO+0z0f4z+QEujvbXU9xtBFjeXvtjTc=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: luka.gejak@linux.dev,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/8] staging: rtl8723bs: rtw_mlme: fix long lines and related issues
Date: Tue, 28 Apr 2026 19:44:30 +0300
Message-ID: <20260428164513.763471-1-me@cipherat.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

This series addresses review feedback on v5. Changes from v5:

- Fix variable declaration ordering that broke compilation due to
  dependency on uninitialized pointer (per Luka Gejak)

Salman Alghamdi (8):
  staging: rtl8723bs: fix buffer over-read in rtw_update_protection
  staging: rtl8723bs: rtw_mlme: add bounds checks before ie_length
    subtraction
  staging: rtl8723bs: rtw_mlme: wrap lines exceeding 100 columns
  staging: rtl8723bs: rtw_mlme: wrap rtw_sitesurvey_cmd condition
  staging: rtl8723bs: rtw_mlme: extract local variables for long
    expressions
  staging: rtl8723bs: rtw_mlme: remove dead commented-out code
  staging: rtl8723bs: rtw_mlme: consolidate capability comparisons lines
  staging: rtl8723bs: rtw_mlme: add blank line for readability

 drivers/staging/rtl8723bs/core/rtw_mlme.c | 276 ++++++++++++++--------
 1 file changed, 183 insertions(+), 93 deletions(-)

-- 
2.54.0

