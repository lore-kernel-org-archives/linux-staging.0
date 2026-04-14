Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACCB2F28FF;
	Tue, 14 Apr 2026 17:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776187182; cv=none; b=Ipjh8VoCildtAR8Zhi30hCueqIs8QMYAulMCyzZU9k/wu1AFwLy6opzdfIq0CYkWdpNocdBx5fg7gwyP3jvuybkYijQnfJ2wFkX5CvlJIBeOfvO0o/j1ItK5pxI1K7gyyA84MMjpU+XuaRbT6ypmAdHJcjOCu8P1biJtITG8ifw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776187182; c=relaxed/simple;
	bh=s+gb7abRfvDUpdCH57bT15i58BmAc/VeIOdR72Y0SKg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JsKQQYDX62wFJDugsZHoUTTXlQxoPyBffz9xVykWpVDRRK06B3hbfhVNJbMkNb4M2SkrLJ24HdClDhZ0vJBFJb1S1pfeG9rmcNCiE1oQO1GpXGaBb7OEwtZiSFnYTVhU1upIN1GfURNWrNkCpyxdK86hMmcgANB8XQrO/Z6Z5m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kwKvcOdy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kwKvcOdy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D5B6C19425;
	Tue, 14 Apr 2026 17:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776187181;
	bh=s+gb7abRfvDUpdCH57bT15i58BmAc/VeIOdR72Y0SKg=;
	h=From:To:Cc:Subject:Date:From;
	b=kwKvcOdyqrPaAcI7Mw1dpzy5K3K+/yjt8fJjoXamm3dp2wt7V6IDyDhCxK1RUo72h
	 iX5wtO0a8d5S1b986aWEpJh7kV8A03FLfXEpGXjLBfxgt4klJ8l9uFt0+xpGK8tuKz
	 t9R8ktv5YX5y5gWa2K9DaDcHvjkKeiyVWPdJl13w=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] staging: rtl8723bs: fix OOB write in HT_caps_handler()
Date: Tue, 14 Apr 2026 19:19:09 +0200
Message-ID: <2026041408-grill-mahogany-d1e3@gregkh>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1330; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=s+gb7abRfvDUpdCH57bT15i58BmAc/VeIOdR72Y0SKg=; b=owGbwMvMwCRo6H6F97bub03G02pJDJn3ynleblr/b5Z3bldrlqLg9XlfdSI99n0t8mZdpSoX9 tS01HNFRywLgyATg6yYIsuXbTxH91ccUvQytD0NM4eVCWQIAxenAExkdSnDginL+H+3LAi6/oBj w2e1M5dKinKXczIsWFBatlbIN2wly/5S5+3Vp8L3f2LVAgA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

HT_caps_handler() loops up to pIE->length, the IE length byte taken
directly from an over-the-air association response, and uses the counter
to index pmlmeinfo->HT_caps.u.HT_cap[26].  A malicious AP can supply an
HT capabilities IE with a length byte up to 255, AND-writing into
adjacent fields of struct mlme_ext_info.  This is reachable in station
mode (the default) via OnAssocRsp.

HT_info_handler() already rejects oversized IEs so do the same thing in
HT_caps_handler() to resolve this.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Assisted-by: gregkh_clanker_t1000
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 3242978da36c..a2e016c6a01f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -932,6 +932,9 @@ void HT_caps_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE)
 	if (phtpriv->ht_option == false)
 		return;
 
+	if (pIE->length > sizeof(pmlmeinfo->HT_caps))
+		return;
+
 	pmlmeinfo->HT_caps_enable = 1;
 
 	for (i = 0; i < (pIE->length); i++) {
-- 
2.53.0

