Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AAC18DB35
	for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 21:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773525302; cv=none; b=dVjJ2Mo57VnwBxz6EcE0kmcv3QJp3OKE4pZrIk9UjSiQZbaawusY4Csrz6icB/O05H8y131myXJzS5xZ54JZDsLRGBmLoaEIJWfHsjCeELF7YYwtkAdIHQkNp8NBREp/1INQaPywoKtSBtLIajuJ3eaY8EKr19UIQ1JmrICl8xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773525302; c=relaxed/simple;
	bh=15w5kEWRz3rOC74oX2RZpNvRCn6YpVVKpHG7jKba2QE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S9HHKqgfm0rC7DacIMavwH9Xmsev7iOkjEMytcvMzenzQ/XuxVX74I4x1UnA0FsiOLcFMtbKVITBfa8zxOwXL1ynkHsNT5vsdR6RXpGqo+O5EFkOQY1utvTlzhesaKaj8C/6EiEIQ/M5gLnNVhLbqkke8t08B1+L8KCmIwTw95U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XW/xIpR7; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XW/xIpR7"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-128d7db88b9so3868006c88.0
        for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 14:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773525301; x=1774130101; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gK6DERWokTZvncYIJRhrEb3k9HWCiYprVUL5K2pGOSY=;
        b=XW/xIpR7Dz5Z3CXU07K5tytjv4mmNxvZAmL1J+iYADmUvvauxLkAbCN18dgKc2nKJf
         x3gtTObxXpLcZ8lBspSA1XinbEFUxVK7oj7loG8ziLcEZEXiNzIGkMRArp1T8PjuMx1x
         tSKn3DKMgfNiQZY86uvoOTc7p/5gOLqT+crLe4kuQw02vAy/mwWxc+eCAblQf2n67i7r
         3lE/HB6KcdVtgSKGyNz4F+azT3MKJYNOXS8kTuo+AV8NMWmqamatETqiNUeeBGDDyS1b
         0DPnx0CDZ//JJxNwmf+e1SS9KIoTXfROYwudDmmSI8zUROtWZAnGHFKy9s0jMGXaPILu
         h6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773525301; x=1774130101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gK6DERWokTZvncYIJRhrEb3k9HWCiYprVUL5K2pGOSY=;
        b=H/oUpTK4ouMAu/AppIbroMGOfjuei5HubRe/FvvulfBqyIKeF8cPAF42+IuLYaC1Ru
         6VW5m6APOF6Wx2lc5DO4rPZDugQMQpQtjmuY5bkFe9NK8mXE8tRg9S9BA/lFB4cPftWJ
         ZCGIOCOhiZx3Rsy0NWvS0atcoCXGJ6Tv3RrsUxt1FxQpcTeM3ADw6KYvCBMx8Cbf0AnA
         VGhB8yTpWl0mGTCrgUaetSfeb2GlCQHEK13TbgXDqZV5qWBrHbTjhn/W3p0CXmkAXTjI
         qDeKAfIEM1AKPmfe49QzScJSnX5idYX5X3CaYSwo54cMb/uOdB9K/vw5U7c2byvx/wRZ
         ClvA==
X-Gm-Message-State: AOJu0YxcvMOrf47FAsMGDAZrJEedjku8ZtnNCs88ghKbxfpGVddCeDfW
	gMSProUfRX1SJ39lL15sMNsDkNsMPTeMMb69Kqtxe5JSEgYX0lVU7wqF
X-Gm-Gg: ATEYQzwvzEJzek/2jG/vjsF3r7piN7sPQOawe8v+BUmr04K/xZ66qnFBhjAyfsBGktI
	QE83hi1HeC2wZYk5zQfCyvcUevhy2qEO0d/j8iNSCl1UvrmV842CVvkl075B+PDjX3J+TwLKsOP
	GESamY910b9isKpWKNzjXFrS9e5yNun7MVYA+77ItgGoG91sd1NBUlJNFAkUZflEe0DC7VEEpQD
	r0BMyQ2ewRzogb2bjDq35B2TwUmsb1jbmURW3TpKkioO+JkjW9W879NacwuR95+ZSU6QhX2AOv3
	Bod57S1f13XkUuf7R5Qj7M7wE1heDRlY7/4EFRZgPbEW+mYQpmHK9SthNyHV0MtPzg3lnYjAkQ8
	0g0Bvwq21fBZbI+U983B4uRSlA6hSoEWmAlL0mD0BUX90xfapxNKcA02BJilW5GooG5DQg2Z6kG
	qJihN+zaDXTjPoAL7q4zjgriTSgsklqivX996pRfDOQdbMmUo=
X-Received: by 2002:a05:7022:f97:b0:128:d4be:7433 with SMTP id a92af1059eb24-128f3dd31e1mr3308758c88.34.1773525300691;
        Sat, 14 Mar 2026 14:55:00 -0700 (PDT)
Received: from mjmachine.localdomain ([131.255.96.240])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128f63b6a34sm8282623c88.14.2026.03.14.14.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 14:55:00 -0700 (PDT)
From: Marcos Andrade <marcosandrade95963@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ethantidmore06@gmail.com,
	Marcos Andrade <marcosandrade95963@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Replace msleep() with fsleep()
Date: Sat, 14 Mar 2026 18:54:44 -0300
Message-ID: <20260314215444.46899-1-marcosandrade95963@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace msleep(10) with fsleep(10 * USEC_PER_MSEC) in _rtw_init_xmit_priv().
fsleep() is the new standard API for delays, as it automatically chooses
the best sleep method based on the duration.

Suggested-by: Ethan Tidmore <ethantidmore06@gmail.com>
Signed-off-by: Marcos Andrade <marcosandrade95963@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 4062fe0c1..dab16851f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -5,6 +5,7 @@
  *
  ******************************************************************************/
 #include <drv_types.h>
+#include <linux/delay.h>
 #include <linux/if_ether.h>
 
 static u8 P802_1H_OUI[P80211_OUI_LEN] = { 0x00, 0x00, 0xf8 };
@@ -129,7 +130,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 		/* Tx buf allocation may fail sometimes, so sleep and retry. */
 		res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ), true);
 		if (res == _FAIL) {
-			msleep(10);
+			fsleep(10 * USEC_PER_MSEC);
 			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ), true);
 			if (res == _FAIL)
 				goto exit;
-- 
2.53.0

