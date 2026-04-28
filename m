Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5A8329E79
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 16:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777394732; cv=none; b=h6i48foxdaBdjMbgTTGRPP7xz9lupVh8OzL7cIhxNu+BJBZv8PTwOzD593RUmpCziZcJchbqB02QfzBUfKNo79mS67dQ4N5lzs4VaL6KwY4KplznSWpabEvdOZ5aDGaSZpt0vi3CjksOobZ1GjI9VgwduU8vUaPAXiKcqZVpYRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777394732; c=relaxed/simple;
	bh=rZHYkXggah79PkVFN+6E/RKD6b6tAyfkViysUFDb8oc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J6199SHSbc8cpveqUEsTlIuF/I45NuZHgnlLylh6iK1z9W1Rk/frdCBh/knkzDz5xwTfwNr+cMfPrRKjRiqKOii4Uf8Mocmv7jPFCQA2sstqG5nPnzkihXTaGmH0LAOQb7qlLOa7YubwW0CYpZRXnlCP1lPH5yXoACllnyZggxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=kMXdw3V+; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="kMXdw3V+"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 637EC84F95;
	Tue, 28 Apr 2026 19:45:22 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1777394722; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=9UgJASqxAWAeh3eiXQ4y7gcX7HLK+OapSPbuxmiLW5Y=;
	b=kMXdw3V+X6KaN5jNvIsUSwjtoV9CmY+pp7Y/en//lQ8nmd423LdSDsJRhRtA/WssAY6WGJ
	5henIhw9hhiG/aZLkzsLaD3npjFsbU7eCHlcK4lrVH2HOC68iiCaCmwwFDruk+NBpIUNcY
	Ef1y0Zx9+0PKS37moQ/pVU0a2cOUArCfo88go5kGYgkBYRJNQck+DFTZ8iiYAhRyfk3zfm
	OgR5sFXkNg/GTxpchOnUpWziIrB3UAqS3rR9k6sKjZsUk3LA4K/zO9RLWvWBD3cCAqeCrP
	jyFPwp7tdfblH76Ji53OJaJqQqEU9qywjdoNPDlPtOgGkoS6KTEuPGFgGPFKfZVR1JL8DD
	c7JQisNAH2nIsgdAOwZ0BRKCigXMYvNVJIuS0m4sV/rAtJ1oCLXGUHLYyr/81eZHq4g+64
	U0MLQe8dcbSxeJkA+BriweQX9MyE5OP5zvrIx3EQI3WjB8QM1aSLTZqcAYNEeXorX8DtoN
	K7n2fWai2jucAqiC6ii1uzGOHXT3YsuPfwMRE/sFFB1Li5gPOrtwefdyM/X/06qQElu05o
	WGGMu0djklXS4J/yGC18rF9LPNE/NFCAU6VsuxhrdncXZCWYUEElf7gEOao7sVnWAhOnc0
	Ib/TT60wReMad+Fw/JqpZg7hcRtsK3SWO/I0YDvj0TTnBFIF+AXk8=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: luka.gejak@linux.dev,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v6 1/8] staging: rtl8723bs: fix buffer over-read in rtw_update_protection
Date: Tue, 28 Apr 2026 19:44:31 +0300
Message-ID: <20260428164513.763471-2-me@cipherat.com>
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

