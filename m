Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF422E6CC0;
	Sun,  1 Mar 2026 01:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772330044; cv=none; b=OHLGpOk/vP8CzzweozG/+ZZD4sOpFFsUqqcgJcNBAIcCXWqEHs/6U7ambrqESKYsedADzB/TAWL/otxBZ/rkXZS0fXEKAvV6CidUPpXTmVFXJg/kPKVPFeT8HdqJ9vMdqIHFPeFRURuwMXfOYapQjV8D/+jmr15YJ+I5tOXMv1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772330044; c=relaxed/simple;
	bh=L0vLKaJa41WR7N3GFw6yaBtH7B0+tbvOlTNfq1rxAD8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tU//aiJb0PDEA5L0viRy0kAYwFz5mWnbjBYrITsOSH9VYQUt10rv/xGb3ncL/50Jc8oNsGDlOzwNqwnR5HEj7g4KCikMbkahElqHoB2FZW96JkHYwOtN8VQSOwprCa+4ceNvCsFc1F1C7o0zo88D1l6qgL6dzqrkPbKgWsFahEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kepOs2TH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kepOs2TH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFF08C19421;
	Sun,  1 Mar 2026 01:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772330044;
	bh=L0vLKaJa41WR7N3GFw6yaBtH7B0+tbvOlTNfq1rxAD8=;
	h=From:To:Cc:Subject:Date:From;
	b=kepOs2THNTGayhoCjucN3w7/YA5i4hCK3tR8mV6QThx369E02mpOwPZhAwSzZSx+i
	 QOVJFEs0Wsvy6XhzZ9LBzB+Ib8cjszJohGuENBLLSYAZrYbejDKAIu+dmnHv5WrhhT
	 1E1Vilb6s60UnMlrDm+FEdsP0SVccVauWdqkzO5qfBXS+ekbnCyeJVYvHk9xMkmfBG
	 1SoRWxnpMNygHXOEzn5XqUES0Av4lxesS/feS/iVplJAPHonNmIxHLnjGCLniKRwpl
	 mRCUVfio/lsQqEtU/noAxaqbH9j50kZRLU38mGt3CPqC6VOXKzu01i8MAkSH+h8hUV
	 OisAPIGLqW4mQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	ethantidmore06@gmail.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: FAILED: Patch "staging: rtl8723bs: fix null dereference in find_network" failed to apply to 5.15-stable tree
Date: Sat, 28 Feb 2026 20:54:02 -0500
Message-ID: <20260301015402.1720952-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

The patch below does not apply to the 5.15-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 41460a19654c32d39fd0e3a3671cd8d4b7b8479f Mon Sep 17 00:00:00 2001
From: Ethan Tidmore <ethantidmore06@gmail.com>
Date: Mon, 2 Feb 2026 14:54:29 -0600
Subject: [PATCH] staging: rtl8723bs: fix null dereference in find_network

The variable pwlan has the possibility of being NULL when passed into
rtw_free_network_nolock() which would later dereference the variable.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
Link: https://patch.msgid.link/20260202205429.20181-1-ethantidmore06@gmail.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index b3a9e40054a7f..8e98344951acf 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -826,8 +826,10 @@ static void find_network(struct adapter *adapter)
 	struct wlan_network *tgt_network = &pmlmepriv->cur_network;
 
 	pwlan = rtw_find_network(&pmlmepriv->scanned_queue, tgt_network->network.mac_address);
-	if (pwlan)
-		pwlan->fixed = false;
+	if (!pwlan)
+		return;
+
+	pwlan->fixed = false;
 
 	if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) &&
 	    (adapter->stapriv.asoc_sta_count == 1))
-- 
2.51.0




