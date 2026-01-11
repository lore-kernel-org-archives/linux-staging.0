Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46BF1EEA49
	for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 03:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768101733; cv=none; b=T8P9lLbgp3c+COYoImhCNtdUiOZPcvvnnWw1AdZz7yrtEdsFLZzvsGHXiyPa9Uki7e1uw/CHPK4kMOAoQjT2EAXb8vgO6vKkGNaJmIESe7Y1va5VkSqTVyFpBjk/9mpRyLDtMl4j1XEC4zFolH29ww64nrROTEz1CZhbcoWQBa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768101733; c=relaxed/simple;
	bh=CrkS+av4b6hyGwrbUtTQNxsmXJRN4sBl8eRpetnQGmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HtfhoXMx2AD4IAs0rCaOE8UvOvkf6e2m68pM+bbSQJupxWGZYk7pY0JP/i/CUwfP5WGOhmYNFVK06Qhhpb0lGUviqEvYhaHoXfm3FngzW8UcPljCFNfOg0zahQcbQ6r6qEIphnMvL/cGv/mp0T96lEQgSGNT5gL06se5sNyemLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ycu.edu.cn; spf=pass smtp.mailfrom=ycu.edu.cn; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ycu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ycu.edu.cn
X-QQ-mid: esmtpgz13t1768101708t1e4a59bb
X-QQ-Originating-IP: MWHMQcfZuo0p/YZiZlYqN2ta6CtJ9T50ea2opPdIqQE=
Received: from cjz-VMware-Virtual-Platform.loc ( [110.176.3.74])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 11 Jan 2026 11:21:42 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2694668347775749214
EX-QQ-RecipientCnt: 5
From: 2023060904@ycu.edu.cn
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	2023060904@ycu.edu.cn,
	guagua210311@qq.com
Subject: [PATCH v5 1/3] rtl8723bs: io: Add independent rtw_check_continual_io_error function
Date: Sun, 11 Jan 2026 11:21:34 +0800
Message-ID: <2048B07E5179CB78+20260111032136.7078-2-2023060904@ycu.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260111032136.7078-1-2023060904@ycu.edu.cn>
References: <20260111032136.7078-1-2023060904@ycu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:ycu.edu.cn:qybglogicsvrgz:qybglogicsvrgz7b-one-0
X-QQ-XMAILINFO: NvH2zBBgt3uT5qboDoxIZ/xnhOz/uF8Rov1Dg+oJ0zLIEPPpT2lrx4fT
	dWCw576FrGD4r3yZVKF4SZvgpYXlm73Ms/J5RcqT5+4Umfej9hAYTHl/OAIQnWBklHC5zXY
	lPBJVPQqG/8e8enPJYgqs2zrcXylAFDAObqcT53nxKdvk6LLX34udQNrs5IJazqm6/FszWB
	8bBLtsqz9NYA2SOvB3GyM0hSSTsb5518uN1kPEJ57DB4h4KAVdQDOfJz/4m/dSNNpifTaD/
	aWBnfWi0nLXiJo3HVrdGxixmT4HfRe5zHS8PAxsXX5SiNcMslBYTfpeNmq2Iqo22WoIPhU7
	KZa/+cq4p3QYGvnyQlCLoa+R5nxCTMcMbwGXmqgHQLllpziRQC16W+40nkMN7vZMohEvqjM
	MPzEosVwap4gcfFZ+qyQ8CkktgkrlFvLw3mD9e3mlCpMZVG6YHNvpOWLm9Np5osTh1csAuK
	2c5GKiYGj/LoQDxJrSlGRaUVk0mztc6XyADCUDDkIRmO4hh39aMs9X2IfG/OeacG+Mj0SM4
	l/hbm2fWOPt8GQKYpH19Q1ytckpeun6q3QDIiHHqSmQwELxAOgBpwMRe9UQW30oRXXSxRqL
	25XWSZ7AphJUMf5i2mrQidgO5FjFR/TH6FEwJYcZIANkO/m0A+hVqjkgOsSnf6wKhLl/Zpt
	jakpGdciIVlOqkguzyrieCS2X4oKUCmFAqFRKIiM4K7QuCCM3aSYegpVeZ+uZSd688R4Qd4
	TAVsKLTTJU5RGiCd0Q3Eb7OJlN6RvvBMSVF+tMZO85QhHevAvMSAjYmDmrua1WBD80YUcct
	NZdb0gmDigqsZLIRsA+a1EfTMHVNlYF9I6joDAl3dAxg6EQ1T4X3D0pqthWn2PNkr/NKZ4J
	FjdmjolWGriAiA4u/RI3VE6DQ/ryqJrARDbECuquh2/44MnppPC60f2xduT8XMU9/Qx/xVV
	pZRF/+Y3i/EsSQ1Wu4IRFXZklKdeD575GaLfI8A3G72A++ZioQ+S6x1k7+YGFOUxRUYne1V
	YK9v+Vyw==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

