Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25ED42B754
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 16:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777394743; cv=none; b=IKCbAfLPbF/CHAX2uj/LW/p9ISSyHSwvVr0pOFJ7t4pWKEGL3QwID6ZbTAj9MaaT4UB39n89jfqcQ8Ghjea3rOesHhOHvXOp2QhpLUKFVjx9ggJrV2Ljmfs/McFwyhlNZwN0yqTmGoAW7GmHuV264IsSdobED/nQVrKZ3UXS+fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777394743; c=relaxed/simple;
	bh=3VjogJRvlVNg3t8adN5DZTXgCr4LrHLIkitkB/fmWkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LRs/jZbjStABdxt1jcrF4rYTrZ0ClZrLgJT8FyyitOA5mz5fWof4copVX7mUpiC+BaV72Z0SI4rqhUSpoq9r5k0wEpHL36mq0H0Nvda7+BKv5bEUU16d0AJAI4usW4dU/iUrDGSP53GUhfN1dSXSGotcfggjDzHr2JmYJUlFvsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=DWcyd7b+; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="DWcyd7b+"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8AA4684F90;
	Tue, 28 Apr 2026 19:45:38 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1777394739; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=d9Ed+ndE0rLiuYa70jJCdm2waF2bxaiVchc8o7SFhK8=;
	b=DWcyd7b+sErVKkGr0ckRAaEiEEWp8pnKZDBN7//1Yw2tA5GLGvLwEStZtVchvVCd925Ada
	6zw8OFmgwlV+7oCC8e6VMyJudHMm9vO1ZarqQIKe2otaeZ7F1jzI1bN3pb3BitE0GIXbOg
	KB2vASg7kcVKCrlbU8eP5kGvuXton6zT1Mg17PxXTX/6c6fu+nRNjghpHDPle4Jt2JHxPA
	PAnwh5o4BBAcnOKLLHoxjAochKzD06BrPkB5sRxr0Z+605bVKCdMsk040giKHg8u8nzSQ/
	3061GCOuy8IM8SklspRVWRKjfdYMGFMmoeV+06UJJEIpn/bru8lNCGFtkB4qeOfWm9aEU0
	3U5csCL0GfS5o809ilOOTyQidErQzvfBZ+A9yxK0FmOjNa4GGsyB9WydErAl1qtDKmsF2a
	MWmtCnNVKqabIgRKLoUvpywd8sOZeXacYIUHrNwYsj9pgqc0FxggAEpYtaRzMXK0g3OkB7
	o5EGaxqkcdDtA2zMtJhBBY81FCUbL1ydBIo/vKkuk8OBM/ufEfgCDplIpQ25z5TgnyZEjp
	iEFwsSqAwq6X5CzDOR7dc366VxW+fzkR92vvnoQowyEg/7SdkU7ZWCImh+3KE+dGvYO2er
	fmUJGHIi1v3dmeESBkojB205cjK1gjgETZi93Cw55j61ITl9hcpII=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: luka.gejak@linux.dev,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 8/8] staging: rtl8723bs: rtw_mlme: add blank line for readability
Date: Tue, 28 Apr 2026 19:44:38 +0300
Message-ID: <20260428164513.763471-9-me@cipherat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260428164513.763471-1-me@cipherat.com>
References: <20260428164513.763471-1-me@cipherat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add a blank line between the WIFI_UNDER_WPS block and the
wifi_spec block to improve readability.

Signed-off-by: Salman Alghamdi <me@cipherat.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index be8b50e8a232..0104829ca50a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -626,6 +626,7 @@ static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network
 		else
 			return false;
 	}
+
 	if (adapter->registrypriv.wifi_spec == 1) { /* for  correct flow of 8021X  to do.... */
 		u8 *p = NULL;
 		uint ie_len = 0;
-- 
2.54.0

