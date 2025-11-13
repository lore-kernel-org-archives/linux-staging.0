Received: from out203-205-221-173.mail.qq.com (out203-205-221-173.mail.qq.com [203.205.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA069354715;
	Thu, 13 Nov 2025 13:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763038996; cv=none; b=pzgPVUyacTka3bqG+CPcTRep0GrvgYb/CSA1+BKhA8N2k9LJpqh4HnRaDzknHcNtjK7pTACJZmCz/kvJp0DTVbqu4ZX2Ah5Rsa5MSBcPpJbEpyPc7MvGeRRVLTDSnIV7TUqMhOmXJy9hfSW9Bu2lCuK9cekReBSDszHXeYSN63s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763038996; c=relaxed/simple;
	bh=sOv3gpVFSUTOf8qccBUFlmorrQlW6YAkct0+Z3bQd3Y=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=R5iILG/EZ44+ycks2nwzJpxX47acAMEuq6oVJ57wqfj4v351T0tFltwH9RKrQb9Mra0hpMqZ7RKc1+16b3bMxVKdcsOohUgOrenrXi+gkF5BZhy/DXG+cDm8K5jMUTNLSqAw/cHAgPt7tDcjLWgouGgR3An80IvhR/Z9IxUx9gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=Oxwv3GyM; arc=none smtp.client-ip=203.205.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="Oxwv3GyM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1763038984; bh=/GQTtJfCoEQKgTxPit1J56QLlgdP/pwagyLI+EW9z0I=;
	h=From:To:Cc:Subject:Date;
	b=Oxwv3GyMDCidNlsnILnYneLk5Qv4yyuEy3w2Ily83IlQJS77yaiAfwmatUyQ4yIT2
	 fd0aGQkUiDV2GSbmx2DWHwpMdJBq/wcObY2IasPEE3eePemQbASb1G7FLl8pkEjgd4
	 Uw3cVmcyjT9HjStuRYDhBzxIfDo6b2QgO3Zt7t78=
Received: from cjz-VMware-Virtual-Platform ([110.176.66.153])
	by newxmesmtplogicsvrsza56-0.qq.com (NewEsmtp) with SMTP
	id 71044C0; Thu, 13 Nov 2025 21:01:49 +0800
X-QQ-mid: xmsmtpt1763038909t8bqh70fz
Message-ID: <tencent_7710B04B6BEE52903BA2F56376DB9D18A907@qq.com>
X-QQ-XMAILINFO: NbgegmlEc3JuDkyxHrl5zINS911HPJeNGCbHELH9l+vnjxOT5Bx7zaZyTUd9/w
	 /gMcG0QZ8vKBexkGg+7xSWnLg0yp5ZkOsVDsZ/IO9Hy3mLNDURCgTYkL7vbhcjUIUaaJHtAPmfTc
	 DOxKS2vHR7psP07SL4rlf8w/9t6Ykjc1pFrIAgdN5tomK32H+wy3gEjScTD9VVhU9XhRYXky4V54
	 ML+HUmt/G0UxfUrDITWKzy0xbECN6pXzcZWSRGPGe0Dzjs5grXfvajtLM5cOI8uUDzd81aTBDbgd
	 FvTgsG9USwVSnWvK6gQNFDGSqp6DxCc0N0RuwTcQdtaAOpkC4Ns7qVxcCVKsDzRp0tGFWkDGgGLR
	 CaQAFDKnv5Hhkz4rxKJ3X1Wg+BP+3dJjC9zFQuwANF4t1Qm3DDSaH80CfRD/ZS6t9d9U6uNVCC1p
	 rGmzEiHA7ePkEZB/hHkZKfJEH4TRCPxY2R/4/NLYT/yBSCHd730VogMpBWMIGJYRH0MardF2PBgV
	 JLwa2FHJ+HRMjPBJDx1NiJxM+hgPrW1fhrGTyMaSsi6ONSN2LVsaW04yFqILPCmlVytXkSvOR3Sk
	 OCZolXSb+AwADDLoBp/IZPkU4DMmqQumDOCERWaKmWUFSlFvG0FbxArINiMpLq/xae8nKM7hYfIF
	 l+3uG7oP3m+LZc1Qbql4noqHYPgnqctFmWuqk6zxs46sV7ylGIYz6c2C9gvlC08tBB6lEUR3OcBh
	 E0yB70/Uj0Lm+/+R5Xfu+VDZDSK8XIizbCat0jFFBPO0sa2GYg8iskfSwOBJO+RBTRneSOXcw01l
	 RsNLsJ6/Rz3dWHnCSkNhKAkvVJ+VhnvI+Sjb1QAEBhEkB9oi3x9l96AJ7QNCdFVXeHMXJ1STJ+2C
	 zDSOELsXcygqTP9CAYRnwgItvEJ4+WQkaKmW5yvtPZNixep58RP15720Tp3BRX1HR+qOpLzBZAHv
	 o9eV7d2E8KcQqaBwyhO4z/6LYY4fqr9joy/5tec0VgMMRjsiRHRUrE58kZt37DZuSyv0rTgiQgYP
	 K3VzlK9XhLpzps6A+URTb18ocZSm4Be2wbHM1Yc444v/deAoSBMyOuoDmoCqLutEEmy6uhdU822r
	 rHM+pkGRZFSerB1dw=
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: Chang Junzheng <guagua210311@qq.com>
To: outreachy@lists.linux.dev
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	guagua210311@qq.com,
	Chang Junzheng <guagua210311@outlook.com>
Subject: [PATCH] staging: greybus: audio_manager_module: make envp array static const
Date: Thu, 13 Nov 2025 21:01:46 +0800
X-OQ-MSGID: <20251113130146.72831-1-guagua210311@qq.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chang Junzheng <guagua210311@outlook.com>

The envp array in send_add_uevent() function is declared as a non-const
local array, which triggers the following checkpatch.pl warning:

WARNING: char * array declaration might be better as static const

Change the declaration to 'static const char * const' to improve code
safety by making the array read-only and allow for better compiler
optimization. This follows the kernel coding style recommendations.

Signed-off-by: Chang Junzheng <guagua210311@qq.com>
---
 drivers/staging/greybus/audio_manager_module.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index 4a4dfb42f50f..ca6a2cd0bc4f 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -159,14 +159,14 @@ static void send_add_uevent(struct gb_audio_manager_module *module)
 	char ip_devices_string[64];
 	char op_devices_string[64];
 
-	char *envp[] = {
-		name_string,
-		vid_string,
-		pid_string,
-		intf_id_string,
-		ip_devices_string,
-		op_devices_string,
-		NULL
+	static const char * const envp[] = {
+						name_string,
+						vid_string,
+						pid_string,
+						intf_id_string,
+						ip_devices_string,
+						op_devices_string,
+						NULL
 	};
 
 	snprintf(name_string, 128, "NAME=%s", module->desc.name);
-- 
2.43.0

