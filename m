Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6542C3D94
	for <linux-staging@lists.linux.dev>; Sun, 27 Mar 2022 18:10:08 +0000 (UTC)
Received: from dslb-178-004-173-219.178.004.pools.vodafone-ip.de ([178.4.173.219] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nYXKw-00019B-3X; Sun, 27 Mar 2022 20:09:58 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Laight <David.Laight@ACULAB.COM>,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 2/9] staging: r8188eu: use ieee80211 helper to read the pwr bit
Date: Sun, 27 Mar 2022 20:09:37 +0200
Message-Id: <20220327180944.712545-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220327180944.712545-1-martin@kaiser.cx>
References: <20220323074859.177425-1-martin@kaiser.cx>
 <20220327180944.712545-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the ieee80211 helper to read the power management bit.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index fc7f2a559f9b..5af715a08430 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -1079,7 +1079,7 @@ static int validate_recv_frame(struct adapter *adapter, struct recv_frame *precv
 	pattrib->frag_num = GetFragNum(ptr);
 	pattrib->seq_num = GetSequence(ptr);
 
-	pattrib->pw_save = GetPwrMgt(ptr);
+	pattrib->pw_save = ieee80211_has_pm(fc);
 	pattrib->mfrag = ieee80211_has_morefrags(fc);
 	pattrib->mdata = ieee80211_has_moredata(fc);
 	pattrib->privacy = ieee80211_has_protected(fc);
-- 
2.30.2

