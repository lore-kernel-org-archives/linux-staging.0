Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4122CA0
	for <linux-staging@lists.linux.dev>; Sun, 26 Dec 2021 21:25:49 +0000 (UTC)
Received: from dslb-188-097-047-111.188.097.pools.vodafone-ip.de ([188.97.47.111] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n1b1V-0000qQ-Gs; Sun, 26 Dec 2021 22:25:45 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 01/10] staging: r8188eu: remove unused rtw_private_args entries
Date: Sun, 26 Dec 2021 22:25:26 +0100
Message-Id: <20211226212535.197989-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211226212535.197989-1-martin@kaiser.cx>
References: <20211226212535.197989-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the entries of the rtw_private_args array that refer to
non-existing private ioctls.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 88e9734b3094..ea8858213771 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -4311,9 +4311,6 @@ static const struct iw_priv_args rtw_private_args[] = {
 	{
 		SIOCIWFIRSTPRIV + 0x2, 0, 0, "driver_ext"
 	},
-	{
-		SIOCIWFIRSTPRIV + 0x3, 0, 0, "mp_ioctl"
-	},
 	{
 		SIOCIWFIRSTPRIV + 0x4,
 		IW_PRIV_TYPE_INT | IW_PRIV_SIZE_FIXED | 1, 0, "apinfo"
@@ -4368,7 +4365,6 @@ static const struct iw_priv_args rtw_private_args[] = {
 		SIOCIWFIRSTPRIV + 0x12,
 		IW_PRIV_TYPE_CHAR | P2P_PRIVATE_IOCTL_SET_LEN, IW_PRIV_TYPE_CHAR | IFNAMSIZ, "p2p_get2"
 	},
-	{SIOCIWFIRSTPRIV + 0x13, IW_PRIV_TYPE_CHAR | 128, 0, "NULL"},
 	{
 		SIOCIWFIRSTPRIV + 0x14,
 		IW_PRIV_TYPE_CHAR  | 64, 0, "tdls"
@@ -4386,9 +4382,6 @@ static const struct iw_priv_args rtw_private_args[] = {
 
 	{SIOCIWFIRSTPRIV + 0x1D, IW_PRIV_TYPE_CHAR | 40, IW_PRIV_TYPE_CHAR | 0x7FF, "test"
 	},
-
-	{SIOCIWFIRSTPRIV + 0x0E, IW_PRIV_TYPE_CHAR | 1024, 0, ""},  /* set */
-	{SIOCIWFIRSTPRIV + 0x0F, IW_PRIV_TYPE_CHAR | 1024, IW_PRIV_TYPE_CHAR | IW_PRIV_SIZE_MASK, ""},/* get */
 };
 
 static iw_handler rtw_private_handler[] = {
-- 
2.30.2

