Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EF11FDB
	for <linux-staging@lists.linux.dev>; Sun,  3 Apr 2022 16:54:58 +0000 (UTC)
Received: from dslb-094-219-033-178.094.219.pools.vodafone-ip.de ([94.219.33.178] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nb3V4-0008D7-Cv; Sun, 03 Apr 2022 18:54:50 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 05/11] staging: r8188eu: to_fr_ds cannot be 3 here
Date: Sun,  3 Apr 2022 18:54:32 +0200
Message-Id: <20220403165438.357728-6-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220403165438.357728-1-martin@kaiser.cx>
References: <20220403165438.357728-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove two unnecessary ternary operators in validate_recv_data_frame.
pattrib->to_fr_ds cannot be 3 in these places. If it was 3, we'd already
have returned an error to the caller.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 200d8c6c6e11..47d4fd01824f 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -1001,13 +1001,13 @@ static int validate_recv_data_frame(struct adapter *adapter,
 		pattrib->priority = GetPriority((ptr + 24));
 		pattrib->ack_policy = GetAckpolicy((ptr + 24));
 		pattrib->amsdu = GetAMsdu((ptr + 24));
-		pattrib->hdrlen = pattrib->to_fr_ds == 3 ? 32 : 26;
+		pattrib->hdrlen = 26;
 
 		if (pattrib->priority != 0 && pattrib->priority != 3)
 			adapter->recvpriv.bIsAnyNonBEPkts = true;
 	} else {
 		pattrib->priority = 0;
-		pattrib->hdrlen = pattrib->to_fr_ds == 3 ? 30 : 24;
+		pattrib->hdrlen = 24;
 	}
 
 	if (pattrib->order)/* HT-CTRL 11n */
-- 
2.30.2

