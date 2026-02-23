Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4DD2566D3;
	Mon, 23 Feb 2026 13:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771854501; cv=none; b=nMDYK1jiN8ZTiSjKPyVQywPPjAR8YNqIP3zYb+b1l1iB+fK91W4BBLbSgPGRyAcxmLFHNFLJKCUZ1v3mZMVZiyGVcjZAXjQ3WfPNvAq3O3vTI3kUOhx3g+wQ5pWCDZkPv70r8aqP58ZfO7Qqn4HmwbLnidFG+TmT+2PGvrTANiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771854501; c=relaxed/simple;
	bh=Pnx5G8UD9Fu0wLPl8P+n0yq/4vkAEf8/yMLR0we7T1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aAe9x9ZrEzYLE5+CO8+67/rQ5HbXUhTZVPXU2ZowSCYYDXDJgnRl9XgpBKXOt0Tb0FVvpAdrT7KFD7tVxCAiYWbdnWgWCe3sFy4cG5tgReTbpTR1GHVE3IyD01fll+x2sbFOYu1NzvmswWWwSAWcGnL5HU54jesIaim/vUyuqfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2KA2wkIS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2KA2wkIS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E30CC2BCB1;
	Mon, 23 Feb 2026 13:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771854501;
	bh=Pnx5G8UD9Fu0wLPl8P+n0yq/4vkAEf8/yMLR0we7T1Q=;
	h=From:To:Cc:Subject:Date:From;
	b=2KA2wkIScFYRVzAJ9dic1OEvf+zlEaKxJCvFuTQTCiKzjNEWxz+NKWlOCLUKwCH/C
	 CklxaKrjNZZ8y17jt8VDnOIX4ssOVwE61kRRL50l0wgnyGHySLb5DTJAusTmQMeV9A
	 dhyPgypqkzt4Xf43AU9mevH596WuE4kW0HckiFws=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Navaneeth K <knavaneeth786@gmail.com>,
	stable <stable@kernel.org>
Subject: [PATCH] staging: rtl8723bs: properly validate the data in rtw_get_ie_ex()
Date: Mon, 23 Feb 2026 14:31:35 +0100
Message-ID: <2026022336-arrange-footwork-6e54@gregkh>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1825; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=Pnx5G8UD9Fu0wLPl8P+n0yq/4vkAEf8/yMLR0we7T1Q=; b=owGbwMvMwCRo6H6F97bub03G02pJDJlzwnbkb1Kd2fLpaXbdgyfhJQxTpBujvCWWLXV7F5m66 3WvzJnkjlgWBkEmBlkxRZYv23iO7q84pOhlaHsaZg4rE8gQBi5OAZhIwHyGWcwrCub7uCvrZClv 4Q04xnLKsGyCOMOCReulb+2XbObZPFtXQPyU4J3aiFmZAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

Just like in commit 154828bf9559 ("staging: rtl8723bs: fix out-of-bounds
read in rtw_get_ie() parser"), we don't trust the data in the frame so
we should check the length better before acting on it

Cc: Navaneeth K <knavaneeth786@gmail.com>
Cc: stable <stable@kernel.org>
Assisted-by: gkh_clanker_2000
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
Navaneeth, any chance you can test this or at least verify my logic is
correct here?  I got a "hit" from a tool that the work you did in your
commit also needs to be done here, and I _think_ I got it right but do
not have the hardware to test this with at all.  Thanks!

 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 6cf217e21593..3e2b5e6b07f9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -186,20 +186,25 @@ u8 *rtw_get_ie_ex(u8 *in_ie, uint in_len, u8 eid, u8 *oui, u8 oui_len, u8 *ie, u
 
 	cnt = 0;
 
-	while (cnt < in_len) {
+	while (cnt + 2 <= in_len) {
+		u8 ie_len = in_ie[cnt + 1];
+
+		if (cnt + 2 + ie_len > in_len)
+			break;
+
 		if (eid == in_ie[cnt]
-			&& (!oui || !memcmp(&in_ie[cnt+2], oui, oui_len))) {
+			&& (!oui || (ie_len >= oui_len && !memcmp(&in_ie[cnt + 2], oui, oui_len)))) {
 			target_ie = &in_ie[cnt];
 
 			if (ie)
-				memcpy(ie, &in_ie[cnt], in_ie[cnt+1]+2);
+				memcpy(ie, &in_ie[cnt], ie_len + 2);
 
 			if (ielen)
-				*ielen = in_ie[cnt+1]+2;
+				*ielen = ie_len + 2;
 
 			break;
 		}
-		cnt += in_ie[cnt+1]+2; /* goto next */
+		cnt += ie_len + 2; /* goto next */
 	}
 
 	return target_ie;
-- 
2.53.0

