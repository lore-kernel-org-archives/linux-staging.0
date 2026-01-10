Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5160C30CD99
	for <linux-staging@lists.linux.dev>; Sat, 10 Jan 2026 10:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768040322; cv=none; b=u8a7xCj4iF6eXEn2/bb/EgrPqqwRt+OpjsknwV8I3jHDFM/uCCfDHzDq9bNi55DP/kOUS/2xUZ6a8hI86fXiUyKFW9brrCXfZNBb9F2W5+r0HTNciNpDs5BWPIvF4oVf+jdBxkVAeHr9iuK+slncBscFVgOcHOOgsFqAT5pZFWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768040322; c=relaxed/simple;
	bh=GvUr9Gjl57jeoC9Pk7vXj4PQ3PbS/Ly7wkqmKZsJCSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=md+GFNLPADbkqdGogW8gAXrGto83aQx/rZro/89U0XwvsCtr+mG8WmdoJEbvIgJ0IjrsF+CrcidQps0S6dfaLm3cQrupGHG2zF0m1h6OWZCgADZLwdAUMzyIUgfrddVEKgDGwH7BwuXLzgc0ManSp+xIM32vmjx/thp6CI+PN38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ycu.edu.cn; spf=pass smtp.mailfrom=ycu.edu.cn; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ycu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ycu.edu.cn
X-QQ-mid: zesmtpgz4t1768040293td95d1555
X-QQ-Originating-IP: mtJAG3KNL9l5I36qq3j44Pi48h2pOGQoTOQIUfNUP0U=
Received: from cjz-VMware-Virtual-Platform.loc ( [110.176.75.164])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 10 Jan 2026 18:18:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7665719635585695630
EX-QQ-RecipientCnt: 5
From: 2023060904@ycu.edu.cn
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	2023060904@ycu.edu.cn,
	guagua210311@qq.com
Subject: [PATCH 1/3] rtl8723bs: io: Add independent rtw_check_continual_io_error function
Date: Sat, 10 Jan 2026 18:17:58 +0800
Message-ID: <EE88D4787656615D+20260110101801.5820-2-2023060904@ycu.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260110101801.5820-1-2023060904@ycu.edu.cn>
References: <20260110101801.5820-1-2023060904@ycu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:ycu.edu.cn:qybglogicsvrgz:qybglogicsvrgz7b-one-0
X-QQ-XMAILINFO: NkBK3x0tNc75RBzJ+N1usWaUtHTN/VwzFuCCikvI1uCzEX0nCh35PhwD
	F3v84dc4flE+g9i+GTTZBawNuUpKNBQGEu42lRerUiNbjPrtoGOehMAgaVCoqBI8EMslFeI
	Z5msPif17aDR0Moz8Cp8R/hsvtfjkG5s7MtMMFGyrdUV8dlN9gp661MzGHPqjLoAzinLUJC
	OpFbqfC8aNDjkUpIqWE+KkEOeldSdx/peyjVKOQwDo+66r0eb5dy4LpiFlF1tRyGk8Tuv8H
	T7/voyOZqq56MiNX2OLhH0W3P+frEo3mFuhXayzss+uy0Nc+vWLxNE04UDeDm8TBvAZ1igV
	UCQy0pmAzKj2ItuzZR9Y5pBiLJJWYoymJcHOwIRak+9EJBNOhZIljO9QDTa3nqmwwbWf0ck
	OE6y8guoD1Kjb3ge7hvu442of0Ed/rseXzmCYRbTddRL4m7GwxrCHKt8RCRszxpKFlf2AvG
	LctdC2VRsrHj116LlIa7djKEyKGXoQOiwZGtUqkBjb848AcJf9kawbsMELIvhcAq1pij+dj
	7ifpr1adBVq4F003fGYRh/ptyvhDiopdzs5ESTI3d1MIGSC3NbtC7tF9zSwxAwOuX3ekPCm
	80dqKUAWNoa0F20vuEYyEQDi5OUcsPaIQ2GvfNtvDH1Gztez1xbmi3+NwSSEVvqbAqhQ4HC
	Wz5Vd8YOulL7npJGcNg1Uw2S29GFBLPebz2oxtEZy/66POmBCitTJSyxb4ncxXAQqmTRWrT
	FD/4y9q0SnLkvTJWOlDFbDyZrW5zHRXqPF1V5r9Fm8nzjTcyNfCQxzRJsV5lB5yz+fyXoH+
	wOxvBF4F3MAEtwe7P8VX3LqtxCz1+B+HKudwKhry78XY3wUS9JqpcrBVcQErxf7jHuO380m
	FmF2WOXZG4iK6qMrPFl0/wJDB0wcSq1mizZaA5PT4qM4NWudPYnn9F9KkHhSU1IT+rFkPeP
	csWyQvcvy+7+8MLM1b1dlZwM3nIun4PDS5QrcqU5uTgkTIh6TwI/b79KThryreQn04fqSRr
	GZmujheA==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

From: changjunzheng <guagua210311@qq.com>

Add a new function to check if the error count exceeds the MAX_CONTINUAL_IO_ERR
threshold. This function follows the single responsibility principle and
prepares for the subsequent removal of the global continual_io_error variable.

Changelog v3 -> v4:
1. Split the single v3 patch into 4 logical patches (per Greg KH's request)
2. Fix all coding style errors (trailing spaces, missing assignment spaces, indentation)
3. Add clear, purpose-driven commit messages for each patch
4. Add version changelog as required by kernel documentation
5. Add blank line before new function declaration to comply with coding style

Signed-off-by: changjunzheng <guagua210311@qq.com>
---
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

