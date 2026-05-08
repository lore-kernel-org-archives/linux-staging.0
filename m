Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38B132E743
	for <linux-staging@lists.linux.dev>; Fri,  8 May 2026 22:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778279259; cv=none; b=YasMIK8G1UV9ZpVg8OJtacBGEhWFaXSJaWAaikb1Z31jt1U15BIUpP8OwVcmHrYc//LQZpVb6vjQrgT/ZLYdbIhXvoFj+riSo402dYz2He1vQFkjUFGLzhfOBopnk9e1E5B03LsjoAqK55JzyL412YpCWv0din1LuoeFCHm6XXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778279259; c=relaxed/simple;
	bh=9HdIemgfR4VrPqTNiZHWFj+ptqaf+4Vv3NXR+2U51Wk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UXKTgrRp8pUkNeoUd7Ko7SxAA8djuIpo0joBw2GLnUSskSdWbBpmMXWOZphJbYOME9d/2WFYd3Q6j3lfvH795VkRnxCNN6p1SzXxb3bcHeEho37Kv7yzCTjDPVxapBHAgwo+ePBJuREhwgGXT8kpvFpltw5k7QxjaDbW4f1lUKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=DGwexo9u; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="DGwexo9u"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8289784FCE;
	Sat,  9 May 2026 01:27:35 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1778279255; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=3j1c5EDJo/k0wJE4iA56/aLTF1LlfKvBBoU57CDpPI0=;
	b=DGwexo9uOFrIeZ6tUe4UlhySX8Z4BtkOepcdhkImoXtUJEczZzvZDHpKw4j2IaSmPfG41v
	sIuMDY4fsTstfRDh6mFws4aLdE11WF3Dt6HIRhRRTle2wkE1dfn0LlGWCBwIBhNW25vqhX
	/dZKodGtazYPWqw1CTHp80KPp5W+GrrSEg9rrOIQDDn5evoJ78kRJB0hHk85S39kqokg6Z
	59M2afltFQE4aYMKB7TASEwld3NRol+E/0yAI3oFT47HnI2c5kYaTCFJ/IsK+kQMhqlgCi
	fhg3HMd3U/nT96+DVKaEjMVKht/dZFXPTkBOT0vmhN3z7q0voidNsigI/0PT1wPUA++oMV
	TNJUXJe2oyL0qt7mwSfypSLOf6l0yUcxjTSGDnNenfvRHpPKoJk2mqcE6cGDZn5roj5ttK
	hUZNVKdeR6scGRZ3BytSBH6TQShnS30abqTEJNN8MadirkVz+8R+FGluqBxXIjen9Nykv6
	ONGSmuF66jS9DjypwLQ9rBXE8JwxNts7AhUsAsQVWw+uzGY+3/XHBJAbOe5bGJRVFpayMT
	Jhq+fZiYAMdXvTZQb55qoQQmqj/gbspHyML+5QLnTAoWgBDfBlcRAa/Zg1g4GSA3c8UXO4
	znPncJguxEAekaBkzLeOmmB4TDvxkuKY28t+lkpRQcwffRM7DsulM=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	error27@gmail.com,
	luka.gejak@linux.dev,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/7] staging: rtl8723bs: rtw_mlme: wrap rtw_sitesurvey_cmd condition
Date: Sat,  9 May 2026 01:26:59 +0300
Message-ID: <20260508222725.24075-4-me@cipherat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508222725.24075-1-me@cipherat.com>
References: <20260508222725.24075-1-me@cipherat.com>
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

