Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11305188A3A
	for <linux-staging@lists.linux.dev>; Sun,  2 Nov 2025 07:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762069355; cv=none; b=FCXFTkovIkFnJgMKZSJxktcH2xPO05Rg7z5u4PgccYfv30CUd1qZMZXeN++jqtr51ZA0NQdRQ+YGiv+5QGugufCvgkhHo7Fqx5ad7Vz51r6NILftSZjYqbKJfFjkkz/r+U94sThReoK63lkvt+GPhrHx2dfCLkm/dVIFArsap2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762069355; c=relaxed/simple;
	bh=Wts90KexOPFzNhNpSUlyId+A6koKIDjXs6MsB9WBB68=;
	h=Message-ID:Date:From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Disposition; b=NaMpygoo1NC9kG1BMJG4SHO7+5ZdFasb8GHRKPVpLPFyXJKXA9sPMRU2NrM5lCfZSNo7b6YsVZpAWryU+yd9fTO3q0ymNsIMrpcGNb3ly9KiaglxoumY8QxvGIKWBKjqZSgDs23Y6eRaYIrAqvk0347+vxF2rxDSrba0MqemCt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=Mm1MGUeW; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="Mm1MGUeW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1762069337; bh=OwLLO9u7zjgV8Npw0fyKmCcgGeBPAcYrcMqAxRm+IwI=;
	h=Date:From:To:Cc:Subject;
	b=Mm1MGUeW3VNeqEUjnM6V7w0V1/JEUtKiY+llyVa14jcQkQAmRGLJUNK4eO9+UYUu8
	 2ZFs2RMmqK+TnZYk2n7OCRg0TrPr/qVkd+p5+0HSwk5zmAMuR6zirT/FcRjIHcrFQY
	 rFiOIo42SA+cDNX88sIMk7CyCNV1GS8BPJv+FOVk=
Received: from cjz-VMware-Virtual-Platform ([110.176.80.146])
	by newxmesmtplogicsvrszb20-1.qq.com (NewEsmtp) with SMTP
	id A8F83257; Sun, 02 Nov 2025 15:42:15 +0800
X-QQ-mid: xmsmtpt1762069335tiaovwavc
Message-ID: <tencent_08373024EBB5D2D03BAB7518F6F51D212907@qq.com>
X-QQ-XMAILINFO: NAuAIaytDrXptuEDgsGUxpTST5U6St7pWbSKw6ccosjzwtWyKAa4/6nHEPTDNl
	 eXog0TaFwcPkJK9R3o5rSk54CTeSp1ePWjiL2MbT5n67zV1RQsbRlUWm59TxFw2rt6giCThok9C2
	 ZJVym3YTJEmSnASz2GWMNKgp5AvaHH5la5xjBW0ZFqt+pBESNDxGdLylQYhW8cUF+nWbg54EXlf3
	 PccrsaGXZLefhub3+7lbzFPjdQZXEw3tiFGCNv7Z6ubfHOUsiHBst9f2pZ42XY5RQIbfnyBgih8M
	 /OqDbXCZbmiyhgCQmobLyjVY7ZgIqrYflVM8Mor1qzcVJabMD2/GD1JnfZA27uYye8WN4a/+QRZO
	 CWktNVpKQd1budDFRGxVxvNiROorrbs56IYsDDX5dhTKxvoxwe/vPrCIHdSK0/+yWTnUAoAh5m6u
	 mKq6Lt3T0YeHN3Opc0HpvS+Rry6OjYANwvYq/jKWsWqj5IIE9d5aIy2rbu9Koyp5SLqW50HzDyX6
	 rsBuQeCTtLR8BTQqU7qXlUCM2fIUBkKLW5j4QC+otN1xShd7LpCI18rY+50Tb9W7lJlw8MCZZCHB
	 bvTPuutmo9QQcRqluHS6yJH/3roPRlWG9bka4Jxh+nG3XxsW/8Io/2oZ0jr9hibJjp+W90Ag6g4d
	 cfzaIpGGk79BNdJBKEFr8hQmEFQjM0m4I5Q+TWnRNejuduMhVUumOVRWPlEYJOaofSP6dejL8zqi
	 Ly8uxaDG9OxmnYvMwKwj9WI2sKcUT2HKZqS2zlGt6y8hf6BPSOqTEQOrR0QeHwWORky+0t0hu938
	 Y2KO21ZPzCL+Lqun+hoxbvnaGP+T8xt4SCc2cOIRb6dsi+bFYVvjqsosSodjy4eEvaxS+HTDRPOE
	 fIqBn4aHP860f21Pv0sFqnV2shN+fjlxYysZU14V73IqoAZjcK7mvxtoEd70PL5EIdfcBRjdoDWT
	 u2Cb/zjBJ21kS2yn1NV6GlryMH6m4hlV822SlZH4M=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
Date: Sun, 2 Nov 2025 15:42:15 +0800
From: Chang Junzheng <guagua210311@qq.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] staging: fix various code style issues
X-OQ-MSGID: <aQcLV5I8OFcULE8X@cjz-VMware-Virtual-Platform>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix trailing whitespace in rtl8723bs driver and add missing
newlines at end of file in multiple staging drivers.

Changes include:
- Remove trailing whitespace from rtl8723bs/core/rtw_mlme.c
- Add missing newline at EOF for vme_user/vme.c
- Add missing newline at EOF for vme_user/vme_fake.c
- Add missing newline at EOF for vme_user/vme_tsi148.c

This addresses checkpatch.pl warnings about code style compliance.

Signed-off-by: Chang Junzheng <guagua210311@qq.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
 drivers/staging/vme_user/vme.c            | 1 +
 drivers/staging/vme_user/vme_fake.c       | 1 +
 drivers/staging/vme_user/vme_tsi148.c     | 1 +
 4 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index c06d990350e6..778b8715cdb2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2024,7 +2024,7 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 	return ielength;
 }
 
-/* Ported from 8185: IsInPreAuthKeyList(). 
+/* Ported from 8185: IsInPreAuthKeyList().
  * (Renamed from SecIsInPreAuthKeyList(), 2006-10-13.)
  * Added by Annie, 2006-05-07.
  *
diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index 2095de72596a..3f6fb0543e1e 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -1975,3 +1975,4 @@ static int __init vme_init(void)
 	return bus_register(&vme_bus_type);
 }
 subsys_initcall(vme_init);
+
diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index 731fbba17dfd..7647dea15f75 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -1296,3 +1296,4 @@ MODULE_LICENSE("GPL");
 
 module_init(fake_init);
 module_exit(fake_exit);
+
diff --git a/drivers/staging/vme_user/vme_tsi148.c b/drivers/staging/vme_user/vme_tsi148.c
index 733594dde9ae..1c5389020924 100644
--- a/drivers/staging/vme_user/vme_tsi148.c
+++ b/drivers/staging/vme_user/vme_tsi148.c
@@ -2634,3 +2634,4 @@ module_param(geoid, uint, 0);
 
 MODULE_DESCRIPTION("VME driver for the Tundra Tempe VME bridge");
 MODULE_LICENSE("GPL");
+
-- 
2.43.0

