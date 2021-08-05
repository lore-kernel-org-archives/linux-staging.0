Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0944E70
	for <linux-staging@lists.linux.dev>; Thu,  5 Aug 2021 18:58:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 31F1460F01;
	Thu,  5 Aug 2021 18:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628189925;
	bh=IqXLzr/OLEXLF6zqTtqsk+B9+EiwaEbC1W4SSsIHGbI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gWLNpI6bhAYguYTIQlQYzBZMdJBcsm4IqY+fuRonMlyBqdFvEEQ0gBr5TrgbEDhnp
	 j7L6VeeNWuOOoIzJ7qSB0fkKEruZktIoytGmvw/I3CriKPvjqXPDHbJLt+ycGe2X7B
	 qh2XdyltJCTvJvwDYJgzOOptlXHH7LxAaPSEehpTOHf8uvVmBK0h2X9pGwvBxh97sq
	 KfyE0NsSn8NUwFOqztp6sf215ukakymtn8dZtllUVpJ+Fuz2apCzDorNrEvwAzW0SH
	 b/T1Q4CpO8CiLakpMFTOK818jjUoVauUGlpbScwOfGBLL0IhJOqXApd1Nr5o30eDUn
	 hh8mjjS5lXOEg==
From: Nathan Chancellor <nathan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Phillip Potter <phil@philpotter.co.uk>,
	Larry Finger <Larry.Finger@lwfinger.net>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	clang-built-linux@googlegroups.com,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v2 3/3] staging: r8188eu: Remove pointless NULL check in rtw_check_join_candidate()
Date: Thu,  5 Aug 2021 11:58:07 -0700
Message-Id: <20210805185807.3296077-4-nathan@kernel.org>
X-Mailer: git-send-email 2.33.0.rc0
In-Reply-To: <20210805185807.3296077-1-nathan@kernel.org>
References: <20210803223609.1627280-1-nathan@kernel.org>
 <20210805185807.3296077-1-nathan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
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
index e3d5a721d25c..95b952871e67 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -1622,7 +1622,7 @@ static int rtw_check_join_candidate(struct mlme_priv *pmlmepriv
 	}
 
 	/* check ssid, if needed */
-	if (pmlmepriv->assoc_ssid.Ssid && pmlmepriv->assoc_ssid.SsidLength) {
+	if (pmlmepriv->assoc_ssid.SsidLength) {
 		if (competitor->network.Ssid.SsidLength != pmlmepriv->assoc_ssid.SsidLength ||
 		    memcmp(competitor->network.Ssid.Ssid, pmlmepriv->assoc_ssid.Ssid, pmlmepriv->assoc_ssid.SsidLength))
 			goto exit;
-- 
2.33.0.rc0

