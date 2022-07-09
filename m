Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55AE2573
	for <linux-staging@lists.linux.dev>; Sat,  9 Jul 2022 17:10:25 +0000 (UTC)
Received: from dslb-188-096-144-007.188.096.pools.vodafone-ip.de ([188.96.144.7] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oADyI-0005n0-6i; Sat, 09 Jul 2022 19:10:22 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 12/14] staging: r8188eu: _offset is always 0 in efuse_phymap_to_logical
Date: Sat,  9 Jul 2022 19:09:58 +0200
Message-Id: <20220709171000.180481-13-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220709171000.180481-1-martin@kaiser.cx>
References: <20220709171000.180481-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The _offset parameter of iol_read_efuse is always 0. Remove the
parameter and use 0 in the function body.

We can now replace the bytewise copy from efuseTbl to pbuf with memcpy.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index f552b9adece3..87ebfb013193 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -83,7 +83,7 @@ static s32 iol_InitLLTTable(struct adapter *padapter, u8 txpktbuf_bndy)
 }
 
 static void
-efuse_phymap_to_logical(u8 *phymap, u16 _offset, u16 _size_byte, u8  *pbuf)
+efuse_phymap_to_logical(u8 *phymap, u16 _size_byte, u8  *pbuf)
 {
 	u8 *efuseTbl = NULL;
 	u8 rtemp8;
@@ -188,8 +188,7 @@ efuse_phymap_to_logical(u8 *phymap, u16 _offset, u16 _size_byte, u8  *pbuf)
 	/*  */
 	/*  4. Copy from Efuse map to output pointer memory!!! */
 	/*  */
-	for (i = 0; i < _size_byte; i++)
-		pbuf[i] = efuseTbl[_offset + i];
+	memcpy(pbuf, efuseTbl, _size_byte);
 
 	/*  */
 	/*  5. Calculate Efuse utilization. */
@@ -311,7 +310,7 @@ static s32 iol_read_efuse(struct adapter *padapter, u16 size_byte, u8 *logical_m
 	status = iol_execute(padapter, CMD_READ_EFUSE_MAP);
 	if (status == _SUCCESS)
 		efuse_read_phymap_from_txpktbuf(padapter, 0, physical_map, &size);
-	efuse_phymap_to_logical(physical_map, 0, size_byte, logical_map);
+	efuse_phymap_to_logical(physical_map, size_byte, logical_map);
 	return status;
 }
 
-- 
2.30.2

