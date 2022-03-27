Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28013D93
	for <linux-staging@lists.linux.dev>; Sun, 27 Mar 2022 18:10:07 +0000 (UTC)
Received: from dslb-178-004-173-219.178.004.pools.vodafone-ip.de ([178.4.173.219] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nYXL2-00019B-2s; Sun, 27 Mar 2022 20:10:04 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Laight <David.Laight@ACULAB.COM>,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 9/9] staging: r8188eu: use ieee80211 define for fragment number
Date: Sun, 27 Mar 2022 20:09:44 +0200
Message-Id: <20220327180944.712545-10-martin@kaiser.cx>
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

Use the IEEE80211_SCTL_FRAG define to extract the fragment number from an
incoming frame.

pattrib->frag_num must be in host endianness, we have to convert
hdr->seq_ctrl, this field is little-endian.

Remove the local GetFragNum macro, it is not used any more.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 2 +-
 drivers/staging/r8188eu/include/wifi.h  | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 415747da7e3b..62cf2df90073 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -1077,7 +1077,7 @@ static int validate_recv_frame(struct adapter *adapter, struct recv_frame *precv
 
 	pattrib->to_fr_ds = get_tofr_ds(ptr);
 
-	pattrib->frag_num = GetFragNum(ptr);
+	pattrib->frag_num = le16_to_cpu(hdr->seq_ctrl) & IEEE80211_SCTL_FRAG;
 	pattrib->seq_num = IEEE80211_SEQ_TO_SN(le16_to_cpu(hdr->seq_ctrl));
 
 	pattrib->pw_save = ieee80211_has_pm(hdr->frame_control);
diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index dbda1880c45a..e10cf17d6aa0 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -189,9 +189,6 @@ enum WIFI_REG_DOMAIN {
 		*(__le16 *)(pbuf) |= cpu_to_le16(type); \
 	} while (0)
 
-#define GetFragNum(pbuf)			\
-	(le16_to_cpu(*(__le16 *)((size_t)(pbuf) + 22)) & 0x0f)
-
 #define GetTupleCache(pbuf)			\
 	(cpu_to_le16(*(unsigned short *)((size_t)(pbuf) + 22)))
 
-- 
2.30.2

