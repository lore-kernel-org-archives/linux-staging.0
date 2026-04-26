Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C662AD37
	for <linux-staging@lists.linux.dev>; Sun, 26 Apr 2026 22:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777244297; cv=none; b=SuRonAI6awdI9m0OYzeeUKyGLq8PPmxleHLiFSbdALGthOYLcBKXVbS2lQk5e2hxQr/xYMsMJLhNsCmQkSlYhdjFo+qSHDL2SPsgSsU0Rb+LmZvj0FDgi6gcrs+banbBYAPj8RWSCglNOAxbzjfckgFfiC3rvyBp+/6iR1r4pHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777244297; c=relaxed/simple;
	bh=rZHYkXggah79PkVFN+6E/RKD6b6tAyfkViysUFDb8oc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ut/LNkhp5+6LOJQXK/f90fdjwQR2B35qIYY1cZA1dRaaW7Q8zyLHNMByvkPWwVc351zmSXultsMwxuGzsVYIGzVfxE6eWUO3ktDj7HcXnhW/PIgon9peBrqdMoTu2hzVszq/EV+lLhTeaRNm/t9eNWAhMNTHSOpmaaflIoFeLiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=Vd9A6aaI; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="Vd9A6aaI"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A145184F26;
	Mon, 27 Apr 2026 01:58:13 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1777244294; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=9UgJASqxAWAeh3eiXQ4y7gcX7HLK+OapSPbuxmiLW5Y=;
	b=Vd9A6aaI+bM4qV7mnrXqO4bPHEAgpoXKLbwMI3+5784rlIzfxKObcJ+YmUQqVf/HGlNFfo
	lQpw6ClEaNfhLCCja5GBTfvwSVUyYjsS82xkb6eUFiETF0tHT5YeXo66Z/v6uSdKLEbEDF
	0HEtQJZjl4/PyDlnUkmFasYAQqmfdiXdGVzie3g9ITJ3xj9h4K7rU6PxWJSPtw9Bw9+DYI
	edW50yNNUSrO/cfmw8l+/O9A0oAB0N9y+QPJ4HTLed4JFqO8aHyfxJOcdqL9ziETpp6TyP
	gh1KNDsnWe+rPgYREiOCcTIt+yM5VKpsHiK3P6LHx3DqeYR7RRQv4h9hzcGV/XDFRIgvM9
	rM2MrqlQjUOxjokWEvodDc26PjlQtL2ZYKbDfAq8OC4tRRPFA1DsP1o7jbZ84kzQXqtCqw
	w0IKHl3/mUEWcN1iK8sPHDtBjdw03xPh1JZ8g1m7UW7FvyxYO01Z6ub3g6qGLVb0mEGr+I
	GdzrXftYkfPq498LZDO68SKP8MWUkRQXdZEaGYvEtusj8xc69lsh1nXhWKV+A/Wdjz1M06
	tcJmkFqF+B2zFNKnNdH4twTzMaRsP33RoBAV1QpFgc9trQ6AuUrZrd7URxDz1sU8jCMA81
	KtLzVZqBjTix+lPKDyaDu4WtK+bHDLT4SQ+5cYwAWBJausAJ1HPYw=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: luka.gejak@linux.dev,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3 1/5] staging: rtl8723bs: fix buffer over-read in rtw_update_protection
Date: Mon, 27 Apr 2026 01:54:58 +0300
Message-ID: <20260426225552.87114-2-me@cipherat.com>
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

rtw_update_protection() is called with a pointer offset into the
ies buffer but the full ie_length is passed, causing a potential
buffer over-read.

Fixes: e945c43df60b ("Staging: rtl8723bs: Delete dead code from update_current_network()")
Fixes: d3fcee1b78a5 ("staging: rtl8723bs: fix camel case in struct wlan_bssid_ex")
Reported-by: Luka Gejak <luka.gejak@linux.dev>
Closes: https://lore.kernel.org/linux-staging/DI2H39EAAFBZ.3KI5NWN02AQ2S@linux.dev
Cc: stable@vger.kernel.org
Signed-off-by: Salman Alghamdi <me@cipherat.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index ddfc56f0253d..268f294528e6 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -464,8 +464,11 @@ static void update_current_network(struct adapter *adapter, struct wlan_bssid_ex
 
 	if (check_fwstate(pmlmepriv, _FW_LINKED) && (is_same_network(&pmlmepriv->cur_network.network, pnetwork, 0))) {
 		update_network(&pmlmepriv->cur_network.network, pnetwork, adapter, true);
+		if (pmlmepriv->cur_network.network.ie_length < sizeof(struct ndis_802_11_fix_ie))
+			return;
+
 		rtw_update_protection(adapter, (pmlmepriv->cur_network.network.ies) + sizeof(struct ndis_802_11_fix_ie),
-								pmlmepriv->cur_network.network.ie_length);
+								pmlmepriv->cur_network.network.ie_length - sizeof(struct ndis_802_11_fix_ie));
 	}
 }
 
@@ -1072,8 +1075,11 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 			break;
 	}
 
+	if (cur_network->network.ie_length < sizeof(struct ndis_802_11_fix_ie))
+		return;
+
 	rtw_update_protection(padapter, (cur_network->network.ies) + sizeof(struct ndis_802_11_fix_ie),
-									(cur_network->network.ie_length));
+									(cur_network->network.ie_length - sizeof(struct ndis_802_11_fix_ie)));
 
 	rtw_update_ht_cap(padapter, cur_network->network.ies, cur_network->network.ie_length, (u8) cur_network->network.configuration.ds_config);
 }
-- 
2.54.0

