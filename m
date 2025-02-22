Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4974120101F
	for <linux-staging@lists.linux.dev>; Sat, 22 Feb 2025 19:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740253405; cv=none; b=lRpg6qvEMvPOb9DucHn68HM4O7GivnqzE0qNK+JRkzhvJKF0tRJuglir5fO+9VI4x+n0k8oH7XDiD3Fzpwc903X5Ly5xAJO1KbAZSVy3kiO+Gi8jP6bV8CAD6h2+Yb5BuDj6iwjPftLcxdr09rSIepycuqOYakCr07W1sRG2Qb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740253405; c=relaxed/simple;
	bh=j1q5n/HUVw/zxMoNDqNZmL4I4OG1BZVMxCj88fnlUTM=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version:Content-Type; b=Re+I1jA2ILH8a46SOwuta1LLVvJ9tw7MFtMzcB/TDs//cmUR7f8y3Gb/dgeKMSNrkXl+C+6PFZ4556pEMm6YdKekTg0jdfWvk8nyYa0nxXq7jzgDTFEJnqU3fL3e8eOYXeNjGlsiS4GO+ZAcdLGofkj9VHu9Ai7eh88NKJUQKBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Red54.com; spf=pass smtp.mailfrom=red54.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=dQ5yhVJx; arc=none smtp.client-ip=162.62.57.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Red54.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=red54.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="dQ5yhVJx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1740253398; bh=aynS2a/kPanX+LjKJ5jXaswTqt6h+e7tIoipmNInIxw=;
	h=From:To:Cc:Subject:Date;
	b=dQ5yhVJxV7IAlcECrYL8zy8dz138IZvnYhgjFN96vRndunOfupibhBSgQgFaIRv0e
	 XJ3R1HJdKi0uSAxRJoYs2UxyQum03BvMnITcdJzAZ5EB+CYh8xnalRiZpuEh8p85yy
	 KyxTDHObIxq3I2sLLtWl9nKiHMzNgN4DnPeXNh1A=
Received: from mail.red54.com ([139.99.8.57])
	by newxmesmtplogicsvrszc13-0.qq.com (NewEsmtp) with SMTP
	id 93031CFF; Sun, 23 Feb 2025 03:36:48 +0800
X-QQ-mid: xmsmtpt1740253008t1qpfuhzk
Message-ID: <tencent_0BDDF3A721708D16A2E7C3DAFF0FEC79A105@qq.com>
X-QQ-XMAILINFO: NDgMZBR9sMma2vJX+AgOZyC9uQnYIokU47mtTtkAAMa2B6aY7d1ha3Ux33Mz/9
	 cKVaJuZUw64Zqu57ZKMFL3rLA7hn/4nzCXclFHGy3Tddi+AF+oUwIcTeBGkPqbcuo7bpvFOPO4op
	 70ZIL3ymqbifxqsOLlsAujJO8p4PQBWwMubpY+QnSNtpFGXlOb8zGPR1YhMyry2nOHJa+rBlbNZ/
	 EU7CfRlQL+k1C5yOWxwPm8rbEnP39+iuLO9qosVTI17XjZfkN3BBvkUBCyTGSP3+jM5Gx3nVWzxZ
	 pOOc2gHuHzSru8YRmhMVAMynroEzo3Y1yno6I8PssjkZf3xp/RolyaNPNeLS3A9c/UNJzQ9aDhyy
	 iI+I0/kAzhEd1DnAH+fF+LjqvPNBmrik7C5F+Gj4Fh/vZwGJqVgeYjzAsuMDEErs8eREOpoXgWbZ
	 PMYgl4W40DdyzIYS+FxgSh5ZSOcU2jA24Mw+KqMLFr7BLs+amEc1ZWCQDqH5p0V5bc8Xjxr1HS97
	 5+yoiFb1cdMJOzPGCINzi1kxbNuhFbbEwf9mIAapL5FrANAc3FJZl/b0lcj7bXoh0TaGVfpkjtxX
	 gI6OC9dUkZOlahvB1kVl8Pv9YY/zlo3edyLeONcmALwyRahIaW9HdTVh5nXDo/Km/+exx7RZ+AS+
	 tLyc/nnOM5DfW+K6qz19inRMMaGCxGJMMNuB0AH3NGmSVazk6OQEyZhk1aL4KJdEDxtjTm2T04r8
	 NSHUffdB6ffEB17m6cOXBapjLad6c0+z/POa4cqfL+F81wDWL542T1cvjCdoD2paFkLnUkiK2uUU
	 ER0YWz6enPSiJE9sekVjWZlzxjjAsNbNSqsW/JujU2tgBT8FJFOAwkfOdYUU/V9hpEn16ot6thJ6
	 JJf/nAqzq09vMbLqXLQ3r3L5PN8WA0vXdGPSGubDnlLIziH8UhVDRAoJ3JiJvSbYZRzFnqRXlDSS
	 C1Ac1K1ur6K7FyFc14qsuQ/5ArzCln
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
Sender: yeking@red54.com
From: Yeking@Red54.com
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?=E8=B0=A2=E8=87=B4=E9=82=A6=20=28XIE=20Zhibang=29?= <Yeking@Red54.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Robinson <pbrobinson@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: rtl8723bs: select CONFIG_CRYPTO_LIB_AES
Date: Sat, 22 Feb 2025 19:36:17 +0000
X-OQ-MSGID: <20250222193617.396927-1-Yeking@Red54.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: 谢致邦 (XIE Zhibang) <Yeking@Red54.com>

This fixes the following issue:
ERROR: modpost: "aes_expandkey" [drivers/staging/rtl8723bs/r8723bs.ko]
undefined!
ERROR: modpost: "aes_encrypt" [drivers/staging/rtl8723bs/r8723bs.ko]
undefined!

Fixes: 7d40753d8820 ("staging: rtl8723bs: use in-kernel aes encryption in OMAC1 routines")
Fixes: 3d3a170f6d80 ("staging: rtl8723bs: use in-kernel aes encryption")
Signed-off-by: 谢致邦 (XIE Zhibang) <Yeking@Red54.com>
---
 drivers/staging/rtl8723bs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8723bs/Kconfig b/drivers/staging/rtl8723bs/Kconfig
index 8d48c61961a6..353e6ee2c145 100644
--- a/drivers/staging/rtl8723bs/Kconfig
+++ b/drivers/staging/rtl8723bs/Kconfig
@@ -4,6 +4,7 @@ config RTL8723BS
 	depends on WLAN && MMC && CFG80211
 	depends on m
 	select CRYPTO
+	select CRYPTO_LIB_AES
 	select CRYPTO_LIB_ARC4
 	help
 	This option enables support for RTL8723BS SDIO drivers, such as
-- 
2.43.0

