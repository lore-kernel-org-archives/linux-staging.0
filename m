Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F1F379C2A
	for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 20:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778704583; cv=none; b=qBIq8NBK4ZgLpHzWSxOHwwmwsi98OfjTBQT4BtSTiDAeYnHDBPoMS8m6aXnxTIbwRMAtrBoFRA+RFw0ypxatKx5f8yOm+XzqyklO+aPA+JqjUSLpDHkCMPtr5vVu68CxJSaTIHY59FiHZw6FgqhY1XuQm2oxlwnL8vhjpzrDJUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778704583; c=relaxed/simple;
	bh=9HdIemgfR4VrPqTNiZHWFj+ptqaf+4Vv3NXR+2U51Wk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rmdimpUpZZTiWq7454Kp923zZa49pIKFTnL5JTwwajbSL0qgAvYljMpDmM4OneWKAdLJIlPfaILv1gQ+jZdJV8f9HuGXi6f+OJn0yuHVI7rBDOG21VHBQAnaQK36OOoN4J2I323NM4peurxHhpX7i6LtyAxLZlrj0XnfwM8+A48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=zKQswikO; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="zKQswikO"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E207A84FF3;
	Wed, 13 May 2026 23:36:19 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1778704580; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=3j1c5EDJo/k0wJE4iA56/aLTF1LlfKvBBoU57CDpPI0=;
	b=zKQswikOW0ArA79rzOwCjPZ9eNqNa9pZcvAKq722cLkQ3QLMUwUc/ixJYVNbRFgc2ek0WR
	bj83r02X9obqFWZLJe1s9FP92UCLf9U9bF+7MIvvr/t/VMK2ZEwxx6b9OqiuikvcTn8CHP
	oQ1auWfMWY7eZTqD4WBKWykrQ8k3AhQYE4PzKO3R7Ppq4Jk0np3Ob1DHapp8HNmiBegg03
	HVfCSvXfyOybyB0pmhO9oDXv5hHXooxC72/CkbQcyP1Qhl92xn9sW0OFJlcSOnnlfovV2g
	E9VXMluMoo3uo+u5GfE0KBpOU8Otoinh015zxYAQJAtBQ1YyVJooa+MQIPB46L1axWfkat
	2KT9gGboWEns0Nrao57ct6FZOuW9nrlT/uvAhEmrJirFRP2KYfISRJpWof1z1z357Lp77U
	uZeEl0hJByT1b986u09D0zBUtcEXo0aPlJq9DMJpKfmYU3TN0+twAWR0nEaTOLkXTfgEBu
	zdUJkltiqbpxxZDidt5z2dq8gaG0a6anUWy6Bn7em0+42ckSkIlphOCcMsfCMK0CCwa6tb
	o7eTJZEv4Bdr1KA477PekKSMLitbShKAZHrhdz9+CDHNuRwI4CkrV4KkBlAACrK5s4zX0k
	/6gDsx2vI1P7Fgg13VB1MGPxPCrZzN/bfIOQH6Vwwl0nRgDUxDvuQ=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	error27@gmail.com,
	luka.gejak@linux.dev,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 2/6] staging: rtl8723bs: rtw_mlme: wrap rtw_sitesurvey_cmd condition
Date: Wed, 13 May 2026 23:35:00 +0300
Message-ID: <20260513203611.31872-3-me@cipherat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513203611.31872-1-me@cipherat.com>
References: <20260513203611.31872-1-me@cipherat.com>
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

