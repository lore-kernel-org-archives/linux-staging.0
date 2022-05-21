Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D545A3208
	for <linux-staging@lists.linux.dev>; Sat, 21 May 2022 15:38:39 +0000 (UTC)
Received: from dslb-188-096-138-194.188.096.pools.vodafone-ip.de ([188.96.138.194] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nsRBV-0007XY-FV; Sat, 21 May 2022 17:38:29 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 01/12] staging: r8188eu: remove unnecessary category check
Date: Sat, 21 May 2022 17:38:13 +0200
Message-Id: <20220521153824.218196-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220521153824.218196-1-martin@kaiser.cx>
References: <20220521153824.218196-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the unnecessary category check in issue_action_BA. category is
initialised to 3 (WLAN_CATEGORY_BACK) and never updated.

The rtw_set_fixed_ie call gets a pointer to category but it doesn't update
the value.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 94 ++++++++++-----------
 1 file changed, 46 insertions(+), 48 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index faf23fc950c5..f47cf3e7316c 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -5415,60 +5415,58 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 	pframe = rtw_set_fixed_ie(pframe, 1, &(category), &pattrib->pktlen);
 	pframe = rtw_set_fixed_ie(pframe, 1, &(action), &pattrib->pktlen);
 
-	if (category == 3) {
-		switch (action) {
-		case 0: /* ADDBA req */
-			do {
-				pmlmeinfo->dialogToken++;
-			} while (pmlmeinfo->dialogToken == 0);
-			pframe = rtw_set_fixed_ie(pframe, 1, &pmlmeinfo->dialogToken, &pattrib->pktlen);
+	switch (action) {
+	case 0: /* ADDBA req */
+		do {
+			pmlmeinfo->dialogToken++;
+		} while (pmlmeinfo->dialogToken == 0);
+		pframe = rtw_set_fixed_ie(pframe, 1, &pmlmeinfo->dialogToken, &pattrib->pktlen);
 
-			BA_para_set = (0x1002 | ((status & 0xf) << 2)); /* immediate ack & 64 buffer size */
-			le_tmp = cpu_to_le16(BA_para_set);
-			pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)&le_tmp, &pattrib->pktlen);
+		BA_para_set = (0x1002 | ((status & 0xf) << 2)); /* immediate ack & 64 buffer size */
+		le_tmp = cpu_to_le16(BA_para_set);
+		pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)&le_tmp, &pattrib->pktlen);
 
-			BA_timeout_value = 5000;/*  5ms */
-			le_tmp = cpu_to_le16(BA_timeout_value);
-			pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)&le_tmp, &pattrib->pktlen);
+		BA_timeout_value = 5000;/*  5ms */
+		le_tmp = cpu_to_le16(BA_timeout_value);
+		pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)&le_tmp, &pattrib->pktlen);
 
-			psta = rtw_get_stainfo(pstapriv, raddr);
-			if (psta) {
-				start_seq = (psta->sta_xmitpriv.txseq_tid[status & 0x07] & 0xfff) + 1;
+		psta = rtw_get_stainfo(pstapriv, raddr);
+		if (psta) {
+			start_seq = (psta->sta_xmitpriv.txseq_tid[status & 0x07] & 0xfff) + 1;
 
-				psta->BA_starting_seqctrl[status & 0x07] = start_seq;
+			psta->BA_starting_seqctrl[status & 0x07] = start_seq;
 
-				BA_starting_seqctrl = start_seq << 4;
-			}
-			le_tmp = cpu_to_le16(BA_starting_seqctrl);
-			pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)&le_tmp, &pattrib->pktlen);
-			break;
-		case 1: /* ADDBA rsp */
-			pframe = rtw_set_fixed_ie(pframe, 1, &pmlmeinfo->ADDBA_req.dialog_token, &pattrib->pktlen);
-			pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)&status, &pattrib->pktlen);
-			BA_para_set = le16_to_cpu(pmlmeinfo->ADDBA_req.BA_para_set) & 0x3f;
-			BA_para_set |= 0x1000; /* 64 buffer size */
-
-			if (pregpriv->ampdu_amsdu == 0)/* disabled */
-				BA_para_set = BA_para_set & ~BIT(0);
-			else if (pregpriv->ampdu_amsdu == 1)/* enabled */
-				BA_para_set = BA_para_set | BIT(0);
-			le_tmp = cpu_to_le16(BA_para_set);
-
-			pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)&le_tmp, &pattrib->pktlen);
-			pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)&pmlmeinfo->ADDBA_req.BA_timeout_value, &pattrib->pktlen);
-			break;
-		case 2:/* DELBA */
-			BA_para_set = (status & 0x1F) << 3;
-			le_tmp = cpu_to_le16(BA_para_set);
-			pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)&le_tmp, &pattrib->pktlen);
-
-			reason_code = 37;/* Requested from peer STA as it does not want to use the mechanism */
-			le_tmp = cpu_to_le16(reason_code);
-			pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)&le_tmp, &pattrib->pktlen);
-			break;
-		default:
-			break;
+			BA_starting_seqctrl = start_seq << 4;
 		}
+		le_tmp = cpu_to_le16(BA_starting_seqctrl);
+		pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)&le_tmp, &pattrib->pktlen);
+		break;
+	case 1: /* ADDBA rsp */
+		pframe = rtw_set_fixed_ie(pframe, 1, &pmlmeinfo->ADDBA_req.dialog_token, &pattrib->pktlen);
+		pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)&status, &pattrib->pktlen);
+		BA_para_set = le16_to_cpu(pmlmeinfo->ADDBA_req.BA_para_set) & 0x3f;
+		BA_para_set |= 0x1000; /* 64 buffer size */
+
+		if (pregpriv->ampdu_amsdu == 0)/* disabled */
+			BA_para_set = BA_para_set & ~BIT(0);
+		else if (pregpriv->ampdu_amsdu == 1)/* enabled */
+			BA_para_set = BA_para_set | BIT(0);
+		le_tmp = cpu_to_le16(BA_para_set);
+
+		pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)&le_tmp, &pattrib->pktlen);
+		pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)&pmlmeinfo->ADDBA_req.BA_timeout_value, &pattrib->pktlen);
+		break;
+	case 2:/* DELBA */
+		BA_para_set = (status & 0x1F) << 3;
+		le_tmp = cpu_to_le16(BA_para_set);
+		pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)&le_tmp, &pattrib->pktlen);
+
+		reason_code = 37;/* Requested from peer STA as it does not want to use the mechanism */
+		le_tmp = cpu_to_le16(reason_code);
+		pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)&le_tmp, &pattrib->pktlen);
+		break;
+	default:
+		break;
 	}
 
 	pattrib->last_txcmdsz = pattrib->pktlen;
-- 
2.30.2

