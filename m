Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA401D5CF2
	for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 03:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768101732; cv=none; b=a/T4qagVJA/CVlANTlhAFhWUmVPzMNSvyduedOWF9e45jej7hccMObrRqi05/g67gDP0UFZLYFnCTI3g9WQ7dkuoQe+ISkFwBWmE8SJbh/TAOZANnrusUrsKYURn4ttCg591TJA7cd9SHF6ubpLPDdJCdzvhxuizmzPK0g/buqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768101732; c=relaxed/simple;
	bh=80XSac0UdVuvDH0VGllynbFOsWcAbhcSOQchyHHYKUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z48mM3ErcO6dmhuTQHCyTSYOlSXY7Qki0DwETNJ455Z4Bj3eT11mDy+odXg6cKfh5uLv0aZQiwt2IzIwJg+PInx5rWJUWcW7qbe/IEeRX6cMeTGc53OA+1x0DGe1IUdk/N0njIFJr6rTqAQVMSSjsqq+oLgsKUMnFpD/ps3HJmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ycu.edu.cn; spf=pass smtp.mailfrom=ycu.edu.cn; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ycu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ycu.edu.cn
X-QQ-mid: esmtpgz13t1768101715t504ae5ff
X-QQ-Originating-IP: 4FAUWSD7WPtif2B7xiyskq9vrz2Z0jKKMlFpcz3xxmU=
Received: from cjz-VMware-Virtual-Platform.loc ( [110.176.3.74])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 11 Jan 2026 11:21:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6403812175056294739
EX-QQ-RecipientCnt: 5
From: 2023060904@ycu.edu.cn
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	2023060904@ycu.edu.cn,
	guagua210311@qq.com
Subject: [PATCH v5 3/3] rtl8723bs: io: Remove redundant global continual_io_error variable
Date: Sun, 11 Jan 2026 11:21:36 +0800
Message-ID: <C4B236C04D61D2FA+20260111032136.7078-4-2023060904@ycu.edu.cn>
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
X-QQ-XMAILINFO: OQNQM5UP8StMj7j5KVL1tW77hFnEO8aooFzt9Bwk2Vf61bg0x6GwNQ02
	cUIBph8QsOjEh4LrgwVfiNANqOfY/flAwxYhCI7ZBQNBG5V85eefhLequcIJpxGXZZQIljD
	icoA2SiumjS6OAHXYk2wIqs1X1RUlqGdCBoYpOXB/VVLRX9AdhYB3z9bRwZ2jXWzMuZeYse
	s39bz6qgpxW/7tO42huSA5fIqdSqKVNur7kQ7z/1GSh5+sHB7R2SoqKvS34EzGnbkPF+/35
	oqStXg+kLlI70pJjimMvpehIvg5FToljLtQYoXZwoz1xkDc0X8gR2kzrzsFXqBcK1f24Phf
	/TW8s6LRothIqdHn/Kxhj+xhJ/3rHW0NF6/6kfRJyxPk2oVslwzAK+SVRlpseaW5WC5K6Im
	6K6bXMUKLgacc22uzGWq4Y291xyMWVsfBuWTroc5bRvU2aWqMZn8CiWQFZt269lkOc8Mkgj
	0CCDH+4J/5gsKYC2pmsHE+Zkij+DXNz3/NctPSlozTUDWJMgL1GEPyZ1YeJvEBLeonuMygt
	MfrLu1r6E7uk/dNROAQwmIyF20wrpUezqAZz0A6SnH5sXhRd5ia6mGRy/hWg8AjmgRMkhgJ
	3sjhYtwVq9g6E4uL9uhWuLZxWDARyLcbZWCYb4CHZIfMFvKX1FM/L4MoKJNAokMVJYOROSs
	dYHGmwA0l4yIWvX3m1AmcIKVqzCmi8OUbhA89V6wPks21rzALjU9QN55z4EKMd5xuGHwv3M
	BsYK+lZGhlYAddihz3yFAPOY+JMVuz+NP2wI4OubUkIVIkvvbVdLobTtA/A+NIEe73utPTw
	q2gXw/UyFTSMp/LuK27IbGOgYQutDDTOWIsXghSu9lT8oVsyHfDvQ0XK2eUuPkvwL2FJOVj
	xTLe/FDN1A5ud+Z3mmeCKgMl25zsG7NRYDtTy0bgFZDZrxQvlgqf5vHjWhbPqXpa4Pmvfmo
	09aRrvDamJphpOWKbSfrBkmqBP7xoLr5v1HX0DBJpogySh/MkNhRbAmN9
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

From: Changjun Zheng <2023060904@ycu.edu.cn>

Remove the global continual_io_error member from struct dvobj_priv, as it is
no longer used after the local error_count logic is adopted in sdio functions.
This reduces unnecessary memory usage and simplifies the dvobj_priv structure.

Signed-off-by: Changjun Zheng <2023060904@ycu.edu.cn>
---
Changelog from v1 to v2:
- Initial draft: Implemented basic local error count logic, fixed compilation errors.

Changelog from v2 to v3:
- Merged small patches into one, optimized function logic to remove redundant code.

Changelog from v3 to v4:
- Split monolithic patch into single-purpose patches (per Greg's comment), fixed coding style.

Changelog from v4 to v5:
- Fixed format errors (spaces around '=', trailing whitespace) per checkpatch.pl;
- Standardized author name format (split "changjunzheng" to "Changjun Zheng");
- Moved changelog to below the --- separator (kernel format rule).


drivers/staging/rtl8723bs/include/drv_types.h | 1 -
1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index bd7bb5828d56..de4bec961671 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -279,7 +279,6 @@ struct dvobj_priv {
 	u8 Queue2Pipe[HW_QUEUE_ENTRY];/* for out pipe mapping */
 
 	u8 irq_alloc;
-	int continual_io_error;
 
 	atomic_t disable_func;
 
-- 
2.43.0