From: Changjun Zheng <2023060904@ycu.edu.cn>

Add a new function to check if the error count exceeds the MAX_CONTINUAL_IO_ERR
threshold. This function follows the single responsibility principle and
prepares for the subsequent removal of the global continual_io_error variable.

Signed-off-by: Changjun Zheng <2023060904@ycu.edu.cn>
---

Changelog from v1 to v2:
Initial draft: Implemented basic local error count logic, fixed compilation errors.

Changelog from v2 to v3:
Merged small patches into one, optimized function logic to remove redundant code.

Changelog from v3 to v4:
Split monolithic patch into single-purpose patches (per Greg's comment), fixed coding style.

Changelog from v4 to v5:
Fixed format errors (spaces around '=', trailing whitespace) per checkpatch.pl;
Standardized author name format (split "changjunzheng" to "Changjun Zheng");
Moved changelog to below the --- separator (kernel format rule).

drivers/staging/rtl8723bs/core/rtw_io.c    | 16 ++--------------
drivers/staging/rtl8723bs/include/rtw_io.h |  3 +--
2 files changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
index 0f52710e6d3a..cd455cfcf046 100644
--- a/drivers/staging/rtl8723bs/core/rtw_io.c
+++ b/drivers/staging/rtl8723bs/core/rtw_io.c
@@ -132,19 +132,7 @@ int rtw_init_io_priv(struct adapter *padapter, void (*set_intf_ops)(struct adapt
 	return _SUCCESS;
}
 
-/*
- * Increase and check if the continual_io_error of this @param dvobjprive is larger than MAX_CONTINUAL_IO_ERR
- * @return true:
- * @return false:
- */
-int rtw_inc_and_chk_continual_io_error(struct dvobj_priv *dvobj)
-{
-	dvobj->continual_io_error++;
-	return (dvobj->continual_io_error > MAX_CONTINUAL_IO_ERR);
-}
-
-/* Set the continual_io_error of this @param dvobjprive to 0 */
-void rtw_reset_continual_io_error(struct dvobj_priv *dvobj)
+bool rtw_check_continual_io_error(int error_count)
{
-	dvobj->continual_io_error = 0;
+	return (error_count > MAX_CONTINUAL_IO_ERR) ? true : false;
}
diff --git a/drivers/staging/rtl8723bs/include/rtw_io.h b/drivers/staging/rtl8723bs/include/rtw_io.h
index adf1de4d7924..8ae8849f5fd9 100644
--- a/drivers/staging/rtl8723bs/include/rtw_io.h
+++ b/drivers/staging/rtl8723bs/include/rtw_io.h
@@ -48,8 +48,6 @@ struct	intf_hdl {
#define SD_IO_TRY_CNT (8)
#define MAX_CONTINUAL_IO_ERR SD_IO_TRY_CNT
 
-int rtw_inc_and_chk_continual_io_error(struct dvobj_priv *dvobj);
-void rtw_reset_continual_io_error(struct dvobj_priv *dvobj);
 
struct io_priv {
 
@@ -70,5 +68,6 @@ extern int rtw_write32(struct adapter *adapter, u32 addr, u32 val);
extern u32 rtw_write_port(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem);
 
 int rtw_init_io_priv(struct adapter *padapter, void (*set_intf_ops)(struct adapter *padapter, struct _io_ops *pops));
+bool rtw_check_continual_io_error(int error_count);
 
#endif	/* _RTL8711_IO_H_ */
-- 
2.43.0


