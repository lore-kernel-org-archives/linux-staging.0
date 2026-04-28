Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7778D41B365
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 12:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777378727; cv=none; b=HXlEiwrBShpzUyKWhTAmnDS9C2BddEswykw9y531km23OoCW2Hwu2GNOvoOzz3Otmx4PcEq3Vu9sr4VgKYKDyzEjNAdKn2ox0TqGb/olIDoUuDbSSSUOl2D/dnSr4Qnh4IJFnl18Qp0QhL+/Ns7syk+PVC7Qc30GeawPg+DIVAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777378727; c=relaxed/simple;
	bh=9HdIemgfR4VrPqTNiZHWFj+ptqaf+4Vv3NXR+2U51Wk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bYTHq9ibqZwEjN7gzTCbP5rqI6QoHYDNjsMhhkOFFLTosILBVWVGvIRYdVwIu3SpubocFUSFn7KF2gImkP6hm2oHolSpyn4XUJvSnrYkGENQte9tywFDN5IHdF+6j6fbSVMjFd9TPg68RgYSFOGql8pugBOzvCf7GKikt6vPHqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=Ut5dmycg; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="Ut5dmycg"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B83CB84F2F;
	Tue, 28 Apr 2026 15:18:35 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1777378716; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=3j1c5EDJo/k0wJE4iA56/aLTF1LlfKvBBoU57CDpPI0=;
	b=Ut5dmycgl0MTskgmiV0OweNxV2ksKVK1vIeXLeNgoQ7ECDiRAOLJ55VWPmckT2UEz21cDO
	KFPgfMS2jcb8v7URYl8TCHtwU638tUQSfYPN0zoqILQIZWhu0fiqAOBAdLj2FNVWZvb9Id
	et/ymDZEepTIM6KtTVIryYQzY2ooNTEIyFOAmNLL5gc/Ry5StzpwgmYSjRjpfAXysCxaL6
	jtVDukgK1fugYH54R1HOBsAWdCZO8tZBOm/BIKHB+iGPCz21HdKBLqxZ1cVbM5rwEodYji
	oaz9i7qv23S9HdvnmO9r+Y54T5lbDslVjeBsDl+ZWdnLwM/gH/7BfefO8Q0SH8WonR814s
	pRYyH+uFxndovdB8rMjYg8DzDiLDoDlVtWLcvUuWYul9l04eH2RH6cVx8enpJXcXGB89wJ
	YAxWgLXtpYxsInuzCrtvB2YAiWqQV1bOcJSMRzWW3KfYqMPcNvg21fKyqOenfpXqKNzM9g
	844jJobkL072Ia5Kp00gO5CKdv7OuAk3XcmDuNMMR6ymkq2DTgkG3hCsJ31iYydK6N7YbU
	jPu78Wb4a0WZtzmgsFN46VU2CpLKY0OsvF6Ds7bExUXPV5bhvEiOTzA+YkfPQou1gnLBok
	R6+zA3UWwvmQUn4R3xikUebZAWIHBzdYoB4K1mIpbXFs/H8jw3LHk=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: luka.gejak@linux.dev,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/8] staging: rtl8723bs: rtw_mlme: wrap rtw_sitesurvey_cmd condition
Date: Tue, 28 Apr 2026 15:15:47 +0300
Message-ID: <20260428121737.435248-5-me@cipherat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260428121737.435248-1-me@cipherat.com>
References: <20260428121737.435248-1-me@cipherat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Inline rtw_sitesurvey_cmd() directly in the if condition to reduce
line length.

Signed-off-by: Salman Alghamdi <me@cipherat.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index a35d726b803c..caaad38dd790 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -772,9 +772,9 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 				rtw_indicate_connect(adapter);
 			} else {
 				if (rtw_to_roam(adapter) != 0) {
-					if (rtw_dec_to_roam(adapter) == 0
-						|| _SUCCESS != rtw_sitesurvey_cmd(adapter, &pmlmepriv->assoc_ssid, 1, NULL, 0)
-					) {
+					if (rtw_dec_to_roam(adapter) == 0 ||
+					    rtw_sitesurvey_cmd(adapter, &pmlmepriv->assoc_ssid,
+							       1, NULL, 0) != _SUCCESS) {
 						rtw_set_to_roam(adapter, 0);
 						rtw_free_assoc_resources(adapter, 1);
 						rtw_indicate_disconnect(adapter);
-- 
2.54.0

