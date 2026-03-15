Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DA6371057
	for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 21:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773608777; cv=none; b=SK+jm8Ck5eSy61E2Tg0FytXODIB9y0yaC2GNve9ftPzK//MTj3H5TItUEp6AoTpqUtVNpjTN9MGR4Ae5WvPPapMo6CFq4hcWuVyM9GwWVefl6eTC5K5k3KETqHgxs/oUont7vYK5Y9JARDkJ/zgpNCc1V0DlFIGVnvRcPIhkoOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773608777; c=relaxed/simple;
	bh=Dey168Ui+PXMkuMyHIK+EKJdQwhljjKsBZJUbx6zKZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qu3U7wh3pQ99A4gXe1o8AkJgNusDH4Z1P9mWoT4CvXWsjQoRm7PitCAh5b7qHeoIDhLZ6lWlHRO9nOs/+le4EQabNapQlyQ60N72hJRlsLFb1EmoIY84+5XrBzyirAnFdWiKEtf26ntXEoS+B3lSxy1/dGnnY8gO/ge/ixP4hOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ROQgBXQl; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ROQgBXQl"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-829759ca646so2311510b3a.2
        for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 14:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773608775; x=1774213575; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M1Tvd1tpBTM4CPll1YWLQWGwmWd4M95StOV6rs6r8oI=;
        b=ROQgBXQlRBe6HMLlwnLy4Jqc6WM46HZyfSibSl1lzu1bkv9Vcaox60xSXpAlNEAEqA
         hFf+KjsoHHb/IR+vHt7+n2ZpPPq9Zl5rRvpUqEanUq/8PuBIj/2jv5JDtAHvmKH+3LOl
         KhP6ZPg7VaGKHL/ZKXaP+JAKRVWHUOgaKaYrRCJcHHlxV1OlCXZjve8RmLmjr60kcyVw
         R7ltPdaMdDwfvl0AQIbFzMVS9x8nO5ZOVkcEpHwslbwc9BV0wK87z2HobxWaH7JYhG8U
         5llGV6mXh8VmrJcxCLwMt+rpCj5yzB64loWbDLCuSU2gKz86fZyuKx3PrpqonXbcywmS
         admg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773608775; x=1774213575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M1Tvd1tpBTM4CPll1YWLQWGwmWd4M95StOV6rs6r8oI=;
        b=gtwffvAMlFaySDQOC4IR1ArRTz0NID0yrwjwDl36xi8bhz4B/lHfPStccuK1x/1Knm
         9LZCbrMCk4uT+zSQGocNEXAPhup5BjbEMlV8lSc0Pt084WaRpp9vh+ljYT/STC/SI7Nc
         SlmolTl6ABhSr/8lXEaOu8WvzzFLeFjqk81JJve9Q5jbLhCCHQbJTHGEUZIRvTD7k+HM
         Jib6IhZuo0ghJFJJVBPB15gwRFnL26wRhzWPpZxBfYG8v8Qdb01n2Aw9mBgdxkoSLGdO
         V5eU7K+pzN6hOJkJAFisFLiwHN2xYsbCDAZlfoweY8qohfpArCwAQ1O5ieEqYGA5hEcI
         JvAg==
X-Gm-Message-State: AOJu0YxoGizGCPpIf+Pv4QXCCJ+oRTUpcN/S5mt+Ej8W2EbGtnF/rD3O
	1E0PJ1GiLiqjkaLAHI/to9DimES+sKqM9ptWeaSrli7d14bX66el5dNO
X-Gm-Gg: ATEYQzylkA6fMIBxY/bxTknmRuiBtFsBxnPjstEIrbf9vClaXmM4K8kY6u410Nobzl8
	o8A5+kZzVfGxnzIo1OB8OMIyBp7hj3DqWrM4qwZdv/DvxdWLxAsBPxYXShInauPbuOmv9LWb5nM
	nehLrcmK/MqXG/OGj8jodZct1IdHxysgWbBSbtBIPLlWzT8K4helTp0EytqfV85qMYYiaaevo2x
	EQCz/n5a2vJiTubxg3dfjZ/Bzl47pwRWMsXpJGas5FUTqJ44Tac7XnBQ3r0+TFNSwfq72LHIJQM
	S/s4L3Fa3AESCkd2HojmGqJg7c9R9MSUwlGtIb+Xu/T3Dom0E58/RlY9Aso4TFYL5sf2kd/dyK5
	KrbOMRcFP6abTCzAjo78kIDxpqSzuQ3Ho1hRxN5nCegT379zSwUpkpIMQAHFduo6aykIERSMGpb
	EDbs21gk5W5AjSD4F66rOhZhY2m9hUXfx9t/wSshEw8O/VSXE=
X-Received: by 2002:a05:6a00:2b97:b0:823:c59:9cb0 with SMTP id d2e1a72fcca58-82a196d3365mr8502749b3a.1.1773608775055;
        Sun, 15 Mar 2026 14:06:15 -0700 (PDT)
Received: from mjmachine.localdomain ([131.255.96.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0725e05esm13675506b3a.18.2026.03.15.14.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 14:06:14 -0700 (PDT)
From: Marcos Andrade <marcosandrade95963@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marcos Andrade <marcosandrade95963@gmail.com>
Subject: [PATCH v4 2/2] staging: rtl8723bs: Replace msleep() with fsleep()
Date: Sun, 15 Mar 2026 18:05:50 -0300
Message-ID: <20260315210550.6058-3-marcosandrade95963@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260315210550.6058-1-marcosandrade95963@gmail.com>
References: <20260315210550.6058-1-marcosandrade95963@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace msleep(10) with fsleep(10 * USEC_PER_MSEC)
in _rtw_init_xmit_priv().
fsleep() is the new standard API for delays, as it automatically chooses
the best sleep method based on the duration.

Suggested-by: Ethan Tidmore <ethantidmore06@gmail.com>
Signed-off-by: Marcos Andrade <marcosandrade95963@gmail.com>
---
Changes in v4:
 - Wrapped commit message lines to 75 columns.

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

