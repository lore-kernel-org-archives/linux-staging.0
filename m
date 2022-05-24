Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D5C7FB
	for <linux-staging@lists.linux.dev>; Tue, 24 May 2022 09:01:05 +0000 (UTC)
Received: from 162.sub194.ddfr.nl ([83.136.194.162] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ntQPV-0006Y3-96; Tue, 24 May 2022 11:01:01 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 11/12] staging: r8188eu: use mgmt to set start sequence number
Date: Tue, 24 May 2022 11:00:28 +0200
Message-Id: <20220524090029.242584-12-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220524090029.242584-1-martin@kaiser.cx>
References: <20220521153824.218196-1-martin@kaiser.cx>
 <20220524090029.242584-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the mgmt structure in issue_action_BA to set the start sequence
number.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 823c54837364..408aa0a28382 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -5438,8 +5438,8 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 
 			BA_starting_seqctrl = start_seq << 4;
 		}
-		le_tmp = cpu_to_le16(BA_starting_seqctrl);
-		pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)&le_tmp, &pattrib->pktlen);
+		mgmt->u.action.u.addba_req.start_seq_num = cpu_to_le16(BA_starting_seqctrl);
+		pattrib->pktlen += 2;
 		break;
 	case WLAN_ACTION_ADDBA_RESP:
 		mgmt->u.action.u.addba_resp.action_code = WLAN_ACTION_ADDBA_RESP;
-- 
2.30.2

