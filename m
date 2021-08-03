Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295B170
	for <linux-staging@lists.linux.dev>; Tue,  3 Aug 2021 22:36:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 854DB6105A;
	Tue,  3 Aug 2021 22:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628030216;
	bh=qSdTywIFBc/13p1NNpVFBv7XGCZzOAfhX1X6Q8iXRyw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mhzUeMQRKf7D1uB8U3KxLEhJ33/jEhVtELKeZoC/6Z3yG4lGPZWuikPTB+KfGYiZP
	 347UY+QWbVOsy7z+PPRv3Sg3VT+v2SRlfp4hzlSa10fJfD6PEoIz09SmPg11KFpInK
	 AVMhalb+VrE4ZgfYeNaaKVIi4EuXSzCUtJMWwuST3mkgAtsP+JP5lel+cLuCHn45C/
	 tRYP5Yot/gV8bGB56FSvUS5yfyvHStL5XIAUgkVmh5+VIKkd3JvghtbCpsMWYIAQoR
	 cG3Vjxp2aGB3zTMbxOVjzMj0qGoi+GJL+EPrJjBJF1CrmkNydhkyDS+uaqA3Ea0jC9
	 tfUrwq802e91g==
From: Nathan Chancellor <nathan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Phillip Potter <phil@philpotter.co.uk>,
	Larry Finger <Larry.Finger@lwfinger.net>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	clang-built-linux@googlegroups.com,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 4/4] staging: r8188eu: Remove pointless NULL check in rtw_check_join_candidate()
Date: Tue,  3 Aug 2021 15:36:09 -0700
Message-Id: <20210803223609.1627280-5-nathan@kernel.org>
X-Mailer: git-send-email 2.33.0.rc0
In-Reply-To: <20210803223609.1627280-1-nathan@kernel.org>
References: <20210803223609.1627280-1-nathan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

Clang warns:

drivers/staging/r8188eu/core/rtw_mlme.c:1629:28: warning: address of
array 'pmlmepriv->assoc_ssid.Ssid' will always evaluate to 'true'
[-Wpointer-bool-conversion]
        if (pmlmepriv->assoc_ssid.Ssid && pmlmepriv->assoc_ssid.SsidLength) {
            ~~~~~~~~~~~~~~~~~~~~~~^~~~ ~~
1 warning generated.

Ssid is an array not at the beginning of a struct so its address cannot
be NULL so remove the check.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/staging/r8188eu/core/rtw_mlme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index fa4df4a3a2df..16d8f7317897 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -1626,7 +1626,7 @@ static int rtw_check_join_candidate(struct mlme_priv *pmlmepriv
 	}
 
 	/* check ssid, if needed */
-	if (pmlmepriv->assoc_ssid.Ssid && pmlmepriv->assoc_ssid.SsidLength) {
+	if (pmlmepriv->assoc_ssid.SsidLength) {
 		if (competitor->network.Ssid.SsidLength != pmlmepriv->assoc_ssid.SsidLength ||
 		    memcmp(competitor->network.Ssid.Ssid, pmlmepriv->assoc_ssid.Ssid, pmlmepriv->assoc_ssid.SsidLength))
 			goto exit;
-- 
2.33.0.rc0

