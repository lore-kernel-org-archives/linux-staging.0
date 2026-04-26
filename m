Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B7C27E1D7
	for <linux-staging@lists.linux.dev>; Sun, 26 Apr 2026 22:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777244310; cv=none; b=X/KV/bw7MpP2TMSL1oBDylSEphfdWsGbeJ4/8pMviqSBdE1iY9gR5R64+Ly6HLHG9oyi8poE/YjfLWDgvekjoG2b7KD/I0OvTmIXwduFXuiTwrHZFxgTDm9swFJ9sFDjK6UypWgnHcobTBxkak9xOBtrA35tAHTYAE/m/WLFwXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777244310; c=relaxed/simple;
	bh=9b2Vin882ceu308MJOQ1C63Faa6n/1UAc0THYj0nQ8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sFUZ+N7QSoH5J6IttPpulYzf8q7ptNXd+vpN8yX5vpCgWTc8Fu53AqjZl/unw100AMyp2QwnImSLR8O6KKsiVoLdJLyZiQ4FwDBTzv5w1ZripDem/puELAydlGO2fTC1k2d10Iybd8N4/AMXn1KwdU1NBcVnFTe6FTqHhVuwo7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=gUb6qqY3; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="gUb6qqY3"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0F20A84F20;
	Mon, 27 Apr 2026 01:58:20 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1777244301; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=z9dr3yX2ure1NYjdZ7Q3HiLis2nbBAmvgq50OR6f71c=;
	b=gUb6qqY393JzEN1N0BrvrOSprmFj+xioZJmro6/RtSU8r+o3ZwoqVC/XQxH8UobiBDPmEc
	PGW6ekbxbTYgrPVJVxDe4W09ucXu+J9hRZaJd0Ti8rJWIQDUpc+xTDhVIOTcadELRXIwXU
	WvHmNqExnLmZ92TzND89T4eNxA5mLepLplavv1rmCoDmay/VB6C92LDSQw9cEHVgcHcu8y
	j4g9gJ9uIg+xD/NOpJy7kktziYRXo6YZgO0SFD1pOyvQ95CFDFntItZr6L4dDFFSRLMpst
	zkhurj91k06ZuNUdBr/HTo8EsOYT7oZuTaYbGrAxscRWE63ojQj+BzwBsP8gK4jjJKf6mC
	5g6FQg8Hoa0O+rQk09AexzVUsI2e5wYTT8VAAm1+GFIN4Ae5yHbCHUokeWhzN+bAt84GtF
	e3mrfM9MfuzEBFIcnsoLUIuLpA3aVAG3TVce5oNVi4yQ2i1FxdLTB74mY18ClD437B7ObD
	YPsDuFdWnoHGurEGXzaggheYTbtMW4aS+VcIClbt/7L14VTDsD9OQDyhK0hI0ZGMdKxgEr
	GmLONmkZlQymAIVg8qoCZH25gglBu5ggbSu3IrU68wc+S04HXU6QI2ANrxvNCtBYSfihGL
	9mKXZQp8sx1+9c9XcI72PH5hYgoQhIc3oJriIwi5XUc+1DCfy9usM=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: luka.gejak@linux.dev,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] staging: rtl8723bs: rtw_mlme: add blank line for readability
Date: Mon, 27 Apr 2026 01:55:02 +0300
Message-ID: <20260426225552.87114-6-me@cipherat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260426225552.87114-1-me@cipherat.com>
References: <20260426225552.87114-1-me@cipherat.com>
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
index 66d3d55163f2..a2e9516c328e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -631,6 +631,7 @@ static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network
 		else
 			return false;
 	}
+
 	if (adapter->registrypriv.wifi_spec == 1) { /* for  correct flow of 8021X  to do.... */
 		u8 *p = NULL;
 		uint ie_len = 0;
-- 
2.54.0

