Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC2E7F6
	for <linux-staging@lists.linux.dev>; Tue, 24 May 2022 09:01:03 +0000 (UTC)
Received: from 162.sub194.ddfr.nl ([83.136.194.162] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ntQPT-0006Y3-QF; Tue, 24 May 2022 11:00:59 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 09/12] staging: r8188eu: use mgmt to set the timeout
Date: Tue, 24 May 2022 11:00:26 +0200
Message-Id: <20220524090029.242584-10-martin@kaiser.cx>
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

Use the mgmt structure in issue_action_BA to set the timeout in the
outgoing frame.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index ce6327dbc534..da0c0363eb4d 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -5368,7 +5368,6 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 	u16 start_seq;
 	u16 BA_para_set;
 	u16 reason_code;
-	u16 BA_timeout_value;
 	__le16	le_tmp;
 	u16 BA_starting_seqctrl = 0;
 	struct xmit_frame *pmgntframe;
@@ -5424,9 +5423,8 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 		le_tmp = cpu_to_le16(BA_para_set);
 		pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)&le_tmp, &pattrib->pktlen);
 
-		BA_timeout_value = 5000;/*  5ms */
-		le_tmp = cpu_to_le16(BA_timeout_value);
-		pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)&le_tmp, &pattrib->pktlen);
+		mgmt->u.action.u.addba_req.timeout = cpu_to_le16(5000); /* 5 ms */
+		pattrib->pktlen += 2;
 
 		psta = rtw_get_stainfo(pstapriv, raddr);
 		if (psta) {
-- 
2.30.2

